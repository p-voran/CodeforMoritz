using StaticArrays

#Output file
output_file = open("output_file_all.text", "w")

#sparse starting configuration
sparse_start31_2_tiles = [[0,7]]
sparse_start32_3_tiles = [[0,3,5]]
sparse_start32_4_tiles = [[0,1,2,4]]
sparse_start42_4_tiles= [[11,1,7,4]]
sparse_start42_5_tiles= [[0,1,2,4,8]]
sparse_start42_6_tiles= [[0,1,2,4,8,15]]
sparse_start42_7_tiles= [[0,1,2,4,8,14,15]]
sparse_start42_8_tiles= [[0,1,2,4,8,13,14,15]]
sparse_start43_2_tiles = [[0, 15]]
sparse_start43_3_tiles = [[0,1,2]]
sparse_start43_4_tiles = [[0,1,2,7]]
sparse_start43_5_tiles = [[0,1,7,11,15]]
sparse_start43_6_tiles = [[0,1,2,3,7,8]]
sparse_start54_6_tiles = [[0, 1, 2, 4, 8, 16]]

#=
#sparse static starting configurations
sparse_start31_2_tiles = [SVector{2, UInt8}(0,7)]
sparse_start32_3_tiles = [SVector{3, UInt8}(0,3,5)]
sparse_start32_4_tiles = [SVector{4, UInt8}(0,1,2,4)]
sparse_start42_4_tiles= [SVector{4,UInt8}(11,1,7,4)]
sparse_start42_5_tiles= [SVector{5,UInt8}(0,1,2,4,8)]
sparse_start42_6_tiles= [SVector{6,UInt8}(0,1,2,4,8,15)]
sparse_start42_7_tiles= [SVector{7, UInt8}(0,1,2,4,8,14,15)]
sparse_start42_8_tiles= [SVector{8, UInt8}(0,1,2,4,8,13,14,15)]
sparse_start43_2_tiles = [SVector{2, UInt8}(0, 15)]
sparse_start43_3_tiles = [SVector{3, UInt8}(0,1,2)]
sparse_start43_4_tiles = [SVector{4, UInt8}(0,1,2,7)]
sparse_start43_5_tiles = [SVector{5, UInt8}(0,1,7,11,15)]
sparse_start43_6_tiles = [SVector{6, UInt8}(0,1,2,3,7,8)]
sparse_start54_6_tiles = [SVector{6, UInt8}(0, 1, 2, 4, 8, 16)]
=#

