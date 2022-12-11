import itertools
from copy import copy

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


_, sterne = find_hole_positions(6,4)
print(sterne)
# calculate d-cube
d_cube = list(itertools.product([0, 1], repeat=6))
listcube =[]
for item in d_cube:
  listcube.append(list(item))
print(listcube)
# calculate the k-faces each corner is in
facecollection = []
for corner in d_cube:
    for item in sterne:
        k_face = []
        for corner2 in d_cube:
            b = True
            for i in item:
                if corner2[i] != corner[i]:
                    b = False
            if b:
                k_face.append(d_cube.index(corner2))
        facecollection.append(tuple(k_face))

facecollection = list(set(facecollection))

print('face collection was created.')
print(len(facecollection))
print(facecollection)
