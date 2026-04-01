GO
CREATE OR ALTER PROCEDURE dbo.sp_mostrar_articulos_v2
AS
BEGIN
    SELECT * FROM ARTICULO;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_articulo_titulo_v2
    @titulo NVARCHAR(255)
AS
BEGIN
    SELECT * FROM ARTICULO
    WHERE titulo = @titulo;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_listar_autores_v2
AS
BEGIN
    SELECT * FROM PERSONA;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_articulos_autor_v2
    @nombre NVARCHAR(150)
AS
BEGIN
    SELECT A.titulo
    FROM ARTICULO A
    JOIN AUTORIA AU ON A.id_articulo = AU.id_articulo
    JOIN PERSONA P ON AU.id_persona = P.id_persona
    WHERE P.nombre = @nombre;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_articulos_disponibles_v2
AS
BEGIN
    SELECT * FROM ARTICULO
    WHERE disponible = 1;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_articulos_palabra_v2
    @palabra NVARCHAR(100)
AS
BEGIN
    SELECT A.titulo
    FROM ARTICULO A
    JOIN ARTICULO_PALABRA AP ON A.id_articulo = AP.id_articulo
    JOIN PALABRA_CLAVE PC ON AP.id_palabra = PC.id_palabra
    WHERE PC.palabra = @palabra;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_informe_numero_v2
    @numero INT
AS
BEGIN
    SELECT * FROM INFORME_TECNICO
    WHERE numero_identificacion = @numero;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_congreso_internacional_v2
AS
BEGIN
    SELECT A.titulo
    FROM ARTICULO A
    JOIN CONGRESO C ON A.id_articulo = C.id_articulo
    WHERE C.tipo = 'Internacional';
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_congreso_nacional_v2
AS
BEGIN
    SELECT A.titulo
    FROM ARTICULO A
    JOIN CONGRESO C ON A.id_articulo = C.id_articulo
    WHERE C.tipo = 'Nacional';
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_articulos_pais_congreso_v2
    @pais NVARCHAR(100)
AS
BEGIN
    SELECT A.titulo
    FROM ARTICULO A
    JOIN CONGRESO C ON A.id_articulo = C.id_articulo
    WHERE C.pais = @pais;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_articulos_centro_v2
    @centro NVARCHAR(150)
AS
BEGIN
    SELECT A.titulo
    FROM ARTICULO A
    JOIN AUTORIA AU ON A.id_articulo = AU.id_articulo
    JOIN PERSONA P ON AU.id_persona = P.id_persona
    WHERE P.centro_trabajo = @centro;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_articulos_email_v2
    @correo NVARCHAR(150)
AS
BEGIN
    SELECT A.titulo
    FROM ARTICULO A
    JOIN AUTORIA AU ON A.id_articulo = AU.id_articulo
    JOIN PERSONA P ON AU.id_persona = P.id_persona
    WHERE P.email = @correo;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_articulos_anio_v2
    @anio INT
AS
BEGIN
    SELECT *
    FROM ARTICULO
    WHERE YEAR(fecha_publicacion) = @anio;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_articulos_tema_v2
    @tema NVARCHAR(150)
AS
BEGIN
    SELECT A.titulo
    FROM ARTICULO A
    JOIN ARTICULO_TEMA AT ON A.id_articulo = AT.id_articulo
    JOIN TEMA T ON AT.id_tema = T.id_tema
    WHERE T.nombre = @tema;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_articulos_revista_v2
    @nombre NVARCHAR(150)
AS
BEGIN
    SELECT A.titulo
    FROM ARTICULO A
    JOIN REVISTA R ON A.id_articulo = R.id_articulo
    WHERE R.nombre = @nombre;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_articulos_editor_v2
    @editor NVARCHAR(150)
AS
BEGIN
    SELECT A.titulo
    FROM ARTICULO A
    JOIN REVISTA R ON A.id_articulo = R.id_articulo
    WHERE R.editor = @editor;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_revista_anio_v2
    @anio INT
AS
BEGIN
    SELECT A.titulo
    FROM ARTICULO A
    JOIN REVISTA R ON A.id_articulo = R.id_articulo
    WHERE R.anio_publicacion = @anio;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_informe_centro_v2
    @centro NVARCHAR(150)
