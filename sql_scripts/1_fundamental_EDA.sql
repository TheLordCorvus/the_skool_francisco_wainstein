DESC system.application_round;

-- Test lines to check that it works

SELECT COUNT(*) FROM application_round;

SELECT * FROM application_round
FETCH FIRST 5 ROWS ONLY;


-- a) Antal ansökningar per utbildningsområde, sorterat på flest ansökningar

SELECT 
    utbildningsomrade,
    COUNT(*) AS antal
FROM application_round
GROUP BY utbildningsomrade
ORDER BY antal DESC;

-- b) Antal BEVILJADE ansökningar per utbildningsområde

SELECT 
    utbildningsomrade,
    COUNT(*) AS beviljade
FROM application_round
WHERE beslut = 'Beviljad'
GROUP BY utbildningsomrade;


-- c) Antal AVSLAGNA ansökningar per utbildningsområde

SELECT
    utbildningsomrade,
    COUNT(*) AS avslagna
FROM application_round
WHERE beslut = 'Avslag'
GROUP BY utbildningsomrade;


-- d) Antal BEVILJADE ansökningar per utbildningsnamn inom Data/IT

SELECT 
    utbildningsnamn,
    COUNT(*) AS beviljade
FROM application_round
WHERE utbildningsomrade = 'Data/IT' AND beslut = 'Beviljad'
GROUP BY utbildningsnamn
ORDER BY beviljade DESC;


-- e) Antal AVSLAGNA ansökningar per utbildningsnamn inom Data/IT

SELECT
    utbildningsnamn,
    COUNT(*) AS avslagna
FROM application_round
WHERE utbildningsomrade = 'Data/IT' AND beslut = 'Avslag'
GROUP BY utbildningsnamn
ORDER BY avslagna DESC;


-- f) Antal BEVILJADE ansökningar per utbildningsanordnare administrativ enhet & utbildningsnamn, inom Data/IT

SELECT
    anordnare_admin_enhet,
    utbildningsnamn,
    COUNT(*) AS beviljade
FROM application_round
WHERE utbildningsomrade = 'Data/IT' AND beslut = 'Beviljad'
GROUP BY anordnare_admin_enhet, utbildningsnamn
ORDER BY anordnare_admin_enhet, beviljade DESC;
    


-- g) Topp 5 län efter antal beviljade ansökningar

SELECT
    lan,
    COUNT(*) AS beviljade
FROM application_round
WHERE beslut = 'Beviljad'
GROUP BY lan
ORDER BY beviljade DESC
FETCH FIRST 5 ROWS ONLY;



-- h) Andel distans och andel bundna utbildningar inom respektive utbildningsområde

SELECT
    utbildningsomrade,
    ROUND(100 * SUM(CASE WHEN studieform = 'Distans' THEN 1 else 0 END) / COUNT(*), 1) AS andel_distans,
    ROUND(100 * SUM(CASE WHEN studieform = 'Bunden' THEN 1 else 0 END) / COUNT(*), 1) AS andel_bunden
FROM application_round
GROUP BY  utbildningsomrade
ORDER BY utbildningsomrade;

-- i) Antal utbildningar som innehåller ordet AI

SELECT
    COUNT(DISTINCT utbildningsnamn) AS AI_utbildningar
FROM application_round
WHERE REGEXP_LIKE(utbildningsnamn, '(^|[^[:alpha:]])AI([^[:alpha:]]|$)', 'c');



EXIT
