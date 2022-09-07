DROP DATABASE RTO1;
CREATE DATABASE RTO1;

-- Creating RTO Schema
\c rto1


CREATE TABLE RTO (
  rto_code varchar(10) not null,
  rto_loc varchar(25) not null,
  rto_state varchar(25) not null,
  PRIMARY KEY (rto_code),
  CONSTRAINT fk_rto_code foreign key (rto_code) references RTO(rto_code)
);


CREATE TABLE vehicle (
  veh_no varchar(20) not null,
  owner varchar(25) not null,
  veh_color varchar(10) not null,
  Fuel_type varchar(20) not null,
  PRIMARY KEY (veh_no),
  CONSTRAINT fk_veh_no foreign key (veh_no) references vehicle(veh_no)
);


CREATE TABLE license (
	lic_no varchar(25) not null,
	lic_holder varchar(25) not null,
	veh_class varchar(15) not null,
	valid date,
    PRIMARY KEY (lic_no),
	CONSTRAINT fk_lic_no foreign key (lic_no) references license(lic_no)
);


CREATE TABLE cust (
	cus_id int not null,
	cus_name varchar(25) not null,
    dob date not null,
    PRIMARY KEY (cus_id),
	CONSTRAINT fk_cust_id foreign key (cus_id) references cust(cus_id)
);


CREATE TABLE login (
  log_id varchar(15) not null,
  passwd varchar(15) not null,
  mail varchar(25),
  PRIMARY KEY (log_id),
  CONSTRAINT fk_log_id foreign key (log_id) references login(log_id)
);

CREATE TABLE reg_veh (
	rto_code varchar(10) not null,
	veh_no varchar(20) not null,
	constraint pk_reg_veh primary key (rto_code,veh_no),
	CONSTRAINT fk_reg_rto_code foreign key (rto_code) references RTO(rto_code),
	CONSTRAINT fk_reg_veh_no foreign key (veh_no) references vehicle(veh_no)
);

CREATE TABLE reg_lic (
	rto_code varchar(10) not null,
	lic_no varchar(25) not null,
	constraint pk_reg_lic primary key (rto_code,lic_no),
	CONSTRAINT fk_reg_lic_rto_code foreign key (rto_code) references RTO(rto_code),
	CONSTRAINT fk_reg_lic_no foreign key (lic_no) references license(lic_no)
);

CREATE TABLE owned_by (
	veh_no varchar(20) not null,
	cus_id int not null,
	constraint pk_owned_by primary key (veh_no,cus_id),
	CONSTRAINT fk_owns_veh_no foreign key (veh_no) references vehicle(veh_no),
	CONSTRAINT fk_owns_cust_id foreign key (cus_id) references cust(cus_id)
);

CREATE TABLE cust_has_lic (
	cus_id int not null,
	lic_no varchar(25) not null,
	constraint pk_cust_lic primary key (cus_id,lic_no),
	CONSTRAINT fk_lic_cust_id foreign key (cus_id) references cust(cus_id),
	CONSTRAINT fk_cust_lic_no foreign key (lic_no) references license(lic_no)
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
	primary key (ins_no),
	CONSTRAINT fk_ins foreign key (ins_no) references ins(ins_no)
);

CREATE TABLE veh_has_ins (
	veh_no varchar(20) not null,
	ins_no varchar(20) not null,
	ins_amt int not null,
	primary key (veh_no, ins_no),
	CONSTRAINT fk_ins_veh foreign key (ins_no) references ins(ins_no),
	CONSTRAINT fk_veh_ins foreign key (veh_no) references vehicle(veh_no)
);
	


