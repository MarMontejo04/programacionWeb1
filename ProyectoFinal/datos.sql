DROP DATABASE IF EXISTS carrito;
CREATE DATABASE carrito;
USE carrito;

CREATE TABLE consolas(
   id_consolas INT NOT NULL UNIQUE AUTO_INCREMENT ,
   nombre_consola VARCHAR(100) NOT NULL,
   PRIMARY KEY (id_consolas)
) DEFAULT CHARACTER SET utf8;


CREATE TABLE empresas(
   id_empresas INT NOT NULL UNIQUE AUTO_INCREMENT,
   nombre_empresa VARCHAR(100) NOT NULL UNIQUE,
   PRIMARY KEY (id_empresas)
) DEFAULT CHARACTER SET utf8;

CREATE TABLE videoJuegos(
   id_vdjgs INT NOT NULL UNIQUE AUTO_INCREMENT,
   id_empresas INT NOT NULL,
   nombre_vdjg VARCHAR(100) NOT NULL UNIQUE,
   ano_publicado YEAR NOT NULL,
   puntuacion DECIMAL,
   PRIMARY KEY (id_vdjgs),
   FOREIGN KEY (id_empresas) REFERENCES empresas(id_empresas)
) DEFAULT CHARACTER SET utf8;

CREATE TABLE consola_videoJuegos(
   id_consola_videoJuegos int unique not null auto_increment,
   id_vdjgs INT NOT NULL,
   id_consolas INT NOT NULL,
   precio_venta INT NOT NULL,
   precio_compra INT NOT NULL,
   caratula VARCHAR(150) NOT NULL,
   stock INT NOT NULL,
   PRIMARY KEY (id_consola_videoJuegos),
   FOREIGN KEY (id_consolas) REFERENCES consolas(id_consolas),
   FOREIGN KEY (id_vdjgs) REFERENCES videoJuegos(id_vdjgs)
) DEFAULT CHARACTER SET utf8;


CREATE TABLE usuarios(
   id_usuarios INT NOT NULL UNIQUE AUTO_INCREMENT,
   nombre VARCHAR(30) NOT NULL,
   apellido VARCHAR(50) NOT NULL, 
   correo VARCHAR(50) NOT NULL UNIQUE,
   contrasena VARCHAR(20) NOT NULL,
   telefono VARCHAR(10) NOT NULL UNIQUE ,
   fecha_creacion_user DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
   fecha_nacimiento DATE NOT NULL,
   direccion VARCHAR(120) NOT NULL,
   PRIMARY KEY (id_usuarios)
) ENGINE=Innodb DEFAULT CHARACTER SET utf8;

CREATE TABLE registro_pagos(
   id_registro_pagos INT NOT NULL UNIQUE AUTO_INCREMENT,
   num_tarjeta VARCHAR(16),
   correo_paypal VARCHAR(100),
   fecha_pago DATETIME,
   PRIMARY KEY (id_registro_pagos)
) DEFAULT CHARACTER SET utf8;


CREATE TABLE carritos(
   id_carritos INT UNIQUE NOT NULL AUTO_INCREMENT,
   PRIMARY KEY (id_carritos)
) DEFAULT CHARACTER SET utf8;

CREATE TABLE carrito_videoJuegos(
   id_carritos INT NOT NULL,
   id_vdjgs INT NOT NULL,
   cantidad INT NOT NULL,
   FOREIGN KEY (id_carritos) REFERENCES carritos(id_carritos),
   FOREIGN KEY (id_vdjgs) REFERENCES videoJuegos(id_vdjgs)
) DEFAULT CHARACTER SET utf8;

CREATE TABLE usuario_carritos(
   id_carritos INT NOT NULL UNIQUE,
   id_usuarios INT NOT NULL,
   id_registro_pagos INT UNIQUE,
   metodo ENUM('debito','credito','payplay'),
   FOREIGN KEY (id_usuarios) REFERENCES usuarios(id_usuarios),
   FOREIGN KEY (id_carritos) REFERENCES carritos(id_carritos),
   FOREIGN KEY (id_registro_pagos) REFERENCES registro_pagos(id_registro_pagos)
) DEFAULT CHARACTER SET utf8;
-- Inserts de consolas
INSERT INTO consolas (id_consolas, nombre_consola)
VALUES (null, "Xbox");
INSERT INTO consolas (id_consolas, nombre_consola)
VALUES (null, "Play Station");
INSERT INTO consolas (id_consolas, nombre_consola)
VALUES (null, "Nintendo");

