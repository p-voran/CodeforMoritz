
using Permutations


#starting configurations
start1 =  [[0,0,0,1,0,1,1,1,0,1,1,1,1,1,1,1]]
start2 = [[0,0,0,1,0,1,1,1,0,1,1,1,1,1,1,0]]

start3 = [[0,1,1,1,0,0,0,1]]
start4 = [[0,1,1,1,0,0,0,0]]
start5 = [[0,1,1,0,0,0,0,0]]

start52 = [[0,0,0,1,0,1,1,1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]]
start53 = [[0,0,0,0,0,0,0,1,0,0,0,1,0,1,1,1,0,0,0,1,0,1,1,1,0,1,1,1,1,1,1,1]]
start54 = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,1,1,1]]

start65 = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,1,1,1]]
start64 = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,1,1,1,0,0,0,0,0,0,0,1,0,0,0,1,0,1,1,1,0,0,0,1,0,1,1,1,0,1,1,1,1,1,1,1]]
start63 = [[0,0,0,0,0,0,0,1,0,0,0,1,0,1,1,1,0,0,0,1,0,1,1,1,0,1,1,1,1,1,1,1,0,0,0,1,0,1,1,1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]]
start62 = [[0,0,0,1,0,1,1,1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]]

#start1 = [[0,0,0,1,0,2,3,4,0,5,6,7,8,9,10,11]]

#number of corners
const perm_length = 16

#facecollections

facecollection32 = [[[1, 2, 3], [1, 4, 5], [2, 4, 6]], [[0, 2, 3], [0, 4, 5], [3, 5, 7]], [[0, 1, 3], [3, 6, 7], [0, 4, 6]], [[0, 1, 2], [2, 6, 7], [1, 5, 7]], [[5, 6, 7], [0, 1, 5], [0, 2, 6]], [[4, 6, 7], [0, 1, 4], [1, 3, 7]], [[4, 5, 7], [2, 3, 7], [0, 2, 4]], [[4, 5, 6], [2, 3, 6], [1, 3, 5]]]

facecollection42 = [[[1, 2, 3], [1, 4, 5], [2, 4, 6], [1, 8, 9], [2, 8, 10], [4, 8, 12]], [[0, 2, 3], [0, 4, 5], [3, 5, 7], [0, 8, 9], [3, 9, 11], [5, 9, 13]], [[0, 1, 3], [3, 6, 7], [0, 4, 6], [3, 10, 11], [0, 8, 10], [6, 10, 14]], [[0, 1, 2], [2, 6, 7], [1, 5, 7], [2, 10, 11], [1, 9, 11], [7, 11, 15]], [[5, 6, 7], [0, 1, 5], [0, 2, 6], [5, 12, 13], [6, 12, 14], [0, 8, 12]], [[4, 6, 7], [0, 1, 4], [1, 3, 7], [4, 12, 13], [7, 13, 15], [1, 9, 13]], [[4, 5, 7], [2, 3, 7], [0, 2, 4], [7, 14, 15], [4, 12, 14], [2, 10, 14]], [[4, 5, 6], [2, 3, 6], [1, 3, 5], [6, 14, 15], [5, 13, 15], [3, 11, 15]], [[9, 10, 11], [9, 12, 13], [10, 12, 14], [0, 1, 9], [0, 2, 10], [0, 4, 12]], [[8, 10, 11], [8, 12, 13], [11, 13, 15], [0, 1, 8], [1, 3, 11], [1, 5, 13]], [[8, 9, 11], [11, 14, 15], [8, 12, 14], [2, 3, 11], [0, 2, 8], [2, 6, 14]], [[8, 9, 10], [10, 14, 15], [9, 13, 15], [2, 3, 10], [1, 3, 9], [3, 7, 15]], [[13, 14, 15], [8, 9, 13], [8, 10, 14], [4, 5, 13], [4, 6, 14], [0, 4, 8]], [[12, 14, 15], [8, 9, 12], [9, 11, 15], [4, 5, 12], [5, 7, 15], [1, 5, 9]], [[12, 13, 15], [10, 11, 15], [8, 10, 12], [6, 7, 15], [4, 6, 12], [2, 6, 10]], [[12, 13, 14], [10, 11, 14], [9, 11, 13], [6, 7, 14], [5, 7, 13], [3, 7, 11]]]

