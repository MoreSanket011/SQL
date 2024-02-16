CREATE TABLE MY_COMPANY (
    first_name VARCHAR (20) DEFAULT NULL,
	last_name VARCHAR (25) NOT NULL,
	phone_number VARCHAR (20) DEFAULT NULL) 
	SELECT * FROM MY_COMPANY
	INSERT INTO MY_COMPANY VALUES ('SANKET', 'MORE',989898989),
	                              ('AMAN' , 'NILJHA' , 564864)
BEGIN TRANSACTION 
	  INSERT INTO MY_COMPANY VALUES ('IRTA', 'LIHA',45644),
	                              ('SUTVI' , 'NUOU' , 5647486746864)
	SELECT * FROM MY_COMPANY
	SELECT CONCAT(first_name , ' ' ,  last_name) AS FULL_NAME FROM MY_COMPANY
	SELECT * FROM MY_COMPANY
	WHERE first_name like 'sanket%'
		
		alter table MY_COMPANY
		add gender varchar (10),
		dept_id  int

		update   MY_COMPANY
		set gender = 'f' , dept_id = 20
		where first_name = 'SUTvi'
								  
alter table [dbo].[MY_COMPANY]
add salary int 
SELECT * FROM MY_COMPANY

update MY_COMPANY
set salary = 90000 where dept_id = 20
--create procedure below---
create proc procedureMY_COMPANY_gender_dept_id
@gender VARCHAR (10),
@dept_id INT
AS
BEGIN
 select first_name , gender , dept_id from MY_COMPANY
 where gender = @gender AND dept_id = @dept_id
END

/* proc execution command */
procedureMY_COMPANY_gender_dept_id
@gender = 'm',
@dept_id = 20








drop proc [dbo].[spgetMY_COMPANY1]

