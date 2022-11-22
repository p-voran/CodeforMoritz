from math import *
from itertools import permutations

def find_neighbors(configt,board):
    """
    Add all neighbors of a sliding-puzzle configuration to a list.
    
    Keyword arguments:
    configt -- tuple representing a configuration of the board
    board -- list representing a hex board by coordinates of centers of hexes
    
    This function returns a list of all neighbors of the configuration configt
    which may be reached by sliding a single tile.
    """
    neighbors = []
    
    config=list(configt)  # convert from tuple to list--may not be needed    
    n=len(board) 
    zeros=[i for i in range(n) if config[i]==0] # list of holes on board
    # Iterate over tiles on the board.
    # Check for pairs of neighboring holes next to tile.
    # Perform both possible slides of tile into pairs of neighboring holes
    # Add resulting configurations to list of neighbors of configt.
    for i in range(n): # iterate over tile positions
        if config[i]!=0: # check that tile is not a hole
            h=[]  # This will be list of zeros which neighbor the current tile
            for z in zeros:
                # check if a hole is next to current tile
                # if it is, add it to the list of neighboring holes
                if sqrt((board[i][0]-board[z][0])**2 + (board[i][1]-board[z][1])**2)<=1:
                    h.append(z)
            # Iterate over list of holes adjacent to current tile
            # Perform any possible slides
            # Add resulting new configurations to list of neighbors of tile
            for z in range(len(h)): 
                for zz in range(len(h)-z-1):
                    #Check if pair of holes neighboring our tile are adjacent
                    if sqrt((board[h[z]][0]-board[h[zz+z+1]][0])**2 + (board[h[z]][1]-board[h[zz+z+1]][1])**2)<=1:
                        #For each pair of adjacent holes, perform both
                        #possible slides of current tile into the holes
                        A=[config[col] for col in range(n)]
                        A[i]=0 # Current tile becomes hole after slide
                        A[h[z]]=config[i] # Current tile into first hole
                        B=[config[col] for col in range(n)]
                        B[i]=0 # Current tile becomes hole
                        B[h[zz+z+1]]=config[i] # Current tile into second hole
                        # Add both new configurations to list of neighbors
                        # of our configuration configt
                        if not (tuple(A) in neighbors):
                            neighbors.append(tuple(A))
                        if not (tuple(B) in neighbors):
                            neighbors.append(tuple(B))
    return neighbors


#2x2 parallelogram
para2by2=((0,0),(0,1),(-1.5/sqrt(3),0.5),(-1.5/sqrt(3),1.5))

#3x3 paralelogram
para3by3=((0,0),(0,1),(0,2),(-1.5/sqrt(3),0.5),(-1.5/sqrt(3),1.5),(-1.5/sqrt(3),2.5),(-sqrt(3),1),(-sqrt(3),2),(-sqrt(3),3))

#3x3 triangle
tri3=((0,0),(0,1),(0,2),(-1.5/sqrt(3),0.5),(-1.5/sqrt(3),1.5),(-sqrt(3),1))

#2x3 parallelogram
para2by3=((0,0),(0,1),(0,2),(-1.5/sqrt(3),0.5),(-1.5/sqrt(3),1.5),(-1.5/sqrt(3),2.5))

#Flower with 2 layers
hexa7=((0,0),(1,0),(-0.5,-1.5/sqrt(3)),(0.5,-1.5/sqrt(3)),(1.5,-1.5/sqrt(3)),(0,-sqrt(3)),(1,-sqrt(3)))

#Flower with 3 layers 
hexa19=((-1,sqrt(3)),(0,sqrt(3)),(1,sqrt(3)),(-1.5,1.5/sqrt(3)),(-0.5,1.5/sqrt(3)),(0.5,1.5/sqrt(3)),(1.5,1.5/sqrt(3)),(-2,0),(-1,0),(0,0),(1,0),(2,0),(-1.5,-1.5/sqrt(3)),(-0.5,-1.5/sqrt(3)),(0.5,-1.5/sqrt(3)),(1.5,-1.5/sqrt(3)),(-1,-sqrt(3)),(0,-sqrt(3)),(1,-sqrt(3)))

#tester is a trimmed 4 by 4 parallelogram
tester = ((1,0),(2,0),(3,0),(0.5,-1.5/sqrt(3)),(1.5,-1.5/sqrt(3)),(2.5,-1.5/sqrt(3)),(3.5,-1.5/sqrt(3)),(1,-sqrt(3)),
 (2,-sqrt(3)),(3,-sqrt(3)),(4,-sqrt(3)),(1.5,-4.5/sqrt(3)),(2.5,-4.5/sqrt(3)),(3.5,-4.5/sqrt(3)))

