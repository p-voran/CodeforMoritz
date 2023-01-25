
using Permutations


#starting configurations
start1 =  [[0,0,0,1,0,1,1,1,0,1,1,1,1,1,1,1]]
start2 = [[0,0,0,1,0,1,1,1,0,1,1,1,1,1,1,0]]
start3 = [[0,1,1,1,0,0,0,1]]
start4 = [[0,1,1,1,0,0,0,0]]
start5 = [[0,1,1,0,0,0,0,0]]

#start1 = [[0,0,0,1,0,2,3,4,0,5,6,7,8,9,10,11]]

#number of corners
const perm_length = 16

#facecollections

facecollection32 = [[[1, 2, 3], [1, 4, 5], [2, 4, 6]], [[0, 2, 3], [0, 4, 5], [3, 5, 7]], [[0, 1, 3], [3, 6, 7], [0, 4, 6]], [[0, 1, 2], [2, 6, 7], [1, 5, 7]], [[5, 6, 7], [0, 1, 5], [0, 2, 6]], [[4, 6, 7], [0, 1, 4], [1, 3, 7]], [[4, 5, 7], [2, 3, 7], [0, 2, 4]], [[4, 5, 6], [2, 3, 6], [1, 3, 5]]]

facecollection42 = [[[1, 2, 3], [1, 4, 5], [2, 4, 6], [1, 8, 9], [2, 8, 10], [4, 8, 12]], [[0, 2, 3], [0, 4, 5], [3, 5, 7], [0, 8, 9], [3, 9, 11], [5, 9, 13]], [[0, 1, 3], [3, 6, 7], [0, 4, 6], [3, 10, 11], [0, 8, 10], [6, 10, 14]], [[0, 1, 2], [2, 6, 7], [1, 5, 7], [2, 10, 11], [1, 9, 11], [7, 11, 15]], [[5, 6, 7], [0, 1, 5], [0, 2, 6], [5, 12, 13], [6, 12, 14], [0, 8, 12]], [[4, 6, 7], [0, 1, 4], [1, 3, 7], [4, 12, 13], [7, 13, 15], [1, 9, 13]], [[4, 5, 7], [2, 3, 7], [0, 2, 4], [7, 14, 15], [4, 12, 14], [2, 10, 14]], [[4, 5, 6], [2, 3, 6], [1, 3, 5], [6, 14, 15], [5, 13, 15], [3, 11, 15]], [[9, 10, 11], [9, 12, 13], [10, 12, 14], [0, 1, 9], [0, 2, 10], [0, 4, 12]], [[8, 10, 11], [8, 12, 13], [11, 13, 15], [0, 1, 8], [1, 3, 11], [1, 5, 13]], [[8, 9, 11], [11, 14, 15], [8, 12, 14], [2, 3, 11], [0, 2, 8], [2, 6, 14]], [[8, 9, 10], [10, 14, 15], [9, 13, 15], [2, 3, 10], [1, 3, 9], [3, 7, 15]], [[13, 14, 15], [8, 9, 13], [8, 10, 14], [4, 5, 13], [4, 6, 14], [0, 4, 8]], [[12, 14, 15], [8, 9, 12], [9, 11, 15], [4, 5, 12], [5, 7, 15], [1, 5, 9]], [[12, 13, 15], [10, 11, 15], [8, 10, 12], [6, 7, 15], [4, 6, 12], [2, 6, 10]], [[12, 13, 14], [10, 11, 14], [9, 11, 13], [6, 7, 14], [5, 7, 13], [3, 7, 11]]]

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
                    end
                end
            end
        end
    end
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


test = calculateConfigurations(start1, facecollection42)

edges1, transpositions1 = calculate_edges_and_transpositions(test, facecollection42)
println("step 1 \n")

spanning_edges_test, spanning_perms_test, parents_test = compute_spanning_tree(edges1, transpositions1)
println("step 2 \n")

check_cycle_base(edges1, transpositions1, spanning_edges_test, spanning_perms_test, parents_test, start1)
print("also done with that")