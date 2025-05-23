CREATE TABLE Estudiantes (
    IDEstudiante SERIAL PRIMARY KEY,
	
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Direccion VARCHAR(50),
    Ciudad VARCHAR(50),
    Email VARCHAR(50) UNIQUE
	
);

-- Tabla: Departamentos
CREATE TABLE Departamentos (
    IDDepartamento SERIAL PRIMARY KEY,
    NombreDepartamento VARCHAR(30) NOT NULL,
    Edificio VARCHAR(30)
);

-- Tabla: Profesores
CREATE TABLE Profesores (
    IDProfesor SERIAL PRIMARY KEY,
	IDDepartamento INT NOT NULL,
    Nombre_Profesor VARCHAR(25) NOT NULL,
    Apellido_Profesor VARCHAR(30) NOT NULL,
    Titulo VARCHAR(50),
	FOREIGN KEY (IDDepartamento) REFERENCES Departamentos (IDDepartamento)
 
);

-- Tabla: Cursos
CREATE TABLE Cursos (
    IDCurso SERIAL PRIMARY KEY,
	IDDepartamento INT NOT NULL,
    NombreCurso VARCHAR(30) NOT NULL,
    Descripcion VARCHAR (75),
    Creditos INTEGER,
    Semestre INT NOT NULL,
  	FOREIGN KEY (IDDepartamento) REFERENCES Departamentos (IDDepartamento)
);
-- Tabla: Inscripciones
CREATE TABLE Inscripciones (
    IDInscripcion SERIAL PRIMARY KEY,
    IDEstudiante INT  NOT NULL,
    IDCurso INT NOT NULL,
    FechaInscripcion DATE NOT NULL,
    Calificacion INT NOT NULL,
	FOREIGN KEY (IDEstudiante) REFERENCES Estudiantes(IDEstudiante),
	FOREIGN KEY (IDCurso) REFERENCES Cursos(IDCurso)
);

-- Tabla: Aulas
CREATE TABLE Aulas (
    IDAula SERIAL PRIMARY KEY,
    NombreAula VARCHAR(30) NOT NULL,
    Capacidad INT,
    Ubicacion VARCHAR(30)
);

-- Tabla Intermedia: ProgramasCursos


-- Tabla: Horarios
CREATE TABLE Horarios (
    IDHorario SERIAL PRIMARY KEY,
    IDCurso INT NOT NULL,
    IDAula INT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL,
    HoraInicio TIME NOT NULL,
    HoraFin TIME NOT NULL,
	FOREIGN KEY (IDCurso) REFERENCES Cursos(IDCurso),
	FOREIGN KEY (IDAula) REFERENCES Aulas(IDAula)
);


-- Tabla Intermedia: CursosProfesores
CREATE TABLE CursosProfesores (
    IDCursoProfesor SERIAL PRIMARY KEY,
    IDCurso INT NOT NULL,
    IDProfesor INT NOT NULL,
	FOREIGN KEY (IDCurso) REFERENCES Cursos(IDCurso),
	FOREIGN KEY (IDProfesor) REFERENCES Profesores(IDProfesor)
);
-- Tabla: ProgramasEstudio
CREATE TABLE ProgramasEstudio (
    IDPrograma SERIAL PRIMARY KEY,
    NombrePrograma VARCHAR(50) NOT NULL,
    DescripcionPrograma VARCHAR (75)
);

---------
CREATE TABLE ProgramasCursos (
    IDProgramaCurso SERIAL PRIMARY KEY,
    IDPrograma INT NOT NULL,
    IDCurso INT NOT NULL,
	FOREIGN KEY (IDPrograma) REFERENCES ProgramasEstudio(IDPrograma),
	FOREIGN KEY (IDCurso)REFERENCES Cursos(IDCurso)
);
-- Tabla Campus
CREATE TABLE Campus (
    IDCampus SERIAL PRIMARY KEY,
    NombreCampus VARCHAR(50) NOT NULL,
    DireccionCampus VARCHAR(80)
);

CREATE TABLE Carreras (
    IDCarrera SERIAL PRIMARY KEY,
    NombreCarrera VARCHAR(30) NOT NULL,
    TituloOtorgado VARCHAR(35) 
);

ALTER TABLE Estudiantes
ADD COLUMN IDCarrera INT;

