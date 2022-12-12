using Distributed
using StaticArrays
arr = SVector{3, UInt8}(1,2,3) 
file = open("testoutput.txt", "w")
write(file, arr)
close(file)