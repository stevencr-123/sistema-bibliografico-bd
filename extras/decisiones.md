# 🧠 Decisiones de Diseño

## 📌 Minimización de Entidades

Se realizó un proceso de análisis para evitar redundancias en el modelo, consolidando entidades cuando fue necesario. Se unificaron conceptos similares como autores e investigadores en la entidad **Persona**.

---

## 📌 Uso de Especialización (ISA)

Se implementó una especialización disjunta donde:

- Articulo → InformeTecnico
- Articulo → Congreso
- Articulo → Revista

Esto permite representar correctamente los distintos tipos de publicación sin duplicar información.

---

## 📌 Eliminación de Redundancias

No se estableció relación directa entre Revista y Tema, ya que:

- Articulo ya se relaciona con Tema
- Revista es una especialización de Articulo

Esto evita duplicidad de datos.

---

## 📌 Normalización

El modelo fue llevado hasta **Tercera Forma Normal (3FN)**:

- Eliminación de dependencias parciales
- Eliminación de dependencias transitivas
- Uso de tablas intermedias para relaciones N:M

---

## 📌 Integridad de Datos

Se implementaron:

- Claves primarias y foráneas
- Restricciones CHECK
- Triggers para controlar la especialización disjunta

---

## 📌 Justificación del Modelo

El diseño permite:

- Flexibilidad en consultas
- Escalabilidad
- Integridad de la información
- Eliminación de redundancias