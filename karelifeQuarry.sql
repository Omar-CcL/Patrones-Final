IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'VeterinariaKarelife')
	BEGIN
		CREATE DATABASE VeterinariaKarelife
	END
GO

USE VeterinariaKarelife
GO

CREATE TABLE Especie(
	id int primary key,
	nombre varchar(50)
);
GO

CREATE TABLE Animal(
	id int primary key,
	nombre varchar(30),
	especie_id int,
	raza varchar(30),
	edad int,
	peso decimal(10, 2),
	color varchar(30),

	FOREIGN KEY (especie_id) REFERENCES Especie (id)
);
GO

CREATE TABLE Cuidados(
	id int primary key,
	animal_id int,
	alimentacion text,
	ejercicio text,
	aseo text,
	salud text,

	FOREIGN KEY (animal_id) REFERENCES Animal (id)
);
GO

CREATE TABLE Enfermedades(
	id int primary key,
	nombre varchar(30)
);
GO

CREATE TABLE EnfermedadesDetalle(
	id int primary key,
	enfermedad_id int,
	especie_id int,
	sintomas text,
	tratamiento text,
	prevencion text,

	FOREIGN KEY (enfermedad_id) REFERENCES Enfermedades (id),
	FOREIGN KEY (especie_id) REFERENCES Especie (id)
);
GO

CREATE TABLE Duenios(
	id  int primary key,
	nombre varchar(30),
	direccion varchar(50),
	telefono int,
	email varchar(50)
);
GO

CREATE TABLE Adopciones(
	id int primary key,
	animal_id int,
	fecha_adopcion date,
	duenio_id int,

	FOREIGN KEY (animal_id) REFERENCES Animal (id),
	FOREIGN KEY (duenio_id) REFERENCES Duenios (id)
);
GO

CREATE TABLE Consejos(
	id int primary key,
	tema varchar(30),
	descripcion text,
	especie_id int,
	enfermedad_detalle_id int,

	FOREIGN KEY (especie_id) REFERENCES Especie (id),
	FOREIGN KEY (enfermedad_detalle_id) REFERENCES EnfermedadesDetalle (id)
);
GO

