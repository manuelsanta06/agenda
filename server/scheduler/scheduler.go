package scheduler

import(
	"fmt"
	"sync"
	"time"

	"github.com/robfig/cron/v3"
	"github.com/manuelsanta06/agenda/database"
)

var(
	shiftsEnabled=true
	debtsEnabled=true
	mu sync.RWMutex
)

func SetShiftsEnabled(state bool){
	mu.Lock()
	shiftsEnabled=state
	mu.Unlock()
}

func SetDebtsEnabled(state bool){
	mu.Lock()
	debtsEnabled=state
	mu.Unlock()
}

func GetShiftsEnabled()bool{
	mu.RLock()
	defer mu.RUnlock()
	return shiftsEnabled
}

func GetDebtsEnabled()bool{
	mu.RLock()
	defer mu.RUnlock()
	return debtsEnabled
}

func Start(){
	c:=cron.New(cron.WithLocation(time.UTC))

	c.AddFunc("0 3 * * *",func(){ if GetShiftsEnabled(){
			fmt.Println("Cron: Creating shifts...")
			err:=database.RecorridoShiftPopulationRoutine()
			if err!=nil{
				fmt.Println("Cron Error (Shifts):",err)
			}
		}
	})

	c.AddFunc("0 12 1 * *",func(){
		if GetDebtsEnabled(){
			fmt.Println("Cron: Creating debts...")
			err:=database.MonthlyDebtPopulationRoutine()
			if err!=nil{
				fmt.Println("Cron Error (Debts):",err)
			}
		}
	})

	c.Start()
	fmt.Println("Scheduler started on UTC")
}
