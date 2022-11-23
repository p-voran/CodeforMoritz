
using StaticArrays


#starting configurations
start42 = [Int8[0,0,0,1,0,2,3,4,0,5,6,7,8,9,10,11]]
start43 = [Int8[0,0,0,1,0,2,3,4,0,0,0,0,0,0,0,5]]
start54 = [Int8[1,2,3,0,4,0,0,0,5,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]

#sparse starting configurations
sparse_start31 = [Int8[0,1,2,3,4,5,6]]
sparse_start32 = [Int8[0,1,2,4]]
sparse_start43 = [Int8[0, 1, 2, 4, 8]]
sparse_start42_4tiles= [Int8[11,1,7,4]]
sparse_start42_5tiles= [Int8[0,1,2,4,8]]
sparse_start42_6tiles= [Int8[0,1,2,4,8,15]]
sparse_start42_7tiles= [Int8[0,1,2,4,8,14,15]]

#facecollections
facecollection31 = [[[1], [2], [4]], [[0], [3], [5]], [[3], [0], [6]], [[2], [1], [7]], [[5], [6], [0]], [[4], [7], [1]], [[7], [4], [2]], [[6], [5], [3]]]
facecollection32 = [[[1, 2, 3], [1, 4, 5], [2, 4, 6]], [[0, 2, 3], [0, 4, 5], [3, 5, 7]], [[0, 1, 3], [3, 6, 7], [0, 4, 6]], [[0, 1, 2], [2, 6, 7], [1, 5, 7]], [[5, 6, 7], [0, 1, 5], [0, 2, 6]], [[4, 6, 7], [0, 1, 4], [1, 3, 7]], [[4, 5, 7], [2, 3, 7], [0, 2, 4]], [[4, 5, 6], [2, 3, 6], [1, 3, 5]]]
facecollection43 = [[[1, 2, 3, 4, 5, 6, 7], [1, 2, 3, 8, 9, 10, 11], [1, 4, 5, 8, 9, 12, 13], [2, 4, 6, 8, 10, 12, 14]], [[0, 2, 3, 4, 5, 6, 7], [0, 2, 3, 8, 9, 10, 11], [0, 4, 5, 8, 9, 12, 13], [3, 5, 7, 9, 11, 13, 15]], [[0, 1, 3, 4, 5, 6, 7], [0, 1, 3, 8, 9, 10, 11], [3, 6, 7, 10, 11, 14, 15], [0, 4, 6, 8, 10, 12, 14]], [[0, 1, 2, 4, 5, 6, 7], [0, 1, 2, 8, 9, 10, 11], [2, 6, 7, 10, 11, 14, 15], [1, 5, 7, 9, 11, 13, 15]], [[0, 1, 2, 3, 5, 6, 7], [5, 6, 7, 12, 13, 14, 15], [0, 1, 5, 8, 9, 12, 13], [0, 2, 6, 8, 10, 12, 14]], [[0, 1, 2, 3, 4, 6, 7], [4, 6, 7, 12, 13, 14, 15], [0, 1, 4, 8, 9, 12, 13], [1, 3, 7, 9, 11, 13, 15]], [[0, 1, 2, 3, 4, 5, 7], [4, 5, 7, 12, 13, 14, 15], [2, 3, 7, 10, 11, 14, 15], [0, 2, 4, 8, 10, 12, 14]], [[0, 1, 2, 3, 4, 5, 6], [4, 5, 6, 12, 13, 14, 15], [2, 3, 6, 10, 11, 14, 15], [1, 3, 5, 9, 11, 13, 15]], [[9, 10, 11, 12, 13, 14, 15], [0, 1, 2, 3, 9, 10, 11], [0, 1, 4, 5, 9, 12, 13], [0, 2, 4, 6, 10, 12, 14]], [[8, 10, 11, 12, 13, 14, 15], [0, 1, 2, 3, 8, 10, 11], [0, 1, 4, 5, 8, 12, 13], [1, 3, 5, 7, 11, 13, 15]], [[8, 9, 11, 12, 13, 14, 15], [0, 1, 2, 3, 8, 9, 11], [2, 3, 6, 7, 11, 14, 15], [0, 2, 4, 6, 8, 12, 14]], [[8, 9, 10, 12, 13, 14, 15], [0, 1, 2, 3, 8, 9, 10], [2, 3, 6, 7, 10, 14, 15], [1, 3, 5, 7, 9, 13, 15]], [[8, 9, 10, 11, 13, 14, 15], [4, 5, 6, 7, 13, 14, 15], [0, 1, 4, 5, 8, 9, 13], [0, 2, 4, 6, 8, 10, 14]], [[8, 9, 10, 11, 12, 14, 15], [4, 5, 6, 7, 12, 14, 15], [0, 1, 4, 5, 8, 9, 12], [1, 3, 5, 7, 9, 11, 15]], [[8, 9, 10, 11, 12, 13, 15], [4, 5, 6, 7, 12, 13, 15], [2, 3, 6, 7, 10, 11, 15], [0, 2, 4, 6, 8, 10, 12]], [[8, 9, 10, 11, 12, 13, 14], [4, 5, 6, 7, 12, 13, 14], [2, 3, 6, 7, 10, 11, 14], [1, 3, 5, 7, 9, 11, 13]]]
facecollection42 = [[[1, 2, 3], [1, 4, 5], [2, 4, 6], [1, 8, 9], [2, 8, 10], [4, 8, 12]], [[0, 2, 3], [0, 4, 5], [3, 5, 7], [0, 8, 9], [3, 9, 11], [5, 9, 13]], [[0, 1, 3], [3, 6, 7], [0, 4, 6], [3, 10, 11], [0, 8, 10], [6, 10, 14]], [[0, 1, 2], [2, 6, 7], [1, 5, 7], [2, 10, 11], [1, 9, 11], [7, 11, 15]], [[5, 6, 7], [0, 1, 5], [0, 2, 6], [5, 12, 13], [6, 12, 14], [0, 8, 12]], [[4, 6, 7], [0, 1, 4], [1, 3, 7], [4, 12, 13], [7, 13, 15], [1, 9, 13]], [[4, 5, 7], [2, 3, 7], [0, 2, 4], [7, 14, 15], [4, 12, 14], [2, 10, 14]], [[4, 5, 6], [2, 3, 6], [1, 3, 5], [6, 14, 15], [5, 13, 15], [3, 11, 15]], [[9, 10, 11], [9, 12, 13], [10, 12, 14], [0, 1, 9], [0, 2, 10], [0, 4, 12]], [[8, 10, 11], [8, 12, 13], [11, 13, 15], [0, 1, 8], [1, 3, 11], [1, 5, 13]], [[8, 9, 11], [11, 14, 15], [8, 12, 14], [2, 3, 11], [0, 2, 8], [2, 6, 14]], [[8, 9, 10], [10, 14, 15], [9, 13, 15], [2, 3, 10], [1, 3, 9], [3, 7, 15]], [[13, 14, 15], [8, 9, 13], [8, 10, 14], [4, 5, 13], [4, 6, 14], [0, 4, 8]], [[12, 14, 15], [8, 9, 12], [9, 11, 15], [4, 5, 12], [5, 7, 15], [1, 5, 9]], [[12, 13, 15], [10, 11, 15], [8, 10, 12], [6, 7, 15], [4, 6, 12], [2, 6, 10]], [[12, 13, 14], [10, 11, 14], [9, 11, 13], [6, 7, 14], [5, 7, 13], [3, 7, 11]]]
facecollection41 = [[[1], [2], [4], [8]], [[0], [3], [5], [9]], [[3], [0], [6], [10]], [[2], [1], [7], [11]], [[5], [6], [0], [12]], [[4], [7], [1], [13]], [[7], [4], [2], [14]], [[6], [5], [3], [15]], [[9], [10], [12], [0]], [[8], [11], [13], [1]], [[11], [8], [14], [2]], [[10], [9], [15], [3]], [[13], [14], [8], [4]], [[12], [15], [9], [5]], [[15], [12], [10], [6]], [[14], [13], [11], [7]]]
facecollection54 = [[[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], [1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23], [1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27], [1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 25, 28, 29], [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], [0, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23], [0, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27], [0, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 25, 28, 29], [3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31]], [[0, 1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], [0, 1, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23], [0, 1, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27], [3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23, 26, 27, 30, 31], [0, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], [0, 1, 2, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23], [0, 1, 2, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27], [2, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23, 26, 27, 30, 31], [1, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31]], [[0, 1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], [0, 1, 2, 3, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23], [5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30, 31], [0, 1, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 25, 28, 29], [0, 2, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], [0, 1, 2, 3, 4, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23], [4, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30, 31], [0, 1, 4, 8, 9, 12, 13, 16, 17, 20, 21, 24, 25, 28, 29], [1, 3, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31]], [[0, 1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15], [0, 1, 2, 3, 4, 5, 7, 16, 17, 18, 19, 20, 21, 22, 23], [4, 5, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30, 31], [2, 3, 7, 10, 11, 14, 15, 18, 19, 22, 23, 26, 27, 30, 31], [0, 2, 4, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15], [0, 1, 2, 3, 4, 5, 6, 16, 17, 18, 19, 20, 21, 22, 23], [4, 5, 6, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30, 31], [2, 3, 6, 10, 11, 14, 15, 18, 19, 22, 23, 26, 27, 30, 31], [1, 3, 5, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31]], [[0, 1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15], [9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27], [0, 1, 4, 5, 9, 12, 13, 16, 17, 20, 21, 24, 25, 28, 29], [0, 2, 4, 6, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15], [8, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 8, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27], [0, 1, 4, 5, 8, 12, 13, 16, 17, 20, 21, 24, 25, 28, 29], [1, 3, 5, 7, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31]], [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15], [8, 9, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 8, 9, 11, 16, 17, 18, 19, 24, 25, 26, 27], [2, 3, 6, 7, 11, 14, 15, 18, 19, 22, 23, 26, 27, 30, 31], [0, 2, 4, 6, 8, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15], [8, 9, 10, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 8, 9, 10, 16, 17, 18, 19, 24, 25, 26, 27], [2, 3, 6, 7, 10, 14, 15, 18, 19, 22, 23, 26, 27, 30, 31], [1, 3, 5, 7, 9, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31]], [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 14, 15], [8, 9, 10, 11, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31], [4, 5, 6, 7, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30, 31], [0, 1, 4, 5, 8, 9, 13, 16, 17, 20, 21, 24, 25, 28, 29], [0, 2, 4, 6, 8, 10, 14, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 15], [8, 9, 10, 11, 12, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31], [4, 5, 6, 7, 12, 14, 15, 20, 21, 22, 23, 28, 29, 30, 31], [0, 1, 4, 5, 8, 9, 12, 16, 17, 20, 21, 24, 25, 28, 29], [1, 3, 5, 7, 9, 11, 15, 17, 19, 21, 23, 25, 27, 29, 31]], [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15], [8, 9, 10, 11, 12, 13, 15, 24, 25, 26, 27, 28, 29, 30, 31], [4, 5, 6, 7, 12, 13, 15, 20, 21, 22, 23, 28, 29, 30, 31], [2, 3, 6, 7, 10, 11, 15, 18, 19, 22, 23, 26, 27, 30, 31], [0, 2, 4, 6, 8, 10, 12, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], [8, 9, 10, 11, 12, 13, 14, 24, 25, 26, 27, 28, 29, 30, 31], [4, 5, 6, 7, 12, 13, 14, 20, 21, 22, 23, 28, 29, 30, 31], [2, 3, 6, 7, 10, 11, 14, 18, 19, 22, 23, 26, 27, 30, 31], [1, 3, 5, 7, 9, 11, 13, 17, 19, 21, 23, 25, 27, 29, 31]], [[17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 17, 18, 19, 20, 21, 22, 23], [0, 1, 2, 3, 8, 9, 10, 11, 17, 18, 19, 24, 25, 26, 27], [0, 1, 4, 5, 8, 9, 12, 13, 17, 20, 21, 24, 25, 28, 29], [0, 2, 4, 6, 8, 10, 12, 14, 18, 20, 22, 24, 26, 28, 30]], [[16, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 16, 18, 19, 20, 21, 22, 23], [0, 1, 2, 3, 8, 9, 10, 11, 16, 18, 19, 24, 25, 26, 27], [0, 1, 4, 5, 8, 9, 12, 13, 16, 20, 21, 24, 25, 28, 29], [1, 3, 5, 7, 9, 11, 13, 15, 19, 21, 23, 25, 27, 29, 31]], [[16, 17, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 19, 20, 21, 22, 23], [0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 19, 24, 25, 26, 27], [2, 3, 6, 7, 10, 11, 14, 15, 19, 22, 23, 26, 27, 30, 31], [0, 2, 4, 6, 8, 10, 12, 14, 16, 20, 22, 24, 26, 28, 30]], [[16, 17, 18, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 20, 21, 22, 23], [0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 24, 25, 26, 27], [2, 3, 6, 7, 10, 11, 14, 15, 18, 22, 23, 26, 27, 30, 31], [1, 3, 5, 7, 9, 11, 13, 15, 17, 21, 23, 25, 27, 29, 31]], [[16, 17, 18, 19, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 21, 22, 23], [4, 5, 6, 7, 12, 13, 14, 15, 21, 22, 23, 28, 29, 30, 31], [0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 21, 24, 25, 28, 29], [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 22, 24, 26, 28, 30]], [[16, 17, 18, 19, 20, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 22, 23], [4, 5, 6, 7, 12, 13, 14, 15, 20, 22, 23, 28, 29, 30, 31], [0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 24, 25, 28, 29], [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31]], [[16, 17, 18, 19, 20, 21, 23, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 23], [4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 23, 28, 29, 30, 31], [2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 23, 26, 27, 30, 31], [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 24, 26, 28, 30]], [[16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22], [4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 28, 29, 30, 31], [2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 26, 27, 30, 31], [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 25, 27, 29, 31]], [[16, 17, 18, 19, 20, 21, 22, 23, 25, 26, 27, 28, 29, 30, 31], [8, 9, 10, 11, 12, 13, 14, 15, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 25, 26, 27], [0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 25, 28, 29], [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 26, 28, 30]], [[16, 17, 18, 19, 20, 21, 22, 23, 24, 26, 27, 28, 29, 30, 31], [8, 9, 10, 11, 12, 13, 14, 15, 24, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 26, 27], [0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 28, 29], [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 27, 29, 31]], [[16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 27, 28, 29, 30, 31], [8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 27, 28, 29, 30, 31], [0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 27], [2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23, 27, 30, 31], [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28, 30]], [[16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 28, 29, 30, 31], [8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 28, 29, 30, 31], [0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26], [2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23, 26, 30, 31], [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 29, 31]], [[16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 29, 30, 31], [8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 29, 30, 31], [4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 29, 30, 31], [0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 25, 29], [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 30]], [[16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 30, 31], [8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 30, 31], [4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 30, 31], [0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 25, 28], [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 31]], [[16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 31], [8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 31], [4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 31], [2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23, 26, 27, 31], [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28]], [[16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30], [8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30], [4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30], [2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23, 26, 27, 30], [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29]]]

