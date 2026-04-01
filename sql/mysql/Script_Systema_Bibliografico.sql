CREATE DATABASE sistemaBibliografico;
USE sistemaBibliografico;

CREATE TABLE PERSONA (
    id_persona INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    email VARCHAR(150),
    centro_trabajo VARCHAR(150),
    afiliacion_universitaria VARCHAR(150),
    pais VARCHAR(100),
    grado_academico VARCHAR(100),
    experiencia_profesional TEXT
);

CREATE TABLE PALABRA_CLAVE (
    id_palabra INT AUTO_INCREMENT PRIMARY KEY,
    palabra VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE TEMA (
    id_tema INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE UBICACION (
    id_ubicacion INT AUTO_INCREMENT PRIMARY KEY,
    lugar ENUM('Despacho', 'Laboratorio') NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE ARTICULO (
    id_articulo INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    email_contacto VARCHAR(150),
    disponible BOOLEAN NOT NULL,
    resumen TEXT,
    fecha_publicacion DATE,
    id_ubicacion INT NULL,
    
    CONSTRAINT fk_articulo_ubicacion
        FOREIGN KEY (id_ubicacion)
        REFERENCES UBICACION(id_ubicacion)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE AUTORIA (
    id_articulo INT,
    id_persona INT,
    
    PRIMARY KEY (id_articulo, id_persona),
    
    CONSTRAINT fk_autoria_articulo
        FOREIGN KEY (id_articulo)
        REFERENCES ARTICULO(id_articulo)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
        
    CONSTRAINT fk_autoria_persona
        FOREIGN KEY (id_persona)
        REFERENCES PERSONA(id_persona)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE ARTICULO_PALABRA (
    id_articulo INT,
    id_palabra INT,
    
    PRIMARY KEY (id_articulo, id_palabra),
    
    CONSTRAINT fk_articulo_palabra_articulo
        FOREIGN KEY (id_articulo)
        REFERENCES ARTICULO(id_articulo)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
        
    CONSTRAINT fk_articulo_palabra_palabra
        FOREIGN KEY (id_palabra)
        REFERENCES PALABRA_CLAVE(id_palabra)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE PERSONA_TEMA (
    id_persona INT,
    id_tema INT,
    
    PRIMARY KEY (id_persona, id_tema),
    
    CONSTRAINT fk_persona_tema_persona
        FOREIGN KEY (id_persona)
        REFERENCES PERSONA(id_persona)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
        
    CONSTRAINT fk_persona_tema_tema
        FOREIGN KEY (id_tema)
        REFERENCES TEMA(id_tema)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE ARTICULO_TEMA (
    id_articulo INT,
    id_tema INT,
    
    PRIMARY KEY (id_articulo, id_tema),
    
    CONSTRAINT fk_articulo_tema_articulo
        FOREIGN KEY (id_articulo)
        REFERENCES ARTICULO(id_articulo)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
        
    CONSTRAINT fk_articulo_tema_tema
        FOREIGN KEY (id_tema)
        REFERENCES TEMA(id_tema)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE INFORME_TECNICO (
    id_articulo INT PRIMARY KEY,
    numero_identificacion INT,
    centro_publicacion VARCHAR(150),
    mes_publicacion INT,
    anio_publicacion INT,
    
    CONSTRAINT fk_informe_articulo
        FOREIGN KEY (id_articulo)
        REFERENCES ARTICULO(id_articulo)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE CONGRESO (
    id_articulo INT PRIMARY KEY,
    nombre VARCHAR(150),
    edicion VARCHAR(50),
    ciudad VARCHAR(100),
    tipo ENUM('Nacional', 'Internacional'),
    frecuencia VARCHAR(100),
    pais VARCHAR(100),
    anio_primera_edicion INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    
    CONSTRAINT fk_congreso_articulo
        FOREIGN KEY (id_articulo)
        REFERENCES ARTICULO(id_articulo)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE REVISTA (
    id_articulo INT PRIMARY KEY,
    nombre VARCHAR(150),
    editor VARCHAR(150),
    anio_inicio_publicacion INT,
    frecuencia VARCHAR(100),
    numero_revista INT,
    pagina_inicio INT,
    pagina_fin INT,
    area_tematica VARCHAR(150),
    anio_publicacion INT,
    
    CONSTRAINT fk_revista_articulo
        FOREIGN KEY (id_articulo)
        REFERENCES ARTICULO(id_articulo)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO ARTICULO (titulo, email_contacto, disponible, resumen, fecha_publicacion)
VALUES
('IA en medicina', 'a1@mail.com', TRUE, 'uso de IA', '2022-01-01'),
('Big Data', 'a2@mail.com', TRUE, 'datos masivos', '2021-05-10'),
('Blockchain', 'a3@mail.com', FALSE, 'cadena bloques', '2020-03-15'),
('IoT', 'a4@mail.com', TRUE, 'internet cosas', '2023-07-20'),
('ML', 'a5@mail.com', TRUE, 'machine learning', '2022-11-11'),
('DL', 'a6@mail.com', FALSE, 'deep learning', '2021-09-09'),
('Cloud', 'a7@mail.com', TRUE, 'nube', '2020-06-06'),
('Seguridad', 'a8@mail.com', TRUE, 'ciberseguridad', '2023-02-02'),
('Robótica', 'a9@mail.com', FALSE, 'robots', '2022-08-08'),
('Quantum', 'a10@mail.com', TRUE, 'computación cuántica', '2024-01-01');

INSERT INTO PERSONA (nombre, email, pais)
VALUES
('Juan', 'juan@mail.com', 'Colombia'),
('Ana', 'ana@mail.com', 'México'),
('Luis', 'luis@mail.com', 'España'),
('Sofia', 'sofia@mail.com', 'Chile'),
('Carlos', 'carlos@mail.com', 'Perú'),
('Maria', 'maria@mail.com', 'Argentina'),
('Pedro', 'pedro@mail.com', 'Colombia'),
('Laura', 'laura@mail.com', 'Brasil'),
('Diego', 'diego@mail.com', 'Ecuador'),
('Elena', 'elena@mail.com', 'Uruguay');

INSERT INTO TEMA (nombre)
VALUES
('IA'), ('Big Data'), ('Blockchain'), ('IoT'), ('ML'),
('DL'), ('Cloud'), ('Seguridad'), ('Robótica'), ('Quantum');

INSERT INTO PALABRA_CLAVE (palabra)
VALUES
('inteligencia'), ('datos'), ('cadena'), ('sensores'),
('aprendizaje'), ('redes'), ('nube'), ('seguridad'),
('robots'), ('qubits');

INSERT INTO UBICACION (lugar, descripcion)
VALUES
('Despacho','A1'),('Laboratorio','L1'),
('Despacho','A2'),('Laboratorio','L2'),
('Despacho','A3'),('Laboratorio','L3'),
('Despacho','A4'),('Laboratorio','L4'),
('Despacho','A5'),('Laboratorio','L5');

INSERT INTO INFORME_TECNICO VALUES
(1, 1001, 'Uni Cartagena', 1, 2022),
(2, 1002, 'Uni Andes', 5, 2021),
(3, 1003, 'Uni Nacional', 3, 2020);

INSERT INTO CONGRESO VALUES
(4, 'TechConf', '10', 'Bogotá', 'Nacional', 'Anual', 'Colombia', 2010, '2023-01-01', '2023-01-05'),
(5, 'AI Summit', '5', 'Madrid', 'Internacional', 'Anual', 'España', 2015, '2022-06-01', '2022-06-03'),
(6, 'DataConf', '8', 'México DF', 'Internacional', 'Semestral', 'México', 2012, '2021-09-10', '2021-09-12');

INSERT INTO REVISTA VALUES
(7, 'Science AI', 'Elsevier', 2000, 'Mensual', 12, 1, 20, 'IA', 2023),
(8, 'Data Journal', 'Springer', 1995, 'Trimestral', 45, 21, 40, 'Big Data', 2022),
(9, 'Tech Review', 'IEEE', 2010, 'Mensual', 78, 5, 30, 'Tecnología', 2021),
(10, 'Quantum Mag', 'Nature', 2018, 'Mensual', 5, 1, 15, 'Quantum', 2024);

INSERT INTO AUTORIA VALUES (1,1),(1,2),(2,3),(3,4),(4,5),
(5,6),(6,7),(7,8),(8,9),(9,10);

INSERT INTO ARTICULO_TEMA VALUES (1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10);

INSERT INTO PERSONA_TEMA VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10);

INSERT INTO ARTICULO_PALABRA VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10);

DROP TRIGGER IF EXISTS trg_informe_tecnico_insert;
DELIMITER $$
CREATE TRIGGER trg_informe_tecnico_insert
BEFORE INSERT ON INFORME_TECNICO
FOR EACH ROW
BEGIN
      IF NOT EXISTS (
        SELECT 1 FROM ARTICULO WHERE id_articulo = NEW.id_articulo
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El artículo no existe';
    END IF;
    IF EXISTS (SELECT 1 FROM CONGRESO WHERE id_articulo = NEW.id_articulo)
       OR EXISTS (SELECT 1 FROM REVISTA WHERE id_articulo = NEW.id_articulo) THEN
       
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El artículo ya está asignado a otro tipo de publicación';
        
    END IF;
END$$

DELIMITER ;
DROP TRIGGER IF EXISTS trg_congreso_insert;
DELIMITER $$
CREATE TRIGGER trg_congreso_insert
BEFORE INSERT ON CONGRESO
FOR EACH ROW
BEGIN
     IF NOT EXISTS (
        SELECT 1 FROM ARTICULO WHERE id_articulo = NEW.id_articulo
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El artículo no existe';
    END IF;
    IF EXISTS (SELECT 1 FROM INFORME_TECNICO WHERE id_articulo = NEW.id_articulo)
       OR EXISTS (SELECT 1 FROM REVISTA WHERE id_articulo = NEW.id_articulo) THEN
       
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El artículo ya está asignado a otro tipo de publicación';
        
    END IF;
END$$

DELIMITER ;

DROP TRIGGER IF EXISTS trg_revista_insert;
DELIMITER $$
CREATE TRIGGER trg_revista_insert
BEFORE INSERT ON REVISTA
FOR EACH ROW
BEGIN
	 IF NOT EXISTS (
        SELECT 1 FROM ARTICULO WHERE id_articulo = NEW.id_articulo
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El artículo no existe';
    END IF;
    IF EXISTS (SELECT 1 FROM INFORME_TECNICO WHERE id_articulo = NEW.id_articulo)
       OR EXISTS (SELECT 1 FROM CONGRESO WHERE id_articulo = NEW.id_articulo) THEN
       
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El artículo ya está asignado a otro tipo de publicación';
        
    END IF;
END$$

DELIMITER ;

-- CONSULTAS DEL ENUNCIADO
-- MOSTRAR ARTICULOS
SELECT * FROM ARTICULO;

-- MOSTRAR DETALLES DE UN ARTICULO POR TITULO
SELECT * 
FROM ARTICULO
WHERE titulo = 'IA en medicina';

-- LISTAR TODOS LOS AUTORES
SELECT * FROM PERSONA;

-- ARTICULOS POR AUTOR
SELECT A.titulo
FROM ARTICULO A
JOIN AUTORIA AU ON A.id_articulo = AU.id_articulo
JOIN PERSONA P ON AU.id_persona = P.id_persona
WHERE P.nombre = 'Juan';

-- ARTICULOS DISPONIBLES
SELECT *
FROM ARTICULO
WHERE disponible = TRUE;

-- ARTICULOS POR PALABRAS CLAVES
SELECT A.titulo
FROM ARTICULO A
JOIN ARTICULO_PALABRA AP ON A.id_articulo = AP.id_articulo
JOIN PALABRA_CLAVE PC ON AP.id_palabra = PC.id_palabra
WHERE PC.palabra = 'datos';

-- INFORMES TECNICOS POR NUMERO
SELECT *
FROM INFORME_TECNICO
WHERE numero_identificacion = 1001;

-- ARTICULOS EN CONGRESO INTERNACIONAL
SELECT A.titulo
FROM ARTICULO A
JOIN CONGRESO C ON A.id_articulo = C.id_articulo
WHERE C.tipo = 'Internacional';

-- ARTICULOS EN CONGRESO NACIONAL
SELECT A.titulo
FROM ARTICULO A
JOIN CONGRESO C ON A.id_articulo = C.id_articulo
WHERE C.tipo = 'Nacional';

-- ARTICULOS POR PAIS DEL CONGRESO
SELECT A.titulo
FROM ARTICULO A
JOIN CONGRESO C ON A.id_articulo = C.id_articulo
WHERE C.pais = 'España';

-- ARTICULOS POR CENTRO DE TRABAJO
SELECT A.titulo
FROM ARTICULO A
JOIN AUTORIA AU ON A.id_articulo = AU.id_articulo
JOIN PERSONA P ON AU.id_persona = P.id_persona
WHERE P.centro_trabajo = 'Uni Cartagena';

-- ARTICULOS POR EMAIL DEL AUTOR
SELECT A.titulo
FROM ARTICULO A
JOIN AUTORIA AU ON A.id_articulo = AU.id_articulo
JOIN PERSONA P ON AU.id_persona = P.id_persona
WHERE P.email = 'juan@mail.com';

-- ARTICULOS POR AÑO
SELECT *
FROM ARTICULO
WHERE YEAR(fecha_publicacion) = 2022;

-- ARTICULOS POR TEMA
SELECT A.titulo
FROM ARTICULO A
JOIN ARTICULO_TEMA AT ON A.id_articulo = AT.id_articulo
JOIN TEMA T ON AT.id_tema = T.id_tema
WHERE T.nombre = 'IA';

-- ARTICULOS POR NOMBRE DE REVISTA
SELECT A.titulo
FROM ARTICULO A
JOIN REVISTA R ON A.id_articulo = R.id_articulo
WHERE R.nombre = 'Science AI';

-- ARTICULOS POR EDITOR
SELECT A.titulo
FROM ARTICULO A
JOIN REVISTA R ON A.id_articulo = R.id_articulo
WHERE R.editor = 'Elsevier';

-- ARTICULOS EN REVISTA POR AÑO
SELECT A.titulo
FROM ARTICULO A
JOIN REVISTA R ON A.id_articulo = R.id_articulo
WHERE R.anio_publicacion = 2023;

-- INFORMES POR CENTRO
SELECT *
FROM INFORME_TECNICO
WHERE centro_publicacion = 'Uni Cartagena';

-- ARTICULOS POR RANGO DE PAGINAS
SELECT A.titulo
FROM ARTICULO A
JOIN REVISTA R ON A.id_articulo = R.id_articulo
WHERE R.pagina_inicio >= 1 AND R.pagina_fin <= 20;

-- ARTICULOS POR PAIS DEL AUTOR
SELECT A.titulo
FROM ARTICULO A
JOIN AUTORIA AU ON A.id_articulo = AU.id_articulo
JOIN PERSONA P ON AU.id_persona = P.id_persona
WHERE P.pais = 'Colombia';

-- ARTICULOS POR CIUDAD DEL CONGRESO
SELECT A.titulo
FROM ARTICULO A
JOIN CONGRESO C ON A.id_articulo = C.id_articulo
WHERE C.ciudad = 'Bogotá';

-- ARTICULOS POR AFILIACION
SELECT A.titulo
FROM ARTICULO A
JOIN AUTORIA AU ON A.id_articulo = AU.id_articulo
JOIN PERSONA P ON AU.id_persona = P.id_persona
WHERE P.afiliacion_universitaria = 'Uni Cartagena';

-- ARTICULOS POR AREA TEMATICA
SELECT A.titulo
FROM ARTICULO A
JOIN REVISTA R ON A.id_articulo = R.id_articulo
WHERE R.area_tematica = 'IA';

-- INFORMES POR MES
SELECT *
FROM INFORME_TECNICO
WHERE mes_publicacion = 1;

-- ARTICULOS POR EDICION DE CONGRESO
SELECT A.titulo
FROM ARTICULO A
JOIN CONGRESO C ON A.id_articulo = C.id_articulo
WHERE C.edicion = '5';

-- ARTICULOS POR RESUMEN
SELECT *
FROM ARTICULO
WHERE resumen LIKE '%IA%';

-- ARTICULOS POR FECHA
SELECT *
FROM ARTICULO
WHERE fecha_publicacion = '2022-01-01';

-- ARTICULOS POR FRECUENCIA DE REVISTA
SELECT A.titulo
FROM ARTICULO A
JOIN REVISTA R ON A.id_articulo = R.id_articulo
WHERE R.frecuencia = 'Mensual';

-- AUTORES POR NOMBRE
SELECT *
FROM PERSONA
WHERE nombre = 'Juan';

-- AUTORES POR AFILIACION
SELECT *
FROM PERSONA
WHERE afiliacion_universitaria = 'Uni Cartagena';

-- AUTORES POR EMAIL
SELECT *
FROM PERSONA
WHERE email = 'juan@mail.com';

-- AUTORES POR PAIS 
SELECT *
FROM PERSONA
WHERE pais = 'Colombia';

-- AUTORES POR EXPERIENCIA PROFESIONAL
SELECT *
FROM PERSONA
WHERE experiencia_profesional LIKE '%investigador%';

-- AUTORES POR GRADO ACADEMICO
SELECT *
FROM PERSONA
WHERE grado_academico = 'Doctorado';
