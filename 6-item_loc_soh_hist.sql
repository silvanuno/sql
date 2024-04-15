CREATE TABLE ITEM_LOC_SOH_HIST
 (
  soh_date      date not null,
  item          varchar2(25) not null,
  loc           number(10) not null,
  dept          number(4) not null,
  unit_cost     number(20,4) not null,
  stock_on_hand number(12,4) not null,
  stock_value   number not null,
  CONSTRAINT PK_ITEM_LOC_SOH_HIST PRIMARY KEY (soh_date, item, loc)
  )