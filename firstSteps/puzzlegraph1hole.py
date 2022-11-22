from copy import copy

#Matrix representing a square
Q2 = [[0,1,1,0],
[1,0,0,1],
[1,0,0,1],
[0,1,1,0]]

#Matrix representing a cube.
Q3  = [[0,1,1,1,0,0,0,0],
[1,0,0,0,1,0,0,1],
[1,0,0,0,0,1,0,1],
[1,0,0,0,1,1,0,0],
[0,1,0,1,0,0,1,0],
[0,0,1,1,0,0,1,0],
[0,0,0,0,1,1,0,1],
[0,1,1,0,0,0,1,0]]

#starting configurations
start1 = [(0,1,2,3,4,5,6,7)]
start2 = [(0,1,2,3)]

# returns the index of an element
def findindex(item, arr):
    for number,thing in enumerate(arr):
        if thing == item:
            index = number
    return index

#returns true if two iterable have the same contents
def listisequal(arr1, arr2):
    for i, item in enumerate(arr1):
        if arr2[i] != item:
            return False
    return True

def calculateConfigurations(graph, start):
    res = set(copy(start))
    toDo = set(copy(start))
    while len(toDo) > 0:
        #calculate new configs
        configuration = toDo.pop()
        i = findindex(0, configuration)
        newConfigs =[]
        for index,item in enumerate(graph[i]):
            if item == 1:
                dummy = list(copy(configuration))
                dummy[i] = list(configuration)[index]
                dummy[index] = 0
                newConfigs += [tuple(dummy)]
        #add new configs
        for newconfig in newConfigs:
            if newconfig not in res:
                res.add(newconfig)
                toDo.add(newconfig)
     
    return res

def calculateGraph(graph, configurations):
    res = []
    for configuration in configurations:
        i = i = findindex(0, configuration)
        newConfigs =[]
        #calculate adjacent configurations
        for index,item in enumerate(graph[i]):
            if item == 1:
                dummy = list(copy(configuration))
                dummy[i] = list(configuration)[index]
                dummy[index] = 0
                newConfigs += [tuple(dummy)]
        #search for the index of found adjacent configurations
        edges  = []
        for newconfig in newConfigs:
            for index, vertice in enumerate(configurations):
                if vertice == newconfig:
                    edges.append(index)
        res += [edges]
    return res

test = calculateConfigurations(Q3, start1)
print(calculateGraph(Q3, test))
