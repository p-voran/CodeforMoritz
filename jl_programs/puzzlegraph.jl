

#starting configurations
start1 = [[0,0,0,1,0,2,3,4,0,5,6,7,8,9,10,11]]

facecollection42 =  [[[1, 2, 3], [1, 4, 5], [2, 4, 6], [1, 8, 9], [2, 8, 10], [4, 8, 12]], [[0, 2, 3], [0, 4, 5], [3, 5, 7], [0, 8, 9], [3, 9, 11], [5, 9, 13]], [[0, 1, 3], [3, 6, 7], [0, 4, 6], [3, 10, 11], [0, 8, 10], [6, 10, 14]], [[0, 1, 2], [2, 6, 7], [1, 5, 7], [2, 10, 11], [1, 9, 11], [7, 11, 15]], [[5, 6, 7], [0, 1, 5], [0, 2, 6], [5, 12, 13], [6, 12, 14], [0, 8, 12]], [[4, 6, 7], [0, 1, 4], [1, 3, 7], [4, 12, 13], [7, 13, 15], [1, 9, 13]], [[4, 5, 7], [2, 3, 7], [0, 2, 4], [7, 14, 15], [4, 12, 14], [2, 10, 14]], [[4, 5, 6], [2, 3, 6], [1, 3, 5], [6, 14, 15], [5, 13, 15], [3, 11, 15]], [[9, 10, 11], [9, 12, 13], [10, 12, 14], [0, 1, 9], [0, 2, 10], [0, 4, 12]], [[8, 10, 11], [8, 12, 13], [11, 13, 15], [0, 1, 8], [1, 3, 11], [1, 5, 13]], [[8, 9, 11], [11, 14, 15], [8, 12, 14], [2, 3, 11], [0, 2, 8], [2, 6, 14]], [[8, 9, 10], [10, 14, 15], [9, 13, 15], [2, 3, 10], [1, 3, 9], [3, 7, 15]], [[13, 14, 15], [8, 9, 13], [8, 10, 14], [4, 5, 13], [4, 6, 14], [0, 4, 8]], [[12, 14, 15], [8, 9, 12], [9, 11, 15], [4, 5, 12], [5, 7, 15], [1, 5, 9]], [[12, 13, 15], [10, 11, 15], [8, 10, 12], [6, 7, 15], [4, 6, 12], [2, 6, 10]], [[12, 13, 14], [10, 11, 14], [9, 11, 13], [6, 7, 14], [5, 7, 13], [3, 7, 11]]]

four_cube = [[0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 1, 0], [0, 0, 1, 1], [0, 1, 0, 0], [0, 1, 0, 1], [0, 1, 1, 0], [0, 1, 1, 1], [1, 0, 0, 0], [1, 0, 0, 1], [1, 0, 1, 0], [1, 0, 1, 1], [1, 1, 0, 0], [1, 1, 0, 1], [1, 1, 1, 0], [1, 1, 1, 1]]

function calculateConfigurations(start, d, k)
    facecollection = facecollection42
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
        to_do ,res = calculate_one_step(to_do, res, facecollection)
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
                            dummy = copy(configuration)
                            dummy[corner+1] = label
                            dummy[position] = 0
                            if dummy ??? res
                                push!(res, dummy)
                                push!(next_step, dummy)
                            end
                            if dummy == [0,0,0,2,0,1,3,4,0,5,6,7,8,9,10,11]
                                print(dummy)
                                print("transposition found")
                            end
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
test = calculateConfigurations(start1,4,2)
