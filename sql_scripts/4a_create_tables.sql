DROP TABLE IF EXISTS ansokan_kommun;
DROP TABLE IF EXISTS ansokan;
DROP TABLE IF EXISTS kommun;
DROP TABLE IF EXISTS lan;
DROP TABLE IF EXISTS utbildningsanordnare;
DROP TABLE IF EXISTS seqf;
DROP TABLE IF EXISTS sun5_inriktning;
DROP TABLE IF EXISTS utbildningsomrade;

CREATE TABLE utbildningsomrade (
    utbildningsomrade_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    utbildningsomrade_namn VARCHAR2(200) NOT NULL
);

CREATE TABLE sun5_inriktning (
    sun5_kod VARCHAR2(20) PRIMARY KEY,
    utbildningsomrade_id NUMBER NOT NULL REFERENCES utbildningsomrade,
    sun5_namn VARCHAR2(300)
);

CREATE TABLE seqf (
    seqf_kod VARCHAR2(20) PRIMARY KEY,
    examenstyp VARCHAR2(200)
);

CREATE TABLE utbildningsanordnare (
    anordnare_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    anordnare_namn VARCHAR2(300) NOT NULL,
    huvudmannatyp VARCHAR2(100)
);

CREATE TABLE lan (
    lan_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    lan_namn VARCHAR2(100) NOT NULL
);

CREATE TABLE kommun (
    kommun_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    kommun_namn VARCHAR2(100) NOT NULL,
    lan_id NUMBER NOT NULL REFERENCES lan
);

CREATE TABLE ansokan (
    diarienummer VARCHAR2(50) PRIMARY KEY,
    sun5_kod VARCHAR2(20) REFERENCES sun5_inriktning,
    seqf_kod VARCHAR2(20) REFERENCES seqf,
    anordnare_id NUMBER REFERENCES utbildningsanordnare,
    utbildningsnamn VARCHAR2(500),
    beslut VARCHAR2(100),
    yh_poang    NUMBER,
    studieform  VARCHAR2(100),
    studietakt_procent  NUMBER,
    smalt_yrkesomrade   VARCHAR2(20),
    sokta_utbildningsomgangar   NUMBER,
    beviljade_utbildningsomgangar   NUMBER,
    sokta_platser_totalt    NUMBER,
    beviljade_platser_totalt    NUMBER
);

CREATE TABLE ansokan_kommun (
    ansokan_kommun_id   NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    diarienummer    VARCHAR2(50) NOT NULL REFERENCES ansokan,
    kommun_id NUMBER NOT NULL REFERENCES kommun
);

EXIT
