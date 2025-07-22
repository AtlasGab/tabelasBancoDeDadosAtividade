create database Controle_de_Acesso;
use Controle_de_Acesso;

  -- Tabelas e Atributos --
create table Tag (
	id int primary key,
    código int unique not null,
    tipo varchar(50)
);

create table Sala (
	id int primary key,
    numero int unique not null,
    nome varchar(50)
);

create table Usuario (
	id int primary key auto_increment,
    nome varchar(50) not null,
    endereco varchar(100)
);

create table Servidor (
	id_servidor int primary key,
    
    matricula varchar(50) unique not null,
    
    foreign key(id_servidor) references Usuario(id)
);

create table Externo (
	id_externo int primary key,
    matricula_supervisor int not null, -- Relação de supervisão
    
    cpf varchar(11) unique not null,
    
    foreign key(id_externo) references Usuario(id),
    foreign key(matricula_supervisor) references Servidor(matricula)
);

-- Relacionamentos --
create table Permissao_da_Sala (
	id_sala int,
    id_usuario int,
    horario time not null,
    primary key(id_sala, id_usuario, horario),
    
    foreign key(id_sala) references Sala(id),
    foreign key(id_usuario) references Usuario(id)
);

create table Usuario_Possui_Tag (
	id_tag int,
    id_usuario int,
    horario time not null,
    primary key(id_tag, id_usuario, horario),
    
    foreign key(id_tag) references Tag(id),
    foreign key(id_usuario) references Usuario(id)
);

create table Usuario_Tenta_Acessar (
	id_tag int,
    id_sala int,
    id_usuario int,
    horario time not null,
    permitido boolean,
    primary key(id_usuario, id_tag, id_sala, horario),
    
    foreign key(id_tag) references Tag(id),
    foreign key(id_sala) references Sala(id),
    foreign key(id_usuario) references Usuario(id)
);































