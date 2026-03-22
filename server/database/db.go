package database

import (
	"context"
	"fmt"
	"log"
	"os"
	"slices"
	"strconv"
	"strings"
	"time"

  "github.com/google/uuid"
	"github.com/jackc/pgx/v5"

	"github.com/jackc/pgx/v5/pgxpool"
	"github.com/joho/godotenv"
	"github.com/manuelsanta06/agenda/models"
)

var DB *pgxpool.Pool


func parseWeekDays(daysStr string)[]time.Weekday{
	if daysStr==""{return nil}
	
	strDays:=strings.Split(strings.TrimSpace(daysStr)," ")
	var weekdays []time.Weekday
	
	for _,s:=range strDays{
		num,err:=strconv.Atoi(s)
		if err!=nil{continue}
		
		switch num{
      case 1:weekdays=append(weekdays,time.Monday)
      case 2:weekdays=append(weekdays,time.Tuesday)
      case 3:weekdays=append(weekdays,time.Wednesday)
      case 4:weekdays=append(weekdays,time.Thursday)
      case 5:weekdays=append(weekdays,time.Friday)
      case 6:weekdays=append(weekdays,time.Saturday)
      case 7:weekdays=append(weekdays,time.Sunday)
		}
	}
	return weekdays
}

func containsWeekday(days []time.Weekday,target time.Weekday)bool{
  return slices.Contains(days,target)
	// for _,d:=range days{if d==target{return true}}
	// return false
}


func Connect(){
  err:=godotenv.Load()
  if err!=nil{
    log.Println("Aviso: No se encontró archivo .env, usando variables del sistema")
  }

  connString:=os.Getenv("DATABASE_URL")
  if connString==""{
    log.Fatal("Error: La variable DATABASE_URL está vacía")
  }

  DB, err = pgxpool.New(context.Background(),connString)
  if err!=nil{
    log.Fatalf("No se pudo conectar a la base de datos: %v\n",err)
  }

  err=DB.Ping(context.Background())
  if err!=nil{
    log.Fatalf("La base de datos no responde el Ping: %v\n", err)
  }

  fmt.Println("¡Conexión exitosa a PostgreSQL local!")
}

