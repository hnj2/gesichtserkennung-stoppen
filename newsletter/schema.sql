DROP TABLE IF EXISTS mails;

CREATE TABLE mails (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	mail TEXT UNIQUE NOT NULL,
	guid TEXT UNIQUENOT NOT NULL
);