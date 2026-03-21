--remove the old restriction key
ALTER TABLE events DROP CONSTRAINT IF EXISTS events_recorrido_id_fkey;

--rename column
ALTER TABLE events RENAME COLUMN recorrido_id TO shift_id;

--new restriction key
ALTER TABLE events ADD CONSTRAINT events_shift_id_fkey 
FOREIGN KEY (shift_id) REFERENCES recorrido_shifts(id);
