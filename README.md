
# Pharmacy Software

**Pharmacy Software** es una aplicación de escritorio desarrollada en Java para la gestión eficiente de farmacias. Permite administrar inventario, ventas, productos y operaciones diarias, facilitando el control y la organización del negocio farmacéutico.

## Características Principales

- Gestión de inventario: alta, baja y modificación de productos y medicamentos.
- Registro y control de ventas.
- Búsqueda de productos por nombre, código u otros criterios.
- Gestión de usuarios con diferentes niveles de acceso.
- Generación de reportes básicos de productos y ventas.

## Tecnologías Utilizadas

- ![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=java&logoColor=white)  
- ![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)  
- **NetBeans IDE**

## Instalación y Ejecución

1. **Clona el repositorio:**
   ```bash
   git clone https://github.com/Jdcarsa/Pharmacy-Software.git
   ```
2. **Configura la base de datos MySQL:**
   - Crea una base de datos nueva para el sistema.
   - Importa el archivo SQL si está disponible (`/database/` o consulta el proyecto).
   - Configura los parámetros de conexión en la clase de conexión Java (ejemplo: `Conexion.java`).

3. **Abre el proyecto en NetBeans:**
   - Ve a **Archivo > Abrir Proyecto** y selecciona la carpeta clonada.
   - Agrega el conector JDBC de MySQL a las librerías del proyecto si es necesario.

4. **Compila y ejecuta la aplicación:**
   - Haz clic en "Run" o presiona `F6`.

## Uso Básico

- Inicia sesión con tu usuario.
- Agrega, edita o elimina productos desde el panel principal.
- Realiza ventas y consulta reportes de inventario y movimientos.

## Roadmap / Próximas Funcionalidades

- [ ] Notificaciones automáticas por bajo stock.
- [ ] Exportación de reportes a PDF.
- [ ] Mejoras en la interfaz de usuario.

## Licencia

Distribuido bajo la Licencia MIT. Consulta el archivo `LICENSE` para más información.
```