facecollection54 = [[[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], [1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23], [1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27], [1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 25, 28, 29], [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], [0, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23], [0, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27], [0, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 25, 28, 29], [3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31]], [[0, 1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], [0, 1, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23], [0, 1, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27], [3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23, 26, 27, 30, 31], [0, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], [0, 1, 2, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23], [0, 1, 2, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27], [2, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23, 26, 27, 30, 31], [1, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31]], [[0, 1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], [0, 1, 2, 3, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23], [5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30, 31], [0, 1, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 25, 28, 29], [0, 2, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], [0, 1, 2, 3, 4, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23], [4, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30, 31], [0, 1, 4, 8, 9, 12, 13, 16, 17, 20, 21, 24, 25, 28, 29], [1, 3, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31]], [[0, 1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15], [0, 1, 2, 3, 4, 5, 7, 16, 17, 18, 19, 20, 21, 22, 23], [4, 5, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30, 31], [2, 3, 7, 10, 11, 14, 15, 18, 19, 22, 23, 26, 27, 30, 31], [0, 2, 4, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15], [0, 1, 2, 3, 4, 5, 6, 16, 17, 18, 19, 20, 21, 22, 23], [4, 5, 6, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30, 31], [2, 3, 6, 10, 11, 14, 15, 18, 19, 22, 23, 26, 27, 30, 31], [1, 3, 5, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31]], [[0, 1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15], [9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27], [0, 1, 4, 5, 9, 12, 13, 16, 17, 20, 21, 24, 25, 28, 29], [0, 2, 4, 6, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15], [8, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 8, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27], [0, 1, 4, 5, 8, 12, 13, 16, 17, 20, 21, 24, 25, 28, 29], [1, 3, 5, 7, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31]], [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15], [8, 9, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 8, 9, 11, 16, 17, 18, 19, 24, 25, 26, 27], [2, 3, 6, 7, 11, 14, 15, 18, 19, 22, 23, 26, 27, 30, 31], [0, 2, 4, 6, 8, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15], [8, 9, 10, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 8, 9, 10, 16, 17, 18, 19, 24, 25, 26, 27], [2, 3, 6, 7, 10, 14, 15, 18, 19, 22, 23, 26, 27, 30, 31], [1, 3, 5, 7, 9, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31]], [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 14, 15], [8, 9, 10, 11, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31], [4, 5, 6, 7, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30, 31], [0, 1, 4, 5, 8, 9, 13, 16, 17, 20, 21, 24, 25, 28, 29], [0, 2, 4, 6, 8, 10, 14, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 15], [8, 9, 10, 11, 12, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31], [4, 5, 6, 7, 12, 14, 15, 20, 21, 22, 23, 28, 29, 30, 31], [0, 1, 4, 5, 8, 9, 12, 16, 17, 20, 21, 24, 25, 28, 29], [1, 3, 5, 7, 9, 11, 15, 17, 19, 21, 23, 25, 27, 29, 31]], [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15], [8, 9, 10, 11, 12, 13, 15, 24, 25, 26, 27, 28, 29, 30, 31], [4, 5, 6, 7, 12, 13, 15, 20, 21, 22, 23, 28, 29, 30, 31], [2, 3, 6, 7, 10, 11, 15, 18, 19, 22, 23, 26, 27, 30, 31], [0, 2, 4, 6, 8, 10, 12, 16, 18, 20, 22, 24, 26, 28, 30]], [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], [8, 9, 10, 11, 12, 13, 14, 24, 25, 26, 27, 28, 29, 30, 31], [4, 5, 6, 7, 12, 13, 14, 20, 21, 22, 23, 28, 29, 30, 31], [2, 3, 6, 7, 10, 11, 14, 18, 19, 22, 23, 26, 27, 30, 31], [1, 3, 5, 7, 9, 11, 13, 17, 19, 21, 23, 25, 27, 29, 31]], [[17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 17, 18, 19, 20, 21, 22, 23], [0, 1, 2, 3, 8, 9, 10, 11, 17, 18, 19, 24, 25, 26, 27], [0, 1, 4, 5, 8, 9, 12, 13, 17, 20, 21, 24, 25, 28, 29], [0, 2, 4, 6, 8, 10, 12, 14, 18, 20, 22, 24, 26, 28, 30]], [[16, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 16, 18, 19, 20, 21, 22, 23], [0, 1, 2, 3, 8, 9, 10, 11, 16, 18, 19, 24, 25, 26, 27], [0, 1, 4, 5, 8, 9, 12, 13, 16, 20, 21, 24, 25, 28, 29], [1, 3, 5, 7, 9, 11, 13, 15, 19, 21, 23, 25, 27, 29, 31]], [[16, 17, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 19, 20, 21, 22, 23], [0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 19, 24, 25, 26, 27], [2, 3, 6, 7, 10, 11, 14, 15, 19, 22, 23, 26, 27, 30, 31], [0, 2, 4, 6, 8, 10, 12, 14, 16, 20, 22, 24, 26, 28, 30]], [[16, 17, 18, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 20, 21, 22, 23], [0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 24, 25, 26, 27], [2, 3, 6, 7, 10, 11, 14, 15, 18, 22, 23, 26, 27, 30, 31], [1, 3, 5, 7, 9, 11, 13, 15, 17, 21, 23, 25, 27, 29, 31]], [[16, 17, 18, 19, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 21, 22, 23], [4, 5, 6, 7, 12, 13, 14, 15, 21, 22, 23, 28, 29, 30, 31], [0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 21, 24, 25, 28, 29], [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 22, 24, 26, 28, 30]], [[16, 17, 18, 19, 20, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 22, 23], [4, 5, 6, 7, 12, 13, 14, 15, 20, 22, 23, 28, 29, 30, 31], [0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 24, 25, 28, 29], [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 23, 25, 27, 29, 31]], [[16, 17, 18, 19, 20, 21, 23, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 23], [4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 23, 28, 29, 30, 31], [2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 23, 26, 27, 30, 31], [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 24, 26, 28, 30]], [[16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22], [4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 28, 29, 30, 31], [2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 26, 27, 30, 31], [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 25, 27, 29, 31]], [[16, 17, 18, 19, 20, 21, 22, 23, 25, 26, 27, 28, 29, 30, 31], [8, 9, 10, 11, 12, 13, 14, 15, 25, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 25, 26, 27], [0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 25, 28, 29], [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 26, 28, 30]], [[16, 17, 18, 19, 20, 21, 22, 23, 24, 26, 27, 28, 29, 30, 31], [8, 9, 10, 11, 12, 13, 14, 15, 24, 26, 27, 28, 29, 30, 31], [0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 26, 27], [0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 28, 29], [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 27, 29, 31]], [[16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 27, 28, 29, 30, 31], [8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 27, 28, 29, 30, 31], [0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 27], [2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23, 27, 30, 31], [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28, 30]], [[16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 28, 29, 30, 31], [8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 28, 29, 30, 31], [0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26], [2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23, 26, 30, 31], [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 29, 31]], [[16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 29, 30, 31], [8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 29, 30, 31], [4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 29, 30, 31], [0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 25, 29], [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 30]], [[16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 30, 31], [8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 30, 31], [4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 30, 31], [0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 25, 28], [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 31]], [[16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 31], [8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 31], [4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 31], [2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23, 26, 27, 31], [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28]], [[16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30], [8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30], [4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30], [2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23, 26, 27, 30], [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29]]]

