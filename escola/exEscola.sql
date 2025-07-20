CREATE DATABASE if not exists exEscola;
USE exEscola;

-- Tabelas e atributos --
create table if not exists Campus (
    codigo int primary key,
    
    endereço varchar(100),
    cidade varchar(100)
);


create table if not exists Professor (
    matricula int primary key,
    
    nome varchar(80),
    titulacao varchar(50),
    
    codigo_campus int,
    foreign key(codigo_campus) references Campus(codigo)    
);


create table if not exists Notebook (
    codigo int primary key,
    
    data_compra date,
    
    codigo_campus int,
    foreign key(codigo_campus) references Campus(codigo)
);


create table if not exists Turma (
    codigo int primary key,
    
    semestre int,
    
    codigo_campus int,
    foreign key(codigo_campus) references Campus(codigo)
);


create table if not exists Aluno (
    matricula int primary key,
    
    nome varchar(80),
    rendimento decimal(3, 1)
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


create table Aluno_Turmas (
    matricula_aluno int,
    codigo_turma int,
    primary key(matricula_aluno, codigo_turma),
    
    foreign key (matricula_aluno) references Aluno(matricula),
    foreign key (codigo_turma) references Turma(codigo)
);

describe Campus;
describe Professor;
describe Turma;
describe Professor_Leciona_Turma;
describe Aluno;
describe Notebook;
describe Professor_Adquire_Notebook;
describe Aluno_turmas;
