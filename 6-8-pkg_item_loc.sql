CREATE OR REPLACE PACKAGE PKG_ITEM_LOC IS
  --
  FUNCTION INSERT_ITEM_LOC_SOH_HIST(I_location IN item_loc_soh.loc%TYPE DEFAULT NULL)
    RETURN BOOLEAN;
  --
  FUNCTION GET_LOC RETURN LOC_TBL PIPELINED;
  --
END PKG_ITEM_LOC;
/
CREATE OR REPLACE PACKAGE BODY PKG_ITEM_LOC IS
  --
  FUNCTION INSERT_ITEM_LOC_SOH_HIST(I_location IN item_loc_soh.loc%TYPE DEFAULT NULL)
    RETURN BOOLEAN IS
  BEGIN
    --
    INSERT /*+ append */ INTO ITEM_LOC_SOH_HIST(soh_date, item, loc, dept, unit_cost, stock_on_hand, stock_value)
    SELECT SYSDATE, item, loc, dept, unit_cost, stock_on_hand, unit_cost * stock_on_hand
      FROM item_loc_soh
     WHERE loc = NVL(I_location, loc);
     --
     RETURN TRUE;
     --
  EXCEPTION
    WHEN OTHERS THEN
      RETURN FALSE;
  END INSERT_ITEM_LOC_SOH_HIST;
  --
  FUNCTION GET_LOC RETURN LOC_TBL PIPELINED
    IS
  BEGIN
    --
    FOR l IN (SELECT loc,
                     loc_desc
                FROM loc) LOOP
      --
      PIPE ROW(LOC_OBJ(loc      => l.loc,
                       loc_desc => l.loc_desc));
    --
    END LOOP;
    --
  END GET_LOC;
  --
END PKG_ITEM_LOC;
/