facecollection53 = [[[1, 2, 3, 4, 5, 6, 7], [1, 2, 3, 8, 9, 10, 11], [1, 4, 5, 8, 9, 12, 13], [2, 4, 6, 8, 10, 12, 14], [1, 2, 3, 16, 17, 18, 19], [1, 4, 5, 16, 17, 20, 21], [2, 4, 6, 16, 18, 20, 22], [1, 8, 9, 16, 17, 24, 25], [2, 8, 10, 16, 18, 24, 26], [4, 8, 12, 16, 20, 24, 28]], [[0, 2, 3, 4, 5, 6, 7], [0, 2, 3, 8, 9, 10, 11], [0, 4, 5, 8, 9, 12, 13], [3, 5, 7, 9, 11, 13, 15], [0, 2, 3, 16, 17, 18, 19], [0, 4, 5, 16, 17, 20, 21], [3, 5, 7, 17, 19, 21, 23], [0, 8, 9, 16, 17, 24, 25], [3, 9, 11, 17, 19, 25, 27], [5, 9, 13, 17, 21, 25, 29]], [[0, 1, 3, 4, 5, 6, 7], [0, 1, 3, 8, 9, 10, 11], [3, 6, 7, 10, 11, 14, 15], [0, 4, 6, 8, 10, 12, 14], [0, 1, 3, 16, 17, 18, 19], [3, 6, 7, 18, 19, 22, 23], [0, 4, 6, 16, 18, 20, 22], [3, 10, 11, 18, 19, 26, 27], [0, 8, 10, 16, 18, 24, 26], [6, 10, 14, 18, 22, 26, 30]], [[0, 1, 2, 4, 5, 6, 7], [0, 1, 2, 8, 9, 10, 11], [2, 6, 7, 10, 11, 14, 15], [1, 5, 7, 9, 11, 13, 15], [0, 1, 2, 16, 17, 18, 19], [2, 6, 7, 18, 19, 22, 23], [1, 5, 7, 17, 19, 21, 23], [2, 10, 11, 18, 19, 26, 27], [1, 9, 11, 17, 19, 25, 27], [7, 11, 15, 19, 23, 27, 31]], [[0, 1, 2, 3, 5, 6, 7], [5, 6, 7, 12, 13, 14, 15], [0, 1, 5, 8, 9, 12, 13], [0, 2, 6, 8, 10, 12, 14], [5, 6, 7, 20, 21, 22, 23], [0, 1, 5, 16, 17, 20, 21], [0, 2, 6, 16, 18, 20, 22], [5, 12, 13, 20, 21, 28, 29], [6, 12, 14, 20, 22, 28, 30], [0, 8, 12, 16, 20, 24, 28]], [[0, 1, 2, 3, 4, 6, 7], [4, 6, 7, 12, 13, 14, 15], [0, 1, 4, 8, 9, 12, 13], [1, 3, 7, 9, 11, 13, 15], [4, 6, 7, 20, 21, 22, 23], [0, 1, 4, 16, 17, 20, 21], [1, 3, 7, 17, 19, 21, 23], [4, 12, 13, 20, 21, 28, 29], [7, 13, 15, 21, 23, 29, 31], [1, 9, 13, 17, 21, 25, 29]], [[0, 1, 2, 3, 4, 5, 7], [4, 5, 7, 12, 13, 14, 15], [2, 3, 7, 10, 11, 14, 15], [0, 2, 4, 8, 10, 12, 14], [4, 5, 7, 20, 21, 22, 23], [2, 3, 7, 18, 19, 22, 23], [0, 2, 4, 16, 18, 20, 22], [7, 14, 15, 22, 23, 30, 31], [4, 12, 14, 20, 22, 28, 30], [2, 10, 14, 18, 22, 26, 30]], [[0, 1, 2, 3, 4, 5, 6], [4, 5, 6, 12, 13, 14, 15], [2, 3, 6, 10, 11, 14, 15], [1, 3, 5, 9, 11, 13, 15], [4, 5, 6, 20, 21, 22, 23], [2, 3, 6, 18, 19, 22, 23], [1, 3, 5, 17, 19, 21, 23], [6, 14, 15, 22, 23, 30, 31], [5, 13, 15, 21, 23, 29, 31], [3, 11, 15, 19, 23, 27, 31]], [[9, 10, 11, 12, 13, 14, 15], [0, 1, 2, 3, 9, 10, 11], [0, 1, 4, 5, 9, 12, 13], [0, 2, 4, 6, 10, 12, 14], [9, 10, 11, 24, 25, 26, 27], [9, 12, 13, 24, 25, 28, 29], [10, 12, 14, 24, 26, 28, 30], [0, 1, 9, 16, 17, 24, 25], [0, 2, 10, 16, 18, 24, 26], [0, 4, 12, 16, 20, 24, 28]], [[8, 10, 11, 12, 13, 14, 15], [0, 1, 2, 3, 8, 10, 11], [0, 1, 4, 5, 8, 12, 13], [1, 3, 5, 7, 11, 13, 15], [8, 10, 11, 24, 25, 26, 27], [8, 12, 13, 24, 25, 28, 29], [11, 13, 15, 25, 27, 29, 31], [0, 1, 8, 16, 17, 24, 25], [1, 3, 11, 17, 19, 25, 27], [1, 5, 13, 17, 21, 25, 29]], [[8, 9, 11, 12, 13, 14, 15], [0, 1, 2, 3, 8, 9, 11], [2, 3, 6, 7, 11, 14, 15], [0, 2, 4, 6, 8, 12, 14], [8, 9, 11, 24, 25, 26, 27], [11, 14, 15, 26, 27, 30, 31], [8, 12, 14, 24, 26, 28, 30], [2, 3, 11, 18, 19, 26, 27], [0, 2, 8, 16, 18, 24, 26], [2, 6, 14, 18, 22, 26, 30]], [[8, 9, 10, 12, 13, 14, 15], [0, 1, 2, 3, 8, 9, 10], [2, 3, 6, 7, 10, 14, 15], [1, 3, 5, 7, 9, 13, 15], [8, 9, 10, 24, 25, 26, 27], [10, 14, 15, 26, 27, 30, 31], [9, 13, 15, 25, 27, 29, 31], [2, 3, 10, 18, 19, 26, 27], [1, 3, 9, 17, 19, 25, 27], [3, 7, 15, 19, 23, 27, 31]], [[8, 9, 10, 11, 13, 14, 15], [4, 5, 6, 7, 13, 14, 15], [0, 1, 4, 5, 8, 9, 13], [0, 2, 4, 6, 8, 10, 14], [13, 14, 15, 28, 29, 30, 31], [8, 9, 13, 24, 25, 28, 29], [8, 10, 14, 24, 26, 28, 30], [4, 5, 13, 20, 21, 28, 29], [4, 6, 14, 20, 22, 28, 30], [0, 4, 8, 16, 20, 24, 28]], [[8, 9, 10, 11, 12, 14, 15], [4, 5, 6, 7, 12, 14, 15], [0, 1, 4, 5, 8, 9, 12], [1, 3, 5, 7, 9, 11, 15], [12, 14, 15, 28, 29, 30, 31], [8, 9, 12, 24, 25, 28, 29], [9, 11, 15, 25, 27, 29, 31], [4, 5, 12, 20, 21, 28, 29], [5, 7, 15, 21, 23, 29, 31], [1, 5, 9, 17, 21, 25, 29]], [[8, 9, 10, 11, 12, 13, 15], [4, 5, 6, 7, 12, 13, 15], [2, 3, 6, 7, 10, 11, 15], [0, 2, 4, 6, 8, 10, 12], [12, 13, 15, 28, 29, 30, 31], [10, 11, 15, 26, 27, 30, 31], [8, 10, 12, 24, 26, 28, 30], [6, 7, 15, 22, 23, 30, 31], [4, 6, 12, 20, 22, 28, 30], [2, 6, 10, 18, 22, 26, 30]], [[8, 9, 10, 11, 12, 13, 14], [4, 5, 6, 7, 12, 13, 14], [2, 3, 6, 7, 10, 11, 14], [1, 3, 5, 7, 9, 11, 13], [12, 13, 14, 28, 29, 30, 31], [10, 11, 14, 26, 27, 30, 31], [9, 11, 13, 25, 27, 29, 31], [6, 7, 14, 22, 23, 30, 31], [5, 7, 13, 21, 23, 29, 31], [3, 7, 11, 19, 23, 27, 31]], [[17, 18, 19, 20, 21, 22, 23], [17, 18, 19, 24, 25, 26, 27], [17, 20, 21, 24, 25, 28, 29], [18, 20, 22, 24, 26, 28, 30], [0, 1, 2, 3, 17, 18, 19], [0, 1, 4, 5, 17, 20, 21], [0, 2, 4, 6, 18, 20, 22], [0, 1, 8, 9, 17, 24, 25], [0, 2, 8, 10, 18, 24, 26], [0, 4, 8, 12, 20, 24, 28]], [[16, 18, 19, 20, 21, 22, 23], [16, 18, 19, 24, 25, 26, 27], [16, 20, 21, 24, 25, 28, 29], [19, 21, 23, 25, 27, 29, 31], [0, 1, 2, 3, 16, 18, 19], [0, 1, 4, 5, 16, 20, 21], [1, 3, 5, 7, 19, 21, 23], [0, 1, 8, 9, 16, 24, 25], [1, 3, 9, 11, 19, 25, 27], [1, 5, 9, 13, 21, 25, 29]], [[16, 17, 19, 20, 21, 22, 23], [16, 17, 19, 24, 25, 26, 27], [19, 22, 23, 26, 27, 30, 31], [16, 20, 22, 24, 26, 28, 30], [0, 1, 2, 3, 16, 17, 19], [2, 3, 6, 7, 19, 22, 23], [0, 2, 4, 6, 16, 20, 22], [2, 3, 10, 11, 19, 26, 27], [0, 2, 8, 10, 16, 24, 26], [2, 6, 10, 14, 22, 26, 30]], [[16, 17, 18, 20, 21, 22, 23], [16, 17, 18, 24, 25, 26, 27], [18, 22, 23, 26, 27, 30, 31], [17, 21, 23, 25, 27, 29, 31], [0, 1, 2, 3, 16, 17, 18], [2, 3, 6, 7, 18, 22, 23], [1, 3, 5, 7, 17, 21, 23], [2, 3, 10, 11, 18, 26, 27], [1, 3, 9, 11, 17, 25, 27], [3, 7, 11, 15, 23, 27, 31]], [[16, 17, 18, 19, 21, 22, 23], [21, 22, 23, 28, 29, 30, 31], [16, 17, 21, 24, 25, 28, 29], [16, 18, 22, 24, 26, 28, 30], [4, 5, 6, 7, 21, 22, 23], [0, 1, 4, 5, 16, 17, 21], [0, 2, 4, 6, 16, 18, 22], [4, 5, 12, 13, 21, 28, 29], [4, 6, 12, 14, 22, 28, 30], [0, 4, 8, 12, 16, 24, 28]], [[16, 17, 18, 19, 20, 22, 23], [20, 22, 23, 28, 29, 30, 31], [16, 17, 20, 24, 25, 28, 29], [17, 19, 23, 25, 27, 29, 31], [4, 5, 6, 7, 20, 22, 23], [0, 1, 4, 5, 16, 17, 20], [1, 3, 5, 7, 17, 19, 23], [4, 5, 12, 13, 20, 28, 29], [5, 7, 13, 15, 23, 29, 31], [1, 5, 9, 13, 17, 25, 29]], [[16, 17, 18, 19, 20, 21, 23], [20, 21, 23, 28, 29, 30, 31], [18, 19, 23, 26, 27, 30, 31], [16, 18, 20, 24, 26, 28, 30], [4, 5, 6, 7, 20, 21, 23], [2, 3, 6, 7, 18, 19, 23], [0, 2, 4, 6, 16, 18, 20], [6, 7, 14, 15, 23, 30, 31], [4, 6, 12, 14, 20, 28, 30], [2, 6, 10, 14, 18, 26, 30]], [[16, 17, 18, 19, 20, 21, 22], [20, 21, 22, 28, 29, 30, 31], [18, 19, 22, 26, 27, 30, 31], [17, 19, 21, 25, 27, 29, 31], [4, 5, 6, 7, 20, 21, 22], [2, 3, 6, 7, 18, 19, 22], [1, 3, 5, 7, 17, 19, 21], [6, 7, 14, 15, 22, 30, 31], [5, 7, 13, 15, 21, 29, 31], [3, 7, 11, 15, 19, 27, 31]], [[25, 26, 27, 28, 29, 30, 31], [16, 17, 18, 19, 25, 26, 27], [16, 17, 20, 21, 25, 28, 29], [16, 18, 20, 22, 26, 28, 30], [8, 9, 10, 11, 25, 26, 27], [8, 9, 12, 13, 25, 28, 29], [8, 10, 12, 14, 26, 28, 30], [0, 1, 8, 9, 16, 17, 25], [0, 2, 8, 10, 16, 18, 26], [0, 4, 8, 12, 16, 20, 28]], [[24, 26, 27, 28, 29, 30, 31], [16, 17, 18, 19, 24, 26, 27], [16, 17, 20, 21, 24, 28, 29], [17, 19, 21, 23, 27, 29, 31], [8, 9, 10, 11, 24, 26, 27], [8, 9, 12, 13, 24, 28, 29], [9, 11, 13, 15, 27, 29, 31], [0, 1, 8, 9, 16, 17, 24], [1, 3, 9, 11, 17, 19, 27], [1, 5, 9, 13, 17, 21, 29]], [[24, 25, 27, 28, 29, 30, 31], [16, 17, 18, 19, 24, 25, 27], [18, 19, 22, 23, 27, 30, 31], [16, 18, 20, 22, 24, 28, 30], [8, 9, 10, 11, 24, 25, 27], [10, 11, 14, 15, 27, 30, 31], [8, 10, 12, 14, 24, 28, 30], [2, 3, 10, 11, 18, 19, 27], [0, 2, 8, 10, 16, 18, 24], [2, 6, 10, 14, 18, 22, 30]], [[24, 25, 26, 28, 29, 30, 31], [16, 17, 18, 19, 24, 25, 26], [18, 19, 22, 23, 26, 30, 31], [17, 19, 21, 23, 25, 29, 31], [8, 9, 10, 11, 24, 25, 26], [10, 11, 14, 15, 26, 30, 31], [9, 11, 13, 15, 25, 29, 31], [2, 3, 10, 11, 18, 19, 26], [1, 3, 9, 11, 17, 19, 25], [3, 7, 11, 15, 19, 23, 31]], [[24, 25, 26, 27, 29, 30, 31], [20, 21, 22, 23, 29, 30, 31], [16, 17, 20, 21, 24, 25, 29], [16, 18, 20, 22, 24, 26, 30], [12, 13, 14, 15, 29, 30, 31], [8, 9, 12, 13, 24, 25, 29], [8, 10, 12, 14, 24, 26, 30], [4, 5, 12, 13, 20, 21, 29], [4, 6, 12, 14, 20, 22, 30], [0, 4, 8, 12, 16, 20, 24]], [[24, 25, 26, 27, 28, 30, 31], [20, 21, 22, 23, 28, 30, 31], [16, 17, 20, 21, 24, 25, 28], [17, 19, 21, 23, 25, 27, 31], [12, 13, 14, 15, 28, 30, 31], [8, 9, 12, 13, 24, 25, 28], [9, 11, 13, 15, 25, 27, 31], [4, 5, 12, 13, 20, 21, 28], [5, 7, 13, 15, 21, 23, 31], [1, 5, 9, 13, 17, 21, 25]], [[24, 25, 26, 27, 28, 29, 31], [20, 21, 22, 23, 28, 29, 31], [18, 19, 22, 23, 26, 27, 31], [16, 18, 20, 22, 24, 26, 28], [12, 13, 14, 15, 28, 29, 31], [10, 11, 14, 15, 26, 27, 31], [8, 10, 12, 14, 24, 26, 28], [6, 7, 14, 15, 22, 23, 31], [4, 6, 12, 14, 20, 22, 28], [2, 6, 10, 14, 18, 22, 26]], [[24, 25, 26, 27, 28, 29, 30], [20, 21, 22, 23, 28, 29, 30], [18, 19, 22, 23, 26, 27, 30], [17, 19, 21, 23, 25, 27, 29], [12, 13, 14, 15, 28, 29, 30], [10, 11, 14, 15, 26, 27, 30], [9, 11, 13, 15, 25, 27, 29], [6, 7, 14, 15, 22, 23, 30], [5, 7, 13, 15, 21, 23, 29], [3, 7, 11, 15, 19, 23, 27]]]

