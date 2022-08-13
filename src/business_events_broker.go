package main

import (
    "fmt"
    "encoding/json"
)

type Business struct {
    name string        `json:"business_name"`
	primaryKey uint64  `json:"pk"`

    events map[string]*Event
}

type Event struct {
    name string               `json:"business_name"`
	primaryKey uint64         `json:"pk"`
    foreignKeyBusiness uint64 `json:"fk"`
}


func main() {
    business1 := &Business{name: "Todo o nada", primaryKey: 0}
    //event1 := &Event{name: "2 x 1", primaryKey: 1000, foreignKeyBusiness: 0}
    //event2 := &Event{name: "Birra gratis", primaryKey: 1001, foreignKeyBusiness: 0}

    e, err := json.Marshal(business1)
    if err != nil {
        fmt.Println(err)
        return
    }
    fmt.Println(string(e))
}