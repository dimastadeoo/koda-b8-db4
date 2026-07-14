CREATE TABLE "users" (
    "id" BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "status" VARCHAR(20) NOT NULL,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "profiles" (
    "id" BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "id_user" BIGINT REFERENCES "users"("id") NOT NULL, 
    "name" VARCHAR(80) NOT NULL,
    "gender" VARCHAR(1) CHECK ("gender" IN ('M', 'F')) NOT NULL,
    "address" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "auth" (
    "id" BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "id_user" BIGINT REFERENCES "users"("id") NOT NULL, 
    "phone_number" INT UNIQUE NOT NULL,
    "email"  VARCHAR(40) NOT NULL,
    "password" VARCHAR(80) NOT NULL,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);
CREATE TABLE "sesions"(
    "id" BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "id_user" BIGINT REFERENCES "users"("id") NOT NULL, 
    "token" VARCHAR(100) UNIQUE,
    "status" VARCHAR(30) NOT NULL,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);
CREATE TABLE "auth_log"(
    "id" BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "id_user" BIGINT REFERENCES "sesions"("id") NOT NULL, 
    "activity" TEXT NOT NULL,
    "ip_address" VARCHAR(80),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