facecollection52 = [[[1, 2, 3], [1, 4, 5], [2, 4, 6], [1, 8, 9], [2, 8, 10], [4, 8, 12], [1, 16, 17], [2, 16, 18], [4, 16, 20], [8, 16, 24]], [[0, 2, 3], [0, 4, 5], [3, 5, 7], [0, 8, 9], [3, 9, 11], [5, 9, 13], [0, 16, 17], [3, 17, 19], [5, 17, 21], [9, 17, 25]], [[0, 1, 3], [3, 6, 7], [0, 4, 6], [3, 10, 11], [0, 8, 10], [6, 10, 14], [3, 18, 19], [0, 16, 18], [6, 18, 22], [10, 18, 26]], [[0, 1, 2], [2, 6, 7], [1, 5, 7], [2, 10, 11], [1, 9, 11], [7, 11, 15], [2, 18, 19], [1, 17, 19], [7, 19, 23], [11, 19, 27]], [[5, 6, 7], [0, 1, 5], [0, 2, 6], [5, 12, 13], [6, 12, 14], [0, 8, 12], [5, 20, 21], [6, 20, 22], [0, 16, 20], [12, 20, 28]], [[4, 6, 7], [0, 1, 4], [1, 3, 7], [4, 12, 13], [7, 13, 15], [1, 9, 13], [4, 20, 21], [7, 21, 23], [1, 17, 21], [13, 21, 29]], [[4, 5, 7], [2, 3, 7], [0, 2, 4], [7, 14, 15], [4, 12, 14], [2, 10, 14], [7, 22, 23], [4, 20, 22], [2, 18, 22], [14, 22, 30]], [[4, 5, 6], [2, 3, 6], [1, 3, 5], [6, 14, 15], [5, 13, 15], [3, 11, 15], [6, 22, 23], [5, 21, 23], [3, 19, 23], [15, 23, 31]], [[9, 10, 11], [9, 12, 13], [10, 12, 14], [0, 1, 9], [0, 2, 10], [0, 4, 12], [9, 24, 25], [10, 24, 26], [12, 24, 28], [0, 16, 24]], [[8, 10, 11], [8, 12, 13], [11, 13, 15], [0, 1, 8], [1, 3, 11], [1, 5, 13], [8, 24, 25], [11, 25, 27], [13, 25, 29], [1, 17, 25]], [[8, 9, 11], [11, 14, 15], [8, 12, 14], [2, 3, 11], [0, 2, 8], [2, 6, 14], [11, 26, 27], [8, 24, 26], [14, 26, 30], [2, 18, 26]], [[8, 9, 10], [10, 14, 15], [9, 13, 15], [2, 3, 10], [1, 3, 9], [3, 7, 15], [10, 26, 27], [9, 25, 27], [15, 27, 31], [3, 19, 27]], [[13, 14, 15], [8, 9, 13], [8, 10, 14], [4, 5, 13], [4, 6, 14], [0, 4, 8], [13, 28, 29], [14, 28, 30], [8, 24, 28], [4, 20, 28]], [[12, 14, 15], [8, 9, 12], [9, 11, 15], [4, 5, 12], [5, 7, 15], [1, 5, 9], [12, 28, 29], [15, 29, 31], [9, 25, 29], [5, 21, 29]], [[12, 13, 15], [10, 11, 15], [8, 10, 12], [6, 7, 15], [4, 6, 12], [2, 6, 10], [15, 30, 31], [12, 28, 30], [10, 26, 30], [6, 22, 30]], [[12, 13, 14], [10, 11, 14], [9, 11, 13], [6, 7, 14], [5, 7, 13], [3, 7, 11], [14, 30, 31], [13, 29, 31], [11, 27, 31], [7, 23, 31]], [[17, 18, 19], [17, 20, 21], [18, 20, 22], [17, 24, 25], [18, 24, 26], [20, 24, 28], [0, 1, 17], [0, 2, 18], [0, 4, 20], [0, 8, 24]], [[16, 18, 19], [16, 20, 21], [19, 21, 23], [16, 24, 25], [19, 25, 27], [21, 25, 29], [0, 1, 16], [1, 3, 19], [1, 5, 21], [1, 9, 25]], [[16, 17, 19], [19, 22, 23], [16, 20, 22], [19, 26, 27], [16, 24, 26], [22, 26, 30], [2, 3, 19], [0, 2, 16], [2, 6, 22], [2, 10, 26]], [[16, 17, 18], [18, 22, 23], [17, 21, 23], [18, 26, 27], [17, 25, 27], [23, 27, 31], [2, 3, 18], [1, 3, 17], [3, 7, 23], [3, 11, 27]], [[21, 22, 23], [16, 17, 21], [16, 18, 22], [21, 28, 29], [22, 28, 30], [16, 24, 28], [4, 5, 21], [4, 6, 22], [0, 4, 16], [4, 12, 28]], [[20, 22, 23], [16, 17, 20], [17, 19, 23], [20, 28, 29], [23, 29, 31], [17, 25, 29], [4, 5, 20], [5, 7, 23], [1, 5, 17], [5, 13, 29]], [[20, 21, 23], [18, 19, 23], [16, 18, 20], [23, 30, 31], [20, 28, 30], [18, 26, 30], [6, 7, 23], [4, 6, 20], [2, 6, 18], [6, 14, 30]], [[20, 21, 22], [18, 19, 22], [17, 19, 21], [22, 30, 31], [21, 29, 31], [19, 27, 31], [6, 7, 22], [5, 7, 21], [3, 7, 19], [7, 15, 31]], [[25, 26, 27], [25, 28, 29], [26, 28, 30], [16, 17, 25], [16, 18, 26], [16, 20, 28], [8, 9, 25], [8, 10, 26], [8, 12, 28], [0, 8, 16]], [[24, 26, 27], [24, 28, 29], [27, 29, 31], [16, 17, 24], [17, 19, 27], [17, 21, 29], [8, 9, 24], [9, 11, 27], [9, 13, 29], [1, 9, 17]], [[24, 25, 27], [27, 30, 31], [24, 28, 30], [18, 19, 27], [16, 18, 24], [18, 22, 30], [10, 11, 27], [8, 10, 24], [10, 14, 30], [2, 10, 18]], [[24, 25, 26], [26, 30, 31], [25, 29, 31], [18, 19, 26], [17, 19, 25], [19, 23, 31], [10, 11, 26], [9, 11, 25], [11, 15, 31], [3, 11, 19]], [[29, 30, 31], [24, 25, 29], [24, 26, 30], [20, 21, 29], [20, 22, 30], [16, 20, 24], [12, 13, 29], [12, 14, 30], [8, 12, 24], [4, 12, 20]], [[28, 30, 31], [24, 25, 28], [25, 27, 31], [20, 21, 28], [21, 23, 31], [17, 21, 25], [12, 13, 28], [13, 15, 31], [9, 13, 25], [5, 13, 21]], [[28, 29, 31], [26, 27, 31], [24, 26, 28], [22, 23, 31], [20, 22, 28], [18, 22, 26], [14, 15, 31], [12, 14, 28], [10, 14, 26], [6, 14, 22]], [[28, 29, 30], [26, 27, 30], [25, 27, 29], [22, 23, 30], [21, 23, 29], [19, 23, 27], [14, 15, 30], [13, 15, 29], [11, 15, 27], [7, 15, 23]]]

