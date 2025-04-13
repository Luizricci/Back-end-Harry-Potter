CREATE DATABASE hp 

\c hp

CREATE TABLE houses (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    founder VARCHAR(100) NOT NULL
);

CREATE TABLE wizards (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    image VARCHAR(255),
    house_id INTEGER REFERENCES houses(id) ON DELETE SET NULL
);

INSERT INTO houses (name, founder) VALUES 
    ('Grifinória', 'Godric Gryffindor'),
    ('Sonserina', 'Salazar Slytherin'),
    ('Corvinal', 'Rowena Ravenclaw'),
    ('Lufa-Lufa', 'Helga Hufflepuff');

INSERT INTO wizards (name, house_id, image) VALUES 
    ('Harry Potter', 1, 'https://wallpapers.com/images/high/harry-potter-pictures-dxxvdv7ihxcr6vzr.jpg'),
    ('Draco Malfoy', 2, 'https://wallpapers.com/images/high/young-draco-malfoy-fovp1t3td6uw9gec.jpg'),
    ('Luna Lovegood', 3, 'https://wallpapers.com/images/high/harry-potter-landscape-gku92nrjrhuj6v1b.jpg'),
    ('Hermione Granger', 1, 'https://wallpapers.com/images/high/hermione-granger-in-focus-shot-ofd9h99pfvjrsple.jpg');

