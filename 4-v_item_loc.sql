CREATE OR REPLACE VIEW V_ITEM_LOC(loc, item, dept, unit_cost, stock_on_hand)
SELECT loc,
       item,
       dept,
       unit_cost,
       stock_on_hand
  FROM item_loc_soh
 WHERE EXISTS(SELECT 1
                FROM user_dept ud
               WHERE ud.user_id = USER
                 AND ud.dept    = ils.dept);