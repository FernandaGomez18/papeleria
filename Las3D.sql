CREATE DATABASE Las3D;
USE Las3D;

CREATE TABLE Login(
NombreDeUsuario VARCHAR(50),
Contraseña INT);

CREATE TABLE Usuarios(
IdUsuarios INT PRIMARY KEY AUTO_INCREMENT,
Nombre VARCHAR(50),
Apellidos VARCHAR(50),
Puesto VARCHAR(50));

CREATE TABLE RegistroProducto(
IdProducto INT PRIMARY KEY AUTO_INCREMENT,
NombreProducto VARCHAR(50),
DescripcionProducto VARCHAR(50),
CantidadProducto VARCHAR(15),
precio INT); 

CREATE TABLE RegistroCompra(
IdCompra INT PRIMARY KEY AUTO_INCREMENT,
NombreCliente VARCHAR (50),
NombreEmpleado VARCHAR (50),
CantidadDeProducto VARCHAR(50),
Producto VARCHAR(50),
Fecha DATETIME,
fkIdUsuarios INT,
fkIdProducto INT,
FOREIGN KEY(fkIdUsuarios) REFERENCES Usuarios (IdUsuarios),
FOREIGN KEY(fkIdProducto) REFERENCES RegistroProducto (IdProducto)); 


CREATE TABLE Ventas(
IdVenta INT PRIMARY KEY AUTO_INCREMENT,
NombreCliente VARCHAR(50),
NombreUsuario VARCHAR(50),
Producto VARCHAR (50),
CantidadVenta VARCHAR(20),
Fecha DATETIME,
fkIdProducto INT,
fkIdCompra INT,
FOREIGN KEY(fkIdProducto) REFERENCES RegistroProducto (IdProducto),
FOREIGN KEY(fkIdCompra) REFERENCES RegistroCompra (IdCompra)); 


delimiter $$
DROP PROCEDURE if EXISTS p_insertarLogin;
CREATE PROCEDURE p_insertarLogin(
IN p_NombreDeUsuario VARCHAR(50),
in p_Contraseña INT
)
BEGIN
   DECLARE x INT;
   SELECT COUNT(*) FROM Login WHERE  NombreDeUsuario=p_NombreDeUsuario INTO x;
   if X=0 AND p_NombreDeUsuario<0 then
    INSERT INTO Login VALUES(p_NombreDeUsuario,p_Contraseña);
    ELSE  if X=0 AND p_NombreDeUsuario>0 then
    UPDATE Login SET Contraseña=p_Contraseña WHERE NombreDeUsuario=p_NombreDeUsuario;
    else
    UPDATE Login SET Contraseña=p_Contraseña WHERE NombreDeUsuario=p_NombreDeUsuario;
    END if;
    END if;
END;; $$


delimiter $$
DROP PROCEDURE if EXISTS p_EliminarLogin;
CREATE PROCEDURE p_EliminarLogin(IN p_NombreDeUsuario VARCHAR(50))
BEGIN
  DELETE FROM Login WHERE NombreDeUsuario=p_NombreDeUsuario;
END;; $$


delimiter $$
DROP PROCEDURE if EXISTS p_insertarUsuarios;
CREATE PROCEDURE p_insertarUsuarios(
IN p_IdUsuarios INT,
in p_Nombre VARCHAR(50),
in p_Apellidos VARCHAR(50),
in p_Puesto VARCHAR(50)
)
BEGIN
   DECLARE x INT;
   SELECT COUNT(*) FROM Usuarios WHERE Nombre=p_Nombre INTO x;
   if X=0 AND p_IdUsuarios<0 then
    INSERT INTO Usuarios VALUES(NULL, p_Nombre,p_Apellidos,p_Puesto);
    ELSE  if X=0 AND p_IdUsuarios>0 then
    UPDATE Usuarios SET Nombre=p_Nombre, Apellidos=p_Apellidos, Puesto=p_Puesto WHERE IdUsuarios=p_IdUsuarios;
    else
    UPDATE Usuarios SET Nombre=p_Nombre, Apellidos=p_Apellidos, Puesto=p_Puesto WHERE IdUsuarios=p_IdUsuarios;
    END if;
    END if;
END;; $$


delimiter $$
DROP PROCEDURE if EXISTS p_EliminarUsuarios;
CREATE PROCEDURE p_EliminarUsuarios(IN p_IdUsuarios INT)
BEGIN
  DELETE FROM Usuarios WHERE IdUsuarios=p_IdUsuarios;
