-- a) Antal ansökningar per utbildningsområde, sorterat på flest sökningar
SELECT 
    o.utbildningsomrade_namn,
    COUNT(*) AS antal_ansokningar
FROM ansokan a
JOIN sun5_inriktning s ON s.sun5_kod = a.sun5_kod
JOIN utbildningsomrade o ON o.utbildningsomrade_id = s.utbildningsomrade_id
GROUP BY o.utbildningsomrade_namn
ORDER BY antal_ansokningar DESC;

-- b) Antal BEVILJADE ansökningar per utbildningsområde

SELECT 
    o.utbildningsomrade_namn,
    COUNT(*) AS beviljade
FROM ansokan a
JOIN sun5_inriktning s ON s.sun5_kod = a.sun5_kod
JOIN utbildningsomrade o ON o.utbildningsomrade_id = s.utbildningsomrade_id
WHERE beslut = 'Beviljad'
GROUP BY o.utbildningsomrade_namn
ORDER BY beviljade DESC;

-- c) Antal AVSLAGNA ansökningar per utbildningsområde

SELECT 
    o.utbildningsomrade_namn,
    COUNT(*) AS avslagna
FROM ansokan a
JOIN sun5_inriktning s ON s.sun5_kod = a.sun5_kod
JOIN utbildningsomrade o ON o.utbildningsomrade_id = s.utbildningsomrade_id
WHERE beslut = 'Avslag'
GROUP BY o.utbildningsomrade_namn
ORDER BY avslagna DESC;

-- d) Antal BEVILJADE ansökningar per utbildningsnamn inom Data/IT

SELECT
    a.utbildningsnamn,
    COUNT(*) AS beviljade
FROM ansokan a
JOIN sun5_inriktning s ON s.sun5_kod = a.sun5_kod
JOIN utbildningsomrade o ON o.utbildningsomrade_id = s.utbildningsomrade_id
WHERE o.utbildningsomrade_namn = 'Data/IT'
AND a.beslut = 'Beviljad'
GROUP BY a.utbildningsnamn
ORDER BY beviljade DESC;

-- e) Antal AVSLAGNA ansökningar per utbildningsnamn inom Data/IT

SELECT
    a.utbildningsnamn,
    COUNT(*) AS avslagna
FROM ansokan a
JOIN sun5_inriktning s ON s.sun5_kod = a.sun5_kod
JOIN utbildningsomrade o ON o.utbildningsomrade_id = s.utbildningsomrade_id
WHERE o.utbildningsomrade_namn = 'Data/IT'
AND a.beslut = 'Avslag'
GROUP BY a.utbildningsnamn
ORDER BY avslagna DESC;

-- f) Antal BEVILJADE ansökningar per utbildningsanordnare administrativ enhet & 
-- utbildningsnamn inom Data/IT

SELECT
    u.anordnare_namn,
    a.utbildningsnamn,
    COUNT(*) AS beviljade
FROM ansokan a
JOIN utbildningsanordnare u ON u.anordnare_id = a.anordnare_id
JOIN sun5_inriktning s ON s.sun5_kod = a.sun5_kod
JOIN utbildningsomrade o ON o.utbildningsomrade_id = s.utbildningsomrade_id
WHERE o.utbildningsomrade_namn = 'Data/IT'
AND beslut = 'Beviljad'
GROUP BY u.anordnare_namn, a.utbildningsnamn
ORDER BY beviljade DESC;

-- g) Topp 5 län efter antal beviljade ansökningar

SELECT 
    l.lan_namn,
    COUNT(DISTINCT a.diarienummer) AS beviljade
FROM ansokan a
JOIN ansokan_kommun ak ON ak.diarienummer = a.diarienummer
JOIN kommun k ON k.kommun_id = ak.kommun_id
JOIN lan l ON l.lan_id = k.lan_id
WHERE a.beslut = 'Beviljad'
GROUP BY l.lan_namn
ORDER BY beviljade DESC
FETCH FIRST 5 ROWS ONLY;

-- h) Andel distans och andel bundna utbildningar inom respektive utbildningsområde

SELECT 
    o.utbildningsomrade_namn,
    COUNT(*) AS totalt,
    ROUND(100 * SUM(CASE WHEN a.studieform = 'Distans' THEN 1 ELSE 0 END) / COUNT(*), 1) AS andel_distans,
    ROUND(100 * SUM(CASE WHEN a.studieform = 'Bunden' THEN 1 ELSE 0 END) / COUNT(*), 1) AS andel_bundna
FROM ansokan a
JOIN sun5_inriktning s ON s.sun5_kod = a.sun5_kod
JOIN utbildningsomrade o ON o.utbildningsomrade_id = s.utbildningsomrade_id
GROUP BY o.utbildningsomrade_namn
ORDER BY o.utbildningsomrade_namn;

-- i) Antal utbildningar som innehåller ordet AI

SELECT
    COUNT(DISTINCT utbildningsnamn) AS antal_utbildningar_med_AI
FROM ansokan
WHERE REGEXP_LIKE(utbildningsnamn, '(^|\W)AI(\W|$)');


EXIT

