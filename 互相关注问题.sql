-- 表结构  用户id    , 关注id
--         fromid int, toid int
--             1     , 2
--             2     , 1
--             1     , 3
--
--   out       1 , 2
-- 找出所有互相关注的人,要求不能有子查询
select if(fromid<toid,fromid,toid) minid,if(fromid<toid,toid,fromid) maxid from tb group by minid,maxid having count(1)=2;

-- 如果互相关注 ,一定是互逆的，那么将两个id 无差别排序，则改组中一定会存在两个
