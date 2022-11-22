from copy import copy
import itertools

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

#places holes
#change to actually place labels, because its faster if there are less labels than holes
def place_tile(configuration, num_holes, last_hole, vertices, stars):
  if num_holes>1:
    for i in range (last_hole, len(configuration)):
      configuration[i] = 1
      place_tile(configuration, num_holes-1, i+1, vertices, stars)
      configuration[i] = 0
  elif num_holes==1:
    for i in range (last_hole, len(configuration)):
      configuration[i] = 1
      vertices.append(copy(configuration))
      stars.append([])
      for index, point in enumerate(configuration):
        if point == 1:
            stars[len(stars)-1].append(copy(index))
      configuration[i]= 0
  return vertices, stars  

def find_tile_positions(d, num_holes):
  return  place_tile([0]*(d), num_holes, 0, [], [])

#takes an unlabeled configuration represented by a tuple of zeros and ones and calculate its key
#key = number repersentet by the binary value of the tuple

def calculatekey(arr):
    res = 0
    l = len(arr) - 1
    for i in arr:
        res = res + (i * (2**l))
        l -= 1
    return res

#calculates the connections in a set of unlabeled configurations
def calculateconnections(d, k, allconfigs):
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
    #connections is the dictionary containig an array of all keys of connected vertex to the key
    newconnections = dict.fromkeys(allconfigs.keys(),[])
    print(newconnections.keys()[0])
    print(newconnections.items()[0])
    #iterare over all possible configurations (allconfigs). Add their connections.
    
    for configuration in allconfigs:
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
                        connectedkeys =[]
                        for corner in k_face:
                            dummy = copy(configuration)
                            dummy[corner] = 1
                            dummy[vertex] = 0
                            connectedkeys.append(calculatekey(dummy))
                        connections.update(calculatekey(configuration), newconnections)                            
    return newconnections


configurations = dict()
foundholes, foundstars = find_tile_positions(32,6)

for foundhole in foundholes:
    configurations.update({calculatekey(foundhole): foundhole})

print(len(configurations))
connections = calculateconnections(5, 4, configurations)
 