#cubes
four_cube = [[0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 1, 0], [0, 0, 1, 1], [0, 1, 0, 0], [0, 1, 0, 1], [0, 1, 1, 0], [0, 1, 1, 1], [1, 0, 0, 0], [1, 0, 0, 1], [1, 0, 1, 0], [1, 0, 1, 1], [1, 1, 0, 0], [1, 1, 0, 1], [1, 1, 1, 0], [1, 1, 1, 1]]

#calculate all the nodes in the unlabeled puzzlegraph.
function calculateConfigurations(start, facecollection)
    #res is the collection of all configurations in the component
    res = copy(start)
    to_do = copy(start)
    counter = 0
    while true
        if length(to_do) == 0
            println("Maximale Tiefe erreicht.")
            break
        end
        counter += 1
        to_do ,res = @time calculate_one_step(to_do, res, facecollection)
        to_do = setdiff(to_do, res)
        res = union(res, to_do)
        println("Tiefe "*string(counter) * " wurde erreicht. \nAuf dieser Stufe gibt es "* string(length(to_do))* " Konfigurationen. \nInsgesamt wurden " * string(length(res)) * " Konfigurationen berechnet.\n")
    end
    return res
end

function calculate_one_step(previous, res, facecollection)
    next_step = []
    if length(previous) == 0
        return next_step, res
    end

    for configuration in previous
        for (position, label) in enumerate(configuration)
            if label != 0
                #iterate over all faces the labeled tile is in
                for k_face in facecollection[position]
                    if is_k_face_empty(configuration, k_face)
                        #add the 2**k-1 slides possible on that k_face
                        for corner in k_face
                            push!(next_step, change_configuration(configuration, label, corner, position))
                        end
                    end
                end
            end
        end
    end
    return next_step, res
