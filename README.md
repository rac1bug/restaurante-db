# 🍽️ Base de Datos Profesional para Restaurante - MySQL

Repositorio con el diseño completo de una base de datos relacional pensada para la gestión integral de un restaurante de tamaño medio. Implementada con **buenas prácticas SQL**, **UUIDs (CHAR(36))** como identificadores y soporte para automatizaciones y reportes avanzados.

---

## 📦 Estructura del proyecto

Este repositorio contiene:

- `estructura.sql` → Creación de tablas y relaciones
- `vistas.sql` → Vistas para reportes y consultas complejas
- `triggers.sql` → Triggers para auditoría y control automático
- `procedures.sql` → Procedimientos almacenados para lógica transaccional
- `datos_ejemplo.sql` → Datos de prueba (opcional)
- `diagrama-logico.png/pdf` → Diagrama lógico de la base de datos
- `README.md` → Documentación del proyecto

---

## 🧩 Módulos incluidos

- **Productos y Categorías**  
- **Pedidos y Detalles**  
- **Mesas y Estados de Pedido**  
- **Formas de Pago y Facturación**  
- **Clientes y Consumo**  
- **Usuarios, Roles y Registro de actividad**
- **Turnos (Entradas/Salidas del personal)**

---

## 🧠 Características Técnicas

- Claves primarias con `UUID` (`CHAR(36)`) para escalabilidad
- Diseño normalizado (3FN) para evitar redundancias
- Relaciones bien definidas con claves foráneas
- Vistas para reportes de ventas, consumo y productividad
- Triggers para registro automático en bitácora
- Procedimientos almacenados para tareas críticas
- Soporte multiforma de pago y múltiples estados de pedido
- Registro de acceso con IP y navegador

---

## 🚀 Cómo utilizar

1. Clona el repositorio:
   ```bash
   git clone https://github.com/tuusuario/restaurante-db.git
   cd restaurante-db
