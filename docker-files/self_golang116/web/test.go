package main

import "fmt"

func DeferFunc1(i int) int {
    t := i
    defer func() {
	t += 3
    }()
    return t
}

func main() {
    fmt.Println(DeferFunc1(1))
}