end

function is_k_face_empty(configuration, k_face)
    my_bool = true
    for corner in k_face
        if configuration[corner+1] != 0
            my_bool = false
            break
        end
    end
    return my_bool
end

function change_configuration(configuration, label, corner, position)
    dummy = copy(configuration)
    dummy[corner+1] = label
    dummy[position] = 0
    return dummy
end

#calculate all the edges  and assign corresponding transpositions to them.
#slides only to adjacent corners to reduce complexity, parity properties stay unchanged.

function is_adjacent(corner1, corner2)
    if sum(abs,  [corner1[i]-corner2[i] for i in range(1, length(corner1))] ) == 1
        return true
    end
    return false
end

function calculate_edges_and_transpositions(nodes, facecollection)
    edges = []
    transpositions = []
    for node in nodes
        temp_edge = []
        temp_transpositions = []
        #idea if slow might swap order (iterate over every face only once)
        for (position, label) in enumerate(node)
            if label != 0
                #iterate over all faces the labeled tile is in
                for k_face in facecollection[position]
                    if is_k_face_empty(node, k_face)
                        #add the 2**k-1 slides possible on that k_face
                        for corner in k_face
                            if is_adjacent(four_cube[position], four_cube[corner + 1])
                                push!(temp_edge, indexin([change_configuration(node, label, corner, position)], nodes)[1])
                                push!(temp_transpositions, Transposition(perm_length ,position, corner + 1))
                            end
                        end
                    end
                end
            end
        end
        push!(edges, temp_edge)
        push!(transpositions, temp_transpositions)
    end
    return edges, transpositions
