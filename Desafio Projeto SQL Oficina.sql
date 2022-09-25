-- criaçao do banco de dados para o cenário de Oficina


create database oficina;

use oficina;



create table clients(
		idClient int auto_increment primary key,
        Fname varchar(10),
        Minit char(3),
        Lname varchar(20),
        Databirth date,
        CPF char (11) not null,
        Address varchar (30),
        conserto varchar (30),
        revisao varchar (30),
        constraint unique_cpf_client unique (CPF)
);


create table equipedemecanicos(
		idMecanico int,
        Mname varchar(10) not null,
        Especialidade varchar(20),
        primary key (idClient)
        
);


create table orders(
		idorder int auto_increment primary key,
        Categorydeservico enum ('Conserto','Revisao') not null,
		idorderClient int,
        orderStatus enum ('Confirmado','Em Processamento','Entregue') default 'Pendente',
        orderDescription varchar(255),
        Payment float,
        constraint fk_orders_client foreign key (idorderClient) references clientes(idClient)

);


create table Maodeobra(
		idMaodeobra int auto_increment primary key,
        Descservico varchar(255),
        Totalvalues float

);



create table OrderMec(
        primary key (idMaodeobra, idorder)
        

);


