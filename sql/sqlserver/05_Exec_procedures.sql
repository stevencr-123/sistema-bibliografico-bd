-- Ejecución de Procedimientos Almacenados

-- ARTÍCULOS
EXEC sp_mostrar_articulos_v2;
EXEC sp_articulo_titulo_v2 @titulo = 'IA en medicina';
EXEC sp_articulos_disponibles_v2;
EXEC sp_articulos_anio_v2 @anio = 2022;
EXEC sp_articulos_fecha_v2 @fecha = '2022-01-01';
EXEC sp_articulos_resumen_v2 @texto = 'IA';


-- AUTORES
EXEC sp_listar_autores_v2;
EXEC sp_autores_nombre_v2 @nombre = 'Juan';
EXEC sp_autores_email_v2 @email = 'juan@mail.com';
EXEC sp_autores_pais_v2 @pais = 'Colombia';
EXEC sp_autores_afiliacion_v2 @af = 'Universidad de Cartagena';
EXEC sp_autores_experiencia_v2 @exp = 'investigador';
EXEC sp_autores_grado_v2 @grado = 'Doctorado';
-- RELACION ARTÍCULO-AUTOR
EXEC sp_articulos_autor_v2 @nombre = 'Juan';
EXEC sp_articulos_email_v2 @correo = 'juan@mail.com';
EXEC sp_articulos_centro_v2 @centro = 'Uni Cartagena';
EXEC sp_articulos_pais_autor_v2 @pais = 'Colombia';
EXEC sp_articulos_afiliacion_v2 @afiliacion = 'Uni Cartagena';
-- PALABRAS CLAVES Y TEMAS
EXEC sp_articulos_palabra_v2 @palabra = 'datos';
EXEC sp_articulos_tema_v2 @tema = 'IA';
-- CONGRESOS
EXEC sp_congreso_internacional_v2;
EXEC sp_congreso_nacional_v2;
EXEC sp_articulos_pais_congreso_v2 @pais = 'España';
EXEC sp_articulos_ciudad_v2 @ciudad = 'Bogotá';
EXEC sp_articulos_edicion_v2 @edicion = '5';
-- REVISTAS
EXEC sp_articulos_revista_v2 @nombre = 'Science AI';
EXEC sp_articulos_editor_v2 @editor = 'Elsevier';
EXEC sp_revista_anio_v2 @anio = 2023;
EXEC sp_articulos_area_v2 @area = 'IA';
EXEC sp_articulos_frecuencia_v2 @frecuencia = 'Mensual';
EXEC sp_articulos_paginas_v2 @inicio = 1, @fin = 20;
-- INFORMES TÉCNICOS
EXEC sp_informe_numero_v2 @numero = 1001;
EXEC sp_informe_centro_v2 @centro = 'Uni Cartagena';
