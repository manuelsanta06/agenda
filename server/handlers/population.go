package handlers

import (
	"net/http"
	"os"

	"github.com/manuelsanta06/agenda/database"
)

func RecorridoShiftPopulationHandler(w http.ResponseWriter,r *http.Request){
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
  err:=database.RecorridoShiftPopulationRoutine()
  if err!=nil{
    http.Error(w,err.Error(),http.StatusInternalServerError)
    return
  }

  w.WriteHeader(http.StatusOK)
	w.Write([]byte(`{"status": "ok", "mensaje": "shifts populados"}`))
}

func RecorridosDebtsPopulationHandler(w http.ResponseWriter,r *http.Request){
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
  err:=database.MonthlyDebtPopulationRoutine()
  if err!=nil{
    http.Error(w,err.Error(),http.StatusInternalServerError)
    return
  }

  w.WriteHeader(http.StatusOK)
	w.Write([]byte(`{"status": "ok", "mensaje": "Debts populados"}`))
}
