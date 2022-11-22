from math import *
from pickle import FALSE, TRUE
import numpy as np

n = 28
# returns the index of an element
def findindex(item, arr):
    for number,thing in enumerate(arr):
        if thing == item:
            index = number
    return index

#returns true if two permutations are equal
def permisequal(arr1, arr2):
    for i, item in enumerate(arr1):
        if arr2[i] != item:
            return False
    return True

# multiplies two permutations
def pm2(arr1, arr2):
    res = list(range(len(arr1)))
    if len(arr1) != len(arr2):
        print("Error: uneven lenght")
        return 0
    for i, thing in enumerate(arr1):
        res[i] = arr2[thing]
    return res

#multiplies any numer of permutations
def pm(*args):
    answer = list(range(len(args[0])))
    for  item in args:
        answer = pm2(answer, item)
    return answer

#turns cycle notation into permutation notation
def ctop(arr):
    res = list(range(n))
    for cycle in arr:
        for i,item in enumerate(cycle):
            if i+1 == len(cycle):
                res[item] = cycle[0]
            else:
                res[item] = cycle[i+1]
    return res

#turns permutation notation itno cycle notation
def ptoc(arr):
    res = []
    numbers = list(range(len(arr)))
    i = 0
    while len(numbers) > 0:
        if arr[numbers[0]] == numbers[0]:
            numbers.pop(0)
        else:
            cycstart = numbers[0]
            cycnext = arr[numbers[0]]
            numbers.pop(0)
            res.append([])
            res[i].append(cycstart)
            while cycnext != cycstart:
                res[i].append(cycnext)
                numbers.remove(cycnext)
                cycnext = arr[cycnext]            
            i = i+1
    return res

def invert(arr):
    res = []
    for i in range(len(arr)):
        res.append(findindex(i, arr))
    return res


a = ctop([[0,1,2,3,4,5,6,7,8,9,10],[11,12,13,14,15]])
ainv = invert(a)
b = ctop([[11,1,20,21,22,23,24,25,26,27,10],[0,16,17,18,19]])
binv = invert(b)
print(a)
print(b)
"""
cyc1 = [[1,2,3],[0,4]]
print(ctop(cyc1))

print(ptoc([4,2,3,1,0]))
perm1 =[1,2,3,0]
perm2 = [1,2,3,0]
perm3 = [1,2,3,0]
perm4  = [2,3,0,1]
print(pm(perm1,perm2,perm3,perm4))
"""