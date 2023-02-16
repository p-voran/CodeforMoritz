import itertools
from copy import copy

def find_hole_positions(d, k):
  '''
  d-dimension of the cube
  k-dimension of the wanted faces
  returns collection of ways to put d-k stars in a d-element vektor
  '''
  return  place_hole([1]*(d), d-k, 0, [], [])

def facecollection(d , k):
  '''
   d-dimension of the cube
   k-dimension of the wanted faces
  returns a collection where for each vertex t a list of the k faces containing t is given. 
  The k faces contain the indices of its vertices with regard to the d cube.
  returns list of vertices of the d_cube
  '''
  _, sterne = find_hole_positions(d,k)
  print(sterne)
  # calculate d-cube
  d_cube = list(itertools.product([0, 1], repeat=d))
  listcube =[]
  for item in d_cube:
    listcube.append(list(item))
  print(listcube)
  # calculate the k-faces each corner is in
  facecollection = []
  for corner in d_cube:
      k_faces = []
      for item in sterne:
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
  return facecollection, listcube

#adjacent
def adjacent_facecollection(d , k):
  '''
   d-dimension of the cube
   k-dimension of the wanted faces
  returns a collection where for each vertex t a list of the k faces containing t is given. 
  The k faces contain the indices of its vertices with regard to the d cube.
  returns list of vertices of the d_cube
  '''
  _, sterne = find_hole_positions(d,k)
  print(sterne)
  # calculate d-cube
  d_cube = list(itertools.product([0, 1], repeat=d))
  listcube =[]
  for item in d_cube:
    listcube.append(list(item))
  print(listcube)
  # calculate the k-faces each corner is in
  facecollection = []
  for corner in d_cube:
      k_faces = []
      for item in sterne:
          k_face = []
          for corner2 in d_cube:
              b = True
              for i in item:
                  if corner2[i] != corner[i]:
                    b = False
              if b  and is_adjacent(corner, corner2):
                k_face.append(d_cube.index(corner2))
          k_faces += [k_face]
      facecollection += [k_faces]
  print('face collection was created.')
  print(facecollection)
  return facecollection, listcube

#auxiliary functions
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

def is_adjacent(corner1, corner2):
    if sum([abs(corner1[i]- corner2[i]) for i in range(len(corner1))]) == 1:
        return True
    return False


#make the facecollection
print("The facecollections are:")
facecollection(3,2)
print("Only adjacents")
adjacent_facecollection(3,2)
