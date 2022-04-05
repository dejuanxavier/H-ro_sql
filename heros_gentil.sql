DROP TABLE IF EXISTS heros;
DROP TABLE IF EXISTS armes;
DROP TABLE IF EXISTS competences;
DROP TABLE IF EXISTS herocompetence;


CREATE TABLE heros (
    `ID` tinyint(1) NOT NULL,
    `Nom` varchar(50) NOT NULL,
    `PV` tinyint(2) NOT NULL,
    `Bonus` tinyint(2) NOT NULL,
    `Defense` tinyint(2) NOT NULL,
    `ArmeEnMain` tinyint(2) DEFAULT NULL,
    `Statut` varchar(100) NOT NULL,
    `Immunite` varchar(20) NOT NULL
);

CREATE TABLE armes (
    `ID` tinyint(1) NOT NULL,
    `HerosID` tinyint(1) NOT NULL,
    `Nom` varchar(50) NOT NULL,
    `Type` varchar(20) NOT NULL,
    `Degat` tinyint(2) NOT NULL
);


CREATE TABLE competences (
    `ID` tinyint(1) NOT NULL,
    `Type` ENUM('Statut', 'PV', 'Defense',
    'Bonus', 'ArmeEnMain', 'Immunite'),
    `Effet` varchar(50)
);



INSERT INTO heros (ID, Nom, PV, Bonus, Defense, ArmeEnMain, Statut, Immunite)
    VALUES
        (1, 'Comar', 40, 2, 15, NULL, 'le joyeux', 'mousse'),
        (2, 'Kirderf', 35, 14, 5, NULL, 'le combatif', 'aucun'),
        (3, 'Luijen', 45, 5, 8, NULL, 'le flegme', 'destabilisant');



INSERT INTO armes (ID, HerosID, Nom, Type, Degat)
    VALUES
        (1, 0, 'batte', 'mousse', 0),
        (2, 0, 'vanne de Liujen', 'destabilisant', 10),
        (3, 0, 'Microsoft', 'effrayant', 20),
        (4, 0, 'feuille', 'tranchant', 5),
        (5, 0, 'caillou', 'contondant', 5),
        (6, 0, 'ciseau', 'percant', 5);

INSERT INTO competences (ID, Type, Effet)
    VALUES
        (1, 'Bonus', 'Couuyyèèère'),
        (2, 'Bonus', 'la trot magique'),
        (3, 'Bonus', 'feutoutflamme');


ALTER TABLE heros 
    ADD PRIMARY KEY (ID);

ALTER TABLE competences
    ADD PRIMARY KEY (ID);

ALTER TABLE armes
    ADD FOREIGN KEY fk_armes(HerosID)
    REFERENCES heros(ID);

CREATE TABLE herocompetence (
    `heroID`tinyint(1) NOT NULL,
    `compID`tinyint(1) NOT NULL
);

ALTER TABLE herocompetence
    ADD CONSTRAINT fk_heros
    FOREIGN KEY (heroID)
    REFERENCES heros(ID);


ALTER TABLE herocompetence
    ADD CONSTRAINT fk_competences
    FOREIGN KEY (compID)
    REFERENCES competences(ID);

