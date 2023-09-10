-- Suppression des tables :
DROP TABLE IF EXISTS room_mission ;
DROP TABLE IF EXISTS mission ;
DROP TABLE IF EXISTS recurrence ;
DROP TABLE IF EXISTS category ;
DROP TABLE IF EXISTS room ;
DROP TABLE IF EXISTS user_house ;
DROP TABLE IF EXISTS house ;
DROP TABLE IF EXISTS "User" ;

-- Création des tables :

CREATE TABLE "User"
(
    id_user SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password CHAR(60) NOT NULL
);

CREATE TABLE house
(
    id_house SERIAL PRIMARY KEY,
    house_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL
);

CREATE TABLE user_house
(
    id_user_house SERIAL PRIMARY KEY,
    id_user INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES "User" (id_user),
    id_house INT NOT NULL,
    FOREIGN KEY (id_house) REFERENCES house (id_house)
);

CREATE TABLE room
(
    id_room SERIAL PRIMARY KEY,
    room_name VARCHAR(255) NOT NULL,
    id_house INT NOT NULL,
    FOREIGN KEY (id_house) REFERENCES house (id_house)
);

CREATE TABLE category
(
    id_category SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE recurrence
(
    id_recurrence SERIAL PRIMARY KEY,
    recurrence_type VARCHAR(100) NOT NULL
);

CREATE TABLE mission
(
    id_mission SERIAL PRIMARY KEY,
    mission_name VARCHAR(255) NOT NULL,
    description TEXT,
    last_date DATE,
    due_date DATE NOT NULL,
    recurrence INT NOT NULL,
    id_recurrence_type INT NOT NULL,
    FOREIGN KEY (id_recurrence_type) REFERENCES recurrence (id_recurrence),
    user_attributed_to INT NOT NULL,
    FOREIGN KEY (user_attributed_to) REFERENCES "User" (id_user),
    user_assign_by INT NOT NULL,
    FOREIGN KEY (user_assign_by) REFERENCES "User" (id_user),
    id_category INT NOT NULL,
    FOREIGN KEY (id_category) REFERENCES category (id_category)
);

CREATE TABLE room_mission
(
    id_room_mission SERIAL PRIMARY KEY,
    id_mission INT NOT NULL,
    FOREIGN KEY (id_mission) REFERENCES mission (id_mission),
    id_room INT NOT NULL,
    FOREIGN KEY (id_room) REFERENCES room (id_room)
);
