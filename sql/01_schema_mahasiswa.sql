CREATE SCHEMA IF NOT EXISTS "SALAM";

CREATE TABLE IF NOT EXISTS "SALAM".mahasiswas (
    nim VARCHAR(10) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    semester INT NOT NULL,
    ipk NUMERIC(3,2) NOT NULL,
    CONSTRAINT uq_mahasiswas_email UNIQUE (email),
    CONSTRAINT chk_mahasiswas_semester
        CHECK (semester BETWEEN 1 AND 14),
    CONSTRAINT chk_mahasiswas_ipk
        CHECK (ipk BETWEEN 0 AND 4)
);

INSERT INTO "SALAM".mahasiswas
    (nim, nama, email, semester, ipk)
VALUES
    ('1247050016', 'Arham Mahasin',
     'arham.mahasin@example.com', 5, 3.75)
ON CONFLICT (nim) DO NOTHING;