#cubes
four_cube = [[0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 1, 0], [0, 0, 1, 1], [0, 1, 0, 0], [0, 1, 0, 1], [0, 1, 1, 0], [0, 1, 1, 1], [1, 0, 0, 0], [1, 0, 0, 1], [1, 0, 1, 0], [1, 0, 1, 1], [1, 1, 0, 0], [1, 1, 0, 1], [1, 1, 1, 0], [1, 1, 1, 1]]
five_cube = [[0, 0, 0, 0, 0], [0, 0, 0, 0, 1], [0, 0, 0, 1, 0], [0, 0, 0, 1, 1], [0, 0, 1, 0, 0], [0, 0, 1, 0, 1], [0, 0, 1, 1, 0], [0, 0, 1, 1, 1], [0, 1, 0, 0, 0], [0, 1, 0, 0, 1], [0, 1, 0, 1, 0], [0, 1, 0, 1, 1], [0, 1, 1, 0, 0], [0, 1, 1, 0, 1], [0, 1, 1, 1, 0], [0, 1, 1, 1, 1], [1, 0, 0, 0, 0], [1, 0, 0, 0, 1], [1, 0, 0, 1, 0], [1, 0, 0, 1, 1], [1, 0, 1, 0, 0], [1, 0, 1, 0, 1], [1, 0, 1, 1, 0], [1, 0, 1, 1, 1], [1, 1, 0, 0, 0], [1, 1, 0, 0, 1], [1, 1, 0, 1, 0], [1, 1, 0, 1, 1], [1, 1, 1, 0, 0], [1, 1, 1, 0, 1], [1, 1, 1, 1, 0], [1, 1, 1, 1, 1]]