end

#returns if permutation is even or odd, calculated on the labels only

function is_odd(perm, unlabeld_starting_config)
    arr = perm.data
    for i in range(1, perm_length)
        if unlabeld_starting_config[1][i] == 0
            arr[i] = i
        end
    end
    if sign(Permutation(arr)) ==  -1
        return true
    end
    return false
end

#multiplies all permutaions in an array
function perm_mult(arr)
    arr2 = deepcopy(arr)
    res = arr2[end]
    pop!(arr2)
    while length(arr2) > 0
        res = arr2[end] * res
        pop!(arr2)
    end
    return res
end


#=
#wth i am tired
function check_cycles(edges, transpositions, start_node, current_node, blocked_nodes, perm_array)
    for (i, next_node) in enumerate(edges[current_node])
        if next_node == start_node
            blocked_nodes.add(start_node)
            perm_array.add(transpositions[i])
            if is_odd(perm_mult(perm_array))
                print(blocked_nodes)
                print("odd permutation was found")
            end
        elseif !(next_node in blocked_nodes)
            check_cycles(edges, transpositions, start_node, next_node, push(blocked_nodes, start_node), push(perm_array,transpositions[i]))
        end
    end
    return 1
end
#check_cycles(edges1, transpositions1, 1, 1, [1], [])
=#

