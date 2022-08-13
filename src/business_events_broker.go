package main

import (
    "fmt"
    "encoding/json"
)

type Business struct {
    Name string `json:"business_name"`
	Number int  `json:"pk"`
}

func main() {
    emp := &Employee{Name: "Rocky",Number: 5454}
    e, err := json.Marshal(emp)
    if err != nil {
        fmt.Println(err)
        return
    }
    fmt.Println(string(e))
}