END;; $$

delimiter $$
DROP PROCEDURE if EXISTS p_MostrarUsuarios;
CREATE PROCEDURE p_MostrarUsuarios(IN p_Nombre VARCHAR(50))
BEGIN 
 SELECT * FROM Usuarios WHERE Nombre LIKE CONCAT('%',p_Nombre,'%');
END;; $$



delimiter $$
DROP PROCEDURE if EXISTS p_insertarRegistroCompra;
CREATE PROCEDURE p_insertarRegistroCompra(
IN p_IdCompra INT,
in p_NombreCliente VARCHAR (50),
in p_NombreTrabajador VARCHAR (50),
in p_CantidadDeProducto VARCHAR(50),
in p_Producto VARCHAR(50),
in p_Fecha DATETIME,
in p_fkIdUsuarios INT,
in p_fkIdProducto INT
)
BEGIN
   DECLARE x INT;
   SELECT COUNT(*) FROM RegistroCompra WHERE NombreCliente =p_NombreCliente INTO x;
   if X=0 AND p_IdCompra<0 then
    INSERT INTO RegistroCompra VALUES(NULL,p_NombreCliente,p_NombreTrabajador,p_CantidadDeProducto,
	 p_Producto,p_Fecha,fkIdUsuarios,fkIdProducto);
    ELSE  if X=0 AND p_IdCompra>0 then
    UPDATE RegistroCompra SET NombreCliente=p_NombreCliente, NombreTrabajador=p_NombreTrabajador,
	  CantidadDeProducto=p_CantidadDeProducto,Producto=p_Producto,
	  Fecha=p_Fecha, fkIdUsuarios=p_fkIdUsuarios,fkIdProducto=p_fkIdProducto WHERE IdCompra=p_IdCompra;
    else
    UPDATE RegistroCompra SET NombreCliente=p_NombreCliente, NombreTrabajador=p_NombreTrabajador,
	  CantidadDeProducto=p_CantidadDeProducto,Producto=p_Producto,
	  Fecha=p_Fecha, fkIdUsuarios=p_fkIdUsuarios WHERE IdCompra=p_IdCompra;
    END if;
    END if;
END;; $$


delimiter $$
DROP PROCEDURE if EXISTS p_EliminarRegistroCompra;
CREATE PROCEDURE p_EliminarRegistroCompra(IN p_IdCompra INT)
BEGIN
  DELETE FROM RegistroCompra WHERE IdCompra=p_IdCompra;
END;; $$

delimiter $$
DROP PROCEDURE if EXISTS p_MostrarRegistroCompra;
CREATE PROCEDURE p_MostrarRegistroCompra(IN p_NombreCliente VARCHAR(50))
BEGIN 
 SELECT * FROM RegistroCompra WHERE NombreCliente LIKE CONCAT('%',p_NombreCliente,'%');
END;; $$


delimiter $$
DROP PROCEDURE if EXISTS p_insertarRegistroProducto;
CREATE PROCEDURE p_insertarRegistroProducto(
IN p_IdProducto INT,
in p_NombreProducto VARCHAR(50),
in p_DescripcionProducto VARCHAR(50),
in p_CantidadProducto VARCHAR(15),
in p_precio INT
)
BEGIN
   DECLARE x INT;
   SELECT COUNT(*) FROM RegistroProducto WHERE NombreProducto =p_NombreProducto INTO x;
   if X=0 AND p_IdProducto<0 then
    INSERT INTO RegistroProducto VALUES(NULL,p_NombreProducto,p_DescripcionProducto,p_CantidadProducto,
	 p_precio);
    ELSE  if X=0 AND p_IdProducto>0 then
    UPDATE RegistroProducto SET NombreProducto=p_NombreProducto, DescripcionProducto=p_DescripcionProducto,
	  CantidadProducto=p_CantidadProducto,precio=p_precio WHERE IdProducto=p_IdProducto;
    else
    UPDATE RegistroProducto SET NombreProducto=p_NombreProducto, DescripcionProducto=p_DescripcionProducto,
	  CantidadProducto=p_CantidadProducto,precio=p_precio WHERE IdProducto=p_IdProducto;
    END if;
    END if;
END;; $$


delimiter $$
DROP PROCEDURE if EXISTS p_EliminarRegistroProducto;
CREATE PROCEDURE p_EliminarRegistroProducto(IN p_IdProducto INT)
BEGIN
  DELETE FROM RegistroProducto WHERE IdProducto=p_IdProducto;
