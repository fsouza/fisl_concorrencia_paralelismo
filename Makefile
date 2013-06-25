# Copyright 2013 Francisco Souza. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

PLAN9FLAGS = -I$(PLAN9)/include/ -L$(PLAN9)/lib/ -lthread -l9 -Wno-unused-parameter

sequence: sequence.c
	$(CC) $(CFLAGS) $(PLAN9FLAGS) $(LDFLAGS) -o sequence sequence.c