#facecollections
#first index is dimension of the cube
#second index is the face dimension
facecollection_3_1 = [[[1], [2], [4]], [[0], [3], [5]], [[3], [0], [6]], [[2], [1], [7]], [[5], [6], [0]], [[4], [7], [1]], [[7], [4], [2]], [[6], [5], [3]]]
facecollection_3_2 = [[[1, 2, 3], [1, 4, 5], [2, 4, 6]], [[0, 2, 3], [0, 4, 5], [3, 5, 7]], [[0, 1, 3], [3, 6, 7], [0, 4, 6]], [[0, 1, 2], [2, 6, 7], [1, 5, 7]], [[5, 6, 7], [0, 1, 5], [0, 2, 6]], [[4, 6, 7], [0, 1, 4], [1, 3, 7]], [[4, 5, 7], [2, 3, 7], [0, 2, 4]], [[4, 5, 6], [2, 3, 6], [1, 3, 5]]]
facecollection_4_1 = [[[1], [2], [4], [8]], [[0], [3], [5], [9]], [[3], [0], [6], [10]], [[2], [1], [7], [11]], [[5], [6], [0], [12]], [[4], [7], [1], [13]], [[7], [4], [2], [14]], [[6], [5], [3], [15]], [[9], [10], [12], [0]], [[8], [11], [13], [1]], [[11], [8], [14], [2]], [[10], [9], [15], [3]], [[13], [14], [8], [4]], [[12], [15], [9], [5]], [[15], [12], [10], [6]], [[14], [13], [11], [7]]]
facecollection_4_2 = [[[1, 2, 3], [1, 4, 5], [2, 4, 6], [1, 8, 9], [2, 8, 10], [4, 8, 12]], [[0, 2, 3], [0, 4, 5], [3, 5, 7], [0, 8, 9], [3, 9, 11], [5, 9, 13]], [[0, 1, 3], [3, 6, 7], [0, 4, 6], [3, 10, 11], [0, 8, 10], [6, 10, 14]], [[0, 1, 2], [2, 6, 7], [1, 5, 7], [2, 10, 11], [1, 9, 11], [7, 11, 15]], [[5, 6, 7], [0, 1, 5], [0, 2, 6], [5, 12, 13], [6, 12, 14], [0, 8, 12]], [[4, 6, 7], [0, 1, 4], [1, 3, 7], [4, 12, 13], [7, 13, 15], [1, 9, 13]], [[4, 5, 7], [2, 3, 7], [0, 2, 4], [7, 14, 15], [4, 12, 14], [2, 10, 14]], [[4, 5, 6], [2, 3, 6], [1, 3, 5], [6, 14, 15], [5, 13, 15], [3, 11, 15]], [[9, 10, 11], [9, 12, 13], [10, 12, 14], [0, 1, 9], [0, 2, 10], [0, 4, 12]], [[8, 10, 11], [8, 12, 13], [11, 13, 15], [0, 1, 8], [1, 3, 11], [1, 5, 13]], [[8, 9, 11], [11, 14, 15], [8, 12, 14], [2, 3, 11], [0, 2, 8], [2, 6, 14]], [[8, 9, 10], [10, 14, 15], [9, 13, 15], [2, 3, 10], [1, 3, 9], [3, 7, 15]], [[13, 14, 15], [8, 9, 13], [8, 10, 14], [4, 5, 13], [4, 6, 14], [0, 4, 8]], [[12, 14, 15], [8, 9, 12], [9, 11, 15], [4, 5, 12], [5, 7, 15], [1, 5, 9]], [[12, 13, 15], [10, 11, 15], [8, 10, 12], [6, 7, 15], [4, 6, 12], [2, 6, 10]], [[12, 13, 14], [10, 11, 14], [9, 11, 13], [6, 7, 14], [5, 7, 13], [3, 7, 11]]]
facecollection_4_3 = [[[1, 2, 3, 4, 5, 6, 7], [1, 2, 3, 8, 9, 10, 11], [1, 4, 5, 8, 9, 12, 13], [2, 4, 6, 8, 10, 12, 14]], [[0, 2, 3, 4, 5, 6, 7], [0, 2, 3, 8, 9, 10, 11], [0, 4, 5, 8, 9, 12, 13], [3, 5, 7, 9, 11, 13, 15]], [[0, 1, 3, 4, 5, 6, 7], [0, 1, 3, 8, 9, 10, 11], [3, 6, 7, 10, 11, 14, 15], [0, 4, 6, 8, 10, 12, 14]], [[0, 1, 2, 4, 5, 6, 7], [0, 1, 2, 8, 9, 10, 11], [2, 6, 7, 10, 11, 14, 15], [1, 5, 7, 9, 11, 13, 15]], [[0, 1, 2, 3, 5, 6, 7], [5, 6, 7, 12, 13, 14, 15], [0, 1, 5, 8, 9, 12, 13], [0, 2, 6, 8, 10, 12, 14]], [[0, 1, 2, 3, 4, 6, 7], [4, 6, 7, 12, 13, 14, 15], [0, 1, 4, 8, 9, 12, 13], [1, 3, 7, 9, 11, 13, 15]], [[0, 1, 2, 3, 4, 5, 7], [4, 5, 7, 12, 13, 14, 15], [2, 3, 7, 10, 11, 14, 15], [0, 2, 4, 8, 10, 12, 14]], [[0, 1, 2, 3, 4, 5, 6], [4, 5, 6, 12, 13, 14, 15], [2, 3, 6, 10, 11, 14, 15], [1, 3, 5, 9, 11, 13, 15]], [[9, 10, 11, 12, 13, 14, 15], [0, 1, 2, 3, 9, 10, 11], [0, 1, 4, 5, 9, 12, 13], [0, 2, 4, 6, 10, 12, 14]], [[8, 10, 11, 12, 13, 14, 15], [0, 1, 2, 3, 8, 10, 11], [0, 1, 4, 5, 8, 12, 13], [1, 3, 5, 7, 11, 13, 15]], [[8, 9, 11, 12, 13, 14, 15], [0, 1, 2, 3, 8, 9, 11], [2, 3, 6, 7, 11, 14, 15], [0, 2, 4, 6, 8, 12, 14]], [[8, 9, 10, 12, 13, 14, 15], [0, 1, 2, 3, 8, 9, 10], [2, 3, 6, 7, 10, 14, 15], [1, 3, 5, 7, 9, 13, 15]], [[8, 9, 10, 11, 13, 14, 15], [4, 5, 6, 7, 13, 14, 15], [0, 1, 4, 5, 8, 9, 13], [0, 2, 4, 6, 8, 10, 14]], [[8, 9, 10, 11, 12, 14, 15], [4, 5, 6, 7, 12, 14, 15], [0, 1, 4, 5, 8, 9, 12], [1, 3, 5, 7, 9, 11, 15]], [[8, 9, 10, 11, 12, 13, 15], [4, 5, 6, 7, 12, 13, 15], [2, 3, 6, 7, 10, 11, 15], [0, 2, 4, 6, 8, 10, 12]], [[8, 9, 10, 11, 12, 13, 14], [4, 5, 6, 7, 12, 13, 14], [2, 3, 6, 7, 10, 11, 14], [1, 3, 5, 7, 9, 11, 13]]]
facecollection_5_1 = [[[1], [2], [4], [8], [16]], [[0], [3], [5], [9], [17]], [[3], [0], [6], [10], [18]], [[2], [1], [7], [11], [19]], [[5], [6], [0], [12], [20]], [[4], [7], [1], [13], [21]], [[7], [4], [2], [14], [22]], [[6], [5], [3], [15], [23]], [[9], [10], [12], [0], [24]], [[8], [11], [13], [1], [25]], [[11], [8], [14], [2], [26]], [[10], [9], [15], [3], [27]], [[13], [14], [8], [4], [28]], [[12], [15], [9], [5], [29]], [[15], [12], [10], [6], [30]], [[14], [13], [11], [7], [31]], [[17], [18], [20], [24], [0]], [[16], [19], [21], [25], [1]], [[19], [16], [22], [26], [2]], [[18], [17], [23], [27], [3]], [[21], [22], [16], [28], [4]], [[20], [23], [17], [29], [5]], [[23], [20], [18], [30], [6]], [[22], [21], [19], [31], [7]], [[25], [26], [28], [16], [8]], [[24], [27], [29], [17], [9]], [[27], [24], [30], [18], [10]], [[26], [25], [31], [19], [11]], [[29], [30], [24], [20], [12]], [[28], [31], [25], [21], [13]], [[31], [28], [26], [22], [14]], [[30], [29], [27], [23], [15]]]
facecollection_5_4 = [[[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], [1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23], [1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27], [1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 25, 28, 29], [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], [0, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23], [0, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27], [0, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 25, 28, 29], [3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31]], [[0, 1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], [0, 1, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23], [0, 1, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27], [3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23, 26, 27, 30, 31], [0, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], [0, 1, 2, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23], [0, 1, 2, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27], [2, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23, 26, 27, 30, 31], [1, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31]], [[0, 1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], [0, 1, 2, 3, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23], [5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30, 31], [0, 1, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 25, 28, 29], [0, 2, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], [0, 1, 2, 3, 4, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23], [4, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30, 31], [0, 1, 4, 8, 9, 12, 13, 16, 17, 20, 21, 24, 25, 28, 29], [1, 3, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31]], [[0, 1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15], [0, 1, 2, 3, 4, 5, 7, 16, 17, 18, 19, 20, 21, 22, 23], [4, 5, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30, 31], [2, 3, 7, 10, 11, 14, 15, 18, 19, 22, 23, 26, 27, 30, 31], [0, 2, 4, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15], [0, 1, 2, 3, 4, 5, 6, 16, 17, 18, 19, 20, 21, 22, 23], [4, 5, 6, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30, 31], [2, 3, 6, 10, 11, 14, 15, 18, 19, 22, 23, 26, 27, 30, 31], [1, 3, 5, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31]], [[0, 1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15], [9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27], [0, 1, 4, 5, 9, 12, 13, 16, 17, 20, 21, 24, 25, 28, 29], [0, 2, 4, 6, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15], [8, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 8, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27], [0, 1, 4, 5, 8, 12, 13, 16, 17, 20, 21, 24, 25, 28, 29], [1, 3, 5, 7, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31]], [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15], [8, 9, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 8, 9, 11, 16, 17, 18, 19, 24, 25, 26, 27], [2, 3, 6, 7, 11, 14, 15, 18, 19, 22, 23, 26, 27, 30, 31], [0, 2, 4, 6, 8, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15], [8, 9, 10, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 8, 9, 10, 16, 17, 18, 19, 24, 25, 26, 27], [2, 3, 6, 7, 10, 14, 15, 18, 19, 22, 23, 26, 27, 30, 31], [1, 3, 5, 7, 9, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31]], [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 14, 15], [8, 9, 10, 11, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31], [4, 5, 6, 7, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30, 31], [0, 1, 4, 5, 8, 9, 13, 16, 17, 20, 21, 24, 25, 28, 29], [0, 2, 4, 6, 8, 10, 14, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 15], [8, 9, 10, 11, 12, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31], [4, 5, 6, 7, 12, 14, 15, 20, 21, 22, 23, 28, 29, 30, 31], [0, 1, 4, 5, 8, 9, 12, 16, 17, 20, 21, 24, 25, 28, 29], [1, 3, 5, 7, 9, 11, 15, 17, 19, 21, 23, 25, 27, 29, 31]], [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15], [8, 9, 10, 11, 12, 13, 15, 24, 25, 26, 27, 28, 29, 30, 31], [4, 5, 6, 7, 12, 13, 15, 20, 21, 22, 23, 28, 29, 30, 31], [2, 3, 6, 7, 10, 11, 15, 18, 19, 22, 23, 26, 27, 30, 31], [0, 2, 4, 6, 8, 10, 12, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], [8, 9, 10, 11, 12, 13, 14, 24, 25, 26, 27, 28, 29, 30, 31], [4, 5, 6, 7, 12, 13, 14, 20, 21, 22, 23, 28, 29, 30, 31], [2, 3, 6, 7, 10, 11, 14, 18, 19, 22, 23, 26, 27, 30, 31], [1, 3, 5, 7, 9, 11, 13, 17, 19, 21, 23, 25, 27, 29, 31]], [[17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 17, 18, 19, 20, 21, 22, 23], [0, 1, 2, 3, 8, 9, 10, 11, 17, 18, 19, 24, 25, 26, 27], [0, 1, 4, 5, 8, 9, 12, 13, 17, 20, 21, 24, 25, 28, 29], [0, 2, 4, 6, 8, 10, 12, 14, 18, 20, 22, 24, 26, 28, 30]], [[16, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 16, 18, 19, 20, 21, 22, 23], [0, 1, 2, 3, 8, 9, 10, 11, 16, 18, 19, 24, 25, 26, 27], [0, 1, 4, 5, 8, 9, 12, 13, 16, 20, 21, 24, 25, 28, 29], [1, 3, 5, 7, 9, 11, 13, 15, 19, 21, 23, 25, 27, 29, 31]], [[16, 17, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 19, 20, 21, 22, 23], [0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 19, 24, 25, 26, 27], [2, 3, 6, 7, 10, 11, 14, 15, 19, 22, 23, 26, 27, 30, 31], [0, 2, 4, 6, 8, 10, 12, 14, 16, 20, 22, 24, 26, 28, 30]], [[16, 17, 18, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 20, 21, 22, 23], [0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 24, 25, 26, 27], [2, 3, 6, 7, 10, 11, 14, 15, 18, 22, 23, 26, 27, 30, 31], [1, 3, 5, 7, 9, 11, 13, 15, 17, 21, 23, 25, 27, 29, 31]], [[16, 17, 18, 19, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 21, 22, 23], [4, 5, 6, 7, 12, 13, 14, 15, 21, 22, 23, 28, 29, 30, 31], [0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 21, 24, 25, 28, 29], [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 22, 24, 26, 28, 30]], [[16, 17, 18, 19, 20, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 22, 23], [4, 5, 6, 7, 12, 13, 14, 15, 20, 22, 23, 28, 29, 30, 31], [0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 24, 25, 28, 29], [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31]], [[16, 17, 18, 19, 20, 21, 23, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 23], [4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 23, 28, 29, 30, 31], [2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 23, 26, 27, 30, 31], [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 24, 26, 28, 30]], [[16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22], [4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 28, 29, 30, 31], [2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 26, 27, 30, 31], [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 25, 27, 29, 31]], [[16, 17, 18, 19, 20, 21, 22, 23, 25, 26, 27, 28, 29, 30, 31], [8, 9, 10, 11, 12, 13, 14, 15, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 25, 26, 27], [0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 25, 28, 29], [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 26, 28, 30]], [[16, 17, 18, 19, 20, 21, 22, 23, 24, 26, 27, 28, 29, 30, 31], [8, 9, 10, 11, 12, 13, 14, 15, 24, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 26, 27], [0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 28, 29], [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 27, 29, 31]], [[16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 27, 28, 29, 30, 31], [8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 27, 28, 29, 30, 31], [0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 27], [2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23, 27, 30, 31], [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28, 30]], [[16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 28, 29, 30, 31], [8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 28, 29, 30, 31], [0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26], [2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23, 26, 30, 31], [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 29, 31]], [[16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 29, 30, 31], [8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 29, 30, 31], [4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 29, 30, 31], [0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 25, 29], [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 30]], [[16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 30, 31], [8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 30, 31], [4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 30, 31], [0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 25, 28], [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 31]], [[16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 31], [8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 31], [4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 31], [2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23, 26, 27, 31], [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28]], [[16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30], [8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30], [4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30], [2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23, 26, 27, 30], [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29]]]