CREATE PROCEDURE ConsejosSP(
    @accion CHAR(1),
    @id INT,
    @tema VARCHAR(30),
    @descripcion TEXT,
    @especie_id INT,
    @enfermedad_detalle_id INT
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @accion = 'I' -- Insert
    BEGIN
        INSERT INTO [dbo].[Consejos]
            ([tema], [descripcion], [especie_id], [enfermedad_detalle_id])
        VALUES
            (@tema, @descripcion, @especie_id, @enfermedad_detalle_id);
    END

    IF @accion = 'S' -- Select
    BEGIN
        SELECT [id], [tema], [descripcion], [especie_id], [enfermedad_detalle_id]
        FROM [dbo].[Consejos];
    END

    IF @accion = 'U' -- Update
    BEGIN
        UPDATE [dbo].[Consejos]
        SET 
            [tema] = @tema,
            [descripcion] = @descripcion,
            [especie_id] = @especie_id,
            [enfermedad_detalle_id] = @enfermedad_detalle_id
        WHERE [id] = @id;
    END
END
GO

CREATE PROCEDURE EspecieSP(
    @accion CHAR(1),
    @id INT,
    @nombre VARCHAR(50)
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @accion = 'I' -- Insert
    BEGIN
        INSERT INTO [dbo].[Especie] ([nombre])
        VALUES (@nombre);
    END

    IF @accion = 'S' -- Select
    BEGIN
        SELECT [id], [nombre] FROM [dbo].[Especie];
    END

    IF @accion = 'U' -- Update
    BEGIN
        UPDATE [dbo].[Especie]
        SET [nombre] = @nombre
        WHERE [id] = @id;
    END

    IF @accion = 'D' -- Delete
    BEGIN
        DELETE FROM [dbo].[Especie] WHERE [id] = @id;
    END
END
GO

CREATE PROCEDURE AnimalSP(
    @accion CHAR(1),
    @id INT,
    @nombre VARCHAR(30),
    @especie_id INT,
    @raza VARCHAR(30),
    @edad INT,
    @peso DECIMAL(10, 2),
    @color VARCHAR(30)
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @accion = 'I' -- Insert
    BEGIN
        INSERT INTO [dbo].[Animal] ([nombre], [especie_id], [raza], [edad], [peso], [color])
        VALUES (@nombre, @especie_id, @raza, @edad, @peso, @color);
    END

    IF @accion = 'S' -- Select
    BEGIN
        SELECT [id], [nombre], [especie_id], [raza], [edad], [peso], [color] FROM [dbo].[Animal];
    END

    IF @accion = 'U' -- Update
    BEGIN
        UPDATE [dbo].[Animal]
        SET 
            [nombre] = @nombre,
            [especie_id] = @especie_id,
            [raza] = @raza,
            [edad] = @edad,
            [peso] = @peso,
            [color] = @color
        WHERE [id] = @id;
    END

    IF @accion = 'D' -- Delete
    BEGIN
        DELETE FROM [dbo].[Animal] WHERE [id] = @id;
    END
END
GO

CREATE PROCEDURE CuidadosSP(
    @accion CHAR(1),
    @id INT,
    @animal_id INT,
    @alimentacion TEXT,
    @ejercicio TEXT,
    @aseo TEXT,
    @salud TEXT
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @accion = 'I' -- Insert
    BEGIN
        INSERT INTO [dbo].[Cuidados] ([animal_id], [alimentacion], [ejercicio], [aseo], [salud])
        VALUES (@animal_id, @alimentacion, @ejercicio, @aseo, @salud);
    END

    IF @accion = 'S' -- Select
    BEGIN
        SELECT [id], [animal_id], [alimentacion], [ejercicio], [aseo], [salud] FROM [dbo].[Cuidados];
    END

    IF @accion = 'U' -- Update
    BEGIN
        UPDATE [dbo].[Cuidados]
        SET 
            [animal_id] = @animal_id,
            [alimentacion] = @alimentacion,
            [ejercicio] = @ejercicio,
            [aseo] = @aseo,
            [salud] = @salud
        WHERE [id] = @id;
    END

    IF @accion = 'D' -- Delete
    BEGIN
        DELETE FROM [dbo].[Cuidados] WHERE [id] = @id;
    END
END
GO

CREATE PROCEDURE EnfermedadesSP(
    @accion CHAR(1),
    @id INT,
    @nombre VARCHAR(30)
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @accion = 'I' -- Insert
    BEGIN
        INSERT INTO [dbo].[Enfermedades] ([nombre])
        VALUES (@nombre);
    END

    IF @accion = 'S' -- Select
    BEGIN
        SELECT [id], [nombre] FROM [dbo].[Enfermedades];
    END

    IF @accion = 'U' -- Update
    BEGIN
        UPDATE [dbo].[Enfermedades]
        SET [nombre] = @nombre
        WHERE [id] = @id;
    END

    IF @accion = 'D' -- Delete
    BEGIN
        DELETE FROM [dbo].[Enfermedades] WHERE [id] = @id;
    END
END
GO

CREATE PROCEDURE EnfermedadesDetalleSP(
    @accion CHAR(1),
    @id INT,
    @enfermedad_id INT,
    @especie_id INT,
    @sintomas TEXT,
    @tratamiento TEXT,
    @prevencion TEXT
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @accion = 'I' -- Insert
    BEGIN
        INSERT INTO [dbo].[EnfermedadesDetalle] ([enfermedad_id], [especie_id], [sintomas], [tratamiento], [prevencion])
        VALUES (@enfermedad_id, @especie_id, @sintomas, @tratamiento, @prevencion);
    END

    IF @accion = 'S' -- Select
    BEGIN
        SELECT [id], [enfermedad_id], [especie_id], [sintomas], [tratamiento], [prevencion] FROM [dbo].[EnfermedadesDetalle];
    END

    IF @accion = 'U' -- Update
    BEGIN
        UPDATE [dbo].[EnfermedadesDetalle]
        SET 
            [enfermedad_id] = @enfermedad_id,
            [especie_id] = @especie_id,
            [sintomas] = @sintomas,
            [tratamiento] = @tratamiento,
            [prevencion] = @prevencion
        WHERE [id] = @id;
    END

    IF @accion = 'D' -- Delete
    BEGIN
        DELETE FROM [dbo].[EnfermedadesDetalle] WHERE [id] = @id;
    END
END
GO

CREATE PROCEDURE DueniosSP(
    @accion CHAR(1),
    @id INT,
    @nombre VARCHAR(30),
    @direccion VARCHAR(50),
    @telefono INT,
    @email VARCHAR(50)
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @accion = 'I' -- Insert
    BEGIN
        INSERT INTO [dbo].[Duenios] ([nombre], [direccion], [telefono], [email])
        VALUES (@nombre, @direccion, @telefono, @email);
    END

    IF @accion = 'S' -- Select
    BEGIN
        SELECT [id], [nombre], [direccion], [telefono], [email] FROM [dbo].[Duenios];
    END

    IF @accion = 'U' -- Update
    BEGIN
        UPDATE [dbo].[Duenios]
        SET 
            [nombre] = @nombre,
            [direccion] = @direccion,
            [telefono] = @telefono,
            [email] = @email
        WHERE [id] = @id;
    END

    IF @accion = 'D' -- Delete
    BEGIN
        DELETE FROM [dbo].[Duenios] WHERE [id] = @id;
    END
END
GO

CREATE PROCEDURE AdopcionesSP(
    @accion CHAR(1),
    @id INT,
    @animal_id INT,
    @fecha_adopcion DATE,
    @duenio_id INT
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @accion = 'I' -- Insert
    BEGIN
        INSERT INTO [dbo].[Adopciones] ([animal_id], [fecha_adopcion], [duenio_id])
        VALUES (@animal_id, @fecha_adopcion, @duenio_id);
    END

    IF @accion = 'S' -- Select
    BEGIN
        SELECT [id], [animal_id], [fecha_adopcion], [duenio_id] FROM [dbo].[Adopciones];
    END

    IF @accion = 'U' -- Update
    BEGIN
        UPDATE [dbo].[Adopciones]
        SET 
            [animal_id] = @animal_id,
            [fecha_adopcion] = @fecha_adopcion,
            [duenio_id] = @duenio_id
        WHERE [id] = @id;
    END

    IF @accion = 'D' -- Delete
    BEGIN
        DELETE FROM [dbo].[Adopciones] WHERE [id] = @id;
    END
END
GO

-- Insertar datos en la tabla Especie
INSERT INTO Especie (id, nombre)
VALUES 
    (1, 'Perro'),
    (2, 'Gato'),
    (3, 'Conejo');
GO
-- Insertar datos en la tabla Enfermedades
INSERT INTO Enfermedades (id, nombre)
VALUES 
    (1, 'Parvovirus'),
    (2, 'Gusanos Intestinales'),
    (3, 'Obesidad'),
    (4, 'Leucemia Felina'),
    (5, 'Infección Respiratoria');
GO

-- Insertar datos en la tabla EnfermedadesDetalle
INSERT INTO EnfermedadesDetalle (id, enfermedad_id, especie_id, sintomas, tratamiento, prevencion)
VALUES 
    (1, 1, 1, 'Vómitos, diarrea, letargo', 'Tratamiento sintomático y soporte', 'Vacunación'),
    (2, 2, 1, 'Pérdida de peso, diarrea', 'Desparasitantes', 'Desparasitaciones regulares'),
    (3, 3, 1, 'Falta de energía, aumento de peso', 'Dieta controlada', 'Ejercicio regular'),
    (4, 4, 2, 'Pérdida de peso, anemia', 'Tratamiento veterinario', 'Vacunación'),
    (5, 5, 2, 'Estornudos, secreción nasal', 'Antibióticos', 'Vacunación y control ambiental');
GO

-- Insertar datos en la tabla Animal
INSERT INTO Animal (id, nombre, especie_id, raza, edad, peso, color)
VALUES 
    (1, 'Fido', 1, 'Labrador', 3, 25.50, 'Marrón'),
    (2, 'Mimi', 2, 'Persa', 2, 4.00, 'Blanco'),
    (3, 'Bunny', 3, 'Holandés', 1, 1.50, 'Gris');
GO

-- Insertar datos en la tabla Cuidados
INSERT INTO Cuidados (id, animal_id, alimentacion, ejercicio, aseo, salud)
VALUES 
    (1, 1, 'Croquetas balanceadas', '1 hora de juego diario', 'Baño mensual', 'Chequeo anual'),
    (2, 2, 'Comida seca y húmeda', '30 minutos de juego diario', 'Cepillado semanal', 'Chequeo semestral'),
    (3, 3, 'Heno y pellets', '1 hora de ejercicio diario', 'Limpieza semanal', 'Chequeo mensual');
GO

-- Insertar datos en la tabla Duenios
INSERT INTO Duenios (id, nombre, direccion, telefono, email)
VALUES 
    (1, 'Carlos Pérez', 'Calle Falsa 123', 123456789, 'carlos@example.com'),
    (2, 'Laura Gómez', 'Avenida Siempre Viva 456', 987654321, 'laura@example.com');
GO

-- Insertar datos en la tabla Adopciones
INSERT INTO Adopciones (id, animal_id, fecha_adopcion, duenio_id)
VALUES 
    (1, 1, '2023-01-15', 1),
    (2, 2, '2023-03-20', 2);
GO
-- Insertar datos en la tabla Consejos
INSERT INTO Consejos (id, tema, descripcion, especie_id, enfermedad_detalle_id)
VALUES 
    (1, 'Vacunación', 'Es importante vacunar a las mascotas para prevenir enfermedades.', 1, 1),
    (2, 'Desparasitación', 'Realizar desparasitaciones periódicas es esencial para la salud.', 1, 2),
    (3, 'Alimentación', 'Proveer una dieta balanceada ayuda a mantener a su mascota saludable.', 1, 3),
    (4, 'Chequeos', 'Los chequeos regulares pueden detectar problemas de salud a tiempo.', 2, 4);
GO