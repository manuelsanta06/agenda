ALTER TABLE debts ADD COLUMN IF NOT EXISTS event_id TEXT REFERENCES events(id) ON DELETE CASCADE;

UPDATE debts SET description='' WHERE description IS NULL;
ALTER TABLE debts ALTER COLUMN description SET NOT NULL;

INSERT INTO debts (id, event_id, date, description, total_amount, paid_amount, is_settled, created_at, updated_at)
SELECT 
    gen_random_uuid()::text,
    id,
    start_date_time,
    'Precio del evento: ' || name,
    price,
    0,
    FALSE,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
FROM events;

ALTER TABLE debts DROP CONSTRAINT IF EXISTS debt_target_check;
ALTER TABLE debts ADD CONSTRAINT debt_target_check CHECK (num_nonnulls(passenger_id, chofer_id, event_id) = 1);

ALTER TABLE events DROP COLUMN IF EXISTS price;
