-- =========================================
-- CONSULTAS AVANZADAS
-- =========================================

-- 🔹 Top autores con más artículos
SELECT P.nombre, COUNT(*) AS total_articulos
FROM PERSONA P
JOIN AUTORIA A ON P.id_persona = A.id_persona
GROUP BY P.nombre
ORDER BY total_articulos DESC;

-- 🔹 Artículos por año y país
SELECT YEAR(A.fecha_publicacion) AS anio, P.pais, COUNT(*) AS total
FROM ARTICULO A
JOIN AUTORIA AU ON A.id_articulo = AU.id_articulo
JOIN PERSONA P ON AU.id_persona = P.id_persona
GROUP BY YEAR(A.fecha_publicacion), P.pais;

-- 🔹 Artículos con más de una palabra clave
SELECT A.titulo
FROM ARTICULO A
JOIN ARTICULO_PALABRA AP ON A.id_articulo = AP.id_articulo
GROUP BY A.titulo
HAVING COUNT(AP.id_palabra) > 1;

-- 🔹 Autores que trabajan en múltiples temas
SELECT P.nombre
FROM PERSONA P
JOIN PERSONA_TEMA PT ON P.id_persona = PT.id_persona
GROUP BY P.nombre
HAVING COUNT(PT.id_tema) > 1;