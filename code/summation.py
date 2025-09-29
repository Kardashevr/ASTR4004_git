#!/usr/bin/env python3
import argparse
import timeit
import numpy as np
from numba import jit

def for_loop_sum(n):
    total = 0 
    for i in n:
        total += i
    return total

def numpy_sum(n):
    n = np.array(n)
    return np.sum(n)

@jit
def numba_sum(n):
    total = 0 
    for i in n:
        total += i
    return total

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Compare summation methods.")
    parser.add_argument("-n", type=int, default=int(1e8), help="The upper limit of the summation.")
    args = parser.parse_args()

    n = args.n
    n = np.arange(1, n+1, dtype=np.int64)

    # Time for loop summation
    loop_time = timeit.timeit(lambda: for_loop_sum(n))
    print(f"For loop sum time: {loop_time:.6f} seconds")

    # Time numpy summation
    numpy_time = timeit.timeit(lambda: numpy_sum(n))
    print(f"Numpy sum time: {numpy_time:.6f} seconds")

    # Time numba summation
    # First call to compile the function
    numba_sum(n)
    numba_time = timeit.timeit(lambda: numba_sum(n))
    print(f"Numba sum time: {numba_time:.6f} seconds")
