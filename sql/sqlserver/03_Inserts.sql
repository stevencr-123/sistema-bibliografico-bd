INSERT INTO UBICACION (lugar, descripcion) VALUES
('Despacho','A1'),
('Laboratorio','L1'),
('Despacho','A2'),
('Laboratorio','L2'),
('Despacho','A3'),
('Laboratorio','L3'),
('Despacho','A4'),
('Laboratorio','L4'),
('Despacho','A5'),
('Laboratorio','L5');
GO

INSERT INTO PERSONA 
(nombre, email, centro_trabajo, afiliacion_universitaria, pais, grado_academico, experiencia_profesional) 
VALUES
('Juan', 'juan@mail.com', 'Uni Cartagena', 'Universidad de Cartagena', 'Colombia', 'Doctorado', 'Investigador en inteligencia artificial'),
('Ana', 'ana@mail.com', 'Uni UNAM', 'UNAM', 'México', 'Maestría', 'Especialista en análisis de datos'),
('Luis', 'luis@mail.com', 'Uni Madrid', 'Universidad Complutense', 'España', 'Doctorado', 'Investigador en blockchain'),
('Sofia', 'sofia@mail.com', 'Uni Chile', 'Universidad de Chile', 'Chile', 'Ingeniería', 'Desarrolladora IoT'),
('Carlos', 'carlos@mail.com', 'Uni Lima', 'PUCP', 'Perú', 'Maestría', 'Analista de datos'),
('Maria', 'maria@mail.com', 'Uni Buenos Aires', 'UBA', 'Argentina', 'Doctorado', 'Experta en machine learning'),
('Pedro', 'pedro@mail.com', 'Uni Cartagena', 'Universidad de Cartagena', 'Colombia', 'Ingeniería', 'Desarrollador backend'),
('Laura', 'laura@mail.com', 'Uni Sao Paulo', 'USP', 'Brasil', 'Maestría', 'Especialista en cloud computing'),
('Diego', 'diego@mail.com', 'Uni Quito', 'Escuela Politécnica', 'Ecuador', 'Ingeniería', 'Especialista en seguridad informática'),
('Elena', 'elena@mail.com', 'Uni Montevideo', 'Universidad de la República', 'Uruguay', 'Doctorado', 'Investigadora en computación cuántica');
GO

INSERT INTO ARTICULO 
(titulo, email_contacto, disponible, resumen, fecha_publicacion, id_ubicacion) 
VALUES
('IA en medicina', 'a1@mail.com', 1, 'Aplicación de IA en diagnóstico clínico', '2022-01-01', 1),
('Big Data', 'a2@mail.com', 1, 'Análisis de grandes volúmenes de datos', '2021-05-10', 2),
('Blockchain', 'a3@mail.com', 0, 'Tecnología de cadena de bloques', '2020-03-15', 3),
('IoT', 'a4@mail.com', 1, 'Internet de las cosas aplicado a hogares inteligentes', '2023-07-20', 4),
('ML', 'a5@mail.com', 1, 'Algoritmos de machine learning', '2022-11-11', 5),
('DL', 'a6@mail.com', 0, 'Redes neuronales profundas', '2021-09-09', 6),
('Cloud', 'a7@mail.com', 1, 'Computación en la nube moderna', '2020-06-06', 7),
('Seguridad', 'a8@mail.com', 1, 'Ciberseguridad en sistemas distribuidos', '2023-02-02', 8),
('Robótica', 'a9@mail.com', 0, 'Automatización mediante robots', '2022-08-08', 9),
('Quantum', 'a10@mail.com', 1, 'Computación cuántica avanzada', '2024-01-01', 10);
GO

INSERT INTO INFORME_TECNICO 
(id_articulo, numero_identificacion, centro_publicacion, mes_publicacion, anio_publicacion)
VALUES
(1, 1001, 'Universidad de Cartagena', 1, 2022),
(2, 1002, 'Universidad de los Andes', 5, 2021),
(3, 1003, 'Universidad Nacional', 3, 2020);
GO

INSERT INTO CONGRESO 
(id_articulo, nombre, edicion, ciudad, tipo, frecuencia, pais, anio_primera_edicion, fecha_inicio, fecha_fin)
VALUES
(4, 'TechConf', '10', 'Bogotá', 'Nacional', 'Anual', 'Colombia', 2010, '2023-01-01', '2023-01-05'),
(5, 'AI Summit', '5', 'Madrid', 'Internacional', 'Anual', 'España', 2015, '2022-06-01', '2022-06-03'),
(6, 'DataConf', '8', 'Ciudad de México', 'Internacional', 'Semestral', 'México', 2012, '2021-09-10', '2021-09-12');
GO

INSERT INTO REVISTA 
(id_articulo, nombre, editor, anio_inicio_publicacion, frecuencia, numero_revista, pagina_inicio, pagina_fin, area_tematica, anio_publicacion)
VALUES
(7, 'Science AI', 'Elsevier', 2000, 'Mensual', 12, 1, 20, 'IA', 2023),
(8, 'Data Journal', 'Springer', 1995, 'Trimestral', 45, 21, 40, 'Big Data', 2022),
(9, 'Tech Review', 'IEEE', 2010, 'Mensual', 78, 5, 30, 'Tecnología', 2021),
(10, 'Quantum Mag', 'Nature', 2018, 'Mensual', 5, 1, 15, 'Quantum', 2024);
GO