ALTER TABLE Estudiantes
ADD CONSTRAINT FK_estudiante_carrera
FOREIGN KEY (IDCarrera) REFERENCES Carreras(IDCarrera)
ON DELETE SET NULL;

ALTER TABLE Cursos
ADD COLUMN IDCampus INT,
ADD CONSTRAINT fk_curso_campus
FOREIGN KEY (IDCampus) REFERENCES Campus(IDCampus)
ON DELETE SET NULL;

SELECT * FROM Profesores;
ALTER TABLE Profesores
ADD COLUMN Email VARCHAR(50) UNIQUE;

ALTER TABLE Estudiantes
DROP COLUMN Ciudad;


DROP TABLE Aulas CASCADE;
SELECT * FROM Aulas;

SELECT * FROM Horarios





INSERT INTO Departamentos (NombreDepartamento, Edificio) VALUES
('Ingeniería', 'Edificio A'),
('Ciencias Sociales', 'Edificio B'),
('Administración', 'Edificio C'),
('Matemáticas', 'Edificio D'),
('Química', 'Edificio E'),
('Física', 'Edificio F'),
('Biología', 'Edificio G'),
('Derecho', 'Edificio H'),
('Artes', 'Edificio I'),
('Historia', 'Edificio J'),
('Idiomas', 'Edificio K'),
('Economía', 'Edificio L'),
('Filosofía', 'Edificio M'),
('Educación', 'Edificio N');



INSERT INTO Campus (NombreCampus, DireccionCampus) VALUES
('Campus Central', 'Av. Universidad 123'),
('Campus Norte', 'Calle Técnica 456'),
('Campus Sur', 'Calle Sur 200'),
('Campus Este', 'Av. Oriente 300'),
('Campus Oeste', 'Bulevar Poniente 400'),
('Campus Virtual', 'https://virtual.universidad.edu'),
('Campus Internacional', 'Av. Global 500'),
('Campus Experimental', 'Zona Rural 1'),
('Campus Central II', 'Calle Reforma 110'),
('Campus Científico', 'Parque Científico 2'),
('Campus Empresarial', 'Av. Negocios 10'),
('Campus Salud', 'Av. Médica 100');

INSERT INTO Carreras (NombreCarrera, TituloOtorgado) VALUES
('Ingeniería en Sistemas', 'Ingeniero en Sistemas'),
('Psicología', 'Licenciado en Psicología'),
('Administración de Empresas', 'Licenciado en Administración'),
('Ingeniería Industrial', 'Ingeniero Industrial'),
('Química', 'Licenciado en Química'),
('Física', 'Licenciado en Física'),
('Biología', 'Licenciado en Biología'),
('Derecho', 'Licenciado en Derecho'),
('Artes Plásticas', 'Licenciado en Artes'),
('Historia', 'Licenciado en Historia'),
('Lenguas Modernas', 'Licenciado en Lenguas'),
('Economía', 'Licenciado en Economía'),
('Pedagogía', 'Licenciado en Educación');


INSERT INTO ProgramasEstudio (NombrePrograma, DescripcionPrograma) VALUES
('Programa de Ingeniería', 'Plan 2024 Ingeniería'),
('Programa de Psicología', 'Plan 2023 Psicología'),
('Programa de Química', 'Plan de estudios de Química'),
('Programa de Física', 'Plan de estudios de Física'),
('Programa de Biología', 'Plan de estudios de Biología'),
('Programa de Derecho', 'Plan de estudios de Derecho'),
('Programa de Artes', 'Plan de estudios de Artes'),
('Programa de Historia', 'Plan de estudios de Historia'),
('Programa de Lenguas', 'Plan de estudios de Lenguas'),
('Programa de Economía', 'Plan de estudios de Economía'),
('Programa de Filosofía', 'Plan de estudios de Filosofía'),
('Programa de Educación', 'Plan de estudios de Pedagogía');


