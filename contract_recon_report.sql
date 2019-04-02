--Check for the in list Po's here
select distinct itemcode from ecm.cwpc_itemattribute_v where itemattributecode='ratePlans' and defaultvalue in (
'BCPRM',
'BBPRM',
'BCPOM',
'BBPOM'
) and itemcode in (select distinct itemcode from ecm.cwpc_itemattribute_v where itemattributecode='productTechnicalType' and defaultvalue='BASIC'); 

==============> OLD
create table contract_recon_report as
select /*+ parallel (32) */ st.co_id, a.cust_class, a.LINE_TYPE,
(case when st.ITEMCODE IN ('B2C_PR_MBB_BASIC_PO','B2C_PP_MBB_BASIC_PO','B2B_PP_MBB_BASIC_PO','B2B_PR_MBB_BASIC_PO') then 'DATA' else 'VOICE' end) as TTYPE
,st.CO_STATUS
from st_eoc_item_all st, st_eoc_attr_cols a
where st.co_id=a.cont_id
and st.LINE_TYPE=a.LINE_TYPE
and POTYPE='BASIC'
and LOAD_FLAG='Y';


select 
(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='PREPAID' and TTYPE='VOICE' and STATUS='ACTIVE') as B2C_PREP_V_A,
(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='PREPAID' and TTYPE='VOICE' and STATUS='SUSPENDED') as B2C_PREP_V_S,
(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='PREPAID' and TTYPE='DATA' and STATUS='ACTIVE') as B2C_PREP_D_A,
(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='PREPAID' and TTYPE='DATA' and STATUS='SUSPENDED') as B2C_PREP_D_S,
(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='POSTPAID' and TTYPE='VOICE' and STATUS='ACTIVE') as B2C_POST_V_A,
(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='POSTPAID' and TTYPE='VOICE' and STATUS='SUSPENDED') as B2C_POST_V_S,
(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='POSTPAID' and TTYPE='DATA' and STATUS='ACTIVE') as B2C_POST_D_A,
(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='POSTPAID' and TTYPE='DATA' and STATUS='SUSPENDED') as B2C_POST_D_S
from dual;

select 
(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='PREPAID' and TTYPE='VOICE' and STATUS='ACTIVE') as B2B_PREP_V_A,
(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='PREPAID' and TTYPE='VOICE' and STATUS='SUSPENDED') as B2B_PREP_V_S,
(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='PREPAID' and TTYPE='DATA' and STATUS='ACTIVE') as B2B_PREP_D_A,
(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='PREPAID' and TTYPE='DATA' and STATUS='SUSPENDED') as B2B_PREP_D_S,
(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='POSTPAID' and TTYPE='VOICE' and STATUS='ACTIVE') as B2B_POST_V_A,
(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='POSTPAID' and TTYPE='VOICE' and STATUS='SUSPENDED') as B2B_POST_V_S,
(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='POSTPAID' and TTYPE='DATA' and STATUS='ACTIVE') as B2B_POST_D_A,
(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='POSTPAID' and TTYPE='DATA' and STATUS='SUSPENDED') as B2B_POST_D_S
from dual;

drop table contract_recon_report;


==> NEW

drop table  contract_recon_generate_report;
CREATE TABLE contract_recon_generate_report 
   (CONTRACT VARCHAR2(20 BYTE), 
	CUST_CLASS VARCHAR2(20 BYTE), 
	LINE_TYPE VARCHAR2(20 BYTE), 
	TTYPE VARCHAR2(20 BYTE), 
	STATUS VARCHAR2(20 BYTE), 
	SUB_TYPE VARCHAR2(40 BYTE),
  COUNT NUMBER );

--------PREPAID
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'PREPAID','VOICE','ACTIVE','WANP',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='PREPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='WANP'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'PREPAID','VOICE','ACTIVE','WAHU',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='PREPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='WAHU'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'PREPAID','VOICE','ACTIVE','DIHU',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='PREPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='DIHU'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'PREPAID','VOICE','ACTIVE','ACTIVE',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='PREPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='30'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'PREPAID','VOICE','ACTIVE','SUB_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='PREPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='43'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'PREPAID','VOICE','ACTIVE','ADMIN_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='PREPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='44'));

INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'PREPAID','VOICE','SUSPENDED','DINP',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='PREPAID' 
and TTYPE='VOICE' and CO_STATUS='SUSPENDED' and LEGACY_SUBSTATUS='DINP'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'PREPAID','VOICE','SUSPENDED','SUB_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='PREPAID' 
and TTYPE='VOICE' and CO_STATUS='SUSPENDED' and LEGACY_STATUS_NEW='40'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'PREPAID','VOICE','SUSPENDED','ADMIN_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='PREPAID' 
and TTYPE='VOICE' and CO_STATUS='SUSPENDED' and  LEGACY_STATUS_NEW='42'));

----------------------

INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'PREPAID','DATA','ACTIVE','WANP',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='PREPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='WANP'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'PREPAID','DATA','ACTIVE','WAHU',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='PREPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='WAHU'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'PREPAID','DATA','ACTIVE','DIHU',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='PREPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='DIHU'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'PREPAID','DATA','ACTIVE','ACTIVE',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='PREPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='30'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'PREPAID','DATA','ACTIVE','SUB_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='PREPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='43'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'PREPAID','DATA','ACTIVE','ADMIN_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='PREPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='44'));

INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'PREPAID','DATA','SUSPENDED','DINP',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='PREPAID' 
and TTYPE='DATA' and CO_STATUS='SUSPENDED' and LEGACY_SUBSTATUS='DINP'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'PREPAID','DATA','SUSPENDED','SUB_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='PREPAID' 
and TTYPE='DATA' and CO_STATUS='SUSPENDED' and LEGACY_STATUS_NEW='40'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'PREPAID','DATA','SUSPENDED','ADMIN_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='PREPAID' 
and TTYPE='DATA' and CO_STATUS='SUSPENDED' and  LEGACY_STATUS_NEW='42'));


--------POSTPAID
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'POSTPAID','VOICE','ACTIVE','WANP',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='POSTPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='WANP'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'POSTPAID','VOICE','ACTIVE','WAHU',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='POSTPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='WAHU'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'POSTPAID','VOICE','ACTIVE','DIHU',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='POSTPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='DIHU'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'POSTPAID','VOICE','ACTIVE','ACTIVE',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='POSTPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='30'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'POSTPAID','VOICE','ACTIVE','SUB_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='POSTPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='43'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'POSTPAID','VOICE','ACTIVE','ADMIN_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='POSTPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='44'));

INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'POSTPAID','VOICE','SUSPENDED','DINP',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='POSTPAID' 
and TTYPE='VOICE' and CO_STATUS='SUSPENDED' and LEGACY_SUBSTATUS='DINP'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'POSTPAID','VOICE','SUSPENDED','SUB_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='POSTPAID' 
and TTYPE='VOICE' and CO_STATUS='SUSPENDED' and LEGACY_STATUS_NEW='40'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'POSTPAID','VOICE','SUSPENDED','ADMIN_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='POSTPAID' 
and TTYPE='VOICE' and CO_STATUS='SUSPENDED' and  LEGACY_STATUS_NEW='42'));

----------------------

INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'POSTPAID','DATA','ACTIVE','WANP',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='POSTPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='WANP'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'POSTPAID','DATA','ACTIVE','WAHU',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='POSTPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='WAHU'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'POSTPAID','DATA','ACTIVE','DIHU',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='POSTPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='DIHU'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'POSTPAID','DATA','ACTIVE','ACTIVE',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='POSTPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='30'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'POSTPAID','DATA','ACTIVE','SUB_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='POSTPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='43'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'POSTPAID','DATA','ACTIVE','ADMIN_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='POSTPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='44'));

INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'POSTPAID','DATA','SUSPENDED','DINP',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='POSTPAID' 
and TTYPE='DATA' and CO_STATUS='SUSPENDED' and LEGACY_SUBSTATUS='DINP'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'POSTPAID','DATA','SUSPENDED','SUB_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='POSTPAID' 
and TTYPE='DATA' and CO_STATUS='SUSPENDED' and LEGACY_STATUS_NEW='40'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2C', 'POSTPAID','DATA','SUSPENDED','ADMIN_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2C' and LINE_TYPE='POSTPAID' 
and TTYPE='DATA' and CO_STATUS='SUSPENDED' and  LEGACY_STATUS_NEW='42'));


