import math

def s(a,b):
    if b == 1:
        return 1
    if a == b:
        return 2**a - 1
    return s(a-1, b) + s(a-1, b-1)

def f(a,b):
    part1 = sum[math.comb(a - i, b - i) for i in range(2, )]
    part2 = 
    return part1 + part2

print(s(4,2))

