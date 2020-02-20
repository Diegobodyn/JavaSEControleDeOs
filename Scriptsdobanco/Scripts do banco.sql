-- Comentários de ajustes no banco Diego Henrique
create table tbusuarios(
iduser int primary key, 
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);

-- o comando abaixo descreve a tabela
describe tbusuarios;

-- a linha abaixo insere dados na tabela (CRUD)
insert into tbusuarios(iduser,usuario,fone,login,senha)
values (1,'Diego Henrique', '99865-9434', 'diego', '123456');
-- a linha abaixo consulta 

insert into tbusuarios(iduser,usuario,fone,login,senha)
values (2,'Administrador', '99865-0000', 'admin', 'admin');
-- a linha abaixo consulta 
select * from tbusuarios;

create table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fonecli varchar(50) not null,
emailcli varchar(50)
);

describe tbclientes;

insert into tbclientes (nomecli, endcli, fonecli, emailcli)
values('Linus Torvalds', 'Rua Tux, 2015','9999-9998', 'linus@gmail.com');

select * from tbclientes;

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150) not null,
servico varchar(150),
tecnico varchar (30),
valor decimal(10,2),
idcli int not null, 
foreign key(idcli) references tbclientes(idcli) 
);

describe tbos;
select * from tbos;

insert into tbos(equipamento, defeito, servico, tecnico, valor, idcli)
values('Notebook', 'Não liga', 'troca da fonte', 'Ze', 87.50,1);

select 
O.os, O.equipamento, O.defeito, O.servico, O.valor,
C.nomecli, C.fonecli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);
