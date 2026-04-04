package models

import "time"


type Chofer struct {
	ID           string   `json:"id"`
	Dni          *string  `json:"dni"`
	Name         *string  `json:"name"`
	Surname      *string  `json:"surname"`
	Alias        *string  `json:"alias"`
	MobileNumber *string  `json:"mobile_number"`
	PicturePath  *string  `json:"picture_path"`
	Balance      float64  `json:"balance"`
	IsActive     bool     `json:"is_active"`
	CreatedAt    time.Time`json:"created_at"`
	UpdatedAt    time.Time`json:"updated_at"`
}

type Colectivo struct {
	ID          string      `json:"id"`
	Plate       string      `json:"plate"`
	Vtv         time.Time   `json:"vtv"`
	Name        *string     `json:"name"`
	Number      *int        `json:"number"`
	Capacity    int         `json:"capacity"`
	FuelAmount  *string     `json:"fuel_amount"`
	FuelDate    *time.Time  `json:"fuel_date"`
	OilDate     time.Time   `json:"oil_date"`
	IsActive    bool        `json:"is_active"`
	CreatedAt   time.Time   `json:"created_at"`
	UpdatedAt   time.Time   `json:"updated_at"`
}

type Recorrido struct {
	ID        string `json:"id"`
	Name      string `json:"name"`
	BasePrice int    `json:"base_price"`
	IsActive  bool   `json:"is_active"`
	CreatedAt time.Time `json:"created_at"`
	UpdatedAt time.Time `json:"updated_at"`
}

type Encargado struct {
	ID        string  `json:"id"`
	Name      string  `json:"name"`
	Phone     *string `json:"phone"`
	Balance   float64 `json:"balance"`
	CreatedAt time.Time  `json:"created_at"`
	UpdatedAt time.Time  `json:"updated_at"`
}

// --- TABLAS CON DEPENDENCIAS ---

type Event struct {
	ID                    string  `json:"id"`
	Name                  string  `json:"name"`
	Price                 int     `json:"price"`
	Data                  string  `json:"data"`
	ContactName           *string `json:"contact_name"`
	Contact               *string `json:"contact"`
	Repeat                bool    `json:"repeat"`
	Days                  *string `json:"days"`
	StartDateTime         time.Time  `json:"start_date_time"`
	EndDateTime           time.Time  `json:"end_date_time"`
	StopRepeatingDateTime *time.Time `json:"stop_repeating_date_time"`
	State                 int     `json:"state"`
	Type                  int     `json:"type"`
	IsTrip                bool    `json:"is_trip"`
	ShiftID               *string `json:"shift_id"`
	RecorridoID           *string `json:"recorrido_id"`
	CreatedAt             time.Time  `json:"created_at"`
	UpdatedAt             time.Time  `json:"updated_at"`
}

type Stop struct {
	ID         string  `json:"id"`
	Name       string  `json:"name"`
	Start      *time.Time `json:"start"`
	EventID    string  `json:"event_id"`
	OrderIndex int     `json:"order_index"`
}

type RecorridoShift struct {
	ID          string `json:"id"`
	RecorridoID string `json:"recorrido_id"`
	WeekDay     string `json:"week_day"`
	StartTime   time.Time `json:"start_time"`
	EndTime     time.Time `json:"end_time"`
	ShiftName   string `json:"shift_name"`
	IsActive    bool   `json:"is_active"`
	CreatedAt   time.Time `json:"created_at"`
	UpdatedAt   time.Time `json:"updated_at"`
}

//TABLAS INTERMEDIAS

type RecorridoSubscription struct {
	ID               string  `json:"id"`
	RecorridoID      string  `json:"recorrido_id"`
	EncargadoID      string  `json:"encargado_id"`
	SubscriptionName string  `json:"subscription_name"`
	Address          *string `json:"address"`
	CustomPrice      *int    `json:"custom_price"`
	IsActive         bool    `json:"is_active"`
}

type EventChofer struct {
	EventID  string `json:"event_id"`
	ChoferID string `json:"chofer_id"`
}

type EventColectivo struct {
	EventID     string `json:"event_id"`
	ColectivoID string `json:"colectivo_id"`
}

type ShiftChofer struct {
	ShiftID  string `json:"shift_id"`
	ChoferID string `json:"chofer_id"`
}

type ShiftColectivo struct {
	ShiftID     string `json:"shift_id"`
	ColectivoID string `json:"colectivo_id"`
}

// --- EL CONTENEDOR PRINCIPAL (PAYLOAD) ---
// Este es el objeto gigante que Flutter enviará al puerto /sync

type SyncPayload struct {
	Choferes               []Chofer                 `json:"choferes"`
	Colectivos             []Colectivo              `json:"colectivos"`
	Recorridos             []Recorrido              `json:"recorridos"`
	Encargados             []Encargado              `json:"encargados"`
	Events                 []Event                  `json:"events"`
	Stops                  []Stop                   `json:"stops"`
	RecorridoShifts        []RecorridoShift         `json:"recorrido_shifts"`
	RecorridoSubscriptions []RecorridoSubscription  `json:"recorrido_subscriptions"`

	// Listas de las relaciones
	EventChoferes   []EventChofer    `json:"event_choferes"`
	EventColectivos []EventColectivo `json:"event_colectivos"`
	ShiftChoferes   []ShiftChofer    `json:"shift_choferes"`
	ShiftColectivos []ShiftColectivo `json:"shift_colectivos"`
}