AS
BEGIN
    SELECT *
    FROM INFORME_TECNICO
    WHERE centro_publicacion = @centro;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_articulos_paginas_v2
    @inicio INT,
    @fin INT
AS
BEGIN
    SELECT A.titulo
    FROM ARTICULO A
    JOIN REVISTA R ON A.id_articulo = R.id_articulo
    WHERE R.pagina_inicio >= @inicio AND R.pagina_fin <= @fin;
END;
GO

GO
CREATE OR ALTER PROCEDURE dbo.sp_articulos_pais_autor_v2
    @pais NVARCHAR(100)
AS
BEGIN
    SELECT A.titulo
    FROM ARTICULO A
    JOIN AUTORIA AU ON A.id_articulo = AU.id_articulo
    JOIN PERSONA P ON AU.id_persona = P.id_persona
    WHERE P.pais = @pais;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_articulos_ciudad_v2
    @ciudad NVARCHAR(100)
AS
BEGIN
    SELECT A.titulo
    FROM ARTICULO A
    JOIN CONGRESO C ON A.id_articulo = C.id_articulo
    WHERE C.ciudad = @ciudad;
END;
GO
CREATE OR ALTER PROCEDURE dbo.sp_articulos_afiliacion_v2
    @afiliacion NVARCHAR(150)
AS
BEGIN
    SELECT A.titulo
    FROM ARTICULO A
    JOIN AUTORIA AU ON A.id_articulo = AU.id_articulo
    JOIN PERSONA P ON AU.id_persona = P.id_persona
    WHERE P.afiliacion_universitaria = @afiliacion;
END;
GO
CREATE OR ALTER PROCEDURE dbo.sp_articulos_area_v2
    @area NVARCHAR(150)
AS
BEGIN
    SELECT A.titulo
    FROM ARTICULO A
    JOIN REVISTA R ON A.id_articulo = R.id_articulo
    WHERE R.area_tematica = @area;
END;
GO
CREATE OR ALTER PROCEDURE dbo.sp_informe_mes_v2
    @mes INT
AS
BEGIN
    SELECT *
    FROM INFORME_TECNICO
    WHERE mes_publicacion = @mes;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_articulos_edicion_v2
    @edicion NVARCHAR(50)
AS
BEGIN
    SELECT A.titulo
    FROM ARTICULO A
    JOIN CONGRESO C ON A.id_articulo = C.id_articulo
    WHERE C.edicion = @edicion;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_articulos_resumen_v2
    @texto NVARCHAR(100)
AS
BEGIN
    SELECT *
    FROM ARTICULO
    WHERE resumen LIKE '%' + @texto + '%';
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_articulos_fecha_v2
    @fecha DATE
AS
BEGIN
    SELECT *
    FROM ARTICULO
    WHERE fecha_publicacion = @fecha;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_articulos_frecuencia_v2
    @frecuencia NVARCHAR(100)
AS
BEGIN
    SELECT A.titulo
    FROM ARTICULO A
    JOIN REVISTA R ON A.id_articulo = R.id_articulo
    WHERE R.frecuencia = @frecuencia;
END;
GO
-- PROCEDIMIENTOS ALMACENADOS PARA PERSONA
CREATE OR ALTER PROCEDURE dbo.sp_autores_nombre_v2
    @nombre NVARCHAR(150)
AS
BEGIN
    SELECT * FROM PERSONA WHERE nombre = @nombre;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_autores_afiliacion_v2
    @af NVARCHAR(150)
AS
BEGIN
    SELECT * FROM PERSONA WHERE afiliacion_universitaria = @af;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_autores_email_v2
    @email NVARCHAR(150)
AS
BEGIN
    SELECT * FROM PERSONA WHERE email = @email;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_autores_pais_v2
    @pais NVARCHAR(100)
AS
BEGIN
    SELECT * FROM PERSONA WHERE pais = @pais;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_autores_experiencia_v2
    @exp NVARCHAR(100)
AS
BEGIN
    SELECT * FROM PERSONA 
    WHERE experiencia_profesional LIKE '%' + @exp + '%';
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_autores_grado_v2
    @grado NVARCHAR(100)
AS
BEGIN
    SELECT * FROM PERSONA WHERE grado_academico = @grado;
END;
GO

SELECT name 
FROM sys.procedures
WHERE name LIKE '%v2';
