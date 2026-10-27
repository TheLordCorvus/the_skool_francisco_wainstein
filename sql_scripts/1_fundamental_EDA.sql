DESC system.application_round;

-- Test lines to check that it works

SELECT COUNT(*) FROM application_round;

SELECT * FROM application_round
FETCH FIRST 5 ROWS ONLY;


-- Antal ansökningar per utbildningsområde, sorterat på flest ansökningar

SELECT 
    utbildningsomrade,
    COUNT(*) AS antal
FROM application_round
GROUP BY utbildningsomrade
ORDER BY antal DESC;

-- Antal BEVILJADE ansökningar per utbildningsområde

SELECT 
    utbildningsomrade,
    COUNT(*) AS beviljade
FROM application_round
WHERE beslut = 'Beviljad'
GROUP BY utbildningsomrade;


-- Antal AVSLAGNA ansökningar per utbildningsområde

SELECT
    utbildningsomrade,
    COUNT(*) AS avslagna
FROM application_round
WHERE beslut = 'Avslag'
GROUP BY utbildningsomrade;


-- Antal BEVILJADE ansökningar per utbildningsnamn inom Data/IT

SELECT 
    utbildningsnamn,
    COUNT(*) AS beviljade
FROM application_round
WHERE utbildningsomrade = 'Data/IT' AND beslut = 'Beviljad'
GROUP BY utbildningsnamn;



-- Antal AVSLAGNA ansökningar per utbildningsnamn inom Data/IT

SELECT
    utbildningsnamn,
    COUNT(*) AS avslagna
FROM application_round
WHERE utbildningsomrade = 'Data/IT' AND beslut = 'Avslag'
GROUP BY utbildningsnamn;



-- Antal BEVILJADE ansökningar per utbildningsanordnare administrativ enhet & utbildningsnamn, inom Data/IT

 
    


-- Topp 5 län efter antal beviljade ansökningar




-- Andel distans och andel bundna utbildningar inom respektive utbildningsområde



-- Antal utbildningar som innehåller ordet AI





EXIT
