use tiendaonline;

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    fecha_registro DATE NOT null,
    pais VARCHAR(50)
);


CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

create table pedidos (
id_pedido INT primary key auto_increment,
id_cliente INT,
fecha_pedido DATETIME not null,
total decimal(10,2) not null,
estado VARCHAR(20) default 'pendiente',
foreign key (id_cliente) references clientes(id_cliente)

);

insert into categorias (nombre) values
('Electrónica'), ('Ropa'), ('Hogar'), ('Juguetes');

INSERT INTO clientes (nombre, email, fecha_registro, pais) VALUES
('Ana García', 'ana@email.com', '2023-01-15', 'Colombia'),
('Carlos López', 'carlos@email.com', '2023-02-20', 'México'),
('María Rodríguez', 'maria@email.com', '2023-03-05', 'España'),
('Juan Pérez', 'juan@email.com', '2023-03-10', 'Colombia');

INSERT INTO productos (nombre, precio, stock, id_categoria) VALUES
('Laptop Pro', 1200.50, 15, 1),
('Smartphone X', 800.00, 30, 1),
('Camiseta Algodón', 15.99, 100, 2),
('Pantalón Jean', 35.50, 50, 2),
('Licuadora', 45.00, 20, 3),
('Set de Lego', 55.99, 10, 4);

INSERT INTO pedidos (id_cliente, fecha_pedido, total, estado) VALUES
(1, '2023-04-01 10:30:00', 1216.49, 'Entregado'),
(2, '2023-04-05 14:15:00', 35.50, 'Pendiente'),
(1, '2023-04-10 09:00:00', 800.00, 'Enviado'),
(3, '2023-04-15 16:45:00', 100.99, 'Pendiente');

select nombre,pais from clientes where pais = 'Colombia';

select nombre, precio from productos where precio > 50;


select nombre, stock from productos where stock <= 20;

select nombre from productos where nombre <> 'licuadora' ;

select nombre, precio, stock from productos where precio < 100 and stock>20;

select nombre, pais from clientes where pais = 'Colombia' or pais = 'México';

select * from categorias where nombre in ('Electrónica', 'Hogar');

select nombre, precio from productos where precio >=20 and precio <=100;

select * from clientes where email like '%email.com' #% finalice en email

select * from productos where nombre like 'l%' #empiece l % - % contiene

select * from clientes where nombre like '%a%' and pais = 'Colombia'

select nombre, precio from productos order by precio asc

select * from productos where nombre like '%a%' and precio >50 and stock >10 order by nombre asc limit 3

select concat(nombre, '(-',pais,'-)') as extranjero from clientes

select upper(email)as mayus, lower(nombre) as min from clientes

select length(nombre) as letras from categorias


select nombre, precio, round (precio,1) as REDONDEO ,
ceil(precio) as redondeo_arriba,
floor(precio) as redondeo_abajo
from productos;

select year(fecha_pedido) as anio, month(fecha_pedido) as mes , day(fecha_pedido) as dia from pedidos

select DATEDIFF(now(),fecha_pedido) from pedidos 

select upper(nombre), lower(email), year(fecha_registro) from clientes order by pais asc

select id_categoria ,precio from productos p where p.id_categoria >1 and precio between 800 and 2000


select nombre, precio,
case 
	when precio<20 then 'economico'
    when precio between 20 and 100 then 'normal'
    else 'caro'    
end as categroia_precio
from productos

select id_cliente, estado,
case estado
	when  'entregado' then 'pedido entregado'
	when  'pendiente' then 'esperando confirmacion'
	else 'esperando que llegue'
end as informacion_adicional
from pedidos

select count(*) as Total_clientes from clientes

select 
sum(stock) as suma_stock,
avg (precio) as precio_promedio,
min(precio) as precio_minimo,
max(precio) as precio_maximo
from productos 

select  count(*) as productos_categoria from productos group by id_categoria ;

select nombre, precio
from productos
where precio > (select avg(precio) from productos)


#clientes que hayan hecho al menos un pedido sin join
select * from clientes
where id_cliente in (select id_cliente from pedidos)
  

