from copy import copy
import itertools

#swich role of holes and tiles
#moves now only of lenght 1
#starting configurations

start1 = [(1,2,3,0,4,0,0,0,5,0,0,0,0,0,0,0)]

def hammingdist(a, b):
    res = 0
    for index, item in enumerate(a):
        res += abs(item - b[index])
    return res

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
    print(facecollection)
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
            if label == 0:
                #iterate over all faces the labeled tile is in
                for k_face in facecollection[vertex]:
                    b = True
                    for corner in k_face:
                        if configuration[corner] == 0:
                            b = False
                            break
                    #if face is empty add newconfigurations
                    if b:
                        #add the k slides possible on that k_face
                        for corner in k_face:
                            if hammingdist(d_cube[corner], d_cube[vertex]) == 1:
                                dummy = list(copy(configuration))
                                dummy[vertex] = dummy[corner]
                                dummy[corner] = 0
                                if tuple(dummy) not in res:
                                    toDo.append(tuple(dummy))
                                    res.append(tuple(dummy))
                                    #potential stop condition
                                if tuple(dummy) == (2,1,3,0,4,0,0,0,5,0,0,0,0,0,0,0):
                                    print(tuple(dummy))
                                if tuple(dummy) == (2,3,1,0,4,0,0,0,5,0,0,0,0,0,0,0):
                                    print(tuple(dummy))
    return res

test = calculateConfigurations(start1,4,2)
print(len(test))