#cubes
#not needed for the computations, just as a reference to read the configurations
three_cube = [[0, 0, 0], [0, 0, 1], [0, 1, 0], [0, 1, 1], [1, 0, 0], [1, 0, 1], [1, 1, 0], [1, 1, 1]]
four_cube = [[0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 1, 0], [0, 0, 1, 1], [0, 1, 0, 0], [0, 1, 0, 1], [0, 1, 1, 0], [0, 1, 1, 1], [1, 0, 0, 0], [1, 0, 0, 1], [1, 0, 1, 0], [1, 0, 1, 1], [1, 1, 0, 0], [1, 1, 0, 1], [1, 1, 1, 0], [1, 1, 1, 1]]
five_cube = [[0, 0, 0, 0, 0], [0, 0, 0, 0, 1], [0, 0, 0, 1, 0], [0, 0, 0, 1, 1], [0, 0, 1, 0, 0], [0, 0, 1, 0, 1], [0, 0, 1, 1, 0], [0, 0, 1, 1, 1], [0, 1, 0, 0, 0], [0, 1, 0, 0, 1], [0, 1, 0, 1, 0], [0, 1, 0, 1, 1], [0, 1, 1, 0, 0], [0, 1, 1, 0, 1], [0, 1, 1, 1, 0], [0, 1, 1, 1, 1], [1, 0, 0, 0, 0], [1, 0, 0, 0, 1], [1, 0, 0, 1, 0], [1, 0, 0, 1, 1], [1, 0, 1, 0, 0], [1, 0, 1, 0, 1], [1, 0, 1, 1, 0], [1, 0, 1, 1, 1], [1, 1, 0, 0, 0], [1, 1, 0, 0, 1], [1, 1, 0, 1, 0], [1, 1, 0, 1, 1], [1, 1, 1, 0, 0], [1, 1, 1, 0, 1], [1, 1, 1, 1, 0], [1, 1, 1, 1, 1]]


