create database Setores;

use Setores;

create table Setor (
    codigo int primary key,
    nome varchar(50) not null
);

create table Empregado (
    cpf varchar(11) primary key,
    nome varchar(80),
    
    codigo_setor int, -- Relação lotado
    foreign key(codigo_setor) references Setor(codigo)
);

create table Engenheiro (
    cpf varchar(11) primary key,
    numero_de_registro int unique not null,
    
    foreign key(cpf) references Empregado(cpf)
);

create table Programador (
    cpf varchar(11) primary key,
    especialidade varchar(70),
    
    foreign key(cpf) references Empregado(cpf)
);

create table Projeto (
    codigo int primary key,
    nome varchar(100)
);

create table Engenheiro_Coordena_Projeto (
    codigo_projeto int primary key,
    registro_engenheiro int unique,
    data_coordenacao date,
    
    foreign key(codigo_projeto) references Projeto(codigo),
    foreign key(registro_engenheiro) references Engenheiro(numero_de_registro)
);

create table Programador_Participa_Projeto (
    cpf_programador varchar(11),
    codigo_projeto int,
    primary key(cpf_programador, codigo_projeto),
    
    data_participacao date,
    
    foreign key(codigo_projeto) references Projeto(codigo),
    foreign key(cpf_programador) references Programador(cpf)
);

create table Linguagem_de_Programacao (
    nome varchar(20) primary key,
    multiplataforma boolean,
    aberta boolean
    
);

create table Programador_Domina_Linguagem (
    cpf_programador varchar(11),
    linguagem varchar(20),
    primary key(cpf_programador, linguagem),
    
    foreign key(cpf_programador) references Programador(cpf),
    foreign key(linguagem) references Linguagem_de_Programacao(linguagem)
);











