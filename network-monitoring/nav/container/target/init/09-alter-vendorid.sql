alter table vendor alter column vendorid type varchar;

-- Because
--     SQL Error [0A000]: ERROR: cannot alter type of a column used by a view or rule
--       Detail: rule _RETURN on view enterprise_number depends on column "vendorid"
drop view enterprise_number;
alter table type alter column vendorid type varchar;
create view manage.enterprise_number
as
with enterprise as (
    select type.vendorid,
           (string_to_array(type.sysobjectid::text, '.'::text))[7]::integer as enterprise
    from type
)
select enterprise.vendorid,
       enterprise.enterprise,
       count(*) as count
from enterprise
group by enterprise.vendorid, enterprise.enterprise
order by enterprise.enterprise, (count(*)) desc, enterprise.vendorid;