"""
if you want to calculate higher dimensional puzzles we encourage using the code snippets containing the SVector class.
They use static arrays which saves a lot of memory.
Note that you will have to manually change the static array length whenever you change the number of holes.
Because of this we uploaded a working example of our code which does not use the static arrays.
"""

function calculateConfigurations(start, facecollection)
    #res is the collection of all configurations in the component
    #to_do is the collection of all configurations at the current depth
    #previous is the collection of all configurations at the previous depth
    res = copy(start)
    to_do = copy(start)
    previous = copy(start)

    #=
    res::Vector{SVector{6, UInt8}} = copy(start)
    to_do::Vector{SVector{6, UInt8}} = copy(start)
    previous::Vector{SVector{6, UInt8}} = copy(start)
    =#

    counter = 0
    while true
        if length(to_do) == 0
            write(output_file, "\nDer Diameter ist ≥ "*string(counter - 1) *"")
            break
        end
        counter += 1
        to_do = calculate_one_step(to_do,  facecollection)
        
        res = set_operations(to_do, res, previous)

        #=
        #test here if some configuration is foud at the current depth
        if (1,2,3,4,5) in to_do
            output_file.write("sample configuration found at current depth")
        end
        =#

        previous = copy(to_do)
        write(output_file ,"Tiefe "*string(counter) * " wurde erreicht. \nAuf dieser Stufe gibt es "* string(length(to_do))* " Konfigurationen. \nInsgesamt wurden " * string(length(res)) * " Konfigurationen berechnet.\n")
    end
    return res
