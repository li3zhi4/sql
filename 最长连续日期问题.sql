


with t1 as (select id,dt,min(dt) over(partition by id order by dt) dt1,  row_number() over(partition by id order by dt) rn from t2), t3 as (select id,dt,datediff(dt,dt1)+1-rn cnt from t1),t4 as ( select id,min(dt) start,count(1) ct from t3 group by id,cnt), t5 as (select id,start,date_add(start,interval ct day) end,ct from t4),t6 as ( select id,start,end,ct, dense_rank() over(partition by id order
by ct desc) rn from t5) select id,start,end,ct cnt from t6 where rn=1;
