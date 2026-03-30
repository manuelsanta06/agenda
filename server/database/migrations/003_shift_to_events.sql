ALTER TABLE events DROP CONSTRAINT IF EXISTS events_shift_id_fkey;

ALTER TABLE events ADD CONSTRAINT events_shift_id_fkey 
FOREIGN KEY (shift_id) REFERENCES events(id) ON DELETE SET NULL;

ALTER TABLE events ADD COLUMN recorrido_id TEXT REFERENCES recorridos(id);

DROP TABLE IF EXISTS shift_choferes CASCADE;
DROP TABLE IF EXISTS shift_colectivos CASCADE;
DROP TABLE IF EXISTS recorrido_shifts CASCADE;
