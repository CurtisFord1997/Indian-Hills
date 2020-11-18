       identification division.
       program-id. COBCJF01.
       DATE-WRITTEN. 3/5/20
       AUTHOR. CURTIS FORD.
       DATE-COMPILED.

       environment division.
       INPUT-OUTPUT SECTION.
       
       FILE-CONTROL.
           SELECT INPT 
               ASSIGN TO "C:/COBOLSP20/RESERVE.DAT"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT PRTOUT
               ASSIGN TO "C:/COBOLSP20/CAMPRES.DAT"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT ERROUT
               ASSIGN TO "C:/COBOLSP20/ERROR.PRT"
               ORGANIZATION IS RECORD SEQUENTIAL.

       data division.
       FILE SECTION.
       FD INPT
           LABEL RECORD IS STANDARD
           DATA RECORD IS I-REC
           RECORD CONTAINS 108 CHARACTERS.

       COPY "TRAN.CPY".
       01 INPUT-REDEFING-AREA REDEFINES TRAN-REC.
           05 CAMPGROUND           PIC X(25).
               88 VAL-CAMPGROUND               VALUE "BUCK CREEK" 
                                                   "HONEY CREEK"
                                                   "ISLAND VIEW".
           05 SITE-LTR             PIC X.
           05 SITE-NUM             PIC 99.
               88 VAL-SITE-NUM                 VALUE 1 THRU 99.
           05 REDF-DATE.
               10 REDF-DATE-YYYY          PIC 9(4).
               10 REDF-DATE-MM            PIC 99.
               10 REDF-DATE-DD            PIC 99.
           05 R-LEN-STAY           PIC 99.
               88 VAL-LEN-STAY                 VALUE 2 THRU 11.
           05 FILLER               PIC X(45).
           05 R-CCTYPE             PIC X.
               88 VAL-CCTYPE                   VALUE "V" "M" "A".

           05 CC-NUM-PART          PIC 9(4) OCCURS 4.
           05 CC-EXP.
               10 C-CCEXP-YYYY         PIC 9(4).
               10 C-CCEXP-MM           PIC 99.
               10 C-CCEXP-DD           PIC 99.

       FD PRTOUT
           LABEL RECORD IS STANDARD
           DATA RECORD IS VAL-REC
           RECORD CONTAINS 96 CHARACTERS.
       01 PRTLINE                  PIC X(136).

       FD ERROUT
           LABEL RECORD IS STANDARD
           RECORD CONTAINS 132 CHARACTERS
           DATA RECORD IS ERRLINE
           LINAGE IS 60 WITH FOOTING AT 47.
       01 ERRLINE                  PIC X(132).
           
       working-storage section.
       01 ERROR-LINES.
           05 BLANK-LINE           PIC X(132)  
           05 ERROR-COMP-TITLE-1.
               10 FILLER           PIC X(6)    VALUE 'DATE:'.
               10 COMP-DATE.
                   15 MM           PIC 99.
                   15 FILLER       PIC X       VALUE '/'.
                   15 DD PIC 99.
                   15 FILLER       PIC X       VALUE '/'.
                   15 YYYY PIC 9(4).
               10 FILLER PIC X(36)             VALUE SPACE.
               10 FILLER PIC X(72)             VALUE 
                                       'THE CAMPGROUNDS ERROR REPORT'.
               10 FILLER           PIC X(6)    VALUE 'PAGE:'.
               10 PG               PIC Z9.
           05 ERR-REC          PIC X(132).
           05 ERR-LINE.
               15 FILLER       PIC X(5)        VALUE SPACES.
               15 ERR-MSG      PIC X(127).
           05 ERROR-TOTALS.
               15 FILLER       PIC X(16)       VALUE "ERROR TOTALS:".
               15 FILLER       PIC X(21)       VALUE 
                                       "RECORDS WITH ERRORS:".
               15 ERR-TOT-REC  PIC ZZ,ZZ9.
               15 FILLER       PIC X(5)        VALUE SPACES.
               15 FILLER       PIC X(14)       VALUE "TOTAL ERRORS:".
               15 ERR-TOTS     PIC Z,ZZZ,ZZ9.
               15 FILLER       PIC X(66)       VALUE SPACES.

       01 ERROR-TRACKING.
           05 ERROR-TOTAL-TRACKING.
               10 ERRS-LINES       PIC 9(5)    VALUE 0.
               10 ERRS-TOT         PIC 9(7)    VALUE 0.
           05 ERROR-SWITCHES.
               10 ERR-SW PIC X.
               10 CAMP-SW PIC X.
               10 SITE-SW PIC X.
               10 DATE-SW PIC X.
               10 STAY-SW PIC X.


       01 CURRENT-DATE-AND-TIME.
           05 CURR-DATE            PIC 9(8).
           05 FILLER               PIC X(11).
       01 DATE-FOR-HEADER REDEFINES CURRENT-DATE-AND-TIME.
           05 I-DATE-HEADER.
               10 I-YYYY           PIC 9(4).
               10 I-MM             PIC 99.
               10 I-DD             PIC 99.
           05 FILLER               PIC X(11).

       01 C-DATE.
           05 C-YYYY               PIC 9(4).
           05 C-MM                 PIC 99.
               88 VAL-DATE-MM                  VALUE 1 THRU 12.
               88 VAL-DATE-MM-31-DS            VALUE 1 3 5 7 8 10 12.
               88 VAL-DATE-MM-30-DS            VALUE 4 6 9 11.
           05 C-DD                 PIC 99.
               88 VAL-DD-31-DS                 VALUE 1 THRU 31.
               88 VAL-DD-30-DS                 VALUE 1 THRU 30.
               88 VAL-DD-29-DS                 VALUE 1 THRU 29.
               88 VAL-DD-28-DS                 VALUE 1 THRU 28.

       01 WHICH-DATE               PIC 9.

       01 END-DATE.
           05 C-END-YYYY           PIC 9(4).
           05 C-END-MM             PIC 99.
           05 C-END-DD             PIC 99.

       01 MAX-DAYS-IN-MONTH        PIC 99.

       01 EOF                      PIC X.
       01 ERROR-PAGE               PIC 99      VALUE 0.
       01 LEAP-RMDR                PIC 9.
       
           
       COPY "ERROR.CPY".
       COPY "VAL.CPY".
       COPY "CAMP.CPY".

       procedure division.
       L1-MAIN.
           PERFORM L2-INIT.
           PERFORM L2-MAINLINE
             UNTIL EOF = 'T'.
           PERFORM L2-CLOSING.
           STOP RUN.

       L2-INIT.
           OPEN INPUT INPT.
           OPEN OUTPUT PRTOUT.
           OPEN OUTPUT ERROUT.

           MOVE FUNCTION CURRENT-DATE TO CURRENT-DATE-AND-TIME.
           MOVE CURR-DATE TO I-DATE-HEADER.
           MOVE I-MM TO MM.
           MOVE I-DD TO DD.
           MOVE I-YYYY TO YYYY.

           PERFORM L3-ERR-HEADINGS.
           PERFORM L3-READ.

       L2-MAINLINE.
           PERFORM L3-VALIDATION.
           IF ERR-SW = 'F'
               PERFORM L3-CALC-END-DATE
               PERFORM L3-MANIPULATE-STRINGS
               PERFORM L3-OUTPUT
           END-IF.
           PERFORM L3-READ.

       L2-CLOSING.
           MOVE ERRS-LINES TO ERR-TOT-REC.
           MOVE ERRS-TOT TO ERR-TOTS.
           WRITE ERRLINE FROM ERROR-TOTALS
               AFTER ADVANCING 3 LINES.
           

       L3-ERR-HEADINGS.
           ADD 1 TO ERROR-PAGE.
           MOVE ERROR-PAGE TO PG.

           WRITE ERRLINE FROM ERROR-COMP-TITLE-1
               AFTER ADVANCING PAGE.
           WRITE ERRLINE FROM BLANK-LINE
               AFTER ADVANCING 1 LINE.

      *DO THE HEADINGS FOR THE ERROR REPORT
       L3-READ.
           READ INPT
               AT END
                   MOVE "T" TO EOF.
      *READ FILE
       L3-VALIDATION.
           MOVE 'F' TO CAMP-SW.
           MOVE 'F' TO SITE-SW.
           MOVE 'F' TO DATE-SW.
           MOVE 'F' TO STAY-SW.
           MOVE 'F' TO ERR-SW.
           
           IF NOT VAL-CAMPGROUND
               MOVE 'T' TO CAMP-SW
               MOVE ERRORS(1) TO ERR-MSG
               PERFORM L4-MAIN-ERROR
           END-IF.
      *CHECK THE SITE FIRST LETTER
           IF SITE-LTR NUMERIC
               MOVE 'T' TO SITE-SW
               MOVE ERRORS(2) TO ERR-MSG
               PERFORM L4-MAIN-ERROR
           ELSE
               IF SITE-LTR NOT ALPHABETIC
                   MOVE 'T' TO SITE-SW
                   MOVE ERRORS(3) TO ERR-MSG
                   PERFORM L4-MAIN-ERROR
               END-IF
           END-IF.
           IF SITE-LTR = SPACE
               MOVE 'T' TO SITE-SW
               MOVE ERRORS(4) TO ERR-MSG
               PERFORM L4-MAIN-ERROR
           END-IF.
      *CHECK THE SITE TWO DIDGET NUMBER
           IF SITE-NUM NOT NUMERIC
               MOVE 'T' TO SITE-SW
               MOVE ERRORS(5) TO ERR-MSG
               PERFORM L4-MAIN-ERROR
           ELSE
               IF NOT VAL-SITE-NUM
                   MOVE 'T' TO SITE-SW
                   MOVE ERRORS(6) TO ERR-MSG
                   PERFORM L4-MAIN-ERROR
               END-IF
           END-IF.
      *CHECKS TO MAKE SURE THE DATE IS VALID
           MOVE 1 TO WHICH-DATE.
           MOVE I-DATE TO C-DATE.
           PERFORM L4-DATE-VAL.
      *CHECKS TO SEE IF THE LENGTH OF STAY IS VALID 
           IF I-LEN-STAY NOT NUMERIC
               MOVE 'T' TO STAY-SW
               MOVE ERRORS(14) TO ERR-MSG
               PERFORM L4-MAIN-ERROR
           ELSE
               IF NOT VAL-LEN-STAY
                   MOVE 'T' TO STAY-SW
                   MOVE ERRORS(15) TO ERR-MSG
                   PERFORM L4-MAIN-ERROR
               END-IF
           END-IF.
      *CHECKS TO MAKE SURE LNAME CONTAINS DATA
           IF I-LNAME = SPACES
               MOVE ERRORS(16) TO ERR-MSG
               PERFORM L4-MAIN-ERROR
           END-IF.
      *CHECKS TO MAKE SURE LNAME CONTAINS DATA
           IF I-FNAME = SPACES
               MOVE ERRORS(17) TO ERR-MSG
               PERFORM L4-MAIN-ERROR
           END-IF
      *CHECKS TO SEE IF I-AMT IS NUMERIC, AND IF IT IS IT CHECKS TO 
      *MAKE SURE THAT I-AMT WOULD MATCH HOW MUCH IT WOULD COST FOR
      *THAT PARTICULAR SITE BASED ON IT'S RATE AND THE STAY
           IF I-AMT NOT NUMERIC
               MOVE ERRORS(18) TO ERR-MSG
               PERFORM L4-MAIN-ERROR
           ELSE
               IF SITE-SW = 'F'
                   IF STAY-SW = 'F'
                       SET SITE-INDEX TO 1

                       SEARCH SITE-GROUP
                           WHEN SITE(SITE-INDEX) = SITE-LTR
                       END-SEARCH
                       IF I-AMT NOT = I-LEN-STAY * PRICE(SITE-INDEX)
                           MOVE ERRORS(19) TO ERR-MSG
                           PERFORM L4-MAIN-ERROR
                       END-IF
                   END-IF
               END-IF
           END-IF. 
      *USES THE LVL88 TO CHECK THE CCTYPE
           IF NOT VAL-CCTYPE
               MOVE ERRORS(20) TO ERR-MSG
               PERFORM L4-MAIN-ERROR
           END-IF
      *CHECKS TO MAKE SURE THE CREDIT CARD NUMBER IS NUMERIC
           IF I-CCNUM NOT NUMERIC
               MOVE ERRORS(21) TO ERR-MSG
               PERFORM L4-MAIN-ERROR
           END-IF
      *CHECKS TO MAKE SURE EXPERATION DATE IS VALID
           MOVE CC-EXP TO C-DATE.
           MOVE 2 TO WHICH-DATE.
           PERFORM L4-DATE-VAL.
           
       L3-CALC-END-DATE.
           MOVE REDF-DATE TO C-DATE.
           EVALUATE TRUE
               WHEN VAL-DATE-MM-31-DS
                   MOVE 31 TO MAX-DAYS-IN-MONTH
               WHEN VAL-DATE-MM-30-DS
                   MOVE 30 TO MAX-DAYS-IN-MONTH
               WHEN OTHER
                   DIVIDE C-YYYY BY 4 GIVING LEAP-RMDR
                     REMAINDER LEAP-RMDR
                   IF LEAP-RMDR > 0
                       MOVE 28 TO MAX-DAYS-IN-MONTH
                   ELSE
                       MOVE 29 TO MAX-DAYS-IN-MONTH
                   END-IF
           END-EVALUATE.

           IF C-DD + I-AMT > MAX-DAYS-IN-MONTH
               COMPUTE C-END-DD = C-DD + I-AMT - 
               MAX-DAYS-IN-MONTH
               IF C-MM = 12
                   COMPUTE C-END-MM = 1
                   COMPUTE C-END-YYYY = C-YYYY + 1
               ELSE
                   COMPUTE C-END-MM = C-MM + 1
                   COMPUTE C-END-YYYY = C-YYYY
               END-IF
           ELSE
               COMPUTE C-END-DD = C-DD + I-AMT
               COMPUTE C-END-MM = C-MM
               COMPUTE C-END-YYYY = C-YYYY
           END-IF.

       L3-MANIPULATE-STRINGS.
           MOVE SPACES TO O-NAME.
           STRING I-LNAME '**' I-FNAME
               DELIMITED BY SPACE
                   INTO O-NAME
           INSPECT O-NAME REPLACING ALL '**' BY ', '.

           EVALUATE I-CCTYPE
               WHEN 'V'
                   MOVE 'VISA' TO O-CCTYPE
               WHEN 'M'
                   MOVE 'MASTER CARD' TO O-CCTYPE
               WHEN 'A'
                   MOVE 'AMERICAN EXPRESS' TO O-CCTYPE
           END-EVALUATE.

           STRING CC-NUM-PART(1) '-' CC-NUM-PART(2) '-'
                  CC-NUM-PART(2) '-' CC-NUM-PART(4)
               INTO O-CCNUM.

       L3-OUTPUT.
           MOVE I-CAMPGROUND TO O-CAMPGROUND.
           MOVE I-SITE TO O-SITE.
           MOVE I-DATE TO O-DATE
           MOVE END-DATE TO O-END-DATE.
           MOVE I-LEN-STAY TO O-LEN-STAY.
           MOVE I-AMT TO O-AMT.
           MOVE CC-NUM-PART(1) TO NUM-FST.
           MOVE CC-NUM-PART(2) TO NUM-SND.
           MOVE CC-NUM-PART(3) TO NUM-THRD.
           MOVE CC-NUM-PART(4) TO NUM-FOURTH.
           MOVE I-CCEXP TO O-CCEXP.

           WRITE PRTLINE FROM VAL-REC.

       L4-MAIN-ERROR.
           IF ERR-SW = 'F'
               MOVE TRAN-REC TO ERR-REC
               ADD 1 TO ERRS-LINES
               WRITE ERRLINE FROM ERR-REC
                   AFTER ADVANCING 2 LINE
           END-IF.
           WRITE ERRLINE FROM ERR-LINE
             AFTER ADVANCING 1 LINE
               AT EOP
                   PERFORM L3-ERR-HEADINGS.
           ADD 1 TO ERRS-TOT.
           MOVE 'T' TO ERR-SW.

       L4-DATE-VAL.
            EVALUATE TRUE
               WHEN C-DATE NOT NUMERIC
                   IF WHICH-DATE = 1
                       MOVE 'T' TO DATE-SW
                       MOVE ERRORS(7) TO ERR-MSG
                   ELSE
                       MOVE ERRORS(22) TO ERR-MSG 
                   END-IF
                   PERFORM L4-MAIN-ERROR
               WHEN C-DATE < CURR-DATE
                   IF WHICH-DATE = 1
                       MOVE 'T' TO DATE-SW
                       MOVE ERRORS(8) TO ERR-MSG
                   ELSE
                       MOVE ERRORS(23) TO ERR-MSG
                   END-IF
                   PERFORM L4-MAIN-ERROR
               WHEN NOT VAL-DATE-MM
                   IF WHICH-DATE = 1
                       MOVE 'T' TO DATE-SW
                       MOVE ERRORS(9) TO ERR-MSG
                   ELSE
                       MOVE ERRORS(24) TO ERR-MSG
                   END-IF
                   PERFORM L4-MAIN-ERROR
               WHEN VAL-DATE-MM-31-DS
                   IF NOT VAL-DD-31-DS
                       IF WHICH-DATE = 1
                           MOVE 'T' TO DATE-SW
                           MOVE ERRORS(10) TO ERR-MSG
                       ELSE
                           MOVE ERRORS(25) TO ERR-MSG
                       END-IF
                       PERFORM L4-MAIN-ERROR
                   END-IF
               WHEN VAL-DATE-MM-30-DS
                   IF NOT VAL-DD-30-DS
                       IF WHICH-DATE = 1
                           MOVE 'T' TO DATE-SW
                           MOVE ERRORS(11) TO ERR-MSG
                       ELSE
                           MOVE ERRORS(26) TO ERR-MSG
                       END-IF
                       PERFORM L4-MAIN-ERROR
                   END-IF
               WHEN OTHER
                   DIVIDE C-YYYY BY 4 GIVING LEAP-RMDR
                     REMAINDER LEAP-RMDR
                   IF LEAP-RMDR > 0
                       IF NOT VAL-DD-28-DS
                           IF WHICH-DATE = 1
                               MOVE 'T' TO DATE-SW
                               MOVE ERRORS(12) TO ERR-MSG
                           ELSE
                               MOVE ERRORS(27) TO ERR-MSG
                           END-IF
                           PERFORM L4-MAIN-ERROR
                       END-IF
                   ELSE
                       IF NOT VAL-DD-29-DS
                           IF WHICH-DATE = 1
                               MOVE 'T' TO DATE-SW
                               MOVE ERRORS(13) TO ERR-MSG
                           ELSE 
                               MOVE ERRORS(28) TO ERR-MSG
                           END-IF
                           PERFORM L4-MAIN-ERROR
                       END-IF
                   END-IF
           END-EVALUATE.
           
       end program COBCJF01.


      *ERROR FILE
      *THE LINE FROM THE FILE  COUNT NUMBER OF LINES W ERRORS  FOR GT
      *    ERROR MESSAGE 1     ALSO COUNT THESE FOR GT
      *    ERROR MESSAGE 2