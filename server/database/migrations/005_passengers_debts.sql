DROP TABLE IF EXISTS recorrido_subscriptions CASCADE;
DROP TABLE IF EXISTS encargados CASCADE;

CREATE TABLE passengers (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    manager_name TEXT,
    manager_phone TEXT,
    custom_price INTEGER DEFAULT -1,
    recorrido_id TEXT NOT NULL REFERENCES recorridos(id) ON DELETE CASCADE,
    is_active BOOLEAN DEFAULT TRUE,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Crear tabla Debts
CREATE TABLE debts (
    id TEXT PRIMARY KEY,
    passenger_id TEXT REFERENCES passengers(id) ON DELETE CASCADE,
    chofer_id TEXT REFERENCES choferes(id) ON DELETE CASCADE,
    date TIMESTAMP NOT NULL,
    description TEXT,
    total_amount INTEGER NOT NULL,
    paid_amount INTEGER DEFAULT 0,
    is_settled BOOLEAN DEFAULT FALSE,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT debt_target_check CHECK ((passenger_id IS NULL)!=(chofer_id IS NULL))
);
