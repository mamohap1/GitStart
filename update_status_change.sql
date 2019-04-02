drop table tmp_ContractChange_S2A_1;

create table tmp_ContractChange_S2A_1 nologging parallel 16 as
Select /*+  parallel (a,8) (b,8) */
distinct b.* , a.itemid, a.itemcode , a.itemtype, A.CONTEXTID From St_Eoc_Item_Assoc_Root_1 A , STG_CONT_STAT_CHANGE@eoc2bscs B 
Where A.Msisdn = '966'  || B.Msisdn 
And A.Co_Id = B.Cont_id 
And A.Co_Status = 'SUSPENDED'
and b.success_flag = 0 
and load_flag = 'Y';


drop table tmp_ContractChange_S2A_2;

create table tmp_ContractChange_S2A_2 nologging parallel 16 as
Select /*+  parallel (a,8) (b,8) */
distinct b.* , a.itemid, a.itemcode , a.itemtype, A.CONTEXTID From St_Eoc_Item_Assoc_Root_2 A , STG_CONT_STAT_CHANGE@eoc2bscs B 
Where A.Msisdn = '966'  || B.Msisdn 
And A.Co_Id = B.Cont_id 
And A.Co_Status = 'SUSPENDED'
and b.success_flag = 0 
and load_flag = 'Y';


drop table tmp_ContractChange_S2A_3;

create table tmp_ContractChange_S2A_3 nologging parallel 16 as
Select /*+  parallel (a,8) (b,8) */
distinct b.* , a.itemid, a.itemcode , a.itemtype, A.CONTEXTID  From St_Eoc_Item_Assoc_Root_3 A , STG_CONT_STAT_CHANGE@eoc2bscs B 
Where A.Msisdn = '966'  || B.Msisdn 
And A.Co_Id = B.Cont_id 
And A.Co_Status = 'SUSPENDED'
and b.success_flag = 0 
and load_flag = 'Y';


drop table tmp_ContractChange_S2A_4;

create table tmp_ContractChange_S2A_4 nologging parallel 16 as
Select /*+  parallel (a,8) (b,8) */
distinct b.* , a.itemid, a.itemcode, a.itemtype, A.CONTEXTID  From St_Eoc_Item_Assoc_Root_4 A , STG_CONT_STAT_CHANGE@eoc2bscs B 
Where A.Msisdn = '966'  || B.Msisdn 
And A.Co_Id = B.Cont_id 
And A.Co_Status = 'SUSPENDED'
and b.success_flag = 0 
and load_flag = 'Y';



drop table tmp_ContractChange_S2A_5;

create table tmp_ContractChange_S2A_5 nologging parallel 16 as
Select /*+  parallel (a,8) (b,8) */
distinct b.* , a.itemid, a.itemcode , a.itemtype, A.CONTEXTID From St_Eoc_Item_Assoc_Root_5 A , STG_CONT_STAT_CHANGE@eoc2bscs B 
Where A.Msisdn = '966'  || B.Msisdn 
And A.Co_Id = B.Cont_id 
And A.Co_Status = 'SUSPENDED'
and b.success_flag = 0 
and load_flag = 'Y';



drop table tmp_ContractChange_S2A_6;

create table tmp_ContractChange_S2A_6 nologging parallel 16 as
Select /*+  parallel (a,8) (b,8) */
distinct b.* , a.itemid, a.itemcode ,a.itemtype, A.CONTEXTID From St_Eoc_Item_Assoc_Root_6 A , STG_CONT_STAT_CHANGE@eoc2bscs B 
Where A.Msisdn = '966'  || B.Msisdn 
And A.Co_Id = B.Cont_id 
And A.Co_Status = 'SUSPENDED'
and b.success_flag = 0 
and load_flag = 'Y';



drop table tmp_ContractChange_S2A_7;

create table tmp_ContractChange_S2A_7 nologging parallel 16 as
Select /*+  parallel (a,8) (b,8) */
distinct b.* , a.itemid, a.itemcode, a.itemtype, A.CONTEXTID  From St_Eoc_Item_Assoc_Root_7 A , STG_CONT_STAT_CHANGE@eoc2bscs B 
Where A.Msisdn = '966'  || B.Msisdn 
And A.Co_Id = B.Cont_id 
And A.Co_Status = 'SUSPENDED'
and b.success_flag = 0 
and load_flag = 'Y';




