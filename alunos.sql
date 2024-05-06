-- database: :memory:
-- Criar a tabela de alunos
CREATE TABLE IF NOT EXISTS Alunos (
    ID INTEGER PRIMARY KEY,
    Nome TEXT,
    Idade INTEGER,
    Classe INTEGER,
    Nota REAL
);

INSERT INTO Alunos (nome, idade,Classe, Nota) VALUES 
('João',18,12,14),
('Miquel',16,10,15),
('Lara',15,10, 16),
('Tomas',16,11,13);
-- Remover duplicatas da tabela
DELETE FROM Alunos
WHERE ID NOT IN (
    SELECT MIN(ID)
    FROM Alunos
    GROUP BY Nome, Idade, Classe, Nota
);


SELECT nome, idade
FROM Alunos
WHERE idade > 15;

SELECT nome, Classe, Nota
FROM Alunos
WHERE Classe = 10;

SELECT AVG(Nota) AS media_notas
FROM Alunos;
SELECT nome, Nota
FROM Alunos
ORDER BY Nota DESC
LIMIT 1;
DELETE FROM Alunos
WHERE idade < 12;
SELECT nome, idade
FROM Alunos
WHERE idade = (SELECT MIN(idade) FROM Alunos);

