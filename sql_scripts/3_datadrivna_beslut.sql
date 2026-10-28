DESC system.application_round;

-- Kontroll att det fungerar

SELECT 
    COUNT(*) 
FROM application_round;

SELECT * FROM application_round
FETCH FIRST 5 ROWS ONLY;

--

-- Fråga 1 - Vilka utbildningsområden har högst beviljandegrad?
-- Motivering: The Skool önskar att veta var chansen är störst

SELECT 
    utbildningsomrade,
    COUNT(*) AS totalt,
    SUM(CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END) AS beviljade,
    ROUND(100 * SUM(CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END) / COUNT(*), 1) AS beviljandegrad_procent
FROM application_round
GROUP BY utbildningsomrade
HAVING COUNT(*) >= 10
ORDER BY beviljandegrad_procent DESC;

-- Fråga 2 - Har distansutbildningar högre eller lägre beviljandegrad än platsbundna utbildningar?
-- Motivering: The Skool vill veta hur många utbildningar beviljas på plats respektive distans

SELECT 
    studieform,
    COUNT(*) AS totalt,
    ROUND(100 * SUM(CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END) / COUNT(*), 1) AS beviljandegrad_procent 
FROM application_round
GROUP BY studieform
ORDER BY  beviljandegrad_procent DESC;


-- Fråga 3 - Har kommunala eller privata anordnare högre beviljandegrad inom respektive område
-- Motivering: The Skool vill veta om kommunala aktörer har bättre lycka i något område

SELECT
    utbildningsomrade,
    huvudmannatyp,
    COUNT(*) AS totalt,
    ROUND(100 * SUM(CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END) / COUNT(*), 1) AS beviljandegrad_procent
FROM application_round
GROUP BY utbildningsomrade, huvudmannatyp
HAVING COUNT(*) >= 5
ORDER BY utbildningsomrade, beviljandegrad_procent DESC;

-- Fråga 4 - Är det bäst att söka 1, 2 eller 3 platser?
-- Motivering: The Skool vill veta om antalet sökta platser påverkar beviljandegraden

SELECT
    sokta_omgangar,
    COUNT(*) AS totalt,
    ROUND(100 * SUM(CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END) / COUNT(*), 1) AS beviljandegrad_procent
FROM application_round
GROUP BY sokta_omgangar
ORDER BY sokta_omgangar;

-- Fråga 5 - Vilka anordnare har högst beviljandegrad?
-- Motivering: The Skool vill veta hur det går får vissa skolor för att få en blick på anordnare med bevisad framgång

SELECT
    anordnare_admin_enhet,
    COUNT(*) AS totalt,
    ROUND(100 * SUM(CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END) / COUNT(*), 1) AS beviljandegrad_procent
FROM application_round
GROUP BY anordnare_admin_enhet
ORDER BY beviljandegrad_procent DESC;

SELECT
    anordnare_admin_enhet,
    COUNT(*) AS totalt,
    ROUND(100 * SUM(CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END) / COUNT(*), 1) AS beviljandegrad_procent
FROM application_round
HAVING COUNT(*) >= 5
GROUP BY anordnare_admin_enhet
ORDER BY beviljandegrad_procent DESC
FETCH FIRST 10 ROWS ONLY;

-- Fråga 6 - Vilka SUN5-inriktningar beviljas mest?
-- Motivering: Veta vilka delområden som beviljas mest kan hjälpa The Skool att ha en idé om vilka delområden de ska rikta sin fokus till

SELECT
    sun5_inriktning,
    sun5_inriktning_namn,
    COUNT(*) AS totalt,
    SUM(CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END) AS beviljade,
    ROUND(100 * SUM(CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END) / COUNT(*), 1) AS beviljandegrad_procent
FROM application_round
GROUP BY sun5_inriktning, sun5_inriktning_namn
ORDER BY beviljade DESC, beviljandegrad_procent DESC
FETCH FIRST 10 ROWS ONLY;





EXIT
