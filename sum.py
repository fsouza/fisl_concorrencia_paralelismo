# Copyright 2013 Francisco Souza. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

import multiprocessing


def power(value):
    return value * value

if __name__ == "__main__":
    numbers = xrange(1, 20001)
    pool = multiprocessing.Pool(20)
    powers = pool.map(power, numbers)
    sum = 0
    for n in powers:
        sum += n
    print sum
