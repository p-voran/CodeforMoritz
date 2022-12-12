
using StaticArrays

#Output file

output_file = open("output_file_42_9_tiles.text", "w")


#sparse starting configurations
sparse_start42_9tiles= [SVector{9, UInt8}(0,1,2,4,8,12,13,14,15)]


#facecollections
facecollection42 = [[[1, 2, 3], [1, 4, 5], [2, 4, 6], [1, 8, 9], [2, 8, 10], [4, 8, 12]], [[0, 2, 3], [0, 4, 5], [3, 5, 7], [0, 8, 9], [3, 9, 11], [5, 9, 13]], [[0, 1, 3], [3, 6, 7], [0, 4, 6], [3, 10, 11], [0, 8, 10], [6, 10, 14]], [[0, 1, 2], [2, 6, 7], [1, 5, 7], [2, 10, 11], [1, 9, 11], [7, 11, 15]], [[5, 6, 7], [0, 1, 5], [0, 2, 6], [5, 12, 13], [6, 12, 14], [0, 8, 12]], [[4, 6, 7], [0, 1, 4], [1, 3, 7], [4, 12, 13], [7, 13, 15], [1, 9, 13]], [[4, 5, 7], [2, 3, 7], [0, 2, 4], [7, 14, 15], [4, 12, 14], [2, 10, 14]], [[4, 5, 6], [2, 3, 6], [1, 3, 5], [6, 14, 15], [5, 13, 15], [3, 11, 15]], [[9, 10, 11], [9, 12, 13], [10, 12, 14], [0, 1, 9], [0, 2, 10], [0, 4, 12]], [[8, 10, 11], [8, 12, 13], [11, 13, 15], [0, 1, 8], [1, 3, 11], [1, 5, 13]], [[8, 9, 11], [11, 14, 15], [8, 12, 14], [2, 3, 11], [0, 2, 8], [2, 6, 14]], [[8, 9, 10], [10, 14, 15], [9, 13, 15], [2, 3, 10], [1, 3, 9], [3, 7, 15]], [[13, 14, 15], [8, 9, 13], [8, 10, 14], [4, 5, 13], [4, 6, 14], [0, 4, 8]], [[12, 14, 15], [8, 9, 12], [9, 11, 15], [4, 5, 12], [5, 7, 15], [1, 5, 9]], [[12, 13, 15], [10, 11, 15], [8, 10, 12], [6, 7, 15], [4, 6, 12], [2, 6, 10]], [[12, 13, 14], [10, 11, 14], [9, 11, 13], [6, 7, 14], [5, 7, 13], [3, 7, 11]]]

function calculateConfigurations(start, facecollection)
    #res is the collection of all configurations in the component
    res::Vector{SVector{9, UInt8}} = copy(start)
    to_do::Vector{SVector{9, UInt8}} = copy(start)
    previous::Vector{SVector{9, UInt8}} = copy(start)
    counter = 0
    while true
        if length(to_do) == 0
            write(output_file, "Maximale Tiefe = "*string(counter - 1) * "erreicht.")
            break
        end
        counter += 1
        #println("Time to calculate one_step:")
        to_do = calculate_one_step(to_do,  facecollection)
        
        #println("Time to calculate set_operations:")
        res = set_operations(to_do, res, previous)

        previous = copy(to_do)
        #to_do = setdiff(to_do, res)
        #res = union(res, to_do)
        write(output_file ,"Tiefe "*string(counter) * " wurde erreicht. \nAuf dieser Stufe gibt es "* string(length(to_do))* " Konfigurationen. \nInsgesamt wurden " * string(length(res)) * " Konfigurationen berechnet.\n")
    end
    return res
end

function set_operations(to_do, res, previous)
    #also makes to_do unique, super important.
    setdiff!(to_do, previous)
    setdiff!(to_do, res)
    return [res; to_do]
end

function calculate_one_step(previous, facecollection)
    next_step::Vector{SVector{9, UInt8}} = []
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
                        push!(next_step, SVector{9, UInt8}(setindex!([x for x in configuration], corner, label)))
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

test = @time calculateConfigurations(sparse_start42_9tiles, facecollection42)

if SVector{9, UInt8}(1,0,2,4,8,12,13,14,15) in test
    write(output_file, "2-Cycle was found!")
end
close(output_file)