end

function set_operations(to_do, res, previous)
    #also makes to_do unique
    setdiff!(to_do, previous)
    setdiff!(to_do, res)
    return [res; to_do]
end

function calculate_one_step(previous, facecollection)
    #=
    returns all configurations that are adjacent to the configurations in previous
    =#
    next_step = []
    #next_step::Vector{SVector{6, UInt8}} = []
    if length(previous) == 0
        return next_step
    end

    for configuration in previous
        for (label, position) in enumerate(configuration)
            #iterate over all faces the labeled tile is in
            for k_face in facecollection[position+1]
                if is_k_face_empty(configuration, k_face)
                    #add the 2**k-1 slides possible on that k_face
                    for corner in k_face
                        push!(next_step, setindex!([x for x in configuration], corner, label))
                        #push!(next_step, SVector{6, UInt8}(setindex!([x for x in configuration], corner, label)))
                    end
                end
            end
        end
    end
    return next_step
end

#takes a configuration and a k-face as input
#returns if k_face is empty aside from a single vertex
function is_k_face_empty(configuration, k_face)
    my_bool = true
    for corner in k_face
        if corner in configuration
            my_bool = false
            break
        end
    end
    return my_bool
end

#=
function change_configuration(configuration, label, corner)
    return SVector{3, UInt8}([help_function(i, x, label, corner) for (i,x) in enumerate(configuration)])
