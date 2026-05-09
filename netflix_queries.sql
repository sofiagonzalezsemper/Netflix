/*====================================================
    1️⃣ Crear Base de Datos
====================================================*/
IF DB_ID('VentasDW') IS NOT NULL
    DROP DATABASE VentasDW;
GO

CREATE DATABASE VentasDW;
GO

USE VentasDW;
GO

/*====================================================
    2️⃣ Tablas Dimensión
====================================================*/

-- DimFecha
CREATE TABLE DimFecha (
    FechaKey INT PRIMARY KEY, -- formato YYYYMMDD
    Fecha DATE NOT NULL,
    Dia INT,
    Mes INT,
    NombreMes VARCHAR(20),
    Trimestre INT,
    Anio INT
);

-- DimCategoria
CREATE TABLE DimCategoria (
    CategoriaKey INT IDENTITY(1,1) PRIMARY KEY,
    NombreCategoria VARCHAR(50)
);

-- DimProducto
CREATE TABLE DimProducto (
    ProductoKey INT IDENTITY(1,1) PRIMARY KEY,
    NombreProducto VARCHAR(100),
    CategoriaKey INT,
    Precio DECIMAL(10,2),
    FOREIGN KEY (CategoriaKey) REFERENCES DimCategoria(CategoriaKey)
);

-- DimRegion
CREATE TABLE DimRegion (
    RegionKey INT IDENTITY(1,1) PRIMARY KEY,
    NombreRegion VARCHAR(50)
);

/*====================================================
    3️⃣ Tabla de Hechos
====================================================*/

CREATE TABLE FactVentas (
    VentaKey INT IDENTITY(1,1) PRIMARY KEY,
    FechaKey INT,
    ProductoKey INT,
    RegionKey INT,
    Cantidad INT,
    TotalVenta DECIMAL(12,2),
    FOREIGN KEY (FechaKey) REFERENCES DimFecha(FechaKey),
    FOREIGN KEY (ProductoKey) REFERENCES DimProducto(ProductoKey),
    FOREIGN KEY (RegionKey) REFERENCES DimRegion(RegionKey)
);

/*====================================================
    4️⃣ Insertar Dimensiones
====================================================*/

-- Categorías
INSERT INTO DimCategoria (NombreCategoria) VALUES
('Electrónica'),
('Hogar'),
('Ropa'),
('Deportes');

-- Productos
INSERT INTO DimProducto (NombreProducto, CategoriaKey, Precio) VALUES
('Laptop', 1, 1200),
('Auriculares', 1, 150),
('Microondas', 2, 300),
('Sofá', 2, 800),
('Campera', 3, 120),
('Zapatillas', 3, 90),
('Bicicleta', 4, 700),
('Pelota', 4, 40);

-- Regiones
INSERT INTO DimRegion (NombreRegion) VALUES
('Norte'),
('Sur'),
('Este'),
('Oeste');

/*====================================================
    5️⃣ Generar 3 meses de fechas (Ene-Mar 2025)
====================================================*/

DECLARE @FechaInicio DATE = '2025-01-01';
DECLARE @FechaFin DATE = '2025-03-31';

WHILE @FechaInicio <= @FechaFin
BEGIN
    INSERT INTO DimFecha
    VALUES (
        CONVERT(INT, FORMAT(@FechaInicio, 'yyyyMMdd')),
        @FechaInicio,
        DAY(@FechaInicio),
        MONTH(@FechaInicio),
        DATENAME(MONTH, @FechaInicio),
        DATEPART(QUARTER, @FechaInicio),
        YEAR(@FechaInicio)
    );

    SET @FechaInicio = DATEADD(DAY, 1, @FechaInicio);
END

/*====================================================
    6️⃣ Generar Ventas Aleatorias
====================================================*/

INSERT INTO FactVentas (FechaKey, ProductoKey, RegionKey, Cantidad, TotalVenta)
SELECT 
    F.FechaKey,
    P.ProductoKey,
    R.RegionKey,
    Cantidad = ABS(CHECKSUM(NEWID()) % 5) + 1,
    TotalVenta = (ABS(CHECKSUM(NEWID()) % 5) + 1) * P.Precio
FROM DimFecha F
CROSS JOIN DimProducto P
CROSS JOIN DimRegion R
WHERE ABS(CHECKSUM(NEWID()) % 4) = 1; -- no todos los días venden todo

PRINT 'Base de datos creada correctamente';
