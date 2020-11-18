        01 ERROR-TABLE-STORAGE.
           05 FILLER       VALUE
                   'INVALID CAMPGROUND                               '.
           05 FILLER       VALUE
                   'INVALID SITE: FIRST CHARACTER NUMBER             '.
           05 FILLER       VALUE
                   'INVALID SITE: FIRST CHARACTER NOT LETTER         '.
           05 FILLER       VALUE
                   'INVALID SITE: FIRST CHARACTER SPACE              '.
           05 FILLER       VALUE
                   'INVALID SITE: LAST TWO CHARACTERS NOT NUMBERS    '.
           05 FILLER       VALUE 
                   'INVALID SITE: FIRST CHARACTER LESS THAN 1        '.
           05 FILLER       VALUE
                   'INVALID DATE: NON-NUMERIC YYYYMMDD               '.
           05 FILLER       VALUE
                   'INVALID DATE: IN THE PAST YYYYMMDD               '.
           05 FILLER       VALUE 
                   'INVALID MONTH: MONTH NEEDS TO BE 01 TO 12        '.
           05 FILLER       VALUE
                   'INVALID DAY: NEED BETWEEN 1 AND 31 DAYS IN MONTH '.
           05 FILLER       VALUE
                   'INVALID DAY: NEED BETWEEN 1 AND 30 DAYS IN MONTH '.
           05 FILLER       VALUE
                   'INVALID DAY: NEED BETWEEN 1 AND 28 DAYS IN MONTH '.
           05 FILLER       VALUE
                   'INVALID DAY: NEED BETWEEN 1 AND 29 DAYS IN MONTH '.
		   05 FILLER	   VALUE
                   'INVALID STAY: NON-NUMERIC                        '.
		   05 FILLER	   VALUE
                   'INVALID STAY: DATA IS OUTSIDE RANGE 2 TO 11 REQ  '.
		   05 FILLER	   VALUE
                   'LNAME EMPTY                                      '.
		   05 FILLER	   VALUE
                   'FNAME EMPTY                                      '.
		   05 FILLER	   VALUE
                   'I-AMT NON-NUMERIC                                '.
		   05 FILLER	   VALUE
                   'I-AMT NOT CORRECT                                '.
		   05 FILLER	   VALUE
                   'NOT VALID CREDIT CARD TYPE                       '.
		   05 FILLER	   VALUE
                   'CREDIT CARD NUMBER NON-NUMERIC                   '.
		   05 FILLER	   VALUE
                   'CC EXP NON-NUMERIC                               '.
		   05 FILLER	   VALUE
                   'CC EXP IN PAST                                   '.
		   05 FILLER	   VALUE
                   'CC MONTH 1 TO 12                                 '.
		   05 FILLER	   VALUE
                   'CC DAY BETWEEEN 1 AND 31 DAYS FOR MONTH          '.
		   05 FILLER	   VALUE
                   'CC DAY BETWEEEN 1 AND 30 DAYS FOR MONTH          '.
		   05 FILLER	   VALUE
                   'CC DAY BETWEEEN 1 AND 28 FOR MONTH               '.
		   05 FILLER	   VALUE
                   'CC DAY BETWEEEN 1 AND 29 FOR MONTH               '.
		   
		   

       01 ERROR-TABLE REDEFINES ERROR-TABLE-STORAGE.
           05 ERRORS       PIC X(49)   OCCURS 28.