end


function help_function(i,x, label, corner)
    if i == label
        return corner
    end
    return x
end

function change_configuration_alt_1(configuration, label, corner)
    return SVector{3, UInt8}(setindex!([x for x in configuration], corner, label))
end
=#


"""
if [1, 0, 2, 4, 8, 16] in test
#if SVector{6, UInt8}(1, 0, 2, 4, 8, 16) in test
    write(output_file, "2-Cycle was found!")
end
"""

function is_adjacent(corner1, corner2)
    if sum(abs,  [corner1[i]-corner2[i] for i in range(1, length(corner1))] ) == 1
        return true
    end
    return false
end

#input: list of all configurations in a connected component, for example given by calculateConfigurations; corresponding facecollection.
#calculate all the edges and retruns list of adjacencies.
function calculate_edges(nodes, facecollection)
    edges = []
    for node in nodes
        temp_edge = []+
        #idea if slow might swap order (iterate over every face only once)
        for (position, label) in enumerate(node)
            if label != 0
                #iterate over all faces the labeled tile is in
                for k_face in facecollection[position]
                    if is_k_face_empty(node, k_face)
                        #add the 2**k-1 slides possible on that k_face
                        for corner in k_face
                            push!(temp_edge, indexin([change_configuration(node, label, corner, position)], nodes)[1])
                            #=
                            #slides only to adjacent corners to reduce complexity, parity properties stay unchanged.
                            if is_adjacent(four_cube[position], four_cube[corner + 1])
                                push!(temp_edge, indexin([change_configuration(node, label, corner, position)], nodes)[1])
                                push!(temp_transpositions, [position, corner])
                            end
                            =#
                        end
                    end
                end
            end
        end
        push!(edges, temp_edge)
    end
    return edges
end


