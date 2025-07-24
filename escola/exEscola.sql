CREATE DATABASE if not exists exEscola;
USE exEscola;

-- Tabelas e atributos --
create table if not exists Campus (
    codigo int primary key,
    
    endereço varchar(100) not null,
    cidade varchar(100) not null
);


create table if not exists Professor (
    matricula int primary key,
    
    nome varchar(80) not null,
    titulacao varchar(50),
    
    codigo_campus int not null,
    foreign key(codigo_campus) references Campus(codigo)    
);


create table if not exists Notebook (
    codigo int primary key,
    
    data_compra date,
    
    codigo_campus int not null,
    foreign key(codigo_campus) references Campus(codigo)
);


create table if not exists Turma (
    codigo int primary key,
    
    semestre int,
    
    codigo_campus int not null,
    foreign key(codigo_campus) references Campus(codigo)
);


create table if not exists Aluno (
    matricula int primary key,
    
    nome varchar(80) not null,
    rendimento decimal(3, 1),
    
    codigo_turma int not null,
    foreign key(codigo_turma) references Turma(codigo)
);


-- Relacionamentos --
create table Professor_Leciona_Turma (
    matricula_professor int,
    codigo_turma int,
    primary key(matricula_professor, codigo_turma),
    
    foreign key (matricula_professor) references Professor(matricula),
    foreign key (codigo_turma) references Turma(codigo)
);


create table Professor_Adquire_Notebook (
    codigo_notebook int primary key,
    matricula_professor int unique,
    
    data_aquisicao date,
    
    foreign key (matricula_professor) references Professor(matricula),
    foreign key (codigo_notebook) references Notebook(codigo)
);



describe Campus;
describe Professor;
describe Turma;
describe Professor_Leciona_Turma;
describe Aluno;
describe Notebook;
describe Professor_Adquire_Notebook;
