package handlers

import (
	"encoding/json"
	"net/http"
	"time"
	"os"

	"github.com/manuelsanta06/agenda/database"
	// "github.com/manuelsanta06/agenda/models"
)

func SyncCatalogHandler(w http.ResponseWriter,r *http.Request){
  apiSecret:=os.Getenv("API_SECRET")
	authHeader:=r.Header.Get("Authorization")
	if authHeader!="Bearer "+apiSecret{
		http.Error(w,"Acceso no autorizado",http.StatusUnauthorized)
		return
	}
  if r.Method!=http.MethodGet{
		http.Error(w,"Método no permitido",http.StatusMethodNotAllowed)
		return
	}
  lastSyncStr:=r.URL.Query().Get("last_sync")
  if lastSyncStr==""{
		lastSyncStr="1970-01-01T00:00:00Z"
	}
  _,err:=time.Parse(time.RFC3339, lastSyncStr)
  if err!=nil{
    http.Error(w,"Formato de fecha inválido. Usa RFC3339",http.StatusBadRequest)
    return
  }

	payload,err := database.FetchCatalogSince(lastSyncStr)
  if err!=nil{
    http.Error(w,"Error consultando eventos: "+err.Error(),http.StatusConflict)
    return
  }
  w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(payload)
}

func SyncEventsHandler(w http.ResponseWriter, r *http.Request) {
	apiSecret:=os.Getenv("API_SECRET")
	authHeader:=r.Header.Get("Authorization")
	if authHeader!="Bearer "+apiSecret{
		http.Error(w,"Acceso no autorizado",http.StatusUnauthorized)
		return
	}
  if r.Method!=http.MethodGet{
		http.Error(w,"Método no permitido",http.StatusMethodNotAllowed)
		return
	}
  lastSyncStr:=r.URL.Query().Get("last_sync")
  if lastSyncStr==""{
		lastSyncStr="1970-01-01T00:00:00Z"
	}
  _,err:=time.Parse(time.RFC3339, lastSyncStr)
  if err!=nil{
    http.Error(w,"Formato de fecha inválido. Usa RFC3339",http.StatusBadRequest)
    return
  }

	payload,err:=database.FetchEventsSince(lastSyncStr)
	if err != nil {
		http.Error(w, "Error consultando eventos: "+err.Error(), http.StatusInternalServerError)
		return
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(payload)
}