#small_tester is a trimmed 3 by 4 parallelgram
small_tester = ((1,0),(2,0),(3,0),(0.5,-1.5/sqrt(3)),(1.5,-1.5/sqrt(3)),(2.5,-1.5/sqrt(3)),(3.5,-1.5/sqrt(3)),(1,-sqrt(3)),
 (2,-sqrt(3)),(3,-sqrt(3)))

#4x4 triangle
tri4=((0,0),(1,0),(2,0),(3,0),(0.5,-1.5/sqrt(3)),(1.5,-1.5/sqrt(3)),(2.5,-1.5/sqrt(3)),(1,-sqrt(3)),(2,-sqrt(3)),(1.5,-4.5/sqrt(3)))

#4x4 paralelogram
para4by4=((0,0),(1,0),(2,0),(3,0),(0.5,-1.5/sqrt(3)),(1.5,-1.5/sqrt(3)),(2.5,-1.5/sqrt(3)),(3.5,-1.5/sqrt(3)),(1,-sqrt(3)),(2,-sqrt(3)),(3,-sqrt(3)),(4,-sqrt(3)),(1.5,-4.5/sqrt(3)),(2.5,-4.5/sqrt(3)),(3.5,-4.5/sqrt(3)),(4.5,-4.5/sqrt(3)))

#2x4 parallelogram
para2by4=((0,0),(1,0),(2,0),(3,0),
          (0.5,-1.5/sqrt(3)),(1.5,-1.5/sqrt(3)),
          (2.5,-1.5/sqrt(3)),(3.5,-1.5/sqrt(3)))

#5x3 trimmed pseude rectangle
large_tester=(
            (1,0),(2,0),
            (0.5,-1.5/sqrt(3)),(1.5,-1.5/sqrt(3)),(2.5,-1.5/sqrt(3)),
            (0,-sqrt(3)),(1,-sqrt(3)),(2,-sqrt(3)),
            (0.5,-4.5/sqrt(3)),(1.5,-4.5/sqrt(3)),(2.5,-4.5/sqrt(3)),
            (1,-2*sqrt(3)),(2,-2*sqrt(3))
            )

def gen_starter(holes, tiles):
    """
    Returns a tuple of the form (0,0,..,0,1,2,...,tiles) 
    where the number of 0's is given by the parameter holes.
    """
    return(tuple([0 for hole in range(holes)]+list(range(1, tiles+1-holes))))
    
def find_new(new_configs, found_already, comp_dict, board):
    """
    Search for all neighbors of configurations in the lists new_configs.
    Update the list of configurations found already,
    and the dictionary recording adjacencies in the configuration space.
    Uses the function find_neighbors.
    Keyword arguments:
    new_configs--list of tuples representing configurations of the board.
    found_already--list of all configurations previously found, 
                   which must have the list new_configs as a final segment
    comp_dict--dictionary of adjacency relations found so far.
               Should not yet have keys for configurations in new_configs.
    board--tuple of pairs representing centers of tiles on board
    This function returns a list of new configurations 
    found while searching for neighbors.
    """

    next_up = [] # List that will hold new configurations.
    for config in new_configs:
        # Find neighbors of new configuration,
        # update dictionary which records adjacencies.
        my_pals = find_neighbors(config, board)
        comp_dict[config] = my_pals
        # Check if neighbors found are previously unknown configurations,
        # If so add to the list of configurations found during this step
        # of the search process,
        # and to list of all configurations found so far.
        for pal in my_pals:
            if not (pal in found_already):
                next_up.append(pal)
                found_already.append(pal)
    # Return list of configurations found during the search.
    return(next_up)

def build_component(vertex, board):
    """
    Returns a dictionary representing a connected component in the 
    configuration space of sliding puzzles.
    Keys are confirguations. Values are list of configurations 
    adjacent to the corresponding keys.
    Uses the function find_new.
    Keyword arguments:
    vertex--tuple representing a starting configuration.
    board--board--tuple of pairs representing centers of tiles on board.
    """
    
    found = [vertex] # List of configurations found so far.
    on_deck = [vertex] # Configurations whose neighbors need to be found.
    comp_dict = {} # Dictionary that will record adjacencies.
    while True:
        # Call find_new to find neighbors of all configurations
        # in the list on_deck.
        # Update the list found and the dictionary comp_dict.
        # Replace on_deck with the list of new configurations found.
        on_deck = find_new(on_deck, found, comp_dict, board)
        print("added "+str(len(on_deck))+" new configurations!")
        # If no new configurations were found,
        # the connected component has been exahusted
        # and the loop ends.
        if on_deck == []:
            break
    return(comp_dict)

