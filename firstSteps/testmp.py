import multiprocessing


def mp_func1():
    my_queue = multiprocessing.Queue()
    procs = []
    for i in range(8):
        proc = multiprocessing.Process(target= mp_func2, args= (my_queue, i))
        procs.append(proc)
        proc.start()
        print("proc startet")
    for pr in procs:
        pr.join()
    print(my_queue.get())

def mp_func2(queue, input):
    queue.put(input)

if __name__ == '__main__':
    mp_func1()