END;; $$

delimiter $$
DROP PROCEDURE if EXISTS p_MostrarRegistroProducto;
CREATE PROCEDURE p_MostrarRegistroProducto(IN p_NombreProducto VARCHAR(50))
BEGIN 
 SELECT * FROM RegistroProducto WHERE NombreProducto LIKE CONCAT('%',p_NombreProducto,'%');
END;; $$



delimiter $$
DROP PROCEDURE if EXISTS p_insertarVentas;
CREATE PROCEDURE p_insertarVentas(
IN p_IdVenta INT ,
in p_NombreCliente VARCHAR(50),
in p_NombreUsuario VARCHAR(50),
in p_Producto VARCHAR (50),
in p_CantidadVenta VARCHAR(20),
in p_Fecha DATETIME,
in p_fkIdProducto INT,
in p_fkIdCompra INT
)
BEGIN
   DECLARE x INT;
   SELECT COUNT(*) FROM Ventas WHERE NombreCliente =p_NombreCliente INTO x;
   if X=0 AND p_IdVenta<0 then
    INSERT INTO Ventas VALUES(NULL,p_NombreCliente,p_NombreUsuario,p_Producto,
	 p_CantidadVenta,p_Fecha,fkIdProducto,fkIdProducto);
    ELSE  if X=0 AND p_IdVenta>0 then
    UPDATE Ventas SET NombreCliente=p_NombreCliente, NombreUsuario=p_NombreUsuario,
	  Producto=p_Producto,CantidadVenta=p_CantidadVenta,Fecha=p_Fecha,
	  fkIdProducto=p_fkIdProducto,fkIdCompra=p_fkIdCompra WHERE IdVenta=p_IdVenta;
    else
    UPDATE Ventas SET NombreCliente=p_NombreCliente, NombreUsuario=p_NombreUsuario,
	  Producto=p_Producto,CantidadVenta=p_CantidadVenta,Fecha=p_Fecha,
	  fkIdProducto=p_fkIdProducto, fkIdCompra=p_fkIdCompra WHERE IdVenta=p_IdVenta;
    END if;
    END if;
END;; $$


delimiter $$
DROP PROCEDURE if EXISTS p_EliminarVentas;
CREATE PROCEDURE p_EliminarVentas(IN p_IdVenta INT)
BEGIN
  DELETE FROM Ventas WHERE IdVenta=p_IdVenta;
END;; $$

delimiter $$
DROP PROCEDURE if EXISTS p_MostrarVentas;
CREATE PROCEDURE p_MostrarVentas(IN p_NombreCliente VARCHAR(50))
BEGIN 
 SELECT * FROM Ventas WHERE NombreCliente LIKE CONCAT('%',p_NombreCliente,'%');
END;; $$


/*VISTA*/
CREATE VIEW v_RegistroCompra AS 
SELECT p.IdCompra, i.NombreProducto, p.NombreEmpleado, i.CantidadProducto, p.Producto, p.Fecha
FROM RegistroCompra p
JOIN RegistroProducto i ON i.IdProducto = p.fkIdUsuarios;


/*DISPARADOR*/
delimiter $$
CREATE TRIGGER trigger_verificarExistenciaProducto_before_insert
BEFORE INSERT ON Ventas
FOR EACH  ROW 

BEGIN 


  DECLARE productosExistente INT DEFAULT 0;
  DECLARE productoRequerido INT DEFAULT 0;
  DECLARE counter BIGINT DEFAULT 0;
  
  verificar: loop
  SET counter = counter +1;
  
  if counter =11 then
   leave verificar;
   END if;
   
   SELECT CantidadProducto FROM registro_producto WHERE IdProducto =counter INTO productosExistente;
   SELECT precio FROM registro_producto WHERE IdProducto = counter INTO productoRequerido;
   SET productoRequerido = productoRequerido * NEW.cantidadProducir;
   
   if productoRequerido <= productosExistente then
   
    UPDATE registro_producto SET CantidadProducto = (productosExistente - productoRequerido) WHERE IdProducto=counter;
  
ELSEIF productoRequerido > productosExistente then

  INSERT INTO compra_producto VALUES(NULL, counter(productoRequerido -productosExistente), DEFAULT);
  UPDATE registro_producto SET CantidadProducto = 0 WHERE IdProducto =counter;
 
END if; $$

