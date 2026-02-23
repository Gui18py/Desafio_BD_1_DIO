-- criacao de banco de dados E-commerce
create database ecommerce;
use ecommerce;

-- Criar tabela cliente
create table client(
		idClient int identity(1,1) primary key,
		Fname varchar(10),
		Mimit char(3),
		Lname varchar(20),
		CPF char(11) not null,
		ADDRes varchar(30),
		constraint unique_cpf_client UNIQUE (CPF)
		
);

-- Criar tabela produto

create table product(
		idProduct int identity(1,1) primary key,
		Pname varchar(10) not null,
		classification_kids bit default 0,
		category varchar(20) not null,
		avalicao float default 0,
		tam varchar(10),
		constraint product_category 
        check (category in ('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis'))
			
);

-- Criar tabela pagamentos

create table payments(
		idClient int,
		idPayment int primary key,
		typePayment varchar(10),
		limitAvaliable float,
		cash float,
		constraint type_payment 
        check (typePayment in ('Boleto', 'Cartão', 'Dois cartões')),
		constraint fk_payment_client foreign key (idClient) references client(idClient),

);

-- Criar tabela pedido

create table orders(
		idOrder int identity(1,1) primary key,
		idOrderClient int,
		orderStatus varchar(20) not null,
		orderDescription varchar(255),
		sendValue float default 10,
		paymentCash bit default 0,
		idPayment int,
		
		constraint order_status 
        check (orderStatus in ('Cancelado', 'Confirmado', 'Em processamento')),
		constraint fk_orders_client foreign key (idOrderClient) references client(idClient),
		constraint fk_payment foreign key (idPayment) references payments(idPayment),

);