func FullSync(payload models.SyncPayload)error{
  ctx:=context.Background()
  tx,err:=DB.Begin(ctx)
  if err!=nil{
	  return fmt.Errorf("error al iniciar la transacción: %v",err)
	}
  defer tx.Rollback(ctx)

	//TABLAS PRINCIPALES

	//Choferes
	for _, c := range payload.Choferes {
		_, err := tx.Exec(ctx, `
			INSERT INTO choferes (id, dni, name, surname, alias, mobile_number, picture_path, balance, is_active)
			VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
			ON CONFLICT (id) DO UPDATE SET
				dni = EXCLUDED.dni,
				name = EXCLUDED.name,
				surname = EXCLUDED.surname,
				alias = EXCLUDED.alias,
				mobile_number = EXCLUDED.mobile_number,
				picture_path = EXCLUDED.picture_path,
				balance = EXCLUDED.balance,
				is_active = EXCLUDED.is_active,
				updated_at = CURRENT_TIMESTAMP;
		`, c.ID, c.Dni, c.Name, c.Surname, c.Alias, c.MobileNumber, c.PicturePath, c.Balance, c.IsActive)
		if err != nil {
			return fmt.Errorf("error guardando chofer %s: %v", c.ID, err)
		}
	}

	//Colectivos
	for _, col := range payload.Colectivos {
		_, err := tx.Exec(ctx, `
			INSERT INTO colectivos (id, plate, name, number, capacity, fuel_amount, fuel_date, oil_date, is_active)
			VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
			ON CONFLICT (id) DO UPDATE SET
				plate = EXCLUDED.plate,
				name = EXCLUDED.name,
				number = EXCLUDED.number,
				capacity = EXCLUDED.capacity,
				fuel_amount = EXCLUDED.fuel_amount,
				fuel_date = EXCLUDED.fuel_date,
				oil_date = EXCLUDED.oil_date,
				is_active = EXCLUDED.is_active,
				updated_at = CURRENT_TIMESTAMP;
		`, col.ID, col.Plate, col.Name, col.Number, col.Capacity, col.FuelAmount, col.FuelDate, col.OilDate, col.IsActive)
		if err != nil {
			return fmt.Errorf("error guardando colectivo %s: %v", col.ID, err)
		}
	}

	//Recorridos
	for _, r := range payload.Recorridos {
		_, err := tx.Exec(ctx, `
			INSERT INTO recorridos (id, name, base_price, is_active)
			VALUES ($1, $2, $3, $4)
			ON CONFLICT (id) DO UPDATE SET
				name = EXCLUDED.name,
				base_price = EXCLUDED.base_price,
				is_active = EXCLUDED.is_active,
				updated_at = CURRENT_TIMESTAMP;
		`, r.ID, r.Name, r.BasePrice, r.IsActive)
		if err != nil {
			return fmt.Errorf("error guardando recorrido %s: %v", r.ID, err)
		}
	}

	//Encargados
	for _, enc := range payload.Encargados {
		_, err := tx.Exec(ctx, `
			INSERT INTO encargados (id, name, phone, balance)
			VALUES ($1, $2, $3, $4)
			ON CONFLICT (id) DO UPDATE SET
				name = EXCLUDED.name,
				phone = EXCLUDED.phone,
				balance = EXCLUDED.balance,
				updated_at = CURRENT_TIMESTAMP;
		`, enc.ID, enc.Name, enc.Phone, enc.Balance)
		if err != nil {
			return fmt.Errorf("error guardando encargado %s: %v", enc.ID, err)
		}
	}

	//TABLAS CON DEPENDENCIAS

	//Events
	for _, e := range payload.Events {
		_, err := tx.Exec(ctx, `
			INSERT INTO events (id, name, contact_name, contact, repeat, days, start_date_time, end_date_time, stop_repeating_date_time, state, type, is_trip, shift_id)
			VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13)
			ON CONFLICT (id) DO UPDATE SET
				name = EXCLUDED.name,
				contact_name = EXCLUDED.contact_name,
				contact = EXCLUDED.contact,
				repeat = EXCLUDED.repeat,
				days = EXCLUDED.days,
				start_date_time = EXCLUDED.start_date_time,
				end_date_time = EXCLUDED.end_date_time,
				stop_repeating_date_time = EXCLUDED.stop_repeating_date_time,
				state = EXCLUDED.state,
				type = EXCLUDED.type,
				is_trip = EXCLUDED.is_trip,
				shift_id = EXCLUDED.shift_id,
				updated_at = CURRENT_TIMESTAMP;
		`, e.ID, e.Name, e.ContactName, e.Contact, e.Repeat, e.Days, e.StartDateTime, e.EndDateTime, e.StopRepeatingDateTime, e.State, e.Type, e.IsTrip, e.ShiftID)
		if err != nil {
			return fmt.Errorf("error guardando event %s: %v", e.ID, err)
		}
	}

	//RecorridoShifts
	for _, rs := range payload.RecorridoShifts {
		_, err := tx.Exec(ctx, `
			INSERT INTO recorrido_shifts (id, recorrido_id, week_day, start_time, end_time, shift_name, is_active)
			VALUES ($1, $2, $3, $4, $5, $6, $7)
			ON CONFLICT (id) DO UPDATE SET
				recorrido_id = EXCLUDED.recorrido_id,
				week_day = EXCLUDED.week_day,
				start_time = EXCLUDED.start_time,
				end_time = EXCLUDED.end_time,
				shift_name = EXCLUDED.shift_name,
				is_active = EXCLUDED.is_active,
				updated_at = CURRENT_TIMESTAMP;
		`, rs.ID, rs.RecorridoID, rs.WeekDay, rs.StartTime, rs.EndTime, rs.ShiftName, rs.IsActive)
		if err != nil {
			return fmt.Errorf("error guardando recorrido_shift %s: %v", rs.ID, err)
		}
	}

	//LIMPIEZA DE TABLAS INTERMEDIAS Y DEPENDIENTES

  // Limpiar Stops (Dueño: Event)
	for _, e := range payload.Events {
		_, err := tx.Exec(ctx, `DELETE FROM stops WHERE event_id = $1`, e.ID)
		if err != nil {
			return fmt.Errorf("error limpiando stops del event %s: %v", e.ID, err)
		}
	}

	// Limpiar RecorridoSubscriptions (Dueño: Encargado)
	for _, enc := range payload.Encargados {
		_, err := tx.Exec(ctx, `DELETE FROM recorrido_subscriptions WHERE encargado_id = $1`, enc.ID)
		if err != nil {
			return fmt.Errorf("error limpiando subscriptions del encargado %s: %v", enc.ID, err)
		}
	}

	// Limpiar EventChoferes y EventColectivos (Dueño: Event)
	for _, e := range payload.Events {
		_, err := tx.Exec(ctx, `DELETE FROM event_choferes WHERE event_id = $1`, e.ID)
		if err != nil {
			return fmt.Errorf("error limpiando choferes del event %s: %v", e.ID, err)
		}
		_, err = tx.Exec(ctx, `DELETE FROM event_colectivos WHERE event_id = $1`, e.ID)
		if err != nil {
			return fmt.Errorf("error limpiando colectivos del event %s: %v", e.ID, err)
		}
	}

	// Limpiar ShiftChoferes y ShiftColectivos (Dueño: RecorridoShift)
	for _, rs := range payload.RecorridoShifts {
		_, err := tx.Exec(ctx, `DELETE FROM shift_choferes WHERE shift_id = $1`, rs.ID)
		if err != nil {
			return fmt.Errorf("error limpiando choferes del shift %s: %v", rs.ID, err)
		}
		_, err = tx.Exec(ctx, `DELETE FROM shift_colectivos WHERE shift_id = $1`, rs.ID)
		if err != nil {
			return fmt.Errorf("error limpiando colectivos del shift %s: %v", rs.ID, err)
		}
	}

	//INSERCIÓN DE TABLAS INTERMEDIAS Y DEPENDIENTES

  // Limpiar Stops (Dueño: Event)
  for _, s := range payload.Stops {
		_, err := tx.Exec(ctx, `
			INSERT INTO stops (id, name, start, event_id, order_index)
			VALUES ($1, $2, $3, $4, $5)
			ON CONFLICT (id) DO NOTHING;
		`, s.ID, s.Name, s.Start, s.EventID, s.OrderIndex)
		if err != nil {
			return fmt.Errorf("error guardando stop %s: %v", s.ID, err)
		}
	}

	//RecorridoSubscriptions (Dueño: Encargado)
	for _, sub := range payload.RecorridoSubscriptions {
		_, err := tx.Exec(ctx, `
			INSERT INTO recorrido_subscriptions (id, recorrido_id, encargado_id, subscription_name, address, custom_price, is_active)
			VALUES ($1, $2, $3, $4, $5, $6, $7)
			ON CONFLICT (id) DO NOTHING;
		`, sub.ID, sub.RecorridoID, sub.EncargadoID, sub.SubscriptionName, sub.Address, sub.CustomPrice, sub.IsActive)
		if err != nil {
			return fmt.Errorf("error insertando subscription %s: %v", sub.ID, err)
		}

		// Marcar al Encargado como sucio
		_, err = tx.Exec(ctx, `UPDATE encargados SET updated_at = CURRENT_TIMESTAMP WHERE id = $1`, sub.EncargadoID)
		if err != nil {
			return fmt.Errorf("error marcando encargado como sucio: %v", err)
		}
	}

	//EventChoferes (Dueño: Event)
	for _, ec := range payload.EventChoferes {
		_, err := tx.Exec(ctx, `
			INSERT INTO event_choferes (event_id, chofer_id)
			VALUES ($1, $2)
			ON CONFLICT (event_id, chofer_id) DO NOTHING;
		`, ec.EventID, ec.ChoferID)
		if err != nil {
			return fmt.Errorf("error relacionando event %s con chofer %s: %v", ec.EventID, ec.ChoferID, err)
		}

		// Marcar al Evento como sucio
		_, err = tx.Exec(ctx, `UPDATE events SET updated_at = CURRENT_TIMESTAMP WHERE id = $1`, ec.EventID)
		if err != nil {
			return fmt.Errorf("error marcando evento como sucio: %v", err)
		}
	}

	//EventColectivos (Dueño: Event)
	for _, ecol := range payload.EventColectivos {
		_, err := tx.Exec(ctx, `
			INSERT INTO event_colectivos (event_id, colectivo_id)
			VALUES ($1, $2)
			ON CONFLICT (event_id, colectivo_id) DO NOTHING;
		`, ecol.EventID, ecol.ColectivoID)
		if err != nil {
			return fmt.Errorf("error relacionando event %s con colectivo %s: %v", ecol.EventID, ecol.ColectivoID, err)
		}

		// Marcar al Evento como sucio
		_, err = tx.Exec(ctx, `UPDATE events SET updated_at = CURRENT_TIMESTAMP WHERE id = $1`, ecol.EventID)
		if err != nil {
			return fmt.Errorf("error marcando evento como sucio: %v", err)
		}
	}

	//ShiftChoferes (Dueño: RecorridoShift)
	for _, sc := range payload.ShiftChoferes {
		_, err := tx.Exec(ctx, `
			INSERT INTO shift_choferes (shift_id, chofer_id)
			VALUES ($1, $2)
			ON CONFLICT (shift_id, chofer_id) DO NOTHING;
		`, sc.ShiftID, sc.ChoferID)
		if err != nil {
			return fmt.Errorf("error relacionando shift %s con chofer %s: %v", sc.ShiftID, sc.ChoferID, err)
		}

		// Marcar al RecorridoShift como sucio
		_, err = tx.Exec(ctx, `UPDATE recorrido_shifts SET updated_at = CURRENT_TIMESTAMP WHERE id = $1`, sc.ShiftID)
		if err != nil {
			return fmt.Errorf("error marcando shift como sucio: %v", err)
		}
	}

	//ShiftColectivos (Dueño: RecorridoShift)
	for _, scol := range payload.ShiftColectivos {
		_, err := tx.Exec(ctx, `
			INSERT INTO shift_colectivos (shift_id, colectivo_id)
			VALUES ($1, $2)
			ON CONFLICT (shift_id, colectivo_id) DO NOTHING;
		`, scol.ShiftID, scol.ColectivoID)
		if err != nil {
			return fmt.Errorf("error relacionando shift %s con colectivo %s: %v", scol.ShiftID, scol.ColectivoID, err)
		}

		// Marcar al RecorridoShift como sucio
		_, err = tx.Exec(ctx, `UPDATE recorrido_shifts SET updated_at = CURRENT_TIMESTAMP WHERE id = $1`, scol.ShiftID)
		if err != nil {
			return fmt.Errorf("error marcando shift como sucio: %v", err)
		}
	}

	// Confirmar Transacción
	err = tx.Commit(ctx)
	if err != nil {
		return fmt.Errorf("error al hacer commit de la transacción: %v", err)
	}

	return nil
}