----------------------------------- B2B -----------------------------------
--------PREPAID
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'PREPAID','VOICE','ACTIVE','WANP',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='PREPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='WANP'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'PREPAID','VOICE','ACTIVE','WAHU',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='PREPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='WAHU'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'PREPAID','VOICE','ACTIVE','DIHU',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='PREPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='DIHU'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'PREPAID','VOICE','ACTIVE','ACTIVE',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='PREPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='30'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'PREPAID','VOICE','ACTIVE','SUB_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='PREPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='43'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'PREPAID','VOICE','ACTIVE','ADMIN_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='PREPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='44'));

INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'PREPAID','VOICE','SUSPENDED','DINP',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='PREPAID' 
and TTYPE='VOICE' and CO_STATUS='SUSPENDED' and LEGACY_SUBSTATUS='DINP'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'PREPAID','VOICE','SUSPENDED','SUB_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='PREPAID' 
and TTYPE='VOICE' and CO_STATUS='SUSPENDED' and LEGACY_STATUS_NEW='40'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'PREPAID','VOICE','SUSPENDED','ADMIN_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='PREPAID' 
and TTYPE='VOICE' and CO_STATUS='SUSPENDED' and  LEGACY_STATUS_NEW='42'));

----------------------

INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'PREPAID','DATA','ACTIVE','WANP',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='PREPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='WANP'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'PREPAID','DATA','ACTIVE','WAHU',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='PREPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='WAHU'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'PREPAID','DATA','ACTIVE','DIHU',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='PREPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='DIHU'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'PREPAID','DATA','ACTIVE','ACTIVE',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='PREPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='30'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'PREPAID','DATA','ACTIVE','SUB_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='PREPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='43'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'PREPAID','DATA','ACTIVE','ADMIN_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='PREPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='44'));

INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'PREPAID','DATA','SUSPENDED','DINP',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='PREPAID' 
and TTYPE='DATA' and CO_STATUS='SUSPENDED' and LEGACY_SUBSTATUS='DINP'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'PREPAID','DATA','SUSPENDED','SUB_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='PREPAID' 
and TTYPE='DATA' and CO_STATUS='SUSPENDED' and LEGACY_STATUS_NEW='40'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'PREPAID','DATA','SUSPENDED','ADMIN_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='PREPAID' 
and TTYPE='DATA' and CO_STATUS='SUSPENDED' and  LEGACY_STATUS_NEW='42'));


--------POSTPAID
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'POSTPAID','VOICE','ACTIVE','WANP',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='POSTPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='WANP'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'POSTPAID','VOICE','ACTIVE','WAHU',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='POSTPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='WAHU'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'POSTPAID','VOICE','ACTIVE','DIHU',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='POSTPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='DIHU'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'POSTPAID','VOICE','ACTIVE','ACTIVE',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='POSTPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='30'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'POSTPAID','VOICE','ACTIVE','SUB_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='POSTPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='43'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'POSTPAID','VOICE','ACTIVE','ADMIN_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='POSTPAID'
and TTYPE='VOICE' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='44'));

INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'POSTPAID','VOICE','SUSPENDED','DINP',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='POSTPAID' 
and TTYPE='VOICE' and CO_STATUS='SUSPENDED' and LEGACY_SUBSTATUS='DINP'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'POSTPAID','VOICE','SUSPENDED','SUB_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='POSTPAID' 
and TTYPE='VOICE' and CO_STATUS='SUSPENDED' and LEGACY_STATUS_NEW='40'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'POSTPAID','VOICE','SUSPENDED','ADMIN_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='POSTPAID' 
and TTYPE='VOICE' and CO_STATUS='SUSPENDED' and  LEGACY_STATUS_NEW='42'));

----------------------

INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'POSTPAID','DATA','ACTIVE','WANP',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='POSTPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='WANP'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'POSTPAID','DATA','ACTIVE','WAHU',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='POSTPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='WAHU'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'POSTPAID','DATA','ACTIVE','DIHU',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='POSTPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_SUBSTATUS='DIHU'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'POSTPAID','DATA','ACTIVE','ACTIVE',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='POSTPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='30'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'POSTPAID','DATA','ACTIVE','SUB_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='POSTPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='43'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'POSTPAID','DATA','ACTIVE','ADMIN_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='POSTPAID'
and TTYPE='DATA' and CO_STATUS='ACTIVE' and LEGACY_STATUS_NEW='44'));

INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'POSTPAID','DATA','SUSPENDED','DINP',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='POSTPAID' 
and TTYPE='DATA' and CO_STATUS='SUSPENDED' and LEGACY_SUBSTATUS='DINP'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'POSTPAID','DATA','SUSPENDED','SUB_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='POSTPAID' 
and TTYPE='DATA' and CO_STATUS='SUSPENDED' and LEGACY_STATUS_NEW='40'));
INSERT INTO contract_recon_generate_report VALUES('CONTRACT', 'B2B', 'POSTPAID','DATA','SUSPENDED','ADMIN_INIT_BARR',(select count(distinct co_id) from contract_recon_report where cust_class='B2B' and LINE_TYPE='POSTPAID' 
and TTYPE='DATA' and CO_STATUS='SUSPENDED' and  LEGACY_STATUS_NEW='42'));


select * from contract_recon_generate_report order by CONTRACT,CUST_CLASS,LINE_TYPE,TTYPE,STATUS,SUB_TYPE;

--Export into excel file

drop table  contract_recon_generate_report;

**********************************************************************************************


drop table contract_po_recon_report;
create table contract_po_recon_report as
select /*+ parallel (32) */ st.ITEMCODE, st.cust_class, st.LINE_TYPE,
(case when st.PARENTITEMCODE IN ('B2C_PR_MBB_BASIC_PO','B2C_PP_MBB_BASIC_PO','B2B_PP_MBB_BASIC_PO','B2B_PR_MBB_BASIC_PO') then 'DATA' else 'VOICE' end) as TTYPE
from st_eoc_item_all st where LOAD_FLAG='Y';


--DELETE FROM contract_po_recon_report 
--WHERE rowid NOT IN ( SELECT MAX(ROWID) FROM contract_po_recon_report
--                     GROUP BY ITEMCODE,cust_class,TTYPE );
 --                   commit;
                     
select                
(select  /*+ parallel (a,8) */ count(*) from contract_po_recon_report where CUST_CLASS='B2C' and LINE_TYPE='PREPAID' and TTYPE='DATA') as B2C_PRE_Data,
(select /*+ parallel (a,8) */ count(*) from contract_po_recon_report where CUST_CLASS='B2C' and LINE_TYPE='PREPAID' and TTYPE='VOICE') as B2C_PRE_Voice,
(select /*+ parallel (a,8) */ count(*) from contract_po_recon_report where CUST_CLASS='B2C' and LINE_TYPE='POSTPAID' and TTYPE='DATA') as B2C_POST_Data,
(select /*+ parallel (a,8) */ count(*) from contract_po_recon_report where CUST_CLASS='B2C' and LINE_TYPE='POSTPAID' and TTYPE='VOICE') as B2C_POST_Voice,
(select /*+ parallel (a,8) */ count(*) from contract_po_recon_report where CUST_CLASS='B2B' and LINE_TYPE='PREPAID' and TTYPE='DATA') as B2B_PRE_Data,
(select /*+ parallel (a,8) */ count(*) from contract_po_recon_report where CUST_CLASS='B2B' and LINE_TYPE='PREPAID' and TTYPE='VOICE') as B2B_PRE_Voice,
(select /*+ parallel (a,8) */ count(*) from contract_po_recon_report where CUST_CLASS='B2B' and LINE_TYPE='POSTPAID' and TTYPE='DATA') as B2B_POST_Data,
(select /*+ parallel (a,8) */ count(*) from contract_po_recon_report where CUST_CLASS='B2B' and LINE_TYPE='POSTPAID' and TTYPE='VOICE') as B2B_POST_Voice
 from dual;
