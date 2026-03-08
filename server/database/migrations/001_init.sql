CREATE TABLE choferes (
  id TEXT PRIMARY KEY,
  dni TEXT,
  name TEXT,
  surname TEXT,
  alias TEXT,
  mobile_number TEXT,
  picture_path TEXT,
  balance REAL DEFAULT 0.0,
  is_active BOOLEAN DEFAULT TRUE,

  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE colectivos (
  id TEXT PRIMARY KEY,
  plate TEXT UNIQUE NOT NULL,
  name TEXT,
  number INTEGER,
  capacity INTEGER DEFAULT 0,
  fuel_amount TEXT NOT NULL,
  fuel_date TIMESTAMP NOT NULL,
  oil_date TIMESTAMP NOT NULL,
  is_active BOOLEAN DEFAULT TRUE,

  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE recorridos (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  base_price INTEGER DEFAULT 0,
  is_active BOOLEAN DEFAULT TRUE,

  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE encargados (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  phone TEXT,
  balance REAL DEFAULT 0.0,

  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE events (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  contact_name TEXT,
  contact TEXT,
  repeat BOOLEAN DEFAULT FALSE,
  days TEXT,
  start_date_time TIMESTAMP NOT NULL,
  end_date_time TIMESTAMP NOT NULL,
  stop_repeating_date_time TIMESTAMP,
  state SMALLINT NOT NULL,
  type SMALLINT NOT NULL,
  is_trip BOOLEAN NOT NULL,

  recorrido_id TEXT REFERENCES recorridos(id),

  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE stops (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  start TIMESTAMP,
  event_id TEXT NOT NULL REFERENCES events(id) ON DELETE CASCADE,
  order_index SMALLINT NOT NULL,

  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE recorrido_shifts (
  id TEXT PRIMARY KEY,
  recorrido_id TEXT NOT NULL REFERENCES recorridos(id) ON DELETE CASCADE,
  week_day TEXT NOT NULL,
  start_time TIMESTAMP NOT NULL,
  end_time TIMESTAMP NOT NULL,
  shift_name TEXT NOT NULL,
  is_active BOOLEAN DEFAULT TRUE,

  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE recorrido_subscriptions (
  id TEXT PRIMARY KEY,
  recorrido_id TEXT NOT NULL REFERENCES recorridos(id) ON DELETE CASCADE,
  encargado_id TEXT NOT NULL REFERENCES encargados(id) ON DELETE CASCADE,
  subscription_name TEXT NOT NULL,
  address TEXT,
  custom_price INTEGER,
  is_active BOOLEAN DEFAULT TRUE,
);

--TABLAS INTERMEDIAS

CREATE TABLE event_choferes (
  event_id TEXT NOT NULL REFERENCES events(id) ON DELETE CASCADE,
  chofer_id TEXT NOT NULL REFERENCES choferes(id) ON DELETE CASCADE,
  PRIMARY KEY (event_id, chofer_id)
);

CREATE TABLE event_colectivos (
  event_id TEXT NOT NULL REFERENCES events(id) ON DELETE CASCADE,
  colectivo_id TEXT NOT NULL REFERENCES colectivos(id) ON DELETE CASCADE,
  PRIMARY KEY (event_id, colectivo_id)
);

CREATE TABLE shift_choferes (
  shift_id TEXT NOT NULL REFERENCES recorrido_shifts(id) ON DELETE CASCADE,
  chofer_id TEXT NOT NULL REFERENCES choferes(id) ON DELETE CASCADE,
  PRIMARY KEY (shift_id, chofer_id)
);

CREATE TABLE shift_colectivos (
  shift_id TEXT NOT NULL REFERENCES recorrido_shifts(id) ON DELETE CASCADE,
  colectivo_id TEXT NOT NULL REFERENCES colectivos(id) ON DELETE CASCADE,
  PRIMARY KEY (shift_id, colectivo_id)
);