-- Insert de empresas
INSERT INTO empresas (id_empresas,nombre_empresa)
VALUES (1,"The Coalition");
INSERT INTO empresas (id_empresas,nombre_empresa)
VALUES (2,"343 Industries");
INSERT INTO empresas (id_empresas,nombre_empresa)
VALUES (3,"Konami");
INSERT INTO empresas (id_empresas,nombre_empresa)
VALUES (4,"SantaFrom Software");
INSERT INTO empresas (id_empresas,nombre_empresa)
VALUES (5,"CD Projekt");
INSERT INTO empresas (id_empresas,nombre_empresa)
VALUES (6,"Rockstar Games");
INSERT INTO empresas (id_empresas,nombre_empresa)
VALUES (7,"Team Asobi");
INSERT INTO empresas (id_empresas,nombre_empresa)
VALUES (8,"Naughty Dog");
INSERT INTO empresas (id_empresas,nombre_empresa)
VALUES (9,"Santa Monica Studio");
INSERT INTO empresas (id_empresas,nombre_empresa)
VALUES (10,"Insomniac Games");
INSERT INTO empresas (id_empresas,nombre_empresa)
VALUES (11,"Nintendo");
INSERT INTO empresas (id_empresas,nombre_empresa)
VALUES (12,"Bandai");
INSERT INTO empresas (id_empresas,nombre_empresa)
VALUES (13,"ND Cube");
INSERT INTO empresas (id_empresas,nombre_empresa)
VALUES (14,"Mojang");
INSERT INTO empresas (id_empresas,nombre_empresa)
VALUES (15,"Next Level Games");

-- Inserts de XBOX
INSERT INTO videoJuegos (id_vdjgs, id_empresas, nombre_vdjg, ano_publicado, puntuacion)
VALUES (1, 1, "Gearse 5", 2019, 4.2);
INSERT INTO videoJuegos (id_vdjgs, id_empresas, nombre_vdjg, ano_publicado, puntuacion)
VALUES (2, 2, "Halo Infinite", 2021, 4.2);
INSERT INTO videoJuegos (id_vdjgs, id_empresas, nombre_vdjg, ano_publicado, puntuacion)
VALUES (3, 3, "Metal Gear Solid: Snake Eater", 2024, 4.2);
INSERT INTO videoJuegos (id_vdjgs, id_empresas, nombre_vdjg, ano_publicado, puntuacion)
VALUES (4, 4, "Elden Ring", 2022, 4.2);
INSERT INTO videoJuegos (id_vdjgs, id_empresas, nombre_vdjg, ano_publicado, puntuacion)
VALUES (5, 5, "Cyebrpunk 2077",2020, 4.2);

-- Inserts de PLAY
INSERT INTO videoJuegos (id_vdjgs, id_empresas, nombre_vdjg, ano_publicado, puntuacion)
VALUES (6, 6, "Grand Theft Auto V", 2013, 4.2);
INSERT INTO videoJuegos (id_vdjgs, id_empresas, nombre_vdjg, ano_publicado, puntuacion)
VALUES (7, 7, "Astro Bot", 2024, 4.2);
INSERT INTO videoJuegos (id_vdjgs, id_empresas, nombre_vdjg, ano_publicado, puntuacion)
VALUES (8, 8, "The Last Of Us", 2022, 4.2);
INSERT INTO videoJuegos (id_vdjgs, id_empresas, nombre_vdjg, ano_publicado, puntuacion)
VALUES (9, 9, "God of War: Ragnarök", 2022, 4.2);
INSERT INTO videoJuegos (id_vdjgs, id_empresas, nombre_vdjg, ano_publicado, puntuacion)
VALUES (10, 10, "Spider-Man 2",2023, 4.2);

-- Inserts de NINTENDO
INSERT INTO videoJuegos (id_vdjgs, id_empresas, nombre_vdjg, ano_publicado, puntuacion)
VALUES (11, 11,"Zelda: Breath Of The Wild", 2017, 4.2);
INSERT INTO videoJuegos (id_vdjgs, id_empresas, nombre_vdjg, ano_publicado, puntuacion)
VALUES (12,  12,"Super Smash Bros Ultimate", 2018, 4.2);
INSERT INTO videoJuegos (id_vdjgs, id_empresas, nombre_vdjg, ano_publicado, puntuacion)
VALUES (13, 13, "Mario Party Super Stars", 2021, 4.2);
INSERT INTO videoJuegos (id_vdjgs, id_empresas, nombre_vdjg, ano_publicado, puntuacion)
VALUES (14, 14, "Minecraft", 2020, 4.2);
INSERT INTO videoJuegos (id_vdjgs, id_empresas, nombre_vdjg, ano_publicado, puntuacion)
VALUES (15, 15, "Luigi's Mansion 3",2019, 4.2);

