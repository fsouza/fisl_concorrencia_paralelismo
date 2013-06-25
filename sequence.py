# Copyright 2013 Francisco Souza. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

import random
import time

import csp.csp as csp


@csp.process
def sequence(ch, limit):
    for i in xrange(limit):
        ch.write(i)
    ch.poison()


@csp.process
def consumer(ch):
    while True:
        v = ch.read()
        time.sleep(float(random.randint(0, 100)) / 100.0)
        print v


if __name__ == "__main__":
    ch = csp.Channel()
    sequence(ch, 5000).start()
    processes = csp.Par(process(ch), process(ch), process(ch))
    processes.start()