drop table tmp_ContractChange_S2A_8;

create table tmp_ContractChange_S2A_8 nologging parallel 16 as
Select /*+  parallel (a,8) (b,8) */
distinct b.* , a.itemid, a.itemcode ,a.itemtype, A.CONTEXTID  From St_Eoc_Item_Assoc_Root_8 A , STG_CONT_STAT_CHANGE@eoc2bscs B 
Where A.Msisdn = '966'  || B.Msisdn 
And A.Co_Id = B.Cont_id 
And A.Co_Status = 'SUSPENDED'
and b.success_flag = 0 
and load_flag = 'Y';



drop table tmp_ContractChange_S2A_9;

create table tmp_ContractChange_S2A_9 nologging parallel 16 as
Select /*+  parallel (a,8) (b,8) */
distinct b.* , a.itemid, a.itemcode, a.itemtype, A.CONTEXTID  From St_Eoc_Item_Assoc_Root_9 A , STG_CONT_STAT_CHANGE@eoc2bscs B 
Where A.Msisdn = '966'  || B.Msisdn 
And A.Co_Id = B.Cont_id 
And A.Co_Status = 'SUSPENDED'
and b.success_flag = 0 
and load_flag = 'Y';


drop table tmp_ContractChange_S2A_10;

create table tmp_ContractChange_S2A_10 nologging parallel 16 as
Select /*+  parallel (a,8) (b,8) */
distinct b.* , a.itemid, a.itemcode , a.itemtype, A.CONTEXTID From St_Eoc_Item_Assoc_Root_10 A , STG_CONT_STAT_CHANGE@eoc2bscs B 
Where A.Msisdn = '966'  || B.Msisdn 
And A.Co_Id = B.Cont_id 
And A.Co_Status = 'SUSPENDED'
and b.success_flag = 0 
and load_flag = 'Y';

drop table tmp_ContractChange_S2A_temp;
create table tmp_ContractChange_S2A_temp nologging parallel 8 as 
select /*+ parallel (a,8) */a.Itemid, a.itemcode, a.msisdn, a.itemtype, a.CONTEXTID From tmp_ContractChange_S2A_1  a
union
select /*+ parallel (a,8) */ a.Itemid, a.itemcode, a.msisdn ,a.itemtype, a.CONTEXTID From tmp_ContractChange_S2A_2  a 
union
select /*+ parallel (a,8) */ a.Itemid, a.itemcode, a.msisdn , a.itemtype, a.CONTEXTID From tmp_ContractChange_S2A_3  a 
union
select /*+ parallel (a,8) */ a.Itemid, a.itemcode, a.msisdn ,a.itemtype, a.CONTEXTID From tmp_ContractChange_S2A_4  a 
union
select /*+ parallel (a,8) */ a.Itemid, a.itemcode, a.msisdn ,a.itemtype, a.CONTEXTID From tmp_ContractChange_S2A_5  a 
union
select /*+ parallel (a,8) */ a.Itemid, a.itemcode, a.msisdn ,a.itemtype, a.CONTEXTID From tmp_ContractChange_S2A_6  a 
union
select /*+ parallel (a,8) */ a.Itemid, a.itemcode, a.msisdn ,a.itemtype, a.CONTEXTID From tmp_ContractChange_S2A_7  a 
union
select /*+ parallel (a,8) */ a.Itemid, a.itemcode, a.msisdn, a.itemtype, a.CONTEXTID From tmp_ContractChange_S2A_8  a 
UNION
select /*+ parallel (a,8) */ a.Itemid, a.itemcode, a.msisdn , a.itemtype, a.CONTEXTID From tmp_ContractChange_S2A_9  a 
union
select /*+ parallel (a,8) */ a.Itemid, a.itemcode, a.msisdn, a.itemtype, a.CONTEXTID  From tmp_ContractChange_S2A_10  a ;

