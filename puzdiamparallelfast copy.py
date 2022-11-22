import multiprocessing
from copy import copy
import itertools
import math
import time

#starting configurations
start32 = [(1,2,3,0,4,0,0,0)]
start42 = [(0,0,0,1,0,2,3,4,0,5,6,7,8,9,10,11)]
start43 = [(0,0,0,1,0,2,3,4,0,5,0,0,0,0,0,0)]
start54 = [(1,2,3,0,4,0,0,0,5,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)]

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

def make_facecollection(d, k):
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
    return facecollection

def calculateConfigurations(start, d ,k):
    facecollection = make_facecollection(d, k)
    #res is the collection of all configurations in the component
    res = copy(start)
    to_do = copy(start)
    counter = 0
    while 1:
        first_time = time.time()
        if len(to_do) == 0:
            print("Maximale Tiefe erreicht.")
            break
        counter += 1
        if len(to_do) < 8:
            to_do ,res = calculate_one_step(to_do, res, facecollection)
            print("Tiefe "+ str(counter) + " wurde erreicht. \nAuf dieser Stufe gibt es "+ str(len(to_do))+ " Konfigurationen. \nInsgesamt wurden " + str(len(res)) + " Konfigurationen berechnet.\n")
        else:
            my_queue = multiprocessing.Queue()
            procs = []
            next_step = set(())
            for i in range(7):
                chunk_num = int(math.ceil(len(to_do)/ 7))
                chunk = to_do[chunk_num*i:(chunk_num)*(i+1)]
                proc = multiprocessing.Process(target = mp_one_step, args = (my_queue, chunk, facecollection))
                procs.append(proc)
                proc.start()

            for i in range(7):
                proc_out = my_queue.get(True)
                next_step = next_step.union(proc_out)

            for pr in procs:
                pr.join()

            my_queue.close()

            third_time = time.time()
            next_step.difference_update(set(res))
            to_do = [] + list(next_step)
            res = list(set(res).union(next_step))
            fourth_time = time.time()
            print("update res and to do with difference took:")
            print(fourth_time-third_time)
            second_time = time.time()
            print("time to calculate this step is:")
            print(second_time - first_time)
            print("Tiefe "+ str(counter) + " wurde erreicht. \nAuf dieser Stufe gibt es "+ str(len(to_do))+ " Konfigurationen. \nInsgesamt wurden " + str(len(res)) + " Konfigurationen berechnet.\n")
    return res

def calculate_one_step(previous, res, facecollection):
    next_step = []
    if len(previous) == 0:
        return next_step, res

    for configuration in previous:
        for position, label in enumerate(configuration):
            if label != 0:
                #iterate over all faces the labeled tile is in
                for k_face in facecollection[position]:
                    if is_k_face_empty(configuration, k_face):
                        #add the 2**k-1 slides possible on that k_face
                        for corner in k_face:
                            dummy = list(copy(configuration))
                            dummy[corner] = label
                            dummy[position] = 0
                            if tuple(dummy) not in res:
                                res.append(tuple(dummy))
                                next_step.append(tuple(dummy))
                            #if tuple(dummy) == (1,2,3,0,4,0,0,0,6,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0):
                            #    print("Transposition Found")
    return next_step, res

def mp_one_step(queue, inputs, facecollection):
    next_step = []

    for configuration in inputs:
        for position, label in enumerate(configuration):
            if label != 0:
                #iterate over all faces the labeled tile is in
                for k_face in facecollection[position]:
                    if is_k_face_empty(configuration, k_face):
                        #add the 2**k-1 slides possible on that k_face
                        for corner in k_face:
                            dummy = list(copy(configuration))
                            dummy[corner] = label
                            dummy[position] = 0
                            next_step.append(tuple(dummy))
                            if tuple(dummy) == (1,2,3,0,4,0,0,0,6,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0):
                                print("Transposition Found\n")
                            if tuple(dummy) == (2,1,4,0,3,0,0,0):
                                print("2x2 found\n")
                            if tuple(dummy) == (1,4,2,0,3,0,0,0):
                                print("3 ohne null found\n")
    queue.put(next_step)


def is_k_face_empty(configuration, k_face):
    my_bool = True
    for corner in k_face:
        if configuration[corner] != 0:
            my_bool = False
            break
    return my_bool

if __name__ == '__main__':
    finaloutput = calculateConfigurations(start32,3,2)
    print(len(finaloutput))
#test = calculateConfigurations(start43,4,3)
