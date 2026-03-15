package handlers

import (
  "net/http"
)

func PingHandler(w http.ResponseWriter,r *http.Request){
  w.Header().Set("Content-Type", "application/json")
  w.Write([]byte(`{"mensaje": "Todo ok"}`))
}
