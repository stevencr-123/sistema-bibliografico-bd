

USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'sistemaBibliografico')
BEGIN
    ALTER DATABASE sistemaBibliografico SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE sistemaBibliografico;
END
GO

DROP DATABASE IF EXISTS sistemaBibliografico;
CREATE DATABASE sistemaBibliografico;
USE sistemaBibliografico;

CREATE TABLE UBICACION (
    id_ubicacion INT IDENTITY(1,1) PRIMARY KEY,
    lugar NVARCHAR(20) NOT NULL,
    descripcion NVARCHAR(255),
    CONSTRAINT chk_lugar CHECK (lugar IN ('Despacho','Laboratorio'))
);
GO

CREATE TABLE PERSONA (
    id_persona INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(150) NOT NULL,
    email NVARCHAR(150) UNIQUE,
    centro_trabajo NVARCHAR(150),
    afiliacion_universitaria NVARCHAR(150),
    pais NVARCHAR(100),
    grado_academico NVARCHAR(100),
    experiencia_profesional NVARCHAR(MAX)
);
GO

CREATE TABLE PALABRA_CLAVE (
    id_palabra INT IDENTITY(1,1) PRIMARY KEY,
    palabra NVARCHAR(100) NOT NULL UNIQUE,
    descripcion NVARCHAR(255)
);
GO

CREATE TABLE TEMA (
    id_tema INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(150) NOT NULL UNIQUE,
    descripcion NVARCHAR(255)
);
GO

CREATE TABLE ARTICULO (
    id_articulo INT IDENTITY(1,1) PRIMARY KEY,
    titulo NVARCHAR(255) NOT NULL,
    email_contacto NVARCHAR(150),
    disponible BIT NOT NULL DEFAULT 1,
    resumen NVARCHAR(MAX),
    fecha_publicacion DATE,
    id_ubicacion INT NULL,
    
    CONSTRAINT fk_articulo_ubicacion
        FOREIGN KEY (id_ubicacion)
        REFERENCES UBICACION(id_ubicacion)
        ON DELETE SET NULL
);
GO

CREATE TABLE AUTORIA (
    id_articulo INT,
    id_persona INT,
    CONSTRAINT pk_autoria PRIMARY KEY (id_articulo, id_persona),
    FOREIGN KEY (id_articulo) REFERENCES ARTICULO(id_articulo) ON DELETE CASCADE,
    FOREIGN KEY (id_persona) REFERENCES PERSONA(id_persona) ON DELETE CASCADE
);
GO

CREATE TABLE ARTICULO_PALABRA (
    id_articulo INT,
    id_palabra INT,
    CONSTRAINT pk_articulo_palabra PRIMARY KEY (id_articulo, id_palabra),
    FOREIGN KEY (id_articulo) REFERENCES ARTICULO(id_articulo) ON DELETE CASCADE,
    FOREIGN KEY (id_palabra) REFERENCES PALABRA_CLAVE(id_palabra) ON DELETE CASCADE
);
GO

CREATE TABLE PERSONA_TEMA (
    id_persona INT,
    id_tema INT,
    CONSTRAINT pk_persona_tema PRIMARY KEY (id_persona, id_tema),
    FOREIGN KEY (id_persona) REFERENCES PERSONA(id_persona) ON DELETE CASCADE,
    FOREIGN KEY (id_tema) REFERENCES TEMA(id_tema) ON DELETE CASCADE
);
GO

CREATE TABLE ARTICULO_TEMA (
    id_articulo INT,
    id_tema INT,
    CONSTRAINT pk_articulo_tema PRIMARY KEY (id_articulo, id_tema),
    FOREIGN KEY (id_articulo) REFERENCES ARTICULO(id_articulo) ON DELETE CASCADE,
    FOREIGN KEY (id_tema) REFERENCES TEMA(id_tema) ON DELETE CASCADE
);
GO

CREATE TABLE INFORME_TECNICO (
    id_articulo INT PRIMARY KEY,
    numero_identificacion INT UNIQUE,
    centro_publicacion NVARCHAR(150),
    mes_publicacion INT CHECK (mes_publicacion BETWEEN 1 AND 12),
    anio_publicacion INT,
    FOREIGN KEY (id_articulo) REFERENCES ARTICULO(id_articulo) ON DELETE CASCADE
);
GO

CREATE TABLE CONGRESO (
    id_articulo INT PRIMARY KEY,
    nombre NVARCHAR(150),
    edicion NVARCHAR(50),
    ciudad NVARCHAR(100),
    tipo NVARCHAR(20),
    frecuencia NVARCHAR(100),
    pais NVARCHAR(100),
    anio_primera_edicion INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    CONSTRAINT chk_tipo CHECK (tipo IN ('Nacional','Internacional')),
    FOREIGN KEY (id_articulo) REFERENCES ARTICULO(id_articulo) ON DELETE CASCADE
);
GO

CREATE TABLE REVISTA (
    id_articulo INT PRIMARY KEY,
    nombre NVARCHAR(150),
    editor NVARCHAR(150),
    anio_inicio_publicacion INT,
    frecuencia NVARCHAR(100),
    numero_revista INT,
    pagina_inicio INT,
    pagina_fin INT,
    area_tematica NVARCHAR(150),
    anio_publicacion INT,
    FOREIGN KEY (id_articulo) REFERENCES ARTICULO(id_articulo) ON DELETE CASCADE
);
GO

CREATE INDEX idx_articulo_titulo ON ARTICULO(titulo);
CREATE INDEX idx_persona_nombre ON PERSONA(nombre);
CREATE INDEX idx_palabra ON PALABRA_CLAVE(palabra);
CREATE INDEX idx_tema ON TEMA(nombre);
GO