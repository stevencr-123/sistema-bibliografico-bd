# ⚠️ Errores Detectados y Solucionados

## ❌ Redundancia en entidades

Inicialmente se duplicó la entidad Articulo en diferentes contextos.

✔ Solución: Se centralizó como entidad principal.

---

## ❌ Relaciones innecesarias

Se planteó relación entre Revista y Tema.

✔ Solución: Eliminada por redundancia.

---

## ❌ Mala aplicación de especialización

Se trataban las subclases como entidades independientes.

✔ Solución: Se implementó correctamente la relación ISA.

---

## ❌ Problemas en triggers

Se generaban errores por duplicidad en inserciones.

✔ Solución: Se ajustaron validaciones y lógica.

---

## ❌ Inconsistencias en modelo relacional

Errores en claves y relaciones.

✔ Solución: Revisión completa y normalización.