#takes spanning tree of the unlabeled puzzle graph as input
#constructs cycle base
#prints to the console if cycle in ycle base corresponds to odd permutation on the labels
 function check_cycle_base(edges, perms, spanning_edges, spanning_perms, parents, unlabeled_starting_config)
    for node in range(2, length(edges))
        for edge in edges[node]
            if !(edge in spanning_edges[node])
                if edge != parents[node]

                    path1, path_perms1 = get_path_to_node(node, spanning_edges, spanning_perms, parents)
                    path2, path_perms2 = get_path_from_node(edge, spanning_edges, spanning_perms, parents)

                    if is_odd(perm_mult( cat( path_perms1, perms[node][indexin(edge, edges[node])[1]], path_perms2, dims = 1 )), unlabeled_starting_config )
                        println("odd permutation was found")
                        println(path1, path2)
                        println( perm_mult( cat( path_perms1, perms[node][indexin(edge, edges[node])[1]], path_perms2, dims = 1 )))
                        return true
                    end
                end
            end
        end
    end
    return false
 end

 #returns path fro node to the root of a spanning tree and the corresponding permutations
 function get_path_from_node(start_node, spanning_edges, spanning_perms, parents)
    path = []
    path_perms = []
    current_node = start_node
    while true
        if parents[current_node] == 0
            break
        end

        push!(path, parents[current_node])

        push!(path_perms, spanning_perms[parents[current_node]][ indexin( [current_node] , spanning_edges[parents[current_node]])[1] ] )
        
        current_node = parents[current_node]
    end
    return path, path_perms
 end

 #returns reverse get_path_from_node
 function get_path_to_node(start_node, spanning_edges, spanning_perms, parents)
    path, path_perms = get_path_from_node(start_node, spanning_edges, spanning_perms, parents)
    return reverse(path), reverse(path_perms, dims=1)
 end

#computes spanning tree 
#returns spanning tree and transpositions corresponding to the edges
 function compute_spanning_tree(edges, perms)
    visited_set = [1]
    parents = fill(0, length(edges))
    spanning_edges = deepcopy(edges)
    spanning_perms = deepcopy(perms)
    for node in range(1, length(edges))
        deleteat!( spanning_perms[node] , findall(x-> x in visited_set , spanning_edges[node]) )
        deleteat!( spanning_edges[node] , findall(x-> x in visited_set , spanning_edges[node]) )
        visited_set = [visited_set; spanning_edges[node]]
        for child in spanning_edges[node]
            parents[child] = node
        end
    end
    return spanning_edges, spanning_perms, parents
 end

#be happy.

function check_for_odd_perm(start, facecollection)
    test = calculateConfigurations(start, facecollection)

    edges1, transpositions1 = calculate_edges_and_transpositions(test, facecollection)
    println("step 1 \n")

    spanning_edges_test, spanning_perms_test, parents_test = compute_spanning_tree(edges1, transpositions1)
    println("step 2 \n")

    print("Are there odd permutations? = ")
    println(check_cycle_base(edges1, transpositions1, spanning_edges_test, spanning_perms_test, parents_test, start))
    println("also done with that")
end

println("52 :")
check_for_odd_perm(start52, facecollection52)

println("53 :")
check_for_odd_perm(start53, facecollection53)

println("54 :")
check_for_odd_perm(start54, facecollection54)