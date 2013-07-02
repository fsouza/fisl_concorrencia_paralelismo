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