function calculateConfigurations(start, facecollection)
    #res is the collection of all configurations in the component
    res::Vector{MArray{6, Int8}} = copy(start)
    to_do::Vector{MArray{6, Int8}} = copy(start)
    previous::Vector{MArray{6, Int8}} = copy(start)
    counter = 0
    while true
        if length(to_do) == 0
            println("Maximale Tiefe erreicht.")
            break
        end
        counter += 1
        println("Time to calculate one_step:")
        to_do = @time calculate_one_step(to_do,  facecollection)
        
        println("Time to calculate set_operations:")
        res = @time set_operations(to_do, res, previous)

        previous = copy(to_do)
        #to_do = setdiff(to_do, res)
        #res = union(res, to_do)
        println("Tiefe "*string(counter) * " wurde erreicht. \nAuf dieser Stufe gibt es "* string(length(to_do))* " Konfigurationen. \nInsgesamt wurden " * string(length(res)) * " Konfigurationen berechnet.\n")
    end
    return res
end

function set_operations(to_do, res, previous)
    #to_do = setdiff(to_do, res)
    #res = union(res, to_do)
    #return to_do, res
    setdiff!(to_do, previous)
    setdiff!(to_do, res)
    return [res; to_do]
end

function calculate_one_step(previous, facecollection)
    next_step::Vector{Vector{Int8}} = []
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
                        push!(next_step, change_configuration(configuration, label, corner))
                    end
                end
            end
        end
    end
    return next_step
end

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

function change_configuration(configuration, label, corner)
    dummy = copy(configuration)
    dummy[label] = corner
    return dummy
end

test = @time calculateConfigurations(sparse_start54, facecollection54)