func FetchCatalogSince(lastSyncStr string) (models.SyncPayload, error){
	ctx := context.Background()
	var payload models.SyncPayload

	payload.Choferes = []models.Chofer{}
	payload.Colectivos = []models.Colectivo{}
	payload.Recorridos = []models.Recorrido{}
	payload.Encargados = []models.Encargado{}
	payload.RecorridoShifts = []models.RecorridoShift{}
	payload.RecorridoSubscriptions = []models.RecorridoSubscription{}
	payload.ShiftChoferes = []models.ShiftChofer{}
	payload.ShiftColectivos = []models.ShiftColectivo{}

	//CHOFERES
	rowsChoferes, err := DB.Query(ctx, `
		SELECT id, dni, name, surname, alias, mobile_number, picture_path, balance, is_active, created_at, updated_at 
		FROM choferes 
		WHERE updated_at > $1
	`, lastSyncStr)
	if err != nil {
		return payload, fmt.Errorf("error consultando choferes: %v", err)
	}
	defer rowsChoferes.Close()

	for rowsChoferes.Next() {
		var c models.Chofer
		err := rowsChoferes.Scan(&c.ID, &c.Dni, &c.Name, &c.Surname, &c.Alias, &c.MobileNumber, &c.PicturePath, &c.Balance, &c.IsActive, &c.CreatedAt, &c.UpdatedAt)
		if err != nil {
			return payload, fmt.Errorf("error leyendo fila de chofer: %v", err)
		}
		payload.Choferes = append(payload.Choferes, c)
	}

	//COLECTIVOS
	rowsColectivos, err := DB.Query(ctx, `
		SELECT id, plate, name, number, capacity, fuel_amount, fuel_date, oil_date, is_active, created_at, updated_at 
		FROM colectivos 
		WHERE updated_at > $1
	`, lastSyncStr)
	if err != nil {
		return payload, fmt.Errorf("error consultando colectivos: %v", err)
	}
	defer rowsColectivos.Close()

	for rowsColectivos.Next() {
		var col models.Colectivo
		err := rowsColectivos.Scan(&col.ID, &col.Plate, &col.Name, &col.Number, &col.Capacity, &col.FuelAmount, &col.FuelDate, &col.OilDate, &col.IsActive, &col.CreatedAt, &col.UpdatedAt)
		if err != nil {
			return payload, fmt.Errorf("error leyendo fila de colectivo: %v", err)
		}
		payload.Colectivos = append(payload.Colectivos, col)
	}

	//RECORRIDOS
	rowsRecorridos, err := DB.Query(ctx, `
		SELECT id, name, base_price, is_active, created_at, updated_at 
		FROM recorridos 
		WHERE updated_at > $1
	`, lastSyncStr)
	if err != nil {
		return payload, fmt.Errorf("error consultando recorridos: %v", err)
	}
	defer rowsRecorridos.Close()

	for rowsRecorridos.Next() {
		var r models.Recorrido
		err := rowsRecorridos.Scan(&r.ID, &r.Name, &r.BasePrice, &r.IsActive, &r.CreatedAt, &r.UpdatedAt)
		if err != nil {
			return payload, fmt.Errorf("error leyendo fila de recorrido: %v", err)
		}
		payload.Recorridos = append(payload.Recorridos, r)
	}

	//ENCARGADOS (Dueños de las Suscripciones)
	rowsEncargados, err := DB.Query(ctx, `
		SELECT id, name, phone, balance, created_at, updated_at 
		FROM encargados 
		WHERE updated_at > $1
	`, lastSyncStr)
	if err != nil {
		return payload, fmt.Errorf("error consultando encargados: %v", err)
	}
	defer rowsEncargados.Close()

	for rowsEncargados.Next() {
		var enc models.Encargado
		err := rowsEncargados.Scan(&enc.ID, &enc.Name, &enc.Phone, &enc.Balance, &enc.CreatedAt, &enc.UpdatedAt)
		if err != nil {
			return payload, fmt.Errorf("error leyendo fila de encargado: %v", err)
		}
		payload.Encargados = append(payload.Encargados, enc)
	}

	//RECORRIDO SHIFTS (Dueños de ShiftChoferes y ShiftColectivos)
	rowsShifts, err := DB.Query(ctx, `
		SELECT id, recorrido_id, week_day, start_time, end_time, shift_name, is_active, created_at, updated_at 
		FROM recorrido_shifts 
		WHERE updated_at > $1
	`, lastSyncStr)
	if err != nil {
		return payload, fmt.Errorf("error consultando recorrido_shifts: %v", err)
	}
	defer rowsShifts.Close()

	for rowsShifts.Next() {
		var rs models.RecorridoShift
		err := rowsShifts.Scan(&rs.ID, &rs.RecorridoID, &rs.WeekDay, &rs.StartTime, &rs.EndTime, &rs.ShiftName, &rs.IsActive, &rs.CreatedAt, &rs.UpdatedAt)
		if err != nil {
			return payload, fmt.Errorf("error leyendo fila de recorrido_shift: %v", err)
		}
		payload.RecorridoShifts = append(payload.RecorridoShifts, rs)
	}

	//RECORRIDO SUBSCRIPTIONS (Dependientes de Encargados)
	rowsSubs, err := DB.Query(ctx, `
		SELECT rs.id, rs.recorrido_id, rs.encargado_id, rs.subscription_name, rs.address, rs.custom_price, rs.is_active
		FROM recorrido_subscriptions rs
		JOIN encargados e ON rs.encargado_id = e.id
		WHERE e.updated_at > $1
	`, lastSyncStr)
	if err != nil {
		return payload, fmt.Errorf("error consultando recorrido_subscriptions: %v", err)
	}
	defer rowsSubs.Close()

	for rowsSubs.Next() {
		var sub models.RecorridoSubscription
		err := rowsSubs.Scan(&sub.ID, &sub.RecorridoID, &sub.EncargadoID, &sub.SubscriptionName, &sub.Address, &sub.CustomPrice, &sub.IsActive)
		if err != nil {
			return payload, fmt.Errorf("error leyendo fila de recorrido_subscription: %v", err)
		}
		payload.RecorridoSubscriptions = append(payload.RecorridoSubscriptions, sub)
	}

	//SHIFT CHOFERES (Dependientes de RecorridoShifts)
	rowsShiftChoferes, err := DB.Query(ctx, `
		SELECT sc.shift_id, sc.chofer_id
		FROM shift_choferes sc
		JOIN recorrido_shifts rs ON sc.shift_id = rs.id
		WHERE rs.updated_at > $1
	`, lastSyncStr)
	if err != nil {
		return payload, fmt.Errorf("error consultando shift_choferes: %v", err)
	}
	defer rowsShiftChoferes.Close()

	for rowsShiftChoferes.Next() {
		var sc models.ShiftChofer
		err := rowsShiftChoferes.Scan(&sc.ShiftID, &sc.ChoferID)
		if err != nil {
			return payload, fmt.Errorf("error leyendo fila de shift_choferes: %v", err)
		}
		payload.ShiftChoferes = append(payload.ShiftChoferes, sc)
	}

	//SHIFT COLECTIVOS (Dependientes de RecorridoShifts)
	rowsShiftColectivos, err := DB.Query(ctx, `
		SELECT scol.shift_id, scol.colectivo_id
		FROM shift_colectivos scol
		JOIN recorrido_shifts rs ON scol.shift_id = rs.id
		WHERE rs.updated_at > $1
	`, lastSyncStr)
	if err != nil {
		return payload, fmt.Errorf("error consultando shift_colectivos: %v", err)
	}
	defer rowsShiftColectivos.Close()

	for rowsShiftColectivos.Next() {
		var scol models.ShiftColectivo
		err := rowsShiftColectivos.Scan(&scol.ShiftID, &scol.ColectivoID)
		if err != nil {
			return payload, fmt.Errorf("error leyendo fila de shift_colectivos: %v", err)
		}
		payload.ShiftColectivos = append(payload.ShiftColectivos, scol)
	}

	return payload, nil
}