INSERT INTO Profesores (IDDepartamento, Nombre_Profesor, Apellido_Profesor, Titulo, Email) VALUES
(1, 'Carlos', 'Ramírez', 'Dr. en Ciencias Computacionales', 'cramirez@uni.edu'),
(2, 'Ana', 'López', 'Mtra. en Psicología', 'alopez@uni.edu'),
(3, 'Jorge', 'Gómez', 'Lic. en Administración', 'jgomez@uni.edu'),
(4, 'Laura', 'Ruiz', 'Dra. en Matemáticas', 'lruiz@uni.edu'),
(5, 'Pablo', 'Mendoza', 'Mtro. en Física', 'pmendoza@uni.edu'),
(6, 'Diana', 'Silva', 'Mtra. en Química', 'dsilva@uni.edu'),
(7, 'Raúl', 'Fernández', 'Lic. en Derecho', 'rfernandez@uni.edu'),
(8, 'Claudia', 'Herrera', 'Mtra. en Historia del Arte', 'cherrera@uni.edu'),
(9, 'Sergio', 'Cano', 'Lic. en Historia', 'scano@uni.edu'),
(10, 'Beatriz', 'Nava', 'Mtra. en Lingüística', 'bnava@uni.edu'),
(11, 'Tomás', 'Reyes', 'Mtro. en Economía', 'treyes@uni.edu'),
(12, 'Patricia', 'Torres', 'Lic. en Filosofía', 'ptorres@uni.edu'),
(1, 'Javier', 'Morales', 'Dr. en Computación', 'jmorales@uni.edu');



INSERT INTO Estudiantes (Nombre, Apellido, FechaNacimiento, Direccion, Email, IDCarrera) VALUES
('Luis', 'Hernández', '2000-05-10', 'Av. Siempre Viva 742', 'lhernandez@correo.com', 1),
('María', 'Pérez', '2001-08-15', 'Calle Luna 23', 'mperez@correo.com', 2),
('Sofía', 'Martínez', '2002-03-22', 'Calle Sol 19', 'smartinez@correo.com', 3),
('Jorge', 'Luna', '2000-01-20', 'Calle Río Bravo 10', 'jluna@correo.com', 4),
('Carmen', 'Salas', '2001-04-11', 'Av. Reforma 80', 'csalas@correo.com', 5),
('Marco', 'Delgado', '1999-12-05', 'Calle Norte 45', 'mdelgado@correo.com', 6),
('Andrea', 'Mendoza', '2002-07-19', 'Col. Centro 101', 'amendoza@correo.com', 7),
('Luis', 'Reyes', '2001-09-09', 'Av. Patria 77', 'lreyes@correo.com', 8),
('Rosa', 'Vargas', '2000-10-12', 'Calle Roble 23', 'rvargas@correo.com', 9),
('Gabriel', 'Moreno', '2002-03-18', 'Calle Cedros 56', 'gmoreno@correo.com', 10),
('Isabel', 'Cruz', '2000-06-25', 'Av. Chapultepec 34', 'icruz@correo.com', 1),
('Daniel', 'Suárez', '1999-08-14', 'Calle Norte 999', 'dsuarez@correo.com', 2),
('Natalia', 'Paredes', '2002-11-30', 'Zona Sur 23', 'nparedes@correo.com', 3);


INSERT INTO Cursos (IDDepartamento, NombreCurso, Descripcion, Creditos, Semestre, IDCampus) VALUES
(1, 'Estructura de Datos', 'Curso sobre estructuras fundamentales', 6, 3, 1),
(2, 'Psicología General', 'Introducción a la Psicología', 5, 1, 2),
(3, 'Contabilidad I', 'Conceptos básicos de contabilidad', 4, 1, 1),
(1, 'Álgebra Lineal', 'Estudio de matrices y vectores', 6, 1, 1),
(2, 'Óptica', 'Fundamentos de la luz y visión', 5, 2, 2),
(3, 'Química Orgánica', 'Composición de compuestos orgánicos', 6, 2, 3),
(4, 'Derecho Penal', 'Introducción al derecho penal', 4, 3, 4),
(5, 'Dibujo Artístico', 'Técnicas básicas de dibujo', 3, 1, 5),
(6, 'México Colonial', 'Historia de México virreinal', 4, 4, 6),
(7, 'Inglés Avanzado', 'Perfeccionamiento del idioma inglés', 4, 5, 7),
(8, 'Macroeconomía', 'Estudio de la economía global', 5, 3, 8),
(9, 'Lógica Formal', 'Introducción a la lógica y razonamiento', 4, 1, 9),
(10, 'Didáctica General', 'Métodos de enseñanza', 5, 2, 10);