-- Inserts de consola_videoJuegos
INSERT INTO consola_videoJuegos (id_consola_videoJuegos, id_vdjgs, id_consolas, precio_venta, precio_compra, caratula, stock)
VALUES (1, 1, 1, 1300, 1000,"../carrito/public/img/gears5.jpg",10);
INSERT INTO consola_videoJuegos (id_consola_videoJuegos, id_vdjgs, id_consolas, precio_venta, precio_compra, caratula, stock)
VALUES (2, 2, 1, 1300, 1000,"../carrito/public/img/haloinfinite.jpg",10);
INSERT INTO consola_videoJuegos (id_consola_videoJuegos, id_vdjgs, id_consolas, precio_venta, precio_compra, caratula, stock)
VALUES (3, 3, 1, 1300, 1000,"../carrito/public/img/metalgear.jpg",10);
INSERT INTO consola_videoJuegos (id_consola_videoJuegos, id_vdjgs, id_consolas, precio_venta, precio_compra, caratula, stock)
VALUES (4, 4, 1, 1300, 1000,"../carrito/public/img/eldenring.jpg",10);
INSERT INTO consola_videoJuegos (id_consola_videoJuegos, id_vdjgs, id_consolas, precio_venta, precio_compra, caratula, stock)
VALUES (5, 5, 1, 1300, 1000,"../carrito/public/img/cyberpunk.jpg",10);
INSERT INTO consola_videoJuegos (id_consola_videoJuegos, id_vdjgs, id_consolas, precio_venta, precio_compra, caratula, stock)
VALUES (6, 6, 2, 1300, 1000,"../carrito/public/img/.jpg",10);
INSERT INTO consola_videoJuegos (id_consola_videoJuegos, id_vdjgs, id_consolas, precio_venta, precio_compra, caratula, stock)
VALUES (7, 7, 2, 1300, 1000,"../carrito/public/img/.jpg",10);
INSERT INTO consola_videoJuegos (id_consola_videoJuegos, id_vdjgs, id_consolas, precio_venta, precio_compra, caratula, stock)
VALUES (8, 8, 2, 1300, 1000,"../carrito/public/img/.jpg",10);
INSERT INTO consola_videoJuegos (id_consola_videoJuegos, id_vdjgs, id_consolas, precio_venta, precio_compra, caratula, stock)
VALUES (9, 9, 2, 1300, 1000,"../carrito/public/img/.jpg",10);
INSERT INTO consola_videoJuegos (id_consola_videoJuegos, id_vdjgs, id_consolas, precio_venta, precio_compra, caratula, stock)
VALUES (10, 10, 2, 1300, 1000,"../carrito/public/img/.jpg",10);
INSERT INTO consola_videoJuegos (id_consola_videoJuegos, id_vdjgs, id_consolas, precio_venta, precio_compra, caratula, stock)
VALUES (11, 11, 3, 1300, 1000,"../carrito/public/img/.jpg",10);
INSERT INTO consola_videoJuegos (id_consola_videoJuegos, id_vdjgs, id_consolas, precio_venta, precio_compra, caratula, stock)
VALUES (12, 12, 3, 1300, 1000,"../carrito/public/img/.jpg",10);
INSERT INTO consola_videoJuegos (id_consola_videoJuegos, id_vdjgs, id_consolas, precio_venta, precio_compra, caratula, stock)
VALUES (13, 13, 3, 1300, 1000,"../carrito/public/img/.jpg",10);
INSERT INTO consola_videoJuegos (id_consola_videoJuegos, id_vdjgs, id_consolas, precio_venta, precio_compra, caratula, stock)
VALUES (14, 14, 3, 1300, 1000,"../carrito/public/img/.jpg",10);
INSERT INTO consola_videoJuegos (id_consola_videoJuegos, id_vdjgs, id_consolas, precio_venta, precio_compra, caratula, stock)
VALUES (15, 15, 3, 1300, 1000,"../carrito/public/img/.jpg",10);

-- Inserts usuarios
INSERT INTO usuarios(id_usuarios, nombre,apellido, correo, contrasena, telefono, fecha_creacion_user, fecha_nacimiento, direccion)
VALUES
(1, "Amaury Donovan","Alcantara Cruz", "japonxd1@hotmail.com", "1234","5576478887", NOW() ,'2002-01-25', "Su casa en un pueblito"),
(2, "Edgar","Morales Sanchez", "edgarsanchez@gmail.com", "1234","5528272625", NOW() ,'2004-01-25', "Su casa en EcatePunk"),
(3, "Bruno Ricardo","Alcantara Cruz", "brunopelzlol@gmail.com", "1234","5530313233", NOW() ,'2004-09-22', "Su casa en GAM"),
(4, "Mariana","Montejo Padilla", "surymontejo@gmail.com", "1234","5540414243", NOW() ,'2004-10-11', "Su casa en Benito"),
(5, "Jessica","Linares Sanchez", "linaresSanchez@gmail.com", "1234","5553525153", NOW() ,'2004-11-19', "Su casa en un pueblito"),
(6, "Ricardo","Lopez Ledezma", "richilopez@gmail.com", "1234","5512345678", NOW() ,'2002-01-25', "Su casa en Benito"),
(7, "Jose"," Valdés Guierrez", "jvgutierrez@gmail.com", "1234","5587654321", NOW() ,'1961-01-25', "Su casa en un pueblito");

-- inserts registro-pago 
INSERT INTO registro_pagos(id_registro_pagos, num_tarjeta,correo_paypal, fecha_pago)
VALUES
(1,null, "edgarsanchez@gmail.com", NOW()),
(2, "555555566565", null , NOW()),
(3, "827878927398", null, NOW()),
(4, NULL, "jvgutierrez@gmail.com", NOW())
;
-- Inserts carritos
INSERT INTO carritos (id_carritos) VALUES 
(1),
(2),
(3),
(4);
