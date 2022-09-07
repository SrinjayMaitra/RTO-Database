DROP DATABASE RTO1;
CREATE DATABASE RTO1;

-- Creating RTO Schema
\c rto1


CREATE TABLE RTO (
  rto_code varchar(10) not null,
  rto_loc varchar(25) not null,
  rto_state varchar(25) not null,
  PRIMARY KEY (rto_code)
);


CREATE TABLE vehicle (
  veh_no varchar(20) not null,
  owner varchar(25) not null,
  veh_color varchar(10) not null,
  Fuel_type varchar(20) not null,
  PRIMARY KEY (veh_no)
);


CREATE TABLE license (
	lic_no varchar(25) not null,
	lic_holder varchar(25) not null,
	veh_class varchar(15) not null,
	valid date,
    PRIMARY KEY (lic_no)
);


CREATE TABLE cust (
	cus_id int not null,
	cus_name varchar(25) not null,
    dob date not null,
    PRIMARY KEY (cus_id)
);


CREATE TABLE login (
  log_id varchar(15) not null,
  passwd varchar(15) not null,
  mail varchar(25),
  PRIMARY KEY (log_id)
);

CREATE TABLE reg_veh (
	rto_code_veh varchar(10) not null,
	veh_no_reg varchar(20) not null,
	constraint pk_reg_veh primary key (rto_code_veh,veh_no_reg),
	CONSTRAINT fk_reg_rto_code foreign key (rto_code_veh) references RTO(rto_code),
	CONSTRAINT fk_reg_veh_no foreign key (veh_no_reg) references vehicle(veh_no)
);

CREATE TABLE reg_lic (
	rto_code_lic varchar(10) not null,
	lic_no_reg varchar(25) not null,
	constraint pk_reg_lic primary key (rto_code_lic,lic_no_reg),
	CONSTRAINT fk_reg_lic_rto_code foreign key (rto_code_lic) references RTO(rto_code),
	CONSTRAINT fk_reg_lic_no foreign key (lic_no_reg) references license(lic_no)
);

CREATE TABLE owned_by (
	veh_no_owns varchar(20) not null,
	cus_id_owns int not null,
	constraint pk_owned_by primary key (veh_no_owns,cus_id_owns),
	CONSTRAINT fk_owns_veh_no foreign key (veh_no_owns) references vehicle(veh_no),
	CONSTRAINT fk_owns_cust_id foreign key (cus_id_owns) references cust(cus_id)
);

CREATE TABLE cust_has_lic (
	cus_id_lic int not null,
	lic_no_cust varchar(25) not null,
	constraint pk_cust_lic primary key (cus_id_lic,lic_no_cust),
	CONSTRAINT fk_lic_cust_id foreign key (cus_id_lic) references cust(cus_id),
	CONSTRAINT fk_cust_lic_no foreign key (lic_no_cust) references license(lic_no)
);

CREATE TABLE cust_has_login (
	cus_id int not null,
	log_id varchar(15) not null,
	constraint pk_cust_login primary key (cus_id,log_id),
	CONSTRAINT fk_login_cust_id foreign key (cus_id) references cust(cus_id),
	CONSTRAINT fk_cust_log_id foreign key (log_id) references login(log_id)
);

CREATE TABLE ins (
	ins_no varchar(20) not null,
	valid_till date,
	primary key (ins_no)
);

CREATE TABLE veh_has_ins (
	ins_no_veh varchar(20) not null,
	veh_no_ins varchar(20) not null,
	primary key (veh_no_ins, ins_no_veh),
	CONSTRAINT fk_ins_veh foreign key (ins_no_veh) references ins(ins_no),
	CONSTRAINT fk_veh_ins foreign key (veh_no_ins) references vehicle(veh_no)
	ON DELETE CASCADE
);
	
CREATE table offence (
	notice_no int not null,
	offence_type varchar(50) not null,
	challan_due_date date not null,
	amount int not null,
	primary key (notice_no)
);

create table vehicle_has_offence (
	veh_no_off varchar(50) not null,
	notice_no_veh int not null,
	primary key ( notice_no_veh),
	CONSTRAINT fk_offence_veh foreign key (notice_no_veh) references offence(notice_no),
	CONSTRAINT fk_veh_no_off foreign key (veh_no_off) references vehicle(veh_no)
);

create table accident (
	acc_id int not null,
	acc_date date not null,
	primary key (acc_id)
);

create table veh_had_acc (
	veh_no_acc varchar(20) not null,
	veh_acc_id int not null,
	primary key ( veh_acc_id),
	CONSTRAINT fk_acc_veh foreign key (veh_no_acc) references vehicle(veh_no),
	CONSTRAINT fk_veh_no_acc foreign key (veh_acc_id) references accident(acc_id)
);

CREATE FUNCTION del_ins()
	RETURNS trigger as $$
	BEGIN
		delete from veh_has_ins 
		where ins_no_veh = OLD.ins_no;
		return old;
	END;
	$$
	LANGUAGE 'plpgsql';
	
CREATE TRIGGER deleteins
	BEFORE DELETE ON ins
	FOR EACH ROW
	EXECUTE PROCEDURE del_ins();