def find_new_idx(num_new, found_already, comp_dict, board):
    """
    Search for all neighbors of configurations in the last num_new positions
    of the list of configurations found_already.
    Update the list of configurations found_already to include
    any previously unknown configurations found in the process.
    Update the dictionary comp_dict, which recordings adjacencies 
    in the configuration space.
    
    Differs from find_new in that in the dictionary recording adjacencies,
    configurations are represented by integers giving their 
    place in the list of configurations found.
    Uses the function find_neighbors.
    Keyword arguments:
    new_configs--list of tuples representing configurations of the board.
    found_already--list of all configurations found, 
                   which must have the configurations whose neighbors
                   are to be found as its late num_new entries.
    comp_dict--dictionary of adjacency relations found so far.
               Keys are integers representing the index of a configuration
               in the list found_already.
               Values are lists of integers representing indices of neighbors
               of the configuration indexed in found_already by the 
               corresponding key.
    board--tuple of pairs representing centers of tiles on board
    This function returns the number of previously unknown configurations 
    found while searching for neighbors.
    """

    num_found = 0 # Keep track of number of new configurations found
    my_len = len(found_already) # Number of configurations found so far
    indices = range(my_len-num_new, my_len)
    
    # Iterate over last num_new configurations in original list found_already.
    for idx in indices:
        # Find neighbors each new configuration
        my_pals = find_neighbors_simple(found_already[idx], board)
        for pal in my_pals:
            # Check if each neighbor of the current configuration
            # has been previously found.
            # If not, add it to list of all configurations found so far,
            # and increment number of configurations found in this
            # step of the search.
            if not (pal in found_already):
                num_found += 1
                found_already.append(pal)
        # Add entry for current configuration to the dictionary of adjacencies.
        comp_dict[idx] = [found_already.index(pal) for pal in my_pals]
    # Return the number of configurations found in this step of the search.
    return(num_found)

def build_component_idx(vertex, board):
    """
    Returns a pair whose first element is a list found 
    of all configurations in the connected component of vertex
    in the configuration space of sliding puzzles, 
    and whose second element is a dictionary recording 
    adjacency relations in that connected component.
    Keys in the dictionary are integers. The value corresponding to each key
    is a list of integers, which give the indices in found
    of all neighbors of the configuration indexed by the key.
    Uses the function find_new_idx.
    Keyword arguments:
    vertex--tuple representing a starting configuration.
    board--board--tuple of pairs representing centers of tiles on board.
    """
    found = [vertex] # List of configurations found so far.
    num_to_check = 1 # Number of configurations whose neighbors must be found.
    comp_dict = {} # Records adjacencies in the configuration space.
    while True:
        # Call find_new_idx to find neighbors of the last
        # num_to_check configurations in the list found.
        # Add any previously unknown configurations to the list found
        # and add entries to the dictionary comp_dict.
        # Replace num_to_check with the number of new configurations found.
        num_to_check = find_new_idx(num_to_check, found, comp_dict, board)
        print("added "+str(num_to_check)+ " new configurations!")
        # If no new configurations were found,
        # the connected component has been exahusted
        # and the loop ends.
        if num_to_check == 0:
            break 
    return(found, comp_dict)

def depth_of_tree(vertex, board):
    """
    Returns the depth of the tree found when doing a breadth-first search
    for configurations of a given board shape.
    Uses the function find_new_idx.
    Keyword arguments:
    vertex--tuple representing a starting configuration.
    board--board--tuple of pairs representing centers of tiles on board.
    """
    found = [vertex] # List of configurations found so far.
    num_to_check = 1 # Number of configurations whose neighbors must be found.
    stages = 0 # How many steps from the starting point have been calculated?
    comp_dict = {} # Records adjacencies in the configuration space.
    while True:
        # Call find_new_idx to find neighbors of the last
        # num_to_check configurations in the list found.
        # Add any previously unknown configurations to the list found
        # and add entries to the dictionary comp_dict.
        # Replace num_to_check with the number of new configurations found.
        num_to_check = find_new_idx(num_to_check, found, comp_dict, board)
        print("added "+str(num_to_check)+ " new configurations!")
        # If no new configurations were found,
        # the connected component has been exahusted
        # and the loop ends.
        if num_to_check == 0:
            break
        stages += 1
    return(stages)