INSERT INTO Horarios (IDCurso, IDAula, FechaInicio, FechaFin, HoraInicio, HoraFin) VALUES
(1, 1, '2025-08-01', '2025-12-15', '08:00', '10:00'),
(2, 2, '2025-08-01', '2025-12-15', '10:15', '12:15'),
(3, 1, '2025-08-01', '2025-12-15', '08:00', '09:30'),
(4, 2, '2025-08-01', '2025-12-15', '10:00', '11:30'),
(5, 3, '2025-08-01', '2025-12-15', '12:00', '13:30'),
(6, 4, '2025-08-01', '2025-12-15', '14:00', '15:30'),
(7, 5, '2025-08-01', '2025-12-15', '16:00', '17:30'),
(8, 6, '2025-08-01', '2025-12-15', '09:00', '10:30'),
(9, 7, '2025-08-01', '2025-12-15', '11:00', '12:30'),
(10, 8, '2025-08-01', '2025-12-15', '13:00', '14:30'),
(11, 9, '2025-08-01', '2025-12-15', '15:00', '16:30'),
(12, 10, '2025-08-01', '2025-12-15', '17:00', '18:30');

INSERT INTO CursosProfesores (IDCurso, IDProfesor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13);




INSERT INTO ProgramasCursos (IDPrograma, IDCurso) VALUES
(1, 1),
(2, 2),
(1, 3),
(2, 4),
(3, 5),
(4, 6),
(5, 7),
(6, 8),
(7, 9),
(8, 10),
(9, 11),
(10, 12),
(11, 13);



INSERT INTO Inscripciones (IDEstudiante, IDCurso, FechaInscripcion, Calificacion) VALUES
(1, 1, '2025-08-05', 90),
(2, 2, '2025-08-05', 85),
(3, 3, '2025-08-05', 88),
(4, 4, '2025-08-15', 91),
(5, 5, '2025-08-15', 86),
(6, 6, '2025-08-15', 89),
(7, 7, '2025-08-15', 84),
(8, 8, '2025-08-15', 90),
(9, 9, '2025-08-15', 87),
(10, 10, '2025-08-15', 93),
(11, 11, '2025-08-15', 85),
(12, 12, '2025-08-15', 88),
(13, 1, '2025-08-15', 92);




-- Tablas básicas
SELECT * FROM Campus;
SELECT * FROM Carreras;
SELECT * FROM Departamentos;
SELECT * FROM ProgramasEstudio;
SELECT * FROM Aulas;

-- Tablas principales
SELECT * FROM Estudiantes;
SELECT * FROM Profesores;
SELECT * FROM Cursos;

-- Tablas de relación
SELECT * FROM Estudiantes_Carreras;
SELECT * FROM ProgramasCursos;
SELECT * FROM CursosProfesores;

-- Tablas transaccionales
SELECT * FROM Inscripciones;
SELECT * FROM Horarios;




SELECT Nombre, Apellido
FROM Estudiantes;
SELECT *
FROM Cursos
WHERE Creditos = 3;

SELECT 
    e.Nombre AS NombreEstudiante,
    e.Apellido AS ApellidoEstudiante,
    c.NombreCurso
FROM 
    Inscripciones i
INNER JOIN Estudiantes e ON i.IDEstudiante = e.IDEstudiante
INNER JOIN Cursos c ON i.IDCurso = c.IDCurso;

SELECT e.Nombre AS NombreEstudiante,
    e.Apellido AS ApellidoEstudiante,
    c.NombreCurso
FROM Estudiantes e
LEFT JOIN Inscripciones i ON e.IDEstudiante = i.IDEstudiante
LEFT JOIN Cursos c ON i.IDCurso = c.IDCurso;


SELECT c.NombreCurso,
    e.Nombre AS NombreEstudiante,
    e.Apellido AS ApellidoEstudiante
FROM Estudiantes e
RIGHT JOIN Inscripciones i ON e.IDEstudiante = i.IDEstudiante
RIGHT JOIN Cursos c ON i.IDCurso = c.IDCurso;

SELECT  c.NombreCurso,
    COUNT(i.IDEstudiante) AS CantidadEstudiantes
FROM Cursos c
LEFT JOIN Inscripciones i ON c.IDCurso = i.IDCurso
GROUP BY  c.NombreCurso;