drop index Indx_Ent;  
drop index Indx_Ent_contxid; 
Create Unique Index Ind_Ent On tmp_ContractChange_S2A_temp(itemid ) Parallel 16;
Create Unique Index Indx_Ent_contxid On tmp_ContractChange_S2A_temp(CONTEXTID ) Parallel 16;

drop table tmp_ContractChange_S2A;
create table tmp_ContractChange_S2A as 
select /*+  parallel (a,16) (b,16) */ a.*, b.version from tmp_ContractChange_S2A_temp a, EOC.CWT_SR_CUR_VERSION b
where a.ITEMID=b.DN;


drop index Indx_Ent;
drop index Indx_Ent_contxid;
drop index Indx_item_version;
Create Unique Index Indx_Ent On tmp_ContractChange_S2A(itemid ) Parallel 16;
Create Unique Index Indx_Ent_contxid On tmp_ContractChange_S2A(CONTEXTID ) Parallel 16;
Create Unique Index Indx_item_version On tmp_ContractChange_S2A(itemid,version ) Parallel 16;

--330 sec

---- ContextData
Update (
Select /*+ parallel (a,8) parallel (b,8) */ Data As Tar2,  Replace(A.Data,'SUSPENDED', 'ACTIVE') Src2 ,
  Searchtext Tar1  , Replace(A.Searchtext, 'SUSPENDED', 'ACTIVE') Src1  From 
  eoc.cwt_sr_contextdata a, tmp_ContractChange_S2A b 
  where a.id=b.CONTEXTID
)
Set Tar2 = Src2, Tar1 = Src1;
 
commit; 

---- Service
Update (
Select /*+ parallel (a,8) parallel (b,8) */  STATUSREASON  as tar1, decode(b.ITEMTYPE , 'BillingConfigurationSpec', 'PRO_ACT',
'ChargingConfigurationSpec', 'PRO_ACT', 'CustomerFacingServiceSpec' ,   'PRO_ACT', 'ResourceFacingServiceSpec' , 'OS_CFS')  as src1
From 
  Eoc.Cwt_Sr_service A, tmp_ContractChange_S2A B  
  Where A.ID=B.Itemid 
  and a.version=b.version
  and b.ITEMTYPE IN ('CustomerFacingServiceSpec','ChargingConfigurationSpec','BillingConfigurationSpec','ResourceFacingServiceSpec')
  )
set tar1 = src1; 
commit;

--- Entity
Update (
Select /*+ parallel (a,8) parallel (b,8) */  STATE as tar1 , decode(b.itemtype , 'ProductOffering', 'ACTIVE',
'BillingConfigurationSpec', 'PRO_ACT',
'ChargingConfigurationSpec', 'PRO_ACT', 'CustomerFacingServiceSpec' ,   'PRO_ACT', 'ResourceFacingServiceSpec' , 'OS_CFS','ChargeType', null)  as src1,
CreatedBy Tar3, 'DELTA-STATUS-S2A' As Src3, 
UPDATEDDATE tar4 , sysdate as src4
From 
  Eoc.Cwt_Sr_Entity A, tmp_ContractChange_S2A B  
  Where A.Dn=B.Itemid 
  and a.version=b.version)
set tar1 = src1, tar3 = src3, tar4 = src4;  
commit;


---- EntityACT
Update (
Select /*+ parallel (a,8) parallel (b,8) */  STATE as tar1 , decode(b.itemtype , 'ProductOffering', 'ACTIVE',
'BillingConfigurationSpec', 'PRO_ACT',
'ChargingConfigurationSpec', 'PRO_ACT', 'CustomerFacingServiceSpec' ,   'PRO_ACT', 'ResourceFacingServiceSpec' , 'OS_CFS','ChargeType', null)  as src1,
CreatedBy Tar3, 'DELTA-STATUS-S2A' As Src3, 
UPDATEDDATE tar4 , sysdate as src4
From 
  Eoc.Cwt_Sr_EntityACT A, tmp_ContractChange_S2A B  
  Where A.Dn=B.Itemid 
  and a.version=b.version)
set tar1 = src1, tar3 = src3, tar4 = src4;  
commit;