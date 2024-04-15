SELECT loc,
       item,
       dept,
       unit_cost,
       stock_on_hand
  FROM item_loc_soh ils
 WHERE EXISTS(SELECT 1
                FROM user_dept ud
               WHERE ud.user_id = USER
                 AND ud.dept    = ils.dept);