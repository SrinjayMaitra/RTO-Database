\c rto1

insert into RTO values('KA01','Bengaluru Central','Karnataka');
insert into RTO values('KA02','Bengaluru West','Karnataka');
insert into RTO values('MH01','Mumbai Central','Maharashtra');
insert into RTO values('MH05','Pune','Maharashtra');
insert into RTO values('KA07','Kolar','Karnataka');
insert into RTO values('TS14','Hyderabad','Telangana');

insert into vehicle values('KA01 R9365','sreesha','black','Petrol');
insert into vehicle values('KA02 A7345','srinjay maitra','green','Diesel');
insert into vehicle values('KA02 Q3456','suheb','red','Petrol');
insert into vehicle values('MH01 R4567','ajit m','brown','Diesel');
insert into vehicle values('MH01 S2756','ganesh n','silver','Petrol');
insert into vehicle values('MH05 R2723','sujay','silver','Diesel');
insert into vehicle values('KA07 T3456','suraj','yellow','Petrol');
insert into vehicle values('TS14 J1987','arjun','grey','Petrol');

insert into license values('KA01 20200008858','sreesha','LMV,MCWG','19-08-2041');
insert into license values('KA02 20180007858','srinjay maitra','LMV,MCWOG','11-08-2039');
insert into license values('KA02 20190008248','suheb','LMV,MCWG','13-07-2040');
insert into license values('MH01 20210008834','ajit m','LMV,MCWOG','06-08-2042');
insert into license values('MH01 20200004567','ganesh n','LMV,MCWG','24-08-2041');
insert into license values('MH05 20200002345','sujay','LMV,MCWG','28-08-2041');
insert into license values('KA07 20170001673','suraj','LMV,MCWOG','10-08-2038');
insert into license values('TS14 20140008349','arjun','LMV,MCWOG','12-08-2035');

insert into cust values(1,'sreesha','19-08-2001');
insert into cust values(2,'srinjay maitra','11-08-1998');
insert into cust values(3,'suheb','13-07-2000');
insert into cust values(4,'ajit m','06-08-2002');
insert into cust values(5,'ganesh n','24-08-2001');
insert into cust values(6,'sujay','28-08-2001');
insert into cust values(7,'suraj','10-08-1998');
insert into cust values(8,'arjun','12-08-1995');

insert into login values(1,'123');
insert into login values(2,'123');
insert into login values(3,'123');
insert into login values(4,'123');
insert into login values(5,'123');
insert into login values(6,'123');
insert into login values(7,'123');
insert into login values(8,'123');

insert into reg_veh values('KA01','KA01 R9365');
insert into reg_veh values('KA02','KA02 A7345');
insert into reg_veh values('KA02','KA02 Q3456');
insert into reg_veh values('MH01','MH01 R4567');
insert into reg_veh values('MH01','MH01 S2756');
insert into reg_veh values('MH05','MH05 R2723');
insert into reg_veh values('KA07','KA07 T3456');
insert into reg_veh values('TS14','TS14 J1987');

insert into reg_lic values('KA01','KA01 20200008858');
insert into reg_lic values('KA02','KA02 20180007858');
insert into reg_lic values('KA02','KA02 20190008248');
insert into reg_lic values('MH01','MH01 20210008834');
insert into reg_lic values('MH01','MH01 20200004567');
insert into reg_lic values('MH05','MH05 20200002345');
insert into reg_lic values('KA07','KA07 20170001673');
insert into reg_lic values('TS14','TS14 20140008349');

insert into cust_has_lic values(1,'KA01 20200008858');
insert into cust_has_lic values(2,'KA02 20180007858');
insert into cust_has_lic values(3,'KA02 20190008248');
insert into cust_has_lic values(4,'MH01 20210008834');
insert into cust_has_lic values(5,'MH01 20200004567');
insert into cust_has_lic values(6,'MH05 20200002345');
insert into cust_has_lic values(7,'KA07 20170001673');
insert into cust_has_lic values(8,'TS14 20140008349');

insert into owned_by values('KA01 R9365',1);
insert into owned_by values('KA02 A7345',2);
insert into owned_by values('KA02 Q3456',3);
insert into owned_by values('MH01 R4567',4);
insert into owned_by values('MH01 S2756',5);
insert into owned_by values('MH05 R2723',6);
insert into owned_by values('KA07 T3456',7);
insert into owned_by values('TS14 J1987',8);


insert into cust_has_login values(1,1);
insert into cust_has_login values(2,2);
insert into cust_has_login values(3,3);
insert into cust_has_login values(4,4);
insert into cust_has_login values(5,5);
insert into cust_has_login values(6,6);
insert into cust_has_login values(7,7);
insert into cust_has_login values(8,8);