func FetchEventsSince(lastSyncStr string) (models.SyncPayload, error){
	ctx := context.Background()
	var payload models.SyncPayload

	payload.Events = []models.Event{}
	payload.Stops = []models.Stop{}
	payload.EventChoferes = []models.EventChofer{}
	payload.EventColectivos = []models.EventColectivo{}

	//EVENTOS
	rowsEvents, err := DB.Query(ctx, `
		SELECT id, name, contact_name, contact, repeat, days, start_date_time, end_date_time, stop_repeating_date_time, state, type, is_trip, shift_id, created_at, updated_at
		FROM events
		WHERE updated_at > $1 
		AND start_date_time >= NOW() - INTERVAL '30 days'
	`, lastSyncStr)
	if err != nil {
		return payload, fmt.Errorf("error consultando events: %v", err)
	}
	defer rowsEvents.Close()

	for rowsEvents.Next() {
		var e models.Event
		err := rowsEvents.Scan(&e.ID, &e.Name, &e.ContactName, &e.Contact, &e.Repeat, &e.Days, &e.StartDateTime, &e.EndDateTime, &e.StopRepeatingDateTime, &e.State, &e.Type, &e.IsTrip, &e.ShiftID, &e.CreatedAt, &e.UpdatedAt)
		if err != nil {
			return payload, fmt.Errorf("error leyendo fila de event: %v", err)
		}
		payload.Events = append(payload.Events, e)
	}

	//STOPS
	rowsStops, err := DB.Query(ctx, `
		SELECT s.id, s.name, s.start, s.event_id, s.order_index
		FROM stops s
		JOIN events e ON s.event_id = e.id
		WHERE e.updated_at > $1 
		AND e.start_date_time >= NOW() - INTERVAL '30 days'
	`, lastSyncStr)
	if err!=nil {
		return payload,fmt.Errorf("error consultando stops: %v",err)
	}
	defer rowsStops.Close()

	for rowsStops.Next() {
		var s models.Stop
		err := rowsStops.Scan(&s.ID, &s.Name, &s.Start, &s.EventID, &s.OrderIndex)
		if err != nil {
			return payload, fmt.Errorf("error leyendo fila de stop: %v", err)
		}
		payload.Stops = append(payload.Stops, s)
	}

	//EVENT CHOFERES (Dependientes de Events)
	rowsEventChoferes, err := DB.Query(ctx, `
		SELECT ec.event_id, ec.chofer_id
		FROM event_choferes ec
		JOIN events e ON ec.event_id = e.id
		WHERE e.updated_at > $1 
		AND e.start_date_time >= NOW() - INTERVAL '30 days'
	`, lastSyncStr)
	if err != nil {
		return payload, fmt.Errorf("error consultando event_choferes: %v", err)
	}
	defer rowsEventChoferes.Close()

	for rowsEventChoferes.Next() {
		var ec models.EventChofer
		err := rowsEventChoferes.Scan(&ec.EventID, &ec.ChoferID)
		if err != nil {
			return payload, fmt.Errorf("error leyendo fila de event_choferes: %v", err)
		}
		payload.EventChoferes = append(payload.EventChoferes, ec)
	}

	//EVENT COLECTIVOS (Dependientes de Events)
	rowsEventColectivos, err := DB.Query(ctx, `
		SELECT ecol.event_id, ecol.colectivo_id
		FROM event_colectivos ecol
		JOIN events e ON ecol.event_id = e.id
		WHERE e.updated_at > $1 
		AND e.start_date_time >= NOW() - INTERVAL '30 days'
	`, lastSyncStr)
	if err != nil {
		return payload, fmt.Errorf("error consultando event_colectivos: %v", err)
	}
	defer rowsEventColectivos.Close()

	for rowsEventColectivos.Next() {
		var ecol models.EventColectivo
		err := rowsEventColectivos.Scan(&ecol.EventID, &ecol.ColectivoID)
		if err != nil {
			return payload, fmt.Errorf("error leyendo fila de event_colectivos: %v", err)
		}
		payload.EventColectivos = append(payload.EventColectivos, ecol)
	}

	return payload, nil
}


