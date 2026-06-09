-- Active: 1779300045691@@mysql-2334abba-mysql-1234.e.aivencloud.com@22061@cinema
SELECT F.nome_filme as Filme, S.data_hora as Horario, sala.id_sala as Sala
FROM filme as F
JOIN sessao as S ON F.id_filme=S.id_filme_sessao
JOIN sala ON S.id_sala_sessao=sala.id_sala
GROUP BY F.nome_filme, S.data_hora, sala.id_sala;