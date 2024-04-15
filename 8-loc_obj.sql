CREATE OR REPLACE TYPE LOC_OBJ FORCE AS OBJECT
 (
  --
  LOC      NUMBER(10),
  LOC_DESC VARCHAR2(25),
  --
  CONSTRUCTOR FUNCTION LOC_OBJ
  RETURN SELF AS RESULT,
  --
  CONSTRUCTOR FUNCTION LOC_OBJ
   (
    LOC      NUMBER,
    LOC_DESC VARCHAR2
    ) RETURN SELF AS RESULT
  --
  );
/
--
CREATE OR REPLACE TYPE BODY LOC_OBJ IS
  --
  CONSTRUCTOR FUNCTION LOC_OBJ
    RETURN SELF AS RESULT IS
  BEGIN
    RETURN;
  END;
  --
  CONSTRUCTOR FUNCTION LOC_OBJ
   (
    LOC      NUMBER,
    LOC_DESC VARCHAR2
    ) RETURN SELF AS RESULT IS
  --
  BEGIN
    --
    SELF.LOC      := LOC;
    SELF.LOC_DESC := LOC_DESC;
    --
    RETURN;
  --
  END;
  --
END;
/
--
CREATE OR REPLACE TYPE LOC_TBL FORCE AS TABLE OF LOC_OBJ;
/