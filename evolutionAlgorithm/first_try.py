import numpy as np

#configuration are safed as an list with length #corners of the cube
# 0 represents an empty corner
# numbers (placeholder for the colors) represent the rings

start_configuration = [0,0,0,1,0,4,2,3]
#corresponds to something like: [empty, empty, empty, red, empty, green, blue, yellow]

goal_configuration = [0,0,0,1,0,2,3,4]

#steps for the perfect solution:
c_1 = [0,0,0,1,4,0,2,3]
c_2 = [1,0,0,0,4,0,2,3]
c_3 = [1,0,0,0,4,2,0,3]
c_4 = [1,0,0,0,4,2,3,0]
c_5 = [0,0,0,1,4,2,3,0]

# facecollection: for each corner of the cube we save a list of all the faces the corner is in. Each face is represented as list of the 3 other vertexes it contains.
# this can be used to calculate all possible moves from a given configuration.


facecollection_3_2 =  [[[1, 2, 3], [1, 4, 5], [2, 4, 6]],
                        [[0, 2, 3], [0, 4, 5], [3, 5, 7]],
                          [[0, 1, 3], [3, 6, 7], [0, 4, 6]],
                            [[0, 1, 2], [2, 6, 7], [1, 5, 7]],
                              [[5, 6, 7], [0, 1, 5], [0, 2, 6]],
                                [[4, 6, 7], [0, 1, 4], [1, 3, 7]],
                                  [[4, 5, 7], [2, 3, 7], [0, 2, 4]],
                                    [[4, 5, 6], [2, 3, 6], [1, 3, 5]]]





def fitness_function(current, goal):
    return 1 / (1 + sum([x == y and y != 0 for (x,y) in zip(current, goal)]))

def fitness_function_2(current, goal):
    return 1 / 1 -  np.exp(-sum([x == y and y != 0 for (x,y) in zip(current, goal)]))

print(fitness_function_2(goal_configuration, goal_configuration))
