package main

import (
	// "encoding/json"
	"fmt"
	"log"
	"net/http"

	"github.com/manuelsanta06/agenda/database"
	"github.com/manuelsanta06/agenda/handlers"
)

func main() {
	database.Connect()

	mux:=http.NewServeMux()
	mux.HandleFunc("GET /ping",handlers.PingHandler)

	mux.HandleFunc("POST /sync",handlers.SyncAllHandler)
  mux.HandleFunc("GET /sync/catalog",handlers.SyncCatalogHandler)
  mux.HandleFunc("GET /sync/events",handlers.SyncEventsHandler)

	fmt.Println("Servidor corriendo en http://localhost:8080 ...")
	log.Fatal(http.ListenAndServe("0.0.0.0:8080",mux))
}
