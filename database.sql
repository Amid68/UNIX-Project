CREATE DATABASE IF NOT EXISTS dictionary;
USE dictionary;

CREATE TABLE IF NOT EXISTS words (
    id INT AUTO_INCREMENT PRIMARY KEY,
    word VARCHAR(255) NOT NULL,
    meaning TEXT NOT NULL
);

INSERT INTO words (word, meaning) VALUES 
('apple', 'A fruit'),
('book', 'A collection of pages'),
('cat', 'A small domesticated animal'),
('dog', 'A loyal pet animal'),
('elephant', 'A large mammal'),
('flower', 'A colorful plant part'),
('house', 'A place to live'),
('ice', 'Frozen water'),
('jar', 'A container for storage'),
('kite', 'A flying toy');