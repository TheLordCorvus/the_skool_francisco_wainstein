INSERT INTO utbildningsomrade (
    utbildningsomrade_namn
)
SELECT DISTINCT 
    utbildningsomrade 
FROM application_round;

INSERT INTO seqf (
    seqf_kod, 
    examenstyp
)
SELECT 
    TO_CHAR(seqf_niva), 
    MIN(examenstyp)
FROM application_round
WHERE seqf_niva IS NOT NULL
GROUP BY  seqf_niva;

INSERT INTO utbildningsanordnare (
    anordnare_namn, 
    huvudmannatyp
)
SELECT 
    TRIM(anordnare_admin_enhet), 
    MIN(huvudmannatyp)
FROM application_round
GROUP BY TRIM(anordnare_admin_enhet);

INSERT INTO lan(
    lan_namn
)
SELECT DISTINCT 
    lan 
FROM application_round;

INSERT INTO sun5_inriktning(
    sun5_kod,
    utbildningsomrade_id, 
    sun5_namn
)
SELECT 
    a.sun5_inriktning, 
    o.utbildningsomrade_id, 
    MIN(a.sun5_inriktning_namn)
FROM application_round a
JOIN utbildningsomrade o ON o.utbildningsomrade_namn = a.utbildningsomrade
GROUP BY a.sun5_inriktning, o.utbildningsomrade_id;

INSERT INTO kommun (
    kommun_namn, 
    lan_id
)
SELECT DISTINCT 
    a.kommun, 
    l.lan_id
FROM application_round a
JOIN lan l ON l.lan_namn = a.lan;

INSERT INTO ansokan (
    diarienummer,
    sun5_kod,
    seqf_kod,
    anordnare_id,
    utbildningsnamn,
    beslut,
    yh_poang,
    studieform,
    studietakt_procent,
    smalt_yrkesomrade,
    sokta_utbildningsomgangar,
    beviljade_utbildningsomgangar,
    sokta_platser_totalt,
    beviljade_platser_totalt
)
SELECT 
    a.diarienummer, 
    a.sun5_inriktning,
    TO_CHAR(a.seqf_niva),
    u.anordnare_id,
    a.utbildningsnamn,
    a.beslut,
    a.yh_poang,
    a.studieform,
    a.studietakt_procent,
    a.smalt_yrkesomrade,
    a.sokta_omgangar,
    a.beviljade_omgangar,
    a.sokta_platser_totalt,
    a.beviljade_platser_totalt
FROM application_round a
JOIN utbildningsanordnare u ON u.anordnare_namn = TRIM(a.anordnare_admin_enhet);

INSERT INTO ansokan_kommun (
    diarienummer,
    kommun_id
)
SELECT 
    a.diarienummer, 
    k.kommun_id
FROM application_round a
JOIN lan l ON l.lan_namn = a.lan
JOIN kommun k ON k.kommun_namn = a.kommun AND k.lan_id = l.lan_id;

COMMIT;    
