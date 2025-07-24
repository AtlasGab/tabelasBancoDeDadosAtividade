create database Controle_de_Acesso;
use Controle_de_Acesso;

  -- Tabelas e Atributos --
create table Tag (
    id int primary key auto_increment,
    código int unique not null,
    tipo varchar(50)
);

create table Sala (
    id int primary key auto_increment,
    numero int unique not null,
    nome varchar(50)
);

create table Usuario (
    id int primary key auto_increment,
    nome varchar(50) not null,
    endereco varchar(100)
);

create table Servidor (
    id_usuario int primary key,
    
    matricula varchar(50) unique not null,
    
    foreign key(id_usuario) references Usuario(id)
);

create table Externo (
    id_usuario int primary key,
    matricula_supervisor varchar(50) not null, -- Relação de supervisão
    
    cpf varchar(11) unique not null,
    
    foreign key(id_usuario) references Usuario(id),
    foreign key(matricula_supervisor) references Servidor(matricula)
);

-- Relacionamentos --
create table Permissao_Sala (
    id_sala int,
    id_usuario int,
    horario datetime not null,
    primary key(id_sala, id_usuario, horario),
    
    foreign key(id_sala) references Sala(id),
    foreign key(id_usuario) references Usuario(id)
);

create table Usuario_Possui_Tag (
    id_tag int,
    id_usuario int,
    horario datetime not null,
    primary key(id_tag),
    
    foreign key(id_tag) references Tag(id),
    foreign key(id_usuario) references Usuario(id)
);

create table Usuario_Tenta_Acessar (
    id_tag int,
    id_sala int,
    id_usuario int,
    horario datetime not null,
    permitido boolean,
    primary key(id_usuario, id_tag, id_sala, horario),
    
    foreign key(id_tag) references Tag(id),
    foreign key(id_sala) references Sala(id),
    foreign key(id_usuario) references Usuario(id)
);


DESCRIBE Tag;
DESCRIBE Sala;
DESCRIBE Usuario;
DESCRIBE Servidor;
DESCRIBE Externo;

DESCRIBE Permissao_Sala;
DESCRIBE Usuario_Possui_Tag;
DESCRIBE Usuario_Tenta_Acessar;
