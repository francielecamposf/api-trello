// Escreva a consulta SQL para listar o nome de todos os alunos

SELECT a.nome AS aluno_nome
FROM aluno a
JOIN cursa c ON a.codA = c.codA
JOIN disciplina d ON m.codD = d.codD
JOIN leciona l ON d.codD = l.codD
JOIN professor p ON e.codP = p.codP
WHERE d.nome = 'Cálculo'
AND p.nome = 'João';

// Escreva a consulta SQL para exibir a quantidade de alunos por disciplinas

SELECT d.nome AS disciplina_nome, COUNT(c.codA) AS quantidade_alunos
FROM disciplina d
JOIN cursa c ON d.codD = c.codD
GROUP BY d.nome;

// Escreva a consulta SQL para listar as disciplinas que todos os professores
lecionam.

SELECT d.nome AS disciplina_nome
FROM disciplina d
JOIN leciona l ON d.codD = l.codD
GROUP BY d.nome
HAVING COUNT(l.codP) = (SELECT COUNT(*) FROM professor);

// Escreva a consulta SQL que exibe o total de professores.

SELECT COUNT(*) AS total_professores
FROM professor;

// Escreva a consulta SQL para listar todos os alunos que cursaram alguma
disciplina do ano 2000 até 2020

SELECT DISTINCT a.nome AS aluno_nome
FROM aluno a
JOIN cursa c ON a.codA = c.codA
JOIN disciplina d ON c.codD = d.codD
WHERE d.ano BETWEEN 2000 AND 2020;