write(output_file,"Starte Dimension=3, k=1 mit 2 Teilen\n\n")
@time calculateConfigurations(sparse_start31_2_tiles, facecollection_3_1)
print("Dimension=3, k=1 fertig, 2 Teile fertig\n\n")
write(output_file,"\n\n________________________________________________________________________________________________\n\nStarte Dimension=3, k=2 mit 3 Teilen\n\n")
@time calculateConfigurations(sparse_start32_3_tiles,facecollection_3_2)
print("Dimension=3, k=2, 3 Teile fertig\n\n")
write(output_file,"\n\n________________________________________________________________________________________________\n\nStarte Dimension=3, k=2 mit 4 Teilen\n\n")
@time calculateConfigurations(sparse_start32_4_tiles,facecollection_3_2)
print("Dimension=3, k=2, 4 Teile fertig\n\n")
write(output_file,"\n\n________________________________________________________________________________________________\n\nStarte Dimension=4, k=2 mit 4 Teilen\n\n")
@time calculateConfigurations(sparse_start42_4_tiles,facecollection_4_2)
print("Dimension=4, k=2, 4 Teile fertig\n\n")
write(output_file,"\n\n________________________________________________________________________________________________\n\nStarte Dimension=4, k=2 mit 5 Teilen\n\n")
@time calculateConfigurations(sparse_start42_5_tiles,facecollection_4_2)
print("Dimension=4, k=2, 5 Teile fertig\n\n")
write(output_file,"\n\n________________________________________________________________________________________________\n\nStarte Dimension=4, k=2 mit 6 Teilen\n\n")
@time calculateConfigurations(sparse_start42_6_tiles,facecollection_4_2)
print("Dimension=4, k=2, 6 Teile fertig\n\n")
write(output_file,"\n\n________________________________________________________________________________________________\n\nStarte Dimension=4, k=2 mit 7 Teilen\n\n")
@time calculateConfigurations(sparse_start42_7_tiles,facecollection_4_2)
print("Dimension=4, k=2, 7 Teile fertig\n\n")
write(output_file,"\n\n________________________________________________________________________________________________\n\nStarte Dimension=4, k=2 mit 8 Teilen\n\n")
@time calculateConfigurations(sparse_start42_8_tiles,facecollection_4_2)
print("Dimension=4, k=2, 8 Teile fertig\n\n")
write(output_file,"\n\n________________________________________________________________________________________________\n\nStarte Dimension=4, k=3 mit 2 Teilen\n\n")
@time calculateConfigurations(sparse_start43_2_tiles,facecollection_4_3)
print("Dimension=4, k=3, 2 Teile fertig\n\n")
write(output_file,"\n\n________________________________________________________________________________________________\n\nStarte Dimension=4, k=3 mit 3 Teilen\n\n")
@time calculateConfigurations(sparse_start43_3_tiles,facecollection_4_3)
print("Dimension=4, k=3, 3 Teile fertig\n\n")
write(output_file,"\n\n________________________________________________________________________________________________\n\nStarte Dimension=4, k=3 mit 4 Teilen\n\n")
@time calculateConfigurations(sparse_start43_4_tiles,facecollection_4_3)
print("Dimension=4, k=3, 4 Teile fertig\n\n")
write(output_file,"\n\n________________________________________________________________________________________________\n\nStarte Dimension=4, k=3 mit 5 Teilen\n\n")
@time calculateConfigurations(sparse_start43_5_tiles,facecollection_4_3)
print("Dimension=4, k=3, 5 Teile fertig\n\n")
write(output_file,"\n\n________________________________________________________________________________________________\n\nStarte Dimension=4, k=3 mit 6 Teilen\n\n")
@time calculateConfigurations(sparse_start43_6_tiles,facecollection_4_3)
print("Dimension=4, k=3, 6 Teile fertig\n\n")
write(output_file,"\n\n________________________________________________________________________________________________\n\nStarte Dimension=5, k=4 mit 6 Teilen\n\n")
@time calculateConfigurations(sparse_start54_6_tiles,facecollection_5_4)
print("Dimension=5, k=4, 6 Teile fertig\n\n")


#edges1, transpositions1 = calculate_edges_and_transpositions(test, facecollection42)

close(output_file)
