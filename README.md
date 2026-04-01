# 📚 Sistema Bibliográfico - Base de Datos

<p align="center">
  <img src="https://img.shields.io/badge/SQL%20Server-2022-blue?style=for-the-badge&logo=microsoftsqlserver">
  <img src="https://img.shields.io/badge/MySQL-Workbench-orange?style=for-the-badge&logo=mysql">
  <img src="https://img.shields.io/badge/Database-Design-success?style=for-the-badge">
  <img src="https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge">
</p>

---

## 📌 Descripción

Este proyecto consiste en el diseño e implementación de un sistema de gestión bibliográfica orientado a un grupo de investigación.

Incluye el modelado completo de la base de datos desde el nivel conceptual hasta el lógico, permitiendo gestionar artículos científicos, autores, palabras clave, temas y tipos de publicación.

---

## 🎯 Objetivos

- Diseñar un modelo Entidad-Relación coherente y sin redundancias
- Transformar el modelo a un esquema relacional normalizado
- Implementar la base de datos en SQL Server
- Aplicar restricciones de integridad y reglas de negocio
- Desarrollar procedimientos almacenados para consultas complejas

---

## 🧱 Tecnologías Utilizadas

- 🗄️ SQL Server 2022
- 🐬 MySQL Workbench
- 🧰 Git & GitHub
- 📊 Diagramas ER (Dia)

---

## 🗂️ Estructura Del Proyecto

```bash
📦 sistema-bibliografico-bd
 ┣ 📂 docs
 ┃ ┣ 📄 sistema_bibliografico.docx
 ┃ ┗ 📄 sistema_bibliografico.pdf
 ┣ 📂 diagrams
 ┃ ┣ 🖼️ modelo_er.png
 ┃ ┣ 🖼️ modelo_relacional.png
 ┃ ┣ 📄 modelo_er.dia
 ┃ ┗ 📄 modelo_relacional.dia
 ┣ 📂 sql
 ┃ ┣ 📂 sqlserver
 ┃ ┃ ┣ 📄 01_CreateDatabase+Tables+Constraints.sql
 ┃ ┃ ┣ 📄 02_Triggers.sql
 ┃ ┃ ┣ 📄 03_Inserts.sql
 ┃ ┃ ┣ 📄 04_Procedures.sql
 ┃ ┃ ┗ 📄 05_Exec_Procedures.sql
 ┃ ┗ 📂 mysql
 ┃   ┗ 📄 script_completo.sql
 ┣ 📂 images
 ┃ ┣ 🖼️ fig1_er.png
 ┃ ┣ 🖼️ fig2_relacional.png
 ┃ ┗ 🖼️ fig_queries.png
 ┗ 📂 extras
   ┗ 📄 notas.txt

🧠 Modelo De Datos

El sistema se basa en una entidad central Articulo, relacionada con:

👤 Persona (autores)
🏷️ PalabraClave
🧠 Tema
📍 Ubicacion

🔷 Especialización (ISA disjunta)

📄 InformeTecnico
🎤 Congreso
📚 Revista

---

## 🖼️ Diagramas

### 🔹 Modelo Entidad-Relación
![Modelo ER](SystemaBibliografia.png)

### 🔹 Modelo Relacional
![Modelo Relacional](RelacionalSystemaBibliografia.png)

---

⚙️ Implementación SQL Server

Los scripts están organizados de forma modular:

1.     🧱 Creación de base de datos
2.     🏗️ Creación de tablas
3.     🔐 Restricciones
4.     ⚡ Triggers
5.     📥 Inserción de datos
6.     🧠 Procedimientos almacenados
7.     ▶️ Ejecución de consultas

---

🔐 Reglas De Negocio Implementadas
✔ Un artículo debe tener al menos un autor
✔ Un artículo puede tener múltiples palabras clave
✔ Un artículo pertenece a un único tipo de publicación
✔ Si está disponible → debe tener ubicación
✔ Especialización disjunta mediante triggers

---

🔎 Consultas Implementadas

El sistema permite:

🔍 Artículos por autor
🧠 Artículos por tema
🏷️ Artículos por palabras clave
📊 Artículos por tipo de publicación
🌎 Consultas avanzadas con múltiples criterios
---

▶️ Ejecución Del Proyecto

Ejecutar en SQL Server en el siguiente orden:

1. Ejecutar scripts en orden:
   - `01_CreateDatabase+Tables+Constrints.sql`
   - `02_triggers.sql`
   - `03_inserts.sql`
   - `04_procedures.sql`
   - `05_exec_procedures.sql`

2. Verificar resultados en SQL Server Management Studio.

---

📊 Resultados

El sistema permite gestionar información bibliográfica de manera eficiente, garantizando:

✔ Integridad
✔ Consistencia
✔ Escalabilidad
✔ Alto rendimiento en consultas

---

## 👨‍💻 Autor

**Stevenson CR**

---

## 📌 Observaciones

Este proyecto fue desarrollado con fines académicos, aplicando buenas prácticas de diseño de bases de datos y estándares profesionales.

```
