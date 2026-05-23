CREATE TABLE welcome_message (
  id INTEGER PRIMARY KEY DEFAULT 1 CHECK (id = 1),
  content TEXT NOT NULL DEFAULT '',
  updated_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO welcome_message (id, content) VALUES (1, '');
