package handlers

import (
	"encoding/json"
	"net/http"
	"os"

	"github.com/manuelsanta06/agenda/database"
	"github.com/manuelsanta06/agenda/models"
)

func SyncAllHandler(w http.ResponseWriter,r *http.Request){
  apiSecret:=os.Getenv("API_SECRET")
	authHeader:=r.Header.Get("Authorization")
	if authHeader!="Bearer "+apiSecret{
		http.Error(w,"Acceso no autorizado",http.StatusUnauthorized)
		return
	}
  if r.Method!=http.MethodPost{
		http.Error(w,"Método no permitido",http.StatusMethodNotAllowed)
		return
	}
  var payload models.SyncPayload
  err:=json.NewDecoder(r.Body).Decode(&payload)
	if err!=nil{
		http.Error(w,"JSON inválido: "+err.Error(),http.StatusBadRequest)
		return
	}

  err=database.FullSync(payload)
  if err!=nil{
    http.Error(w,err.Error(),http.StatusConflict)
    return
  }

  w.WriteHeader(http.StatusOK)
	w.Write([]byte(`{"status": "ok", "mensaje": "Sincronización exitosa"}`))
}
