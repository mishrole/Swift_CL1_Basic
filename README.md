# CL1 - Cibertec

> Aplicación básica en Swift

## Tabla de Contenido

* [Ejercicio 1](#ejercicio-1)
* [Ejercicio 2](#ejercicio-2)
* [Tecnologías](#tecnologias)

## Ejercicio 1

La empresa “Ciber Cursos SAC” empresa especializada en venta de cursos e learning se encuentra en 
proceso de ventas online de los cursos promocionando el mismo por ello ha visto la necesidad de crear 
una aplicación móvil para los alumnos interesados puedan comprar los cursos y así puedan agilizar la 
afiliación de prospectos de clientes para ello se ha considerado los siguientes cursos cuyo costo son:

| Código | Curso | Costo Curso | Costo Libro | Descuento Curso
:---: | :---: | :---: | :---: | :---:
| I60 | Flutter | 229 | 20.00 | 25%
| I20 | Android | 100 | 20.00 | 5%
| I40 | iOS | 180 | 30.00 | 10%

La promoción aplica solo en el mes de abril por ello se debe considerar las condiciones de descuento 
de promoción y costo de instalación según la tabla anterior.

Para registrar a un cliente “Ciber Cursos SAC” solicita los siguientes datos como mínimo:
* Nombres completos del cliente
* Número de documento de identidad
* Servicio por el cual se encuentra interesado

Los precios de los cursos se deben mostrar en pantalla.

## Ejercicio 2

Crear una clase llamada MenuOffice con los campos:

* Menu
* Precio
* Cantidad
* Total
* Delivery (Bool)
* Descuento
* Pago Total

Considerar el campo delivery ( Boolean ) con un costo de 7 soles.

* Total= Precio * Cantidad
* Descuento = si el total es mayor a 40 soles 5% descuento
* Pago Total = ( Total + Delivery ) – Descuento

## Tecnologías

* **Swift**
* **xCode**
