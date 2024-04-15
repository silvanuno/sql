-- I'm not sure if I understand correctly. to avoid row locks, I usually use session_id in stg tables, and/or threading

ALTER TABLE ITEM DISABLE TABLE LOCK;

ALTER TABLE LOC DISABLE TABLE LOCK;

ALTER TABLE ITEM_LOC_SOH DISABLE TABLE LOCK;