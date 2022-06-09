CREATE TABLE USUARIO ( 
	usuario VARCHAR(16) PRIMARY KEY,
	correo VARCHAR(50),
	fecha_nacimiento DATE,
	ciudad VARCHAR(40),
	nyap VARCHAR(30),
	contrasenia VARCHAR(200) NOT NULL,
	cantidad_pull_request INT DEFAULT 0
);


CREATE TABLE REPOSITORIO ( 
	nombre VARCHAR(12) PRIMARY KEY,
	usuario VARCHAR(16),
	tipo_repositorio VARCHAR(12),
	cantidad_favoritos INT,
	cantidad_pull_request INT DEFAULT 0,
	CONSTRAINT fk_usuario FOREIGN KEY usuario
	REFERENCES usuario(usuario)
);


CREATE TABLE ARCHIVO ( 
	id SERIAL PRIMARY KEY,
	nombre_repositorio VARCHAR(12),
	usuario_repositorio VARCHAR(16),
	contenido VARCHAR(255),
	CONSTRAINT fk_nombre_repositorio FOREIGN KEY nombre_repositorio
	REFERENCES repositorio(nombre),
 	CONSTRAINT fk_usuario_repositorio FOREIGN KEY usuario_repositorio
	REFERENCES repositorio(usuario)
);


CREATE TABLE COMMIT ( 
	hash VARCHAR(40) PRIMARY KEY,
	id_archivo INT,
	titulo VARCHAR(30),
	descripcion VARCHAR(200),
	fecha_cambio DATE,
	CONSTRAINT fk_id_archivo FOREIGN KEY id_archivo
	REFERENCES archivo(id)
);


CREATE TABLE CONTRIBUCION ( 
	hash VARCHAR(40),
	usuario VARCHAR(16),
	cantidad_cambios INT,
	CONSTRAINT fk_usuario FOREIGN KEY usuario 
	REFERENCES usuario(usuario)
);