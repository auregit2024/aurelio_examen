
    CREATE TABLE zoologico(
        id_zoologico INT NOT NULL AUTO_INCREMENT,
        nombre VARCHAR(50)NOT NULL,
        nit VARCHAR(30) NOT NULL,
        direccion VARCHAR(30)NOT NULL,
        telefono VARCHAR(15)NOT NULL,
        logozoologico VARCHAR(100) NULL,
        fec_insercion TIMESTAMP NOT NULL,
        fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
        usuario INT NOT NULL,
        estado CHAR(1) NOT NULL,
        PRIMARY KEY(id_zoologico)
    )ENGINE=INNODB;

    INSERT INTO zoologico VALUES(1,'ZOOLOGICO MAGISTRAL','10101010', 'Barrio San Louis', '73569682','logo1.png',now(),now(),1,'A');

    

    CREATE TABLE visitantes(
    id_visitante INT NOT NULL AUTO_INCREMENT,
    id_zoologico INT NOT NULL,
    nombre VARCHAR(25) NOT NULL,    
    ap VARCHAR(50) NOT NULL,
    am VARCHAR(50) NOT NULL,
    pais_origen VARCHAR(15),
    genero CHAR(1)NOT NULL,
    fecha_nacimiento DATE ,
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY (id_visitante), 
    FOREIGN KEY(id_zoologico) REFERENCES zoologico(id_zoologico)  ,
    INDEX i_nom (nombre),
    INDEX i_am (ap)
    )ENGINE=INNODB;

    INSERT INTO visitantes VALUES(1,1,'JUAN','BELTRAN','FLORES','PERU','M','2000-01-01',now(),now(),1,'A');
    INSERT INTO visitantes VALUES(2,1,'MARÍA ','GARCÍA',' RAMÍREZ','PARAGUAY','F','1997-04-13',now(),now(),1,'A');
    INSERT INTO visitantes VALUES(3,1,'CARLOS','RODRÍGUEZ ','HERNÁNDEZ','BOLIVIA','M','1980-07-24',now(),now(),1,'A');
    INSERT INTO visitantes VALUES(4,1,'LAURA ','HERNÁNDEZ',' GÓMEZ','PERU','F','2003-09-15',now(),now(),1,'A');
    INSERT INTO visitantes VALUES(5,1,'PEDRO ',' MARTÍNEZ ','FERNÁNDEZ','BOLIVIA','M','2005-02-31',now(),now(),1,'A');
    INSERT INTO visitantes VALUES(6,1,'ANA ','GONZÁLEZ',' LÓPEZ','PERU','F','2008-02-29',now(),now(),1,'A');
    INSERT INTO visitantes VALUES(7,1,'JOSÉ ','LÓPEZ',' MARTÍNEZ','BOLIVIA','M','2010-05-18',now(),now(),1,'A');
    INSERT INTO visitantes VALUES(8,1,'LUCÍA ','PÉREZ ','GONZÁLEZ','CHILE','F','1999-08-07',now(),now(),1,'A');
    INSERT INTO visitantes VALUES(9,1,'MIGUEL ','SÁNCHEZ ',' RODRÍGUEZ','BOLIVIA','M','1994-10-22',now(),now(),1,'A');
    INSERT INTO visitantes VALUES(10,1,'ELENA ','RAMÍREZ',' PÉREZ','PARAGUAY','F','2002-12-10',now(),now(),1,'A');


    CREATE TABLE registro_visitas(
    id_registro INT NOT NULL AUTO_INCREMENT,
    id_visitante INT NOT NULL,
    fecha_visita DATE NOT NULL,
    hora_entrada TIME NOT NULL,
    hora_salida TIME,
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY (id_registro),
    FOREIGN KEY(id_visitante) REFERENCES visitantes(id_visitante)   
    ) ENGINE=INNODB;

    INSERT INTO registro_visitas VALUES(1,10,'2023-01-01', '08:00:00', '14:00:00', now(), now(), 1, 'A');
    INSERT INTO registro_visitas VALUES(2,9,'2022-02-01', '09:00:00', '12:20:00', now(), now(), 1, 'A');
    INSERT INTO registro_visitas VALUES(3,8,'2021-03-01', '08:30:00', '13:14:00', now(), now(), 1, 'A');
    INSERT INTO registro_visitas VALUES(4,7,'2020-04-01', '09:10:00', '11:50:00', now(), now(), 1, 'A');
    INSERT INTO registro_visitas VALUES(5,6,'2019-05-01', '09:40:00', '14:15:00', now(), now(), 1, 'A');
    INSERT INTO registro_visitas VALUES(6,5,'2018-06-01', '10:05:00', '16:30:00', now(), now(), 1, 'A');
    INSERT INTO registro_visitas VALUES(7,4,'2022-07-01', '09:50:00', '15:08:00', now(), now(), 1, 'A');
    INSERT INTO registro_visitas VALUES(8,3,'2023-08-01', '08:39:00', '11:30:00', now(), now(), 1, 'A');
    INSERT INTO registro_visitas VALUES(9,2,'2020-09-01', '09:17:00', '16:20:00', now(), now(), 1, 'A');
    INSERT INTO registro_visitas VALUES(10,1,'2016-10-01', '08:45:00', '17:11:00', now(), now(), 1, 'A');

    CREATE TABLE tipos_animales(
    id_tipo_animal INT NOT NULL AUTO_INCREMENT,
    id_zoologico INT NOT NULL,
    tipo_ani VARCHAR(50) NOT NULL,
    nombre_cientifico_ani VARCHAR(30) NOT NULL,
    descripcion TEXT,
    numero_de_patas INT,
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_tipo_animal),
    FOREIGN KEY(id_zoologico) REFERENCES zoologico (id_zoologico)
    )ENGINE=INNODB;

    INSERT INTO tipos_animales VALUES(1,1,'MAMIFERO','Panthera leo','El león es un gran felino conocido por su melena en los machos y por vivir en manadas en la sabana africana','4',now(),now(),1,'A');
    INSERT INTO tipos_animales VALUES(2,1,'MAMIFERO','Panthera tigris','El tigre es un gran felino rayado de colores naranja y negro, conocido por su fuerza y agilidad en la caza','4',now(),now(),1,'A');
    INSERT INTO tipos_animales VALUES(3,1,'MAMIFERO','Elephas maximus','El elefante es el mamífero terrestre más grande, con trompa larga y orejas grandes','4',now(),now(),1,'A');
    INSERT INTO tipos_animales VALUES(4,1,'MAMIFERO','Giraffa camelopardalis','La jirafa es un mamífero herbívoro de cuello largo, patas largas y manchas en su pelaje. Es el animal terrestre más alto y se encuentra en África','4',now(),now(),1,'A');
    INSERT INTO tipos_animales VALUES(5,1,'MAMIFERO','Cebus capucinus','El mono es un mamífero ágil que vive en árboles y tiene cola prensil','2',now(),now(),1,'A');
    INSERT INTO tipos_animales VALUES(6,1,'MAMIFERO','Ursus arctos','El oso es un mamífero grande y fuerte con pelaje grueso que vive en diversas partes del mundo','4',now(),now(),1,'A');
    INSERT INTO tipos_animales VALUES(7,1,'OVIPARO','Crocodylus niloticus','El cocodrilo es un reptil semiacuático de cuerpo largo, patas cortas y mandíbulas fuertes. Vive en ríos y lagos, y se alimenta principalmente de peces y otros animales','4',now(),now(),1,'A');
    INSERT INTO tipos_animales VALUES(8,1,'MAMIFERO','Ailuropoda melanoleuca','El panda es un oso de pelaje blanco y negro que vive en las montañas de China. Se alimenta principalmente de bambú y es conocido por su aspecto tierno y tranquilo','4',now(),now(),1,'A');
    INSERT INTO tipos_animales VALUES(9,1,'OVIPARO','Crotalus atrox','La serpiente es un reptil sin patas que se desplaza reptando','0',now(),now(),1,'A');
    INSERT INTO tipos_animales VALUES(10,1,'OVIPARO','Psittacus erithacus','El loro es un ave con plumaje colorido, pico fuerte y capacidad para imitar sonidos. Son conocidos por su inteligencia y capacidad para aprender palabras y frases','2',now(),now(),1,'A');

    CREATE TABLE animales(
    id_animal INT NOT NULL AUTO_INCREMENT,
    id_zoologico INT NOT NULL,
    id_tipo_animal INT NOT NULL,
    nombre_ani VARCHAR(90) NOT NULL,
    sexo_ani CHAR(1) NOT NULL,
    cantidad_ani INT ,
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_animal),
    FOREIGN KEY(id_zoologico) REFERENCES zoologico(id_zoologico),
    FOREIGN KEY(id_tipo_animal) REFERENCES tipos_animales(id_tipo_animal)
    )ENGINE=INNODB;

    INSERT INTO animales VALUES(1,1,1,'LEÓN','MACHO','5',now(),now(),1,'A');
    INSERT INTO animales VALUES(2,1,2,'TIGRE','MACHO','8',now(),now(),1,'A');
    INSERT INTO animales VALUES(3,1,3,'ELEFANTE','MACHO','2',now(),now(),1,'A');
    INSERT INTO animales VALUES(4,1,4,'JIRAFA','HEMBRA','4',now(),now(),1,'A');
    INSERT INTO animales VALUES(5,1,5,'MONO','MACHO','20',now(),now(),1,'A');
    INSERT INTO animales VALUES(6,1,6,'OSO','MACHO','4',now(),now(),1,'A');
    INSERT INTO animales VALUES(7,1,7,'COCODRILO','MACHO','6',now(),now(),1,'A');
    INSERT INTO animales VALUES(8,1,8,'PANDA','HEMBRA','6',now(),now(),1,'A');
    INSERT INTO animales VALUES(9,1,9,'SERPIENTE','MACHO','30',now(),now(),1,'A');
    INSERT INTO animales VALUES(10,1,10,'LORO','HEMBRA','20',now(),now(),1,'A');

    CREATE TABLE alimentos(
    id_alimento INT NOT NULL AUTO_INCREMENT,
    tipo_alimento VARCHAR(20) NOT NULL, 
    nombre_alim VARCHAR(20) NOT NULL,
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL, 
    PRIMARY KEY(id_alimento)
    )ENGINE=INNODB;

    INSERT INTO alimentos VALUES(1,'CARNE','CARNE DE CERDO',now(),now(),1,'A');
    INSERT INTO alimentos VALUES(2,'CARNE','CARNE DE CORDERO',now(),now(),1,'A');
    INSERT INTO alimentos VALUES(3,'VEGETAL','RAMAS Y HOJAS DE ÁRBOLES',now(),now(),1,'A');
    INSERT INTO alimentos VALUES(4,'VEGETAL','RAMAS Y HOJAS DE ÁRBOLES',now(),now(),1,'A');
    INSERT INTO alimentos VALUES(5,'FRUTAS','PLÁTANOS',now(),now(),1,'A');
    INSERT INTO alimentos VALUES(6,'CARNE','PESCADO',now(),now(),1,'A');
    INSERT INTO alimentos VALUES(7,'CARNE','CARNE DE POLLO',now(),now(),1,'A');
    INSERT INTO alimentos VALUES(8,'CARNE','PESCADO',now(),now(),1,'A');
    INSERT INTO alimentos VALUES(9,'CARNE','RATAS',now(),now(),1,'A');
    INSERT INTO alimentos VALUES(10,'FRUTOS SECOS','NUECES Y ALMENDRAS',now(),now(),1,'A');


    CREATE TABLE alimentos_animales(
    id_alimento_animal INT NOT NULL AUTO_INCREMENT,
    id_alimento INT NOT NULL,
    id_animal INT NOT NULL,
    cantidad VARCHAR(20) NOT NULL, 
    horario TIME(6),
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL, 
    PRIMARY KEY(id_alimento_animal),
    FOREIGN KEY(id_alimento) REFERENCES alimentos(id_alimento),
    FOREIGN KEY(id_animal) REFERENCES animales(id_animal)
    )ENGINE=INNODB;

    INSERT INTO alimentos_animales VALUES(1,1,1,'2 Kg','01:00:00',now(),now(),1,'A');
    INSERT INTO alimentos_animales VALUES(2,2,2,'4 Kg','01:00:00',now(),now(),1,'A');
    INSERT INTO alimentos_animales VALUES(3,3,3,'7 Kg','01:00:00',now(),now(),1,'A');
    INSERT INTO alimentos_animales VALUES(4,4,4,'12 Kg','01:00:00',now(),now(),1,'A');
    INSERT INTO alimentos_animales VALUES(5,5,5,'9 Kg','01:00:00',now(),now(),1,'A');
    INSERT INTO alimentos_animales VALUES(6,6,6,'2 Kg','01:00:00',now(),now(),1,'A');
    INSERT INTO alimentos_animales VALUES(7,7,7,'4 Kg','01:00:00',now(),now(),1,'A');
    INSERT INTO alimentos_animales VALUES(8,8,8,'2 Kg','01:00:00',now(),now(),1,'A');
    INSERT INTO alimentos_animales VALUES(9,9,9,'10 Kg','01:00:00',now(),now(),1,'A');
    INSERT INTO alimentos_animales VALUES(10,10,10,'6 Kg ','01:00:00',now(),now(),1,'A');

    /*primary, foreign, index, unique cuidadores */
    CREATE TABLE cuidadores(
    id_cuidador INT NOT NULL AUTO_INCREMENT,
    id_zoologico INT NOT NULL,
    ci VARCHAR(20) NOT NULL,
    nombres VARCHAR(30)NOT NULL,
    ap VARCHAR(20),
    am VARCHAR(20), 
    genero CHAR(1)NOT NULL,
    telefono VARCHAR(15)NOT NULL,
    direccion VARCHAR(15)NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_cuidador),
    FOREIGN KEY(id_zoologico) REFERENCES zoologico(id_zoologico),
    INDEX i_ap (ap),
    INDEX i_am (am),
    UNIQUE i_ci (ci)    
    )ENGINE=INNODB;

    INSERT INTO cuidadores VALUES(1,1,'9988615','GERARDO','GOMEZ','CHOQUE','MASCULINO','77748569','PARQUE BOLIVAR','1990-05-22','2018-10-22','2024-03-22',now(),now(),1,'A');
    INSERT INTO cuidadores VALUES(2,1,'1099658','ARIELA','LLANOS','MAMANI','FEMENINO','77748897','AVENIDA LAS AMERICAS','1970-01-22','2015-10-22','2024-02-22',now(),now(),1,'A');
    INSERT INTO cuidadores VALUES(3,1,'1010254','MIRIAM','PEREZ','QUISPE','FEMENINO','77747777','AVENIDA JUAN PABLO II','1996-10-22','2019-01-22','2024-01-22',now(),now(),1,'A');
    INSERT INTO cuidadores VALUES(4,1,'9986161','JUAN','SUAREZ','FLORES','MASCULINO','77744555','CALLE BOLIVAR','1999-06-20','2016-10-22','2024-03-11',now(),now(),1,'A');
    INSERT INTO cuidadores VALUES(5,1,'9911587','DENIS','MAMANI','RAMOS','MASCULINO','77748000','CALLE LA PAZ','2000-10-22','2020-10-22','2024-02-23',now(),now(),1,'A');
    INSERT INTO cuidadores VALUES(6,1,'9930201','JULIETA','DIAZ','CONDORI','FEMENINO','77755896','AVENIDA SANTOS DUMONT','2001-03-01','2024-01-03','2024-01-22',now(),now(),1,'A');
    INSERT INTO cuidadores VALUES(7,1,'1091582','DIEGO','QUISPE','GUTIÉRREZ','MASCULINO','77700025','CALLE CORDILLERA','2001-10-28','2022-02-08','2024-01-22',now(),now(),1,'A');
    INSERT INTO cuidadores VALUES(8,1,'1054652','FERNANDO','MORALES','ARIAS','MASCULINO','7772225','AVENIDA LAS MERCEDES','1997-11-20','2020-06-22','2024-01-22',now(),now(),1,'A');
    INSERT INTO cuidadores VALUES(9,1,'1021651','MAXNELY','LOPEZ','PEREZ','FEMENINO','77748969','AVENIDA DEL MAESTRO','1992-03-11','2016-06-19','2024-01-22',now(),now(),1,'A');
    INSERT INTO cuidadores VALUES(10,1,'9980014','BRAITON','SORUCO','CÁCERES','MASCULINO','77733335','CALLE COCHABAMBA','1995-09-26','2018-09-20','2024-03-22',now(),now(),1,'A');


    CREATE TABLE cuidadores_animales(
    id_cuidador_animal INT NOT NULL AUTO_INCREMENT,
    id_cuidador INT NOT NULL,
    id_animal INT NOT NULL, 
    fecha_icicio DATE NOT NULL,
    fecha_fin DATE,
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,   
    PRIMARY KEY(id_cuidador_animal),
    FOREIGN KEY(id_cuidador) REFERENCES cuidadores(id_cuidador),
    FOREIGN KEY(id_animal) REFERENCES animales(id_animal)
    )ENGINE=INNODB;

    INSERT INTO cuidadores_animales VALUES(1,1,1,'2020-01-01','2024-01-10',now(),now(),1,'A');
    INSERT INTO cuidadores_animales VALUES(2,2,2,'2022-02-02','2024-02-09',now(),now(),1,'A');
    INSERT INTO cuidadores_animales VALUES(3,3,3,'2019-03-03','2024-03-08',now(),now(),1,'A');
    INSERT INTO cuidadores_animales VALUES(4,4,4,'2020-04-04','2024-04-07',now(),now(),1,'A');
    INSERT INTO cuidadores_animales VALUES(5,5,5,'2023-05-05','2024-05-06',now(),now(),1,'A');
    INSERT INTO cuidadores_animales VALUES(6,6,6,'2021-06-06','2024-06-05',now(),now(),1,'A');
    INSERT INTO cuidadores_animales VALUES(7,7,7,'2022-07-07','2024-07-04',now(),now(),1,'A');
    INSERT INTO cuidadores_animales VALUES(8,8,8,'2023-08-08','2024-08-03',now(),now(),1,'A');
    INSERT INTO cuidadores_animales VALUES(9,9,9,'2020-09-09','2024-09-02',now(),now(),1,'A');
    INSERT INTO cuidadores_animales VALUES(10,10,10,'2014-10-10','2024-10-01',now(),now(),1,'A');

    CREATE TABLE jaulas(
    id_jaula INT NOT NULL AUTO_INCREMENT,
    ubicacion VARCHAR(50) NOT NULL,
    tamanio VARCHAR(50)NOT NULL,
    estado_jaula TEXT,
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_jaula)
    )ENGINE=INNODB;

    INSERT INTO jaulas VALUES(1,'CENTRO','GRANDE','OCUPADA',now(),now(),1,'A');
    INSERT INTO jaulas VALUES(2,'COSTADO','MEDIANO','EN CUARENTENA',now(),now(),1,'A');
    INSERT INTO jaulas VALUES(3,'LATERAL','GRANDE','DISPONIBLE',now(),now(),1,'A');
    INSERT INTO jaulas VALUES(4,'ARRIBA','GRANDE','DISPONIBLE',now(),now(),1,'A');
    INSERT INTO jaulas VALUES(5,'CENTRO','PEQUEÑO','OCUPADA',now(),now(),1,'A');
    INSERT INTO jaulas VALUES(6,'ATRAS','GRANDE','OCUPADA',now(),now(),1,'A');
    INSERT INTO jaulas VALUES(7,'CENTRO','MEDIANO','DISPONIBLE',now(),now(),1,'A');
    INSERT INTO jaulas VALUES(8,'CENTRO','GRANDE','EN CUARENTENA',now(),now(),1,'A');
    INSERT INTO jaulas VALUES(9,'CENTRO','GRANDE','DISPONIBLE',now(),now(),1,'A');
    INSERT INTO jaulas VALUES(10,'CENTRO','PEQUEÑO','DISPONIBLE',now(),now(),1,'A');

    CREATE TABLE jaulas_animales(
    id_jaula_animal INT NOT NULL AUTO_INCREMENT,
    id_animal INT NOT NULL,
    id_jaula INT NOT NULL,
    fec_establecido DATE NOT NULL,
    fec_retirado DATE,
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_jaula_animal),
    FOREIGN KEY(id_animal) REFERENCES animales(id_animal),  
    FOREIGN KEY(id_jaula) REFERENCES jaulas(id_jaula) 
    )ENGINE=INNODB;

    INSERT INTO jaulas_animales VALUES(1,1,1,'2004-01-10','2024-01-10',now(),now(),1,'A');
    INSERT INTO jaulas_animales VALUES(2,2,2,'2014-02-09','2024-02-09',now(),now(),1,'A');
    INSERT INTO jaulas_animales VALUES(3,3,3,'2021-03-08','2024-03-08',now(),now(),1,'A');
    INSERT INTO jaulas_animales VALUES(4,4,4,'2012-04-07','2024-04-07',now(),now(),1,'A');
    INSERT INTO jaulas_animales VALUES(5,5,5,'2018-05-06','2024-05-06',now(),now(),1,'A');
    INSERT INTO jaulas_animales VALUES(6,6,6,'2020-06-05','2024-06-05',now(),now(),1,'A');
    INSERT INTO jaulas_animales VALUES(7,7,7,'2019-07-04','2024-07-04',now(),now(),1,'A');
    INSERT INTO jaulas_animales VALUES(8,8,8,'2020-08-03','2024-08-03',now(),now(),1,'A');
    INSERT INTO jaulas_animales VALUES(9,9,9,'2022-09-02','2024-09-02',now(),now(),1,'A');
    INSERT INTO jaulas_animales VALUES(10,10,10,'2023-10-01','2024-10-01',now(),now(),1,'A');

    /*primary, foreign, index, unique limpiadores */
    CREATE TABLE limpiadores(
    id_limpiador INT NOT NULL AUTO_INCREMENT,
    id_zoologico INT NOT NULL,
    ci VARCHAR(20) NOT NULL,
    nombres VARCHAR(30)NOT NULL,
    ap VARCHAR(20),
    am VARCHAR(20),
    genero CHAR(1)NOT NULL,
    telefono VARCHAR(15)NOT NULL,
    direccion VARCHAR(15)NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE NOT NULL,
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_limpiador),
    FOREIGN KEY(id_zoologico) REFERENCES zoologico(id_zoologico),
    INDEX i_ap (ap),
    INDEX i_am (am),
    UNIQUE i_ci (ci)
) ENGINE=INNODB;

INSERT INTO limpiadores VALUES(1, 1, '4329876', 'PEDRO', 'GOMEZ', 'PEREZ', 'M', '77748569', 'CALLE LA PAZ NRO. 123', '2024-10-22', '2024-10-22', '2024-10-22', NOW(), NOW(), 1, 'A');
INSERT INTO limpiadores VALUES(2, 1, '7158942', 'CARLOS', 'MARTINEZ', 'GUTIERREZ', 'M', '77748569', 'AVENIDA SUCRE NRO. 456', '2024-10-22', '2024-10-22', '2024-10-22', NOW(), NOW(), 1, 'A');
INSERT INTO limpiadores VALUES(3, 1, '1267389', 'LUIS', 'SANCHEZ', 'ROJAS', 'M', '77748569', 'CALLE 15 DE ABRIL NRO. 789', '2024-10-22', '2024-10-22', '2024-10-22', NOW(), NOW(), 1, 'A');
INSERT INTO limpiadores VALUES(4, 1, '8905432', 'MIGUEL', 'HERNANDEZ', 'LOPEZ', 'M', '77748569', 'AVENIDA LAS AMÉRICAS NRO. 1011', '2024-10-22', '2024-10-22', '2024-10-22', NOW(), NOW(), 1, 'A');
INSERT INTO limpiadores VALUES(5, 1, '6543210', 'ELENA', 'GONZALEZ', 'CASTILLO', 'F', '77748569', 'CALLE 6 DE OCTUBRE NRO. 1213', '2024-10-22', '2024-10-22', '2024-10-22', NOW(), NOW(), 1, 'A');
INSERT INTO limpiadores VALUES(6, 1, '9876543', 'LAURA', 'MARTINEZ', 'RAMIREZ', 'F', '77748569', 'AVENIDA BELGRANO NRO. 1415', '2024-10-22', '2024-10-22', '2024-10-22', NOW(), NOW(), 1, 'A');
INSERT INTO limpiadores VALUES(7, 1, '3456789', 'CARMEN', 'LOPEZ', 'SILVA', 'F', '77748569', 'CALLE CÓRDOBA NRO. 1617', '2024-10-22', '2024-10-22', '2024-10-22', NOW(), NOW(), 1, 'A');
INSERT INTO limpiadores VALUES(8, 1, '2109876', 'JULIA', 'FERNANDEZ', 'TORRES', 'F', '77748569', 'AVENIDA FRANCISCO MENDEZ NRO. 1819', '2024-10-22', '2024-10-22', '2024-10-22', NOW(), NOW(), 1, 'A');
INSERT INTO limpiadores VALUES(9, 1, '8765432', 'GERARDO', 'GARCIA', 'MENDOZA', 'M', '77748569', 'CALLE JUAN XXIII NRO. 2021', '2024-10-22', '2024-10-22', '2024-10-22', NOW(), NOW(), 1, 'A');
INSERT INTO limpiadores VALUES(10, 1, '5432109', 'FERNANDO', 'RODRIGUEZ', 'REYES', 'M', '77748569', 'AVENIDA LIBERTAD NRO. 2223', '2024-10-22', '2024-10-22', '2024-10-22', NOW(), NOW(), 1, 'A');

    CREATE TABLE limpiadores_jaulas(
    id_limpiador_jaula INT NOT NULL AUTO_INCREMENT,
    id_jaula INT NOT NULL,
    id_limpiador INT NOT NULL,
    fecha_limpieza DATE NOT NULL,
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_limpiador_jaula),
    FOREIGN KEY(id_jaula) REFERENCES jaulas(id_jaula),  
    FOREIGN KEY(id_limpiador) REFERENCES limpiadores(id_limpiador) 
    )ENGINE=INNODB;

    INSERT INTO limpiadores_jaulas VALUES(1,1,1,'2024-10-15',now(),now(),1,'A');
    INSERT INTO limpiadores_jaulas VALUES(2,2,2,'2024-01-12',now(),now(),1,'A');
    INSERT INTO limpiadores_jaulas VALUES(3,3,3,'2024-02-13',now(),now(),1,'A');
    INSERT INTO limpiadores_jaulas VALUES(4,4,4,'2023-02-21',now(),now(),1,'A');
    INSERT INTO limpiadores_jaulas VALUES(5,5,5,'2024-10-10',now(),now(),1,'A');
    INSERT INTO limpiadores_jaulas VALUES(6,6,6,'2023-10-09',now(),now(),1,'A');
    INSERT INTO limpiadores_jaulas VALUES(7,7,7,'2024-01-22',now(),now(),1,'A');
    INSERT INTO limpiadores_jaulas VALUES(8,8,8,'2023-10-04',now(),now(),1,'A');
    INSERT INTO limpiadores_jaulas VALUES(9,9,9,'2024-01-22',now(),now(),1,'A');
    INSERT INTO limpiadores_jaulas VALUES(10,10,10,'2024-01-08',now(),now(),1,'A');

    /*Utilizando el sistema web que están desarrollando y la siguiente base de datos realizar:
*Crear un grupo en su menu con el nombre TERCER BIMESTRE-BDII
*Crear una opción dentro del grupo creado que se llame Rpt MICROS POR SOCIO, 
en la primera pantalla del select que se visualice  Seleccione Socio y se muestre en el select
nombres, ap y am; en base a eso que visualice los micros(nombre, ap, am del socio; placa, modelo, marca, color)
Nota.- Enviar lo solicitado (Sistema web y base de datos) en una carpeta comprimida con el nombre EV_CONTI_08-08_ARUQUIPA.rar
*/

CREATE TABLE socios (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ci VARCHAR(15) NOT NULL,
  nombres VARCHAR(20) NOT NULL,
  ap VARCHAR(30),
  am VARCHAR(30),
  direccion VARCHAR(50) NOT NULL,
  telefono VARCHAR(30),
  fecha_nac date NOT NULL
)ENGINE=INNODB;


CREATE TABLE micros (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  socio_id INT NOT NULL ,
  placa VARCHAR(25) NOT NULL,
  modelo VARCHAR(30),
  marca VARCHAR(30),
  nro_motor VARCHAR(30),
  nro_chasis VARCHAR(30),
  color VARCHAR(50),
  nro_puertas INT,  
  FOREIGN KEY(socio_id) REFERENCES socios (id)
)ENGINE=INNODB;

INSERT INTO socios VALUES (1, '1111111', 'ROGER', 'CASTILLO', 'TOLABA', 'CALLE JUNIN', '66-66699', '1982-08-09');
INSERT INTO socios VALUES (2, '2222222', 'AMELIA', 'RETAMOZO', 'CRUZ', 'CALLE 6 DE JUNIO', '66-67892', '1980-11-19');
INSERT INTO socios VALUES (3, '3333333', 'AGUSTINA', 'ROMERO', 'CASTRO', 'CALLE BALLIVIAN', '66-63598', '1981-12-15');
INSERT INTO socios VALUES (4, '4444444', 'ELISA', 'ITURRI', 'DURAN', 'B. LUIS DE FUENTES', '66-46897', '1982-01-25');
INSERT INTO socios VALUES (5, '1234567', 'LORENA', 'NIEVES', '', 'B. LA PAMPA', '66-23444', '1987-11-13');
INSERT INTO socios VALUES (6, '5032289', 'CECILIA', 'ARENAS', 'CASTRO', 'B. JUAN XXIII', '66-30655', '1985-01-13');


INSERT INTO micros VALUES (1, 1, 'OPP-1458', '1998', 'MITSUBISHI', '36531313-LL', '21213213-II', 'BLANCO', 4);
INSERT INTO micros VALUES (2, 1, 'LFF-3455', '1999', 'MITSUBISHI' , '345346456-UT', '74353656-FY', 'VERDE', 5);
INSERT INTO micros VALUES (3, 2, 'LPO-4567', '1999', 'MITSUBISHI', '11425368-OT', '79742354-FY', 'AZUL COMBINADO', 5);
INSERT INTO micros VALUES (4, 2, 'OVC-7972', '2010', 'KIA', '57826893-UU', '34582539-GG', 'AMARILLO', 4);
INSERT INTO micros VALUES (5, 5, 'VVC-0302', '2018', 'MITSUBISHI', '345346456-UT', '74353656-FY', 'VERDE', 5);
INSERT INTO micros VALUES (6, 5, 'DDC-0304', '2019', 'NISSAN', '456446456-AS', '693353656-TT', 'ROJO', 5);
INSERT INTO micros VALUES (7, 6, 'CAC-2122', '2020', 'KIA', '564645345346-IT', '567568888-CC', 'NEGRO', 5);



    CREATE TABLE personas(
    id_persona INT NOT NULL AUTO_INCREMENT,
    id_zoologico INT NOT NULL,
    ci VARCHAR(20) NOT NULL,
    nombres VARCHAR(30)NOT NULL,
    ap VARCHAR(20),
    am VARCHAR(20),
    telefono VARCHAR(15)NOT NULL,
    direccion VARCHAR(15)NOT NULL,
    genero CHAR(1),
    fec_insercion TIMESTAMP NOT NULL,
    fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_persona), 
    FOREIGN KEY(id_zoologico) REFERENCES zoologico(id_zoologico)
    )ENGINE=INNODB;


    INSERT INTO personas (id_persona, id_zoologico, ci, nombres, ap, am, telefono, direccion, genero,  fec_insercion, fec_modificacion, usuario, estado) 
    VALUES
    (1, 1, '9961353','Aurelio','Aruquipa','Laura','73569682','BARRIO LINDO','M',now(),now(),1,'A'),
    (2, 1, '1234567', 'Angel', 'Aruquipa', 'Ulo', '00000000', 'villa fatima','M',NOW(), NOW(), 2, 'A'),
    (3, 1, '9876543', 'Rufi', 'Laura', 'Choque', '987654321', 'Avenida Central','F', NOW(), NOW(), 1, 'A'),
    (4, 1, '5678910', 'Juan', 'Hernandez', 'Garcia', '567890123', 'Plaza Mayor','M', NOW(), NOW(), 1, 'A'),
    (5, 1, '2345678', 'Ana', 'Martinez', 'Rodriguez', '234567890', 'Calle Secundaria', 'F',NOW(), NOW(), 1, 'A'),
    (6, 1, '7890123', 'Luis', 'Perez', 'Sanchez', '789012345', 'Avenida de la Paz', 'M',NOW(), NOW(), 1, 'A'),
    (7, 1, '3456789', 'Laura', 'Gomez', 'Lopez', '345678901', 'Calle del Sol', 'F',NOW(), NOW(), 1, 'A'),
    (8, 1, '9012345', 'Carlos', 'Rodriguez', 'Gomez', '901234567', 'Avenida Libertad','M', NOW(), NOW(), 1, 'A'),
    (9, 1, '4567891', 'Sofia', 'Sanchez', 'Fernandez', '456789012', 'Calle de los Pinos', 'F',NOW(), NOW(), 1, 'A'),
    (10, 1, '0123456', 'Javier', 'Fernandez', 'Gonzalez', '012345678', 'Avenida de las Flores', 'M',NOW(), NOW(), 1, 'A'),
    (11, 1, '6789012', 'Elena', 'Martinez', 'Garcia', '678901234', 'Calle del Rio','F', NOW(), NOW(), 1, 'A'),
    (12, 1, '3210987', 'Miguel', 'Lopez', 'Perez', '321098765', 'Avenida del Mar', 'M',NOW(), NOW(), 1, 'A'),
    (13, 1, '7890123', 'Lucia', 'Garcia', 'Fernandez', '789012345', 'Calle del Bosque', 'F',NOW(), NOW(), 1, 'A'),
    (14, 1, '3456789', 'Diego', 'Sanchez', 'Lopez', '345678901', 'Avenida del Cielo', 'M',NOW(), NOW(), 1, 'A'),
    (15, 1, '9012345', 'Julia', 'Fernandez', 'Martinez', '901234567', 'Calle del Aire', 'F',NOW(), NOW(), 1, 'A'),
    (16, 1, '4567891', 'Mateo', 'Gomez', 'Sanchez', '456789012', 'Avenida del Sol','M', NOW(), NOW(), 1, 'A'),
    (17, 1, '0123456', 'Valentina', 'Perez', 'Gomez', '012345678', 'Calle de la Luna', 'F',NOW(), NOW(), 1, 'A'),
    (18, 1, '6789012', 'Daniel', 'Garcia', 'Martinez', '678901234', 'Avenida del Campo','M', NOW(), NOW(), 1, 'A'),
    (19, 1, '3210987', 'Camila', 'Martinez', 'Sanchez', '321098765', 'Calle de la Montaña','F', NOW(), NOW(), 1, 'A'),
    (20, 1, '1234567', 'Santiago', 'Lopez', 'Garcia', '123456789', 'Avenida del Rio','M', NOW(), NOW(), 1, 'A');



    CREATE TABLE usuarios(
        id_usuario INT NOT NULL AUTO_INCREMENT,
        id_persona INT NOT NULL,
        usuario1 VARCHAR(30)NOT NULL,
        clave VARCHAR(100)NOT NULL,
        fec_insercion TIMESTAMP NOT NULL,
        fec_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
        usuario INT NOT NULL,
        estado CHAR(1) NOT NULL,
        PRIMARY KEY(id_usuario), 
        FOREIGN KEY(id_persona) REFERENCES personas(id_persona)
    
    )ENGINE=INNODB;

    INSERT INTO usuarios VALUES(1,1,'admin','$2y$10$HxB1sZ3p/ok/Aa3cyATcsuGZoUrZzW5.TtmaiYh61S38axFgKVmXK',now(),now(),1,'A');
    INSERT INTO usuarios VALUES(2,2,'admin2','$2y$10$ATVM8FL.ntU612HIwnDbvuk.eAtjbyxH7spoHqpgQ/SUSqHdX7F0S',now(),now(),2,'A');
    INSERT INTO usuarios VALUES(3,3,'admin3','$2y$10$h0DsBgaEJ82CTQmZTvhBx.xEh96COINMbqsvSITOxk4th7B2.6mlu',now(),now(),3,'A');



    CREATE TABLE roles(
    id_rol INT NOT NULL AUTO_INCREMENT,
    rol VARCHAR(25),
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_rol)
    )ENGINE=INNODB;

    INSERT INTO roles VALUES(1,'ADMINISTRADOR',now(),now(),1,'A');
    INSERT INTO roles VALUES(2,'ADMINISTRADOR2',now(),now(),2,'A');
    INSERT INTO roles VALUES(3,'ADMINISTRADOR3',now(),now(),3,'A');

    CREATE TABLE usuarios_roles(
    id_usuario_rol INT NOT NULL AUTO_INCREMENT,
    id_usuario  INT NOT NULL,
    id_rol INT NOT NULL,
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_usuario_rol),
    FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY(id_rol) REFERENCES roles(id_rol)
    )ENGINE=INNODB;

    INSERT INTO usuarios_roles VALUES(1,1,1,now(),now(),1,'A');
    INSERT INTO usuarios_roles VALUES(2,2,2,now(),now(),2,'A');
    INSERT INTO usuarios_roles VALUES(3,3,3,now(),now(),3,'A');

    CREATE TABLE grupos(
    id_grupo INT NOT NULL AUTO_INCREMENT,
    grupo VARCHAR(15),
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_grupo)
    )ENGINE=INNODB;

    INSERT INTO grupos VALUES(1,'HERAMIENTAS',now(),now(),1,'A');
    INSERT INTO grupos VALUES(2,'ZOOLOGICO',now(),now(),1,'A');
    INSERT INTO grupos VALUES(3,'REPORTES',now(),now(),1,'A');
    INSERT INTO grupos VALUES(4,'RPT ESTADISTICOS',now(),now(),1,'A');
    INSERT INTO grupos VALUES(5,'TERCER BIMESTRE-BDII',now(),now(),1,'A');
    


    CREATE TABLE opciones(
    id_opcion INT NOT NULL AUTO_INCREMENT,
    id_grupo INT NOT NULL,
    opcion VARCHAR (80),
    contenido VARCHAR (80),
    orden VARCHAR(8),
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_opcion),
    FOREIGN KEY(id_grupo) REFERENCES grupos(id_grupo)
    )ENGINE=INNODB;

    INSERT INTO opciones VALUES(1,1,'personas','../privada/personas/personas.php','10',now(),now(),1,'A');
    INSERT INTO opciones VALUES(2,1,'usuarios','../privada/usuarios/usuarios.php','20',now(),now(),1,'A');
    INSERT INTO opciones VALUES(3,1,'grupos','../privada/grupos/grupos.php','30',now(),now(),1,'A');
    INSERT INTO opciones VALUES(4,1,'roles','../privada/roles/roles.php','40',now(),now(),1,'A');
    INSERT INTO opciones VALUES(5,1,'Usuarios Roles','../privada/usuarios_roles/usuarios_roles.php','50',now(),now(),1,'A');
    INSERT INTO opciones VALUES(6,1,'Opciones','../privada/opciones/opciones.php','60',now(),now(),1,'A');
    INSERT INTO opciones VALUES(7,1,'Accesos','../privada/accesos/accesos.php','70',now(),now(),1,'A');
    INSERT INTO opciones VALUES(8,2,'Datos_zoologico','../privada/datos_zoologico/datos_zoologico_modificar.php','10',now(),now(),1,'A');
    INSERT INTO opciones VALUES(9,2,'Visitantes','../privada/visitantes/visitantes.php','10',now(),now(),1,'A');
    INSERT INTO opciones VALUES(10,2,'Registros_visitas','../privada/registros_visitas/registros_visitas.php','10',now(),now(),1,'A');
    INSERT INTO opciones VALUES(11,2,'Alimentos','../privada/alimentos/alimentos.php','20',now(),now(),1,'A');
    INSERT INTO opciones VALUES(12,2,'Animales','../privada/animales/animales.php','30',now(),now(),1,'A');
    INSERT INTO opciones VALUES(13,2,'Alimentos_animales','../privada/alimentos_animales/alimentos_animales.php','10',now(),now(),1,'A');
    INSERT INTO opciones VALUES(14,2,'Tipos_animales','../privada/tipos_animales/tipos_animales.php','20',now(),now(),1,'A');
    INSERT INTO opciones VALUES(15,2,'Cuidadores','../privada/cuidadores/cuidadores.php','40',now(),now(),1,'A');
    INSERT INTO opciones VALUES(16,2,'Cuidadores_animales','../privada/cuidadores_animales/cuidadores_animales.php','50',now(),now(),1,'A');
    INSERT INTO opciones VALUES(17,2,'Jaulas','../privada/jaulas/jaulas.php','60',now(),now(),1,'A');
    INSERT INTO opciones VALUES(18,2,'Jaulas_animales','../privada/jaulas_animales/jaulas_animales.php','10',now(),now(),1,'A');
    INSERT INTO opciones VALUES(19,2,'Limpiadores','../privada/limpiadores/limpiadores.php','10',now(),now(),1,'A');
    INSERT INTO opciones VALUES(20,2,'Limpiadores_jaulas','../privada/limpiadores_jaulas/limpiadores_jaulas.php','10',now(),now(),1,'A');

    INSERT INTO opciones VALUES(21,3,'Rpt Personas con Usuarios','../privada/reportes/personas_usuarios.php ','10',now(),now(),1,'A');
    INSERT INTO opciones VALUES(22,3,'Rpt Personas por fechas','../privada/reportes/personas_fechas.php ','10',now(),now(),1,'A');
    INSERT INTO opciones VALUES(23,3,'Rpt visitas con zoologico','../privada/reportes_visitas/registros_visitas.php ','20',now(),now(),1,'A');
    INSERT INTO opciones VALUES(24,3,'Rpt cuidadores','../privada/reportes_cuidadores_animales/cuidadores_animales.php ','20',now(),now(),1,'A');
    INSERT INTO opciones VALUES(25,3,'Rpt Personas con genero','../privada/reportes_personas_genero/personas_genero.php ','20',now(),now(),1,'A');
    INSERT INTO opciones VALUES(26,3,'Rpt Visitantes con pais origen','../privada/reportes_visitantes_pais_origen/visitantes_pais_origen.php ','20',now(),now(),1,'A');
    INSERT INTO opciones VALUES(27,3,'Rpt Ficha tecnica','../privada/reportes_ficha_tecnica/ficha_tec_personas.php ','20',now(),now(),1,'A');
    INSERT INTO opciones VALUES(28,3,'Rpt Ficha tecnica cuidadores','../privada/reportes_ficha_tecnica_cuidadores/ficha_tec_cuidadores.php ','20',now(),now(),1,'A');



    INSERT INTO opciones VALUES(29,2,'Visitantes','../privada/visitantes/visitantes.php','10',now(),now(),2,'A');
    INSERT INTO opciones VALUES(30,2,'Registros_visitas','../privada/registros_visitas/registros_visitas.php','10',now(),now(),2,'A');
    INSERT INTO opciones VALUES(31,2,'Alimentos','../privada/alimentos/alimentos.php','20',now(),now(),2,'A');
    INSERT INTO opciones VALUES(32,2,'Animales','../privada/animales/animales.php','30',now(),now(),2,'A');
    INSERT INTO opciones VALUES(33,2,'Alimentos_animales','../privada/alimentos_animales/alimentos_animales.php',10,now(),now(),2,'A');
    INSERT INTO opciones VALUES(34,2,'Tipos_animales','../privada/tipos_animales/tipos_animales.php','20',now(),now(),2,'A');



    INSERT INTO opciones VALUES(35,2,'Cuidadores_animales','../privada/cuidadores_animales/cuidadores_animales.php','50',now(),now(),3,'A');
    INSERT INTO opciones VALUES(36,2,'Jaulas','../privada/jaulas/jaulas.php','60',now(),now(),3,'A');
    INSERT INTO opciones VALUES(37,2,'Jaulas_animales','../privada/jaulas_animales/jaulas_animales.php','10',now(),now(),3,'A');
    INSERT INTO opciones VALUES(38,2,'Limpiadores','../privada/limpiadores/limpiadores.php','10',now(),now(),3,'A');
    INSERT INTO opciones VALUES(39,2,'Limpiadores_jaulas','../privada/limpiadores_jaulas/limpiadores_jaulas.php','10',now(),now(),3,'A');

    INSERT INTO opciones VALUES(40,3,'Rpt Personas con Usuarios','../privada/reportes/personas_usuarios.php ','10',now(),now(),3,'A');
    INSERT INTO opciones VALUES(41,3,'Rpt Personas por fechas','../privada/reportes/personas_fechas.php ','10',now(),now(),3,'A');
    INSERT INTO opciones VALUES(42,3,'Rpt visitas con zoologico','../privada/reportes_visitas/registros_visitas.php ','20',now(),now(),3,'A');
    INSERT INTO opciones VALUES(43,3,'Rpt cuidadores','../privada/reportes_cuidadores_animales/cuidadores_animales.php ','20',now(),now(),3,'A');
    INSERT INTO opciones VALUES(44,5,'Rpt MICROS POR SOCIO','../privada/reportes_micros_socios/micros_socios.php ','20',now(),now(),1,'A');
    INSERT INTO opciones VALUES(45,3,'Rpt Ficha tecnica visitantes','../privada/reportes_ficha_tecnica_visitantes/ficha_tec_visitantes.php ','20',now(),now(),1,'A');
    INSERT INTO opciones VALUES(46,5,'Ficha Técnica micros','../privada/ficha_tecnica_micros/ficha_tec_micros.php ','20',now(),now(),1,'A');
    INSERT INTO opciones VALUES(47,4,'Rpt estadisticos','../privada/graficos_estadisticos/reportes_estadisticos.php','20',now(),now(),1,'A');
    INSERT INTO opciones VALUES(48,4,'Rpt estadisticos zoologico','../privada/graficos_estadisticos1/reportes_estadisticos1.php','20',now(),now(),1,'A');





    CREATE TABLE accesos(
    id_acceso INT NOT NULL AUTO_INCREMENT,
    id_opcion INT NOT NULL,
    id_rol INT NOT NULL,
    fecha_insercion TIMESTAMP NOT NULL,
    fecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    usuario INT NOT NULL,
    estado CHAR(1) NOT NULL,
    PRIMARY KEY(id_acceso),
    FOREIGN KEY(id_rol) REFERENCES roles(id_rol)
    )ENGINE=INNODB;

    INSERT INTO accesos VALUES(1,1,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(2,2,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(3,3,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(4,4,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(5,5,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(6,6,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(7,7,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(8,8,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(9,9,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(10,10,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(11,11,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(12,12,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(13,13,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(14,14,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(15,15,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(16,16,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(17,17,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(18,18,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(19,19,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(20,20,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(21,21,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(22,22,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(23,23,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(24,24,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(25,25,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(26,26,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(27,27,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(28,28,1,now(),now(),1,'A');


    
    INSERT INTO accesos VALUES(29,29,3,now(),now(),3,'A');
    INSERT INTO accesos VALUES(30,30,3,now(),now(),3,'A');
    INSERT INTO accesos VALUES(31,31,3,now(),now(),3,'A');
    INSERT INTO accesos VALUES(32,32,3,now(),now(),3,'A');
    INSERT INTO accesos VALUES(33,33,3,now(),now(),3,'A');
    INSERT INTO accesos VALUES(34,34,3,now(),now(),3,'A');
    INSERT INTO accesos VALUES(35,35,3,now(),now(),3,'A');
    INSERT INTO accesos VALUES(36,36,3,now(),now(),3,'A');
    INSERT INTO accesos VALUES(37,37,3,now(),now(),3,'A');
    INSERT INTO accesos VALUES(38,38,3,now(),now(),3,'A');
    INSERT INTO accesos VALUES(39,39,3,now(),now(),3,'A');
    INSERT INTO accesos VALUES(40,40,3,now(),now(),3,'A');
    INSERT INTO accesos VALUES(41,41,3,now(),now(),3,'A');
    INSERT INTO accesos VALUES(42,42,3,now(),now(),3,'A');
    INSERT INTO accesos VALUES(43,43,3,now(),now(),3,'A');
    INSERT INTO accesos VALUES(44,44,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(45,45,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(46,46,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(47,47,1,now(),now(),1,'A');
    INSERT INTO accesos VALUES(48,48,1,now(),now(),1,'A');







/*----------------------------------------------------------------------------------------------------------------------*/

CREATE VIEW vista_per_usu AS
SELECT CONCAT_WS(' ',pe.nombres,pe.ap,pe.am) AS persona, usu.usuario
FROM personas pe
INNER JOIN usuarios usu ON pe.id_persona=usu.id_persona
WHERE pe.estado='A'
AND usu.estado='A'
ORDER BY usu.id_persona;

/*SELECT *FROM vista_per_usu;*/

CREATE VIEW vista_zoologico AS
SELECT logozoologico,nombre
FROM zoologico
WHERE estado='A';


/*SELECT *FROM vista_zoologico;*/

CREATE VIEW _cuidadores1 AS

SELECT CONCAT_WS(' ', c.nombres, c.ap, c.am) AS nombre_completo,
       DATEDIFF(CURRENT_DATE(), c.fecha_inicio) AS dias_trabajados,
       a.nombre_ani AS animal_cuidado
FROM cuidadores c
JOIN cuidadores_animales ca ON c.id_cuidador = ca.id_cuidador
JOIN animales a ON ca.id_animal = a.id_animal
WHERE c.estado = 'A' AND a.estado = 'A' AND c.genero = 'M';

/*SELECT *FROM _cuidadores1;*/

CREATE VIEW vistas_visitas AS

SELECT CONCAT_WS(' ', vi.nombre, vi.ap, vi.am) AS nombre_completo, 
       vi.pais_origen, 
       rv.fecha_visita,
       (
           SELECT COUNT(*)
           FROM registro_visitas
           WHERE id_visitante = vi.id_visitante
       ) AS total_visitas
FROM visitantes AS vi
INNER JOIN registro_visitas AS rv ON vi.id_visitante = rv.id_visitante 
AND vi.estado = 'A' AND rv.estado = 'A'
AND fecha_visita >= '2020-01-01';


/*SELECT *FROM vistas_visitas;*/




/*_personas_indices*/

CREATE VIEW vista_personas AS 
SELECT ci, nombres, ap, telefono
FROM personas
WHERE estado = 'A';



/*consulta*/

/*SELECT * 
FROM vista_personas;*/


CREATE VIEW visitas_zoologico AS

SELECT CONCAT_WS(' ', vi.nombre, vi.ap, vi.am) AS nombre_completo, 
       vi.pais_origen, 
       rv.fecha_visita,
       (
           SELECT COUNT(*)
           FROM registro_visitas
           WHERE id_visitante = vi.id_visitante
       ) AS total_visitas
FROM visitantes AS vi
INNER JOIN registro_visitas AS rv ON vi.id_visitante = rv.id_visitante 
AND vi.estado = 'A' AND rv.estado = 'A'
AND fecha_visita >= '2020-01-01';



CREATE VIEW _cuidadores AS

SELECT CONCAT_WS(' ', c.nombres, c.ap, c.am) AS nombre_completo,
       DATEDIFF(CURRENT_DATE(), c.fecha_inicio) AS dias_trabajados,
       a.nombre_ani AS animal_cuidado
FROM cuidadores c
JOIN cuidadores_animales ca ON c.id_cuidador = ca.id_cuidador
JOIN animales a ON ca.id_animal = a.id_animal
WHERE c.estado = 'A' AND a.estado = 'A' AND c.genero = 'M';



CREATE VIEW limpieza_jaulas AS

SELECT CONCAT_WS(' ', li.nombres, li.ap, li.am) AS nombre_completo, lj.fecha_limpieza
FROM limpiadores li, limpiadores_jaulas lj
WHERE li.id_limpiador = lj.id_limpiador
AND li.estado = 'A' AND lj.estado = 'A'
ORDER BY nombre_completo;



/*--------------------------------------------------------------------------*/
/*--------------------------------------------------------------------------*/
DELIMITER //
CREATE FUNCTION contar_registros()
   RETURNS INT
   BEGIN 
   DECLARE resultado INT;

    SELECT COUNT(id_persona) INTO resultado
    FROM personas 
    WHERE estado = 'A';

    RETURN resultado;

    END //
DELIMITER ;*/


/*SELECT contar_registros() AS 'NUMERO DE REGISTROS DE PERSONAS';

/*----------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------*/

DELIMITER //

CREATE FUNCTION promedio_hora_entrada()
RETURNS TIME
BEGIN
    DECLARE promedio_hora_entrada TIME;

    SELECT SEC_TO_TIME(AVG(TIME_TO_SEC(hora_entrada))) INTO promedio_hora_entrada
    FROM registro_visitas;

    RETURN promedio_hora_entrada;

END //

DELIMITER ;

/*SELECT promedio_hora_entrada() AS 'PROMEDIO DE ENTRADA DE LOS VISITANTES';*/

/*----------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------*/

DELIMITER //

CREATE FUNCTION fecha_nacimiento_cuidador(id_cuidador INT)
   RETURNS DATE
   BEGIN 
   DECLARE fecha_nacimiento_resultado DATE;

    SELECT fecha_nacimiento INTO fecha_nacimiento_resultado
    FROM Cuidadores
    WHERE id_cuidador = id_cuidador AND estado = 'A'
    LIMIT 1;

    RETURN fecha_nacimiento_resultado;

    END //

DELIMITER ;

/*SELECT fecha_nacimiento_cuidador(1) AS 'FECHA NACIMIENTO DE CUIDADOR';*/



/*----------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------*/

/*--------------------------------------------------------------------------*/
DELIMITER //
  CREATE PROCEDURE listado_personas_fechas (IN f_inicio DATE, IN f_fin DATE)
   BEGIN

   SELECT *
   FROM personas
   WHERE fec_insercion BETWEEN f_inicio AND f_fin
   AND estado ='A';

   END //

DELIMITER ;

/*CALL listado_personas_fechas('2024-06-02', '2024-07-02');*/



/*--------------------------------------------------------------------------*/

DELIMITER //
  CREATE PROCEDURE listado_animales ()
   BEGIN

   SELECT *
   FROM animales
   WHERE sexo_ani = 'M'
   AND estado ='A';

   END //
DELIMITER ;

/*CALL listado_animales();*/



/*--------------------------------------------------------------------------*/

DELIMITER //
  CREATE PROCEDURE listado_limpiadores ()
   BEGIN

   SELECT *
   FROM limpiadores
   WHERE nombres LIKE 'L%'
   AND estado ='A';

   END //
DELIMITER ;

/*CALL listado_limpiadores_inicial();*/



/*---------------------------------trigger-----------------------------------------*/




