def write_component_idx(holes, board, board_name, file_name):
    """
    Given a board and number of holes, finds a connected component
    in the configuration space of sliding puzzles.
    Writes the result to a text file, formatted legibly.
    Configurations are represented as tuples, with entries
    corresponding to positions on the board.
    Adjacencies are represented by a dictionary.
    Each key, value pair encodes a configuration
    and a list of its neighbors.
    Configurations in this dictionary are represented by integers
    which indicate their position in the list of all configurations found.
    Uses the function build_component_idx to build the component.
    """

    starter = gen_starter(holes, len(board)) # Generate a starting vertex.
    result = build_component_idx(starter, board) # Build the connected component.
    configs_found=result[0] # List of configurations in connected component.
    c = len(configs_found) 
    comp_dict=result[1] # Dictionary of adjacency relations.
    file = open(file_name, "w+")
    file.write("board: " + board_name + '\n')
    file.write("holes: " + str(holes) + '\n')
    file.write("We found a sample component with %d configurations \n\n" %c)
    file.write("configurations found:\n")
    place = 0 # Number the entries in the list of configurations
    for config in configs_found:
        file.write("Configuration "+str(place)+": "+str(config)+"\n")
        place += 1
    file.write("\n")
    file.write("Relations in the graph:\n")
    for idx in comp_dict:
        file.write(str(idx)+": "+str(comp_dict[idx])+"\n")
    file.close()

def write_from_vert(vert, board, file_name):
    """
    Given a board and number of holes, finds a connected component
    in the configuration space of sliding puzzles.
    Writes the result to a text file, formatted legibly.
    Configurations are represented as tuples, with entries
    corresponding to positions on the board.
    Adjacencies are represented by a dictionary.
    Each key, value pair encodes a configuration
    and a list of its neighbors.
    Configurations in this dictionary are represented by integers
    which indicate their position in the list of all configurations found.
    Uses the function build_component_idx to build the component.
    """
    result = build_component_idx(vert, board) # Build the connected component.
    configs_found=result[0] # List of configurations in connected component.
    c = len(configs_found) 
    comp_dict=result[1] # Dictionary of adjacency relations.
    file = open(file_name, "w+")
    file.write("We found a sample component with %d configurations \n\n" %c)
    file.write("configurations found:\n")
    place = 0 # Number the entries in the list of configurations
    for config in configs_found:
        file.write("Configuration "+str(place)+": "+str(config)+"\n")
        place += 1
    file.write("\n")
    file.write("Relations in the graph:\n")
    for idx in comp_dict:
        file.write(str(idx)+": "+str(comp_dict[idx])+"\n")
    file.close()


def slide_tile(tile, hole, configt):
    """
    Given the position of a labeled tile and a hole, switch them.
    Does no checking to make sure the switch is valid.
    """
    switched = list(configt) # List representing a configuration of the board
    switched[hole] = configt[tile]
    switched[tile] = 0
    return tuple(switched) # Return a tuple
    
def check_distance(pos1, pos2, board):
    """
    Given two positions on the board, determines if they are neighbors
    by checking distance between centers of corresponding
    tiles on the board.
    """
    xdiff = board[pos1][0]-board[pos2][0]
    ydiff = board[pos1][1]-board[pos2][1]
    dist = sqrt(xdiff**2 + ydiff**2)
    answer = (dist <= 1.5) and (dist >= 0.5)
    return answer

def find_neighbors_simple(config_tuple,board):
    """
    Return a list containing all neighbors of a sliding-puzzle configuration.
    
    Keyword arguments:
    configt -- tuple representing a configuration of the board
    board -- list representing a hex board by coordinates of centers of hexes
    
    This function uses the functions check_distance and slide_tile defined above.
    """
    neighbors = []
    config=list(config_tuple)
    positions=len(board)
    holes=[pos for pos in range(positions) if config[pos]==0] # positions holes
    tiles=[pos for pos in range(positions) if config[pos]!= 0] # positions of tiles
    for tile in tiles:
        # Create list of zeros neighoring current tile
        adj_holes=[pos for pos in holes if check_distance(tile, pos, board)]
        to_slide = [] # List of holes tile can be slid into
        for pos1 in adj_holes:
            # If there is another hole adjacent to both pos1 and
            # the current tile, we can slide the current tile
            # into the hole at pos1.
            for pos2 in adj_holes:
                if check_distance(pos1, pos2, board):
                    to_slide.append(pos1)
                    break
        for hole in to_slide:
            neighbors.append(slide_tile(tile, hole, config))
    return neighbors

def trace_path_back(vertex, found, comp_dict):
    """
    Find a path from one configuration to another
    in a spanning tree computed using our breadth-first search algorithm.
    """
    idx = found.index(vertex)
    path = []
    while idx > 0:
        path.append(idx)
        idx = min(comp_dict[idx])
    return path


write_component_idx(2, large_tester, "5x3 rectangle trimmed", "5x3rectangletrimmed.txt")
