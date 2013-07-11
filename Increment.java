// Copyright 2013 Francisco Souza. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import java.util.concurrent.atomic.AtomicInteger;

public class Increment {
	public static void main(String[] args) {
		AtomicInteger i = new AtomicInteger(10);
		System.out.println(i.incrementAndGet());
	}
}
