CREATE TABLE aeronaves (
    id SERIAL PRIMARY KEY,
    modelo VARCHAR(100) NOT NULL,
    codigo_cauda VARCHAR(10) NOT NULL UNIQUE,
	capacidade int
);

CREATE TABLE pilotos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    codigo_anac VARCHAR(6) NOT NULL UNIQUE,
	horas_voo DECIMAL(10,2) NOT NULL CHECK (horas_voo > 0)
);

CREATE TABLE passageiros (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
	email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE voos (
    id SERIAL PRIMARY KEY,
    numero_voo VARCHAR(100) NOT NULL,
    origem VARCHAR(100) NOT NULL,
	destino VARCHAR(100) NOT NULL,
	status VARCHAR(20) DEFAULT 'Agendado',
	aeronave_id int REFERENCES aeronaves(id),
	piloto_id int REFERENCES pilotos(id)
	CHECK (status IN ('Agendado', 'Em voo', 'Concluido', 'Cancelado'))
);

CREATE TABLE passagens (
    id SERIAL PRIMARY KEY,
	assento VARCHAR(4) NOT NULL,
	voo_id int REFERENCES voos(id),
	passageiro_id int REFERENCES passageiros(id),
	classe VARCHAR(20) DEFAULT 'Economica',
	CHECK (classe IN ('Economica', 'Executiva')),
	valor DECIMAL(10,2) NOT NULL CHECK (valor > 0)
);

INSERT INTO aeronaves 
(modelo, codigo_cauda, capacidade)
VALUES
('Ferrari', 'ABC-124', '35'),
('Honda', 'ABC-122', '40'),
('Turbo', 'ABC-125', '45'),
('Flash', 'ABC-126', '30'),
('Goat', 'ABC-129', '50');

INSERT INTO pilotos
(nome, codigo_anac, horas_voo)
VALUES
('beux', '943858', 12.00),
('damien', '987365', 13.00),
('ronaldo', '369754', 14.00),
('coringa', '085375', 15.00),
('thanos', '187659', 16.00);

INSERT INTO passageiros
(nome, cpf, email)
VALUES
('Joao', '94385827384', 'joao@gmail.com'),
('kratos', '98736543212', 'kratos@gmail.com'),
('cristiano', '36975432123', 'cristiano@gmail.com'),
('batman', '08537532074', 'batman@gmail.com'),
('homemaranha', '18765974356', 'homemaranha@gmail.com');

INSERT INTO voos
(numero_voo, origem, destino, status)
VALUES
('67', 'India', 'Rio grande do sul', 'Agendado'),
('24', 'Brasil', 'Argentina', 'Em voo'),
('69', 'Egito', 'Paris', 'Cancelado'),
('92', 'China', 'Madagascar', 'Concluido'),
('91', 'Gotham', 'Metropolis', 'Agendado');

INSERT INTO passagens
(assento, classe, valor)
VALUES
('1234', 'Economica', '300'),
('8536', 'Executiva', '900'),
('5347', 'Economica', '300'),
('8901', 'Executiva', '900'),
('5364', 'Economica', '300');
