DECLARE
  --
  v_file_handle utl_file.file_type;
  v_prev_loc    NUMBER  := 0;
  v_is_open     BOOLEAN := FALSE;
  --
BEGIN
  --
  FOR soh in (SELECT loc,
                     item,
                     dept,
                     unit_cost,
                     stock_on_hand,
                     unit_cost * stock_on_hand stock_value
                FROM item_loc_soh
               ORDER BY loc)
  LOOP
    --
    IF v_prev_loc <> soh.loc THEN
      IF v_is_open THEN
        utl_file.fclose(v_file_handle);
      END IF;
      --
      v_file_handle := utl_file.fopen('DP_DEST', soh.loc||'.csv', 'w', 32767);
      utl_file.put_line(v_file_handle,
                        'item,dept,unit_cost,stock_on_hand,stock_value');
      --
      v_prev_loc := soh.loc;
      v_is_open  := TRUE;
    END IF;
    --
    utl_file.put_line(v_file_handle,
                      soh.item || ',' || soh.dept || ',' || soh.unit_cost || ',' || soh.stock_on_hand || ',' || soh.stock_value);
    --
  END LOOP;
  --
  IF v_is_open THEN
    utl_file.fclose(v_file_handle);
  END IF;
  --
END;