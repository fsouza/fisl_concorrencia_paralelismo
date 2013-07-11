// Copyright 2013 Francisco Souza. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package main

import (
	"fmt"
	"sync/atomic"
)

func main() {
	var n int64
	n = 10
	fmt.Println(atomic.AddInt64(&n, 1))
}
