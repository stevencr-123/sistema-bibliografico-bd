-- =========================================
-- PRUEBAS DE INTEGRIDAD
-- =========================================

-- ❌ Intentar insertar artículo inexistente en informe técnico
INSERT INTO INFORME_TECNICO VALUES (999, 2000, 'Test', 1, 2025);

-- ❌ Intentar duplicar tipo de publicación (debe fallar por trigger)
INSERT INTO INFORME_TECNICO VALUES (1, 3000, 'Otro', 2, 2023);

-- ❌ Insertar palabra clave duplicada (si tiene UNIQUE)
INSERT INTO PALABRA_CLAVE (palabra) VALUES ('IA');

-- ❌ Insertar relación duplicada
INSERT INTO ARTICULO_PALABRA VALUES (1,1);

-- ✔ Inserción válida
INSERT INTO ARTICULO (titulo, disponible) VALUES ('Nuevo articulo', 1);