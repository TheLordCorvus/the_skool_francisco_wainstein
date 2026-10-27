DROP TABLE IF EXISTS application_round;

CREATE TABLE application_round (
    utbildningsomrade   VARCHAR2(200),
    sun5_inriktning     VARCHAR2(20),
    sun5_inriktning_namn    VARCHAR2(300),
    utbildningsnamn     VARCHAR2(500),
    beslut              VARCHAR2(20),
    diarienummer        VARCHAR2(30),
    flera_kommuner      VARCHAR2(10),
    antal_kommuner      NUMBER,
    lan                 VARCHAR2(100),
    kommun              VARCHAR2(100),
    yh_poang            NUMBER,
    studieform          VARCHAR2(50),
    studietakt_procent  NUMBER,
    examenstyp          VARCHAR2(100),
    seqf_niva           NUMBER,
    smalt_yrkesomrade   VARCHAR2(10),
    anordnare_admin_enhet   VARCHAR2(500),
    huvudmannatyp       VARCHAR2(50),
    sokta_omgangar   NUMBER,
    beviljade_omgangar   NUMBER,
    sokta_platser_per_omgang NUMBER,
    sokta_platser_totalt    NUMBER,
    beviljade_platser_omgang1    NUMBER,
    beviljade_platser_omgang2    NUMBER,
    beviljade_platser_omgang3    NUMBER,
    beviljade_platser_omgang4    NUMBER,
    beviljade_platser_omgang5    NUMBER,
    beviljade_platser_totalt    NUMBER
);


LOAD application_round Ansokningar.csv



EXIT