SELECT Nombre, Apellido, FechaNacimiento
FROM Estudiantes
WHERE FechaNacimiento BETWEEN '1995-01-01' AND '1998-12-31';


SELECT Nombre, Apellido, FechaNacimiento
FROM Estudiantes
WHERE FechaNacimiento BETWEEN '2000-01-01' AND '2001-12-31';


SELECT *
FROM Cursos
ORDER BY NombreCurso ASC;


WITH InscripcionesPorEstudiante AS (
    SELECT 
        Estudiantes.IDEstudiante,
        Estudiantes.Nombre,
        Estudiantes.Apellido,
        COUNT(Inscripciones.IDCurso) AS TotalInscripciones
    FROM Estudiantes
    LEFT JOIN Inscripciones ON Estudiantes.IDEstudiante = Inscripciones.IDEstudiante
    GROUP BY Estudiantes.IDEstudiante, Estudiantes.Nombre, Estudiantes.Apellido
)
SELECT 
    Nombre,
    Apellido,
    TotalInscripciones
FROM InscripcionesPorEstudiante
ORDER BY TotalInscripciones DESC
LIMIT 3;

WITH ConteoInscripciones AS (
    SELECT 
        d.NombreDepartamento,
        c.IDCurso,
        c.NombreCurso,
        COUNT(i.IDEstudiante) AS TotalInscritos
    FROM Cursos c
    JOIN Departamentos d ON c.IDDepartamento = d.IDDepartamento
    LEFT JOIN Inscripciones i ON c.IDCurso = i.IDCurso
    GROUP BY d.NombreDepartamento, c.IDCurso, c.NombreCurso
),
MaximosPorDepartamento AS (
    SELECT 
        NombreDepartamento,
        MAX(TotalInscritos) AS MaxInscritos
    FROM ConteoInscripciones
    GROUP BY NombreDepartamento
)
SELECT 
    ci.NombreDepartamento,
    ci.NombreCurso,
    ci.TotalInscritos
FROM ConteoInscripciones ci
JOIN MaximosPorDepartamento mpd 
    ON ci.NombreDepartamento = mpd.NombreDepartamento 
    AND ci.TotalInscritos = mpd.MaxInscritos;

ALTER TABLE Cursos
ADD COLUMN IDProfesor INT,
ADD FOREIGN KEY (IDProfesor) REFERENCES Profesores(IDProfesor);
ALTER TABLE Cursos
DROP COLUMN IDProfesor;



SELECT p.Nombre_Profesor,
       p.Apellido_Profesor,
       COUNT(cp.IDCurso) AS Cantidad_Cursos
FROM Profesores p
JOIN CursosProfesores cp ON p.IDProfesor = cp.IDProfesor
GROUP BY p.IDProfesor, p.Nombre_Profesor, p.Apellido_Profesor
HAVING COUNT(cp.IDCurso) > 2;




	WITH PromediosCursos AS (
    SELECT  c.IDCurso,
        c.NombreCurso,
        AVG(i.Calificacion) AS PromedioCalificacion
    FROM Cursos c
    JOIN Inscripciones i ON c.IDCurso = i.IDCurso
    GROUP BY c.IDCurso, c.NombreCurso
),
CursosConPrograma AS (
    SELECT p.IDPrograma,
        p.NombrePrograma,
        pc.IDCurso,
        c.NombreCurso,
        c.PromedioCalificacion
    FROM  ProgramasEstudio p
    JOIN ProgramasCursos pc ON p.IDPrograma = pc.IDPrograma
    JOIN PromediosCursos c ON pc.IDCurso = c.IDCurso
),

MaxPromPrograma AS (
    SELECT IDPrograma,
        MAX(PromedioCalificacion) AS MaxPromedio
    FROM CursosConPrograma
    GROUP BY IDPrograma
)
SELECT cp.NombrePrograma AS "Programa de Estudio",
    cp.NombreCurso AS "Curso con mejor promedio",
    cp.PromedioCalificacion AS "Promedio de calificación"
FROM CursosConPrograma cp
JOIN MaxPromPrograma m ON cp.IDPrograma = m.IDPrograma 
    AND cp.PromedioCalificacion = m.MaxPromedio
ORDER BY cp.NombrePrograma;
