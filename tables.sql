CREATE TYPE "user_type" AS ENUM ('doctor', 'secretary', 'admin');
CREATE TABLE IF NOT EXISTS "users" (
    "id" serial PRIMARY KEY,
    "firstname" varchar,
    "lastname" varchar,
    "username" varchar NOT NULL UNIQUE,
    "password" bytea NOT NULL,
    "bio" text,
    "phone" varchar NOT NULL,
    "created_time" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    -- "role_id" int,
    -- FOREIGN KEY ("role_id") REFERENCES "role" ("id")
    "type" user_type NOT NULL,
    "is_active" boolean NOT NULL DEFAULT true
);

CREATE TABLE IF NOT EXISTS "patients" (
    "id" serial PRIMARY KEY,
    "firstname" varchar,
    "lastname" varchar,
    "birthdate" TIMESTAMP,
    "desc" text,
    "phone" varchar,
    "created_time" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
    -- "role_id" int,
    -- FOREIGN KEY ("role_id") REFERENCES "role" ("id")
);

CREATE TABLE IF NOT EXISTS "documents" (
    "id" serial PRIMARY KEY,
    "location" varchar,
    "created_time" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
    
CREATE TABLE IF NOT EXISTS "pdd" (
    "p_id" int NOT NULL,
    "u_id" int NOT NULL,
    "d_id" int,
    "desc" text,
    "created_time" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("p_id") REFERENCES "patients" ("id"),
    FOREIGN KEY("u_id") REFERENCES "users" ("id"),
    FOREIGN KEY("d_id") REFERENCES "documents" ("id")
);

CREATE TABLE IF NOT EXISTS "meds" (
    "id" serial PRIMARY KEY,
    "name" varchar NOT NULL
);

CREATE TABLE IF NOT EXISTS "scripts" (
    "p_id" int NOT NULL,
    "u_id" int NOT NULL,
    "m_id" int NOT NULL,
    "desc" text,
    "created_time" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("p_id") REFERENCES "patients" ("id"),
    FOREIGN KEY("u_id") REFERENCES "users" ("id"),
    FOREIGN KEY("m_id") REFERENCES "meds" ("id")
);

