import matplotlib.pyplot as plt
import networkx as nx

from copy import copy
import itertools


#starting configurations
start1 = [(0,0,0,1,0,2,3,4,0,5,6,7,8,9,10,11)]
start2 = [(1,2,3,0,4,0,0,0)]

#places holes
def place_hole(configuration, num_holes, last_hole, vertices, stars):
  if num_holes>1:
    for i in range (last_hole, len(configuration)):
      configuration[i] = '*'
      place_hole(configuration, num_holes-1, i+1, vertices, stars)
      configuration[i] = '1'
  elif num_holes==1:
    for i in range (last_hole, len(configuration)):
      configuration[i] = '*'
      vertices.append(copy(configuration))
      stars.append([])
      for index, point in enumerate(configuration):
        if point == '*':
            stars[len(stars)-1].append(copy(index))
      configuration[i]= '1'
  return vertices, stars

def find_hole_positions(d, num_holes):
  return  place_hole([1]*(d), num_holes, 0, [], [])

def calculateConfigurations(start, d, k):
    _, stars = find_hole_positions(d, d-k)
    #calculate d-cube
    d_cube = list(itertools.product([0,1] , repeat= d))
    print(d_cube)
    #calculate the k-faces each corner is in
    facecollection = []
    for corner in d_cube:
        k_faces = []
        for item in stars:
            k_face = []
            for corner2 in d_cube:
                b = True
                for i in item:
                    if corner2[i] != corner[i]:
                        b = False
                if b and d_cube.index(corner) != d_cube.index(corner2):
                    k_face.append(d_cube.index(corner2))
            k_faces += [k_face]
        facecollection += [k_faces]
    print('face collection was created.')
    #collection of edges
    edges = []
    #res is the collection of all configurations in the component
    res = copy(start)
    #toDo is the collection of all configurations in the component,
    #that still need to be explored
    toDo = copy(start)
    counter = 0
    while len(toDo) > 0:
        counter = counter + 1
        if counter%1000 == 0:
            print(counter)
        configuration = toDo[0]
        toDo.pop(0)
        for vertex, label in enumerate(configuration):
            if label != 0:
                #iterate over all faces the labeled tile is in
                for k_face in facecollection[vertex]:
                    b = True
                    for corner in k_face:
                        if configuration[corner] != 0:
                            b = False
                            break
                    #if face is empty add newconfigurations
                    if b:
                        #add the 2**k-1 slides possible on that k_face
                        for corner in k_face:
                            dummy = list(copy(configuration))
                            dummy[corner] = label
                            dummy[vertex] = 0
                            if tuple(dummy) not in res:
                                toDo.append(tuple(dummy))
                                res.append(tuple(dummy))
                            #draw edges
                            edges.append((res.index(tuple(dummy)),res.index(configuration)))

    return res, edges

test, edgedepen = calculateConfigurations(start2,3,2)
g = nx.Graph(edgedepen)
nx.draw(g)
plt.show()
print(len(test))
