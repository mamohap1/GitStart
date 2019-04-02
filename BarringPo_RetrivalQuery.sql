drop table st_eoc_ATTR_barring;

create table st_eoc_ATTR_barring  as
select /*+ parallel(4) */ * from st_eoc_item_attribute_1 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y' )
union 
select /*+ parallel(4) */* from st_eoc_item_attribute_2 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_attribute_3 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y' )
union 
select /*+ parallel(4) */* from st_eoc_item_attribute_4 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y' )
union 
select /*+ parallel(4) */* from st_eoc_item_attribute_5 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_attribute_6 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_attribute_7 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_attribute_8 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_attribute_9 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_attribute_10 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y');


drop table ATTR_ITEMID_barring;
create table ATTR_ITEMID_barring as select distinct itemid from st_eoc_ATTR_barring;



drop table st_eoc_charge_barring;
create table st_eoc_charge_barring as 
select /*+ parallel(4) */ * from st_eoc_item_charges_1 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_charges_2 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_charges_3 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_charges_4 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_charges_5 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_charges_6 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_charges_7 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_charges_8 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_charges_9 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_charges_10 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y');


drop table st_eoc_item_po_barring;
create table st_eoc_item_po_barring as 
select /*+ parallel(4) */ * from st_eoc_item_assoc_po_1 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_assoc_po_2 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_assoc_po_3 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_assoc_po_4 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_assoc_po_5 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_assoc_po_6 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_assoc_po_7 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_assoc_po_8 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_assoc_po_9 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y')
union 
select /*+ parallel(4) */* from st_eoc_item_assoc_po_10 where itemid IN (select itemid from st_eoc_con_stat_change where Load_Flag_New = 'Y');

-- 290 sec