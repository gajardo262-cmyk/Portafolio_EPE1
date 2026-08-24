
CREATE DATABASE PortafolioDB;


USE PortafolioDB;



CREATE TABLE proyectos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(150) NOT NULL,
    descripcion NVARCHAR(600) NOT NULL,
    tecnologias NVARCHAR(250) NOT NULL
);



INSERT INTO proyectos (
    nombre,
    descripcion,
    tecnologias
)
VALUES
(
    N'Sistema de Gestión y Simulación de Remuneraciones',
    N'Aplicación web desarrollada para gestionar funcionarios, liquidaciones y simulaciones de remuneraciones.',
    N'React · Vite · Redux · JavaScript'
),
(
    N'Aplicación de Realidad Aumentada',
    N'Aplicación móvil desarrollada para visualizar información digital mediante marcadores de realidad aumentada.',
    N'Unity · Vuforia · C#'
),
(
    N'Sistema de Gestión de Ventas',
    N'Aplicación de escritorio desarrollada para gestionar ventas, clientes, productos y sucursales.',
    N'C# · Windows Forms · SQL Server'
),
(
    N'Base de Datos Hospital Regional',
    N'Diseño de una base de datos hospitalaria incluyendo modelado y estrategias de respaldo.',
    N'SQL Server · Base de Datos · Respaldos'
);



CREATE TABLE mensajes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(120) NOT NULL,
    correo NVARCHAR(180) NOT NULL,
    asunto NVARCHAR(200) NOT NULL,
    mensaje NVARCHAR(MAX) NOT NULL,
    fecha DATETIME2 NOT NULL DEFAULT SYSDATETIME()
);
