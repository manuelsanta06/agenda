package handlers

import (
	"net/http"
	"fmt"
	"os"

	"github.com/manuelsanta06/agenda/scheduler"
)

func ToggleShiftsSchedulerHandler(w http.ResponseWriter,r *http.Request){
	apiSecret:=os.Getenv("API_SECRET")
	if r.Header.Get("Authorization")!="Bearer "+apiSecret{
		http.Error(w,"Acceso no autorizado",http.StatusUnauthorized)
		return
	}
	
	newState:=!scheduler.GetShiftsEnabled()
	scheduler.SetShiftsEnabled(newState)
	
	w.WriteHeader(http.StatusOK)
	w.Write([]byte(fmt.Sprintf(`{"status": "ok", "shifts_enabled": %t}`,newState)))
}

func ToggleDebtsSchedulerHandler(w http.ResponseWriter,r *http.Request){
	apiSecret:=os.Getenv("API_SECRET")
	if r.Header.Get("Authorization")!="Bearer "+apiSecret{
		http.Error(w,"Acceso no autorizado",http.StatusUnauthorized)
		return
	}
	
	newState:=!scheduler.GetDebtsEnabled()
	scheduler.SetDebtsEnabled(newState)
	
	w.WriteHeader(http.StatusOK)
	w.Write([]byte(fmt.Sprintf(`{"status": "ok", "debts_enabled": %t}`,newState)))
}