type activeShift struct{
	ID        string
	WeekDay   string
	StartTime time.Time
	EndTime   time.Time
	ShiftName string
  RecorridoName string
}

func RecorridoShiftPopulationRoutine() error {
	ctx:=context.Background()

	//get all active shifts
	queryShifts:=`
		SELECT rs.id, rs.week_day, rs.start_time, rs.end_time, rs.shift_name, r.name
		FROM recorrido_shifts rs
		JOIN recorridos r ON rs.recorrido_id = r.id
		WHERE rs.is_active = TRUE AND r.is_active = TRUE
	`
	rows,err:=DB.Query(ctx,queryShifts)
	if err!=nil{return fmt.Errorf("error obteniendo shifts: %w",err)}
	defer rows.Close()

	var shifts []activeShift
	for rows.Next(){
		var s activeShift
		if err:=rows.Scan(&s.ID,&s.WeekDay,&s.StartTime,&s.EndTime,&s.ShiftName,&s.RecorridoName);err!=nil{
			return fmt.Errorf("error leyendo shift: %w",err)
		}
		shifts=append(shifts,s)
	}
	if err:=rows.Err();err!=nil{return err}


	now:=time.Now()
	startDate:=time.Date(now.Year(),now.Month(),now.Day(),0,0,0,0,now.Location())

	//start the transaction
	tx,err:=DB.Begin(ctx)
	if err!=nil{return fmt.Errorf("error iniciando transacción: %w",err)}
	defer tx.Rollback(ctx)

	//days loop
	for i:=range 16{
		targetDate:=startDate.AddDate(0,0,i)
		targetWeekday:=targetDate.Weekday()

		for _,shift:=range shifts{
			//this shift applies this wwek day?
			shiftDays:=parseWeekDays(shift.WeekDay)
			if !containsWeekday(shiftDays,targetWeekday) {continue}

			//this event already exists?
			var existingID string
			checkQuery:=`SELECT id FROM events WHERE shift_id = $1 AND start_date_time::date = $2::date LIMIT 1`
			err=tx.QueryRow(ctx,checkQuery,shift.ID,targetDate).Scan(&existingID)
			
			if err==nil{
				continue
			}else if err!=pgx.ErrNoRows{
				return fmt.Errorf("error comprobando idempotencia: %w",err)
			}


			eventID:=uuid.New().String()
			
			startDT:=time.Date(targetDate.Year(), targetDate.Month(), targetDate.Day(),
				shift.StartTime.Hour(), shift.StartTime.Minute(), shift.StartTime.Second(), 0, targetDate.Location())
			
			endDT:=time.Date(targetDate.Year(), targetDate.Month(), targetDate.Day(),
				shift.EndTime.Hour(), shift.EndTime.Minute(), shift.EndTime.Second(), 0, targetDate.Location())

			//querry
			insertEventQuery:=`
				INSERT INTO events (id, name, start_date_time, end_date_time, state, type, is_trip, shift_id)
				VALUES ($1, $2, $3, $4, 1, 3, true, $5)
			`
			_,err=tx.Exec(ctx,insertEventQuery,eventID,shift.RecorridoName+" - "+shift.ShiftName,startDT,endDT,shift.ID)
			if err!=nil{return fmt.Errorf("error insertando evento base: %w",err)}

			//shift_chofer -> event_chofer
			copyChoferesQuery := `
				INSERT INTO event_choferes (event_id, chofer_id)
				SELECT $1, chofer_id FROM shift_choferes WHERE shift_id = $2
			`
			_, err = tx.Exec(ctx, copyChoferesQuery, eventID, shift.ID)
			if err!=nil{return fmt.Errorf("error copiando choferes: %w",err)}

			//shift_colectivos -> event_colectivos
			copyColectivosQuery := `
				INSERT INTO event_colectivos (event_id, colectivo_id)
				SELECT $1, colectivo_id FROM shift_colectivos WHERE shift_id = $2
			`
			_, err = tx.Exec(ctx, copyColectivosQuery, eventID, shift.ID)
			if err!=nil{return fmt.Errorf("error copiando colectivos: %w",err)}
		}
	}

	//tinal error check
	if err:=tx.Commit(ctx);err!=nil{
		return fmt.Errorf("error en el commit: %w",err)
	}

	fmt.Println("Populador ejecutado con éxito. Ventana de 16 días sincronizada.")
	return nil
}
