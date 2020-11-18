       identification division.
       program-id. COBCJF06.
       DATE-WRITTEN. 1/31/20
       AUTHOR. CURTIS FORD.
       DATE-COMPILED.

      ******************************************************************
      *THIS PROGRAM CREATES A PRINT REPORT AND AN ERROR REPORT BY 
      *VALIDATING INPUT DATA, THIS TIME USING TABLES
      ******************************************************************

       environment division.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPT
               ASSIGN TO 'C:\COBOL\CBLPOPSL.DAT'
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT PRTOUT
               ASSIGN TO 'C:\COBOL\CBLPOPSL.PRT'
               ORGANIZATION IS RECORD SEQUENTIAL.
           SELECT ERROUT
               ASSIGN TO 'C:\COBOL\CBLPOPER.PRT'
               ORGANIZATION IS RECORD SEQUENTIAL.

       data division.
       FILE SECTION.
       
       FD INPT
           LABEL RECORD IS STANDARD
           DATA RECORD IS I-REC
           RECORD CONTAINS 71 CHARACTERS.

       01 I-REC.
           05 I-LNAME          PIC X(15).
           05 I-FNAME          PIC X(15).
           05 I-ADDRESS        PIC X(15).
           05 I-CITY           PIC X(10).
           05 I-STATE          PIC XX.
               88 VAL-STATE
                   VALUE 'IA','IL','MI','MO','NE','WI'.
           05 I-ZIP.
               10 I-ZIP1       PIC 9(5).
               10 I-ZIP2       PIC 9(4).
           05 I-POP-TYPE       PIC 99.
               88 VAL-POP-TYPE             VALUE 1 THRU 6.
           05 I-CASES          PIC 99.
           05 I-TEAM           PIC X.
               88 VAL-TEAM                 VALUE 'A' THRU 'E'.

       FD PRTOUT
           LABEL RECORD IS STANDARD
           RECORD CONTAINS 132 CHARACTERS
           DATA RECORD IS PRTLINE
           LINAGE IS 60 WITH FOOTING AT 59.

       01 PRTLINE              PIC X(132).

       FD ERROUT
           LABEL RECORD IS STANDARD
           RECORD CONTAINS 132 CHARACTERS
           DATA RECORD IS ERRLINE
           LINAGE IS 60 WITH FOOTING AT 59.

       01 ERRLINE              PIC X(132).

       working-storage section.
       01 WORK-AREA.
           05 MORE-RECS        PIC XXX     VALUE 'YES'.

       01 CURRENT-DATE-AND-TIME.
           05 I-DATE.
               10 I-YYYY       PIC 9(4).
               10 I-MM         PIC 99.
               10 I-DD         PIC 99.
           05 I-TIME           PIC X(11).

       01 BLANK-LINE           PIC X(132)  VALUE SPACE.

      *COMMON HEADER LINES
       01 COMP-TITLE1.
           05 FILLER           PIC X(6)    VALUE 'DATE:'.
           05 COMP-DATE.
               10 MM           PIC 99.
               10 FILLER       PIC X       VALUE '/'.
               10 DD           PIC 99.
               10 FILLER       PIC X       VALUE '/'.
               10 YYYY         PIC 9(4).
           05 FILLER           PIC X(36)   VALUE SPACE.
           05 FILLER           PIC X(72)
               VALUE 'ALBIA SOCCER CLUB FUNDRAISER'.
           05 FILLER           PIC X(6)    VALUE 'PAGE:'.
           05 PG               PIC Z9.

       01 COMP-TITLE2.
           05 FILLER           PIC X(58)   VALUE 'COBCJF05'.
           05 FILLER           PIC X(74)   VALUE 'CURTIS DIVISION'.

      *VALID HEADER LINES
       01 SALES-TITLE.
           05 FILLER           PIC X(60)   VALUE SPACE.
           05 FILLER           PIC X(72)   VALUE 'SALES REPORT'.

       01 COLUMB-HEADINGS.
           05 FILLER           PIC XXX     VALUE SPACE.
           05 FILLER           PIC X(17)   VALUE "LAST NAME".
           05 FILLER           PIC X(17)   VALUE "FIRST NAME".
           05 FILLER           PIC X(12)   VALUE "CITY".
           05 FILLER           PIC X(6)    VALUE "STATE".
           05 FILLER           PIC X(12)   VALUE "ZIP CODE".
           05 FILLER           PIC X(21)   VALUE "POP TYPE".
           05 FILLER           PIC X(14)   VALUE "QUANTITY".
           05 FILLER           PIC X(17)   VALUE "DEPOSIT AMT".
           05 FILLER           PIC X(13)   VALUE "TOTAL SALES".

      *ERROR HEADER LINES
       01 ERROR-TITLE.
           05 FILLER           PIC X(60)   VALUE SPACE.
           05 FILLER           PIC X(72)   VALUE "ERROR REPORT".

       01 ERROR-HEADINGS.
           05 FILLER           PIC X(72)   VALUE "ERROR RECORD".
           05 FILLER           PIC X(60)   VALUE "ERROR DESCRIPTION".

      *DATA LINES
       01 DATA-LINE.
           05 FILLER           PIC XXX     VALUE SPACE.
           05 O-LNAME          PIC X(17).
           05 O-FNAME          PIC X(17).
           05 O-CITY           PIC X(13).
           05 O-STATE          PIC X(5).
           05 O-ZIP1           PIC 9(5).
           05 FILLER           PIC X       VALUE "-".
           05 O-ZIP2           PIC 9(4).
           05 FILLER           PIC XX      VALUE SPACE.
           05 O-POP-TYPE       PIC X(24).
           05 O-CASES          PIC Z9.
           05 FILLER           PIC X(11)   VALUE SPACE.
           05 O-DEPOSIT        PIC $(4).99.
           05 FILLER           PIC X(9)    VALUE SPACE.
           05 O-TOT-SALES      PIC $$,$$$.99.
           05 FILLER           PIC XXX     VALUE SPACE.

       01 ERROR-LINE.
           05 ERROR-RECORD     PIC X(72).
           05 ERROR-DESCR      PIC X(60).

      *GRAND TOTALS LINES
       01 GT-POP-HEADING       PIC X(132)  VALUE "GRAND TOTALS:".

       01 GT-POP-LINE.
           05 POP-GRP              OCCURS 3.
               10 FILLER           PIC X(3)    VALUE SPACE.
               10 GT-POP           PIC X(17).
               10 GT-POP-QTY       PIC ZZZ,ZZ9.
               10 FILLER           PIC X(3)    VALUE SPACE.
           05 FILLER           PIC X(42)   VALUE SPACE.
       
       01 GT-TEAM-HEADING      PIC X(132)  VALUE "TEAM TOTALS:".

       01 GT-TEAM-LINE.
           05 FILLER           PIC XXX     VALUE SPACE.
           05 GT-TEAM          PIC XX.
           05 GT-TEAM-TOT      PIC $$$$,$$$,$$$.99.
           05 FILLER           PIC X(112)  VALUE SPACE.

       01 GT-ERROR-LINE.
           05 FILLER           PIC X(13)   VALUE 'TOTAL ERRORS'.
           05 GT-ERROR         PIC Z,ZZ9.
           05 FILLER           PIC X(101)  VALUE SPACE.

      *ERROR TABLE
       01 ERRORS.
           05 FILLER           PIC X(60)   VALUE 'LAST NAME REQUIRED'.
           05 FILLER           PIC X(60)   VALUE 'FIRST NAME REQUIRED'.
           05 FILLER           PIC X(60)   VALUE 'ADDRESS REQUIRED'.
           05 FILLER           PIC X(60)   VALUE 'CITY REQIRED'.
           05 FILLER           PIC X(60)   VALUE 'STATE REQIRED'.
           05 FILLER           PIC X(60)
               VALUE 'STATE INVALID, NEED IA, IL, MI, MO, NE, OR WI'.
           05 FILLER           PIC X(60)   VALUE 'ZIP CODE NOT NUMERIC'.
           05 FILLER           PIC X(60)
               VALUE 'POP TYPE NOT NUMERIC, NEED VALUES 1-6'.
           05 FILLER           PIC X(60)
               VALUE 'POP-TYPE NEEDS TO BE 1-6'.
           05 FILLER           PIC X(60)   VALUE 'CASES NOT NUMERIC'.
           05 FILLER           PIC X(60)
               VALUE 'AT LEAST ONE CASE REQUIRED'.
           05 FILLER           PIC X(60)
               VALUE 'NOT A VALID TEAM. ONLY A THROUGH E'.

       01 ERROR-TABLE REDEFINES ERRORS.
           05 ERROR-MSG        PIC X(60)   OCCURS 12 TIMES.

      *TEAM TABLES
       01 TEAMS.
           05 FILLER           PIC X       VALUE 'A'.
           05 FILLER           PIC X       VALUE 'B'.
           05 FILLER           PIC X       VALUE 'C'.
           05 FILLER           PIC X       VALUE 'D'.
           05 FILLER           PIC X       VALUE 'E'.

       01 TEAM-NAMES REDEFINES TEAMS.
           05 TEAM             PIC X       OCCURS 5.

       01 TEAM-TOTAL-SALES-TABLE.
           05 TEAM-TOTAL       PIC 9(9)V99 OCCURS 6.

       01 TEAM-SUB             PIC 9.

      *STATE POP DEPOSIT TABLE
       01 STATES.
           05 FILLER.
               10 FILLER       PIC XX      VALUE "IA".
               10 FILLER       PIC V99     VALUE .05.
           05 FILLER.
               10 FILLER       PIC XX      VALUE "IL".
               10 FILLER       PIC V99     VALUE 0.
           05 FILLER.
               10 FILLER       PIC XX      VALUE "MI".
               10 FILLER       PIC V99     VALUE .10.
           05 FILLER.
               10 FILLER       PIC XX      VALUE "MO".
               10 FILLER       PIC V99     VALUE 0.
           05 FILLER.
               10 FILLER       PIC XX      VALUE "NE".
               10 FILLER       PIC V99     VALUE .05.
           05 FILLER.
               10 FILLER       PIC XX      VALUE "WI".
               10 FILLER       PIC V99     VALUE .05.

       01 STATE-TABLE REDEFINES STATES.
           05 STATE-LINE                   OCCURS 6.
               10 STATE-NAME   PIC XX.
               10 STATE-RATE   PIC V99.
       01 SUB            PIC 9.

      *POP TOT QTYS TABLE
       01 POP-TOT.
           05 POP-QTY          PIC 9(6)    OCCURS 6.

      *POP NAMES TABLE
       01 POP-NAMES.
           05 FILLER           PIC X(16)   VALUE 'COKE'.
           05 FILLER           PIC X(16)   VALUE 'DIET COKE'.
           05 FILLER           PIC X(16)   VALUE "MELLO YELLO".
           05 FILLER           PIC X(16)   VALUE "CHERRY COKE".
           05 FILLER           PIC X(16)   VALUE 'DIET CHERRY COKE'.
           05 FILLER           PIC X(16)   VALUE 'SPRITE'.

       01 POP-NAME-TABLE REDEFINES POP-NAMES.
           05 POP-NAME         PIC X(16)   OCCURS 6.

      *CALCULATION VARIABLES
       01 DATA-LINE-VARS.
           05 DEPOSIT          PIC 999V99.
           05 TOTAL-SALES      PIC 9(4)V99.
           05 PG-DATA          PIC 99      VALUE ZERO.

       01 ERROR-LINE-VARS.
           05 ERR-SW           PIC XXX.
           05 PG-ERROR         PIC 99      VALUE ZERO.

       01 GT-ERRORS            PIC 9(4)    VALUE ZERO.

       procedure division.
       0000-MAIN.
           PERFORM 1000-INIT.
           PERFORM 2000-BODY
               UNTIL MORE-RECS = "NO".
           PERFORM 3000-CLOSING.
           STOP RUN.

       1000-INIT.
           OPEN INPUT INPT.
           OPEN OUTPUT PRTOUT.
           OPEN OUTPUT ERROUT.

           MOVE FUNCTION CURRENT-DATE TO CURRENT-DATE-AND-TIME.
           MOVE I-YYYY TO YYYY.
           MOVE I-MM TO MM.
           MOVE I-DD TO DD.

           PERFORM 9000-READ.
           PERFORM 9100-VALID-HEADER.
           PERFORM 9200-ERROR-HEADER.
           PERFORM
               VARYING SUB FROM 1 BY 1
                   UNTIL SUB > 6
                       MOVE ZERO TO POP-QTY(SUB).
           PERFORM
               VARYING TEAM-SUB FROM 1 BY 1
                   UNTIL TEAM-SUB > 5
                       MOVE ZERO TO TEAM-TOTAL(TEAM-SUB).

       2000-BODY.
           PERFORM 2100-VALIDATION THRU 2100-X.
           IF ERR-SW = 'NO'
               PERFORM 2200-CALCS
               PERFORM 2300-OUTPUT
           ELSE
               PERFORM 2400-ERROR
           END-IF

           PERFORM 9000-READ.

       2100-VALIDATION.
           MOVE 'YES' TO ERR-SW.
           EVALUATE TRUE
               WHEN I-LNAME = SPACES
                   MOVE ERROR-MSG(1) TO ERROR-DESCR
               WHEN I-FNAME = SPACES
                   MOVE ERROR-MSG(2) TO ERROR-DESCR
               WHEN I-ADDRESS = SPACES
                   MOVE ERROR-MSG(3) TO ERROR-DESCR
               WHEN I-CITY = SPACES
                   MOVE ERROR-MSG(4) TO ERROR-DESCR
               WHEN I-STATE = SPACES 
                   MOVE ERROR-MSG(5) TO ERROR-DESCR
               WHEN NOT VAL-STATE
                   MOVE ERROR-MSG(6) TO ERROR-DESCR
               WHEN I-ZIP NOT NUMERIC
                   MOVE ERROR-MSG(7) TO ERROR-DESCR
               WHEN I-POP-TYPE NOT NUMERIC
                   MOVE ERROR-MSG(8)
                       TO ERROR-DESCR
               WHEN NOT VAL-POP-TYPE 
                   MOVE ERROR-MSG(9) TO ERROR-DESCR
               WHEN I-CASES NOT NUMERIC
                   MOVE ERROR-MSG(10) TO ERROR-DESCR
               WHEN I-CASES < 1 
                   MOVE ERROR-MSG(11) TO ERROR-DESCR
               WHEN NOT VAL-TEAM
                   MOVE ERROR-MSG(12) TO ERROR-DESCR
               WHEN OTHER
                   MOVE 'NO' TO ERR-SW
           END-EVALUATE.

       2100-X.
           EXIT.

       2200-CALCS.
           PERFORM 
               VARYING SUB FROM 1 BY 1
                   UNTIL I-STATE = STATE-NAME(SUB).
           COMPUTE DEPOSIT ROUNDED = STATE-RATE(SUB) * 24 * 
               I-CASES.
           COMPUTE TOTAL-SALES = I-CASES * 18.71 + DEPOSIT.
           MOVE POP-NAME(I-POP-TYPE) TO O-POP-TYPE.

           ADD I-CASES TO POP-QTY(I-POP-TYPE).

           PERFORM
               VARYING TEAM-SUB FROM 1 BY 1
                   UNTIL TEAM(TEAM-SUB) = I-TEAM 
           END-PERFORM.

           ADD TOTAL-SALES TO TEAM-TOTAL(TEAM-SUB).

       2300-OUTPUT.
           MOVE I-LNAME TO O-LNAME.
           MOVE I-FNAME TO O-FNAME.
           MOVE I-CITY TO O-CITY.
           MOVE I-STATE TO O-STATE.
           MOVE I-ZIP1 TO O-ZIP1.
           MOVE I-ZIP2 TO O-ZIP2.
           MOVE I-CASES TO O-CASES.
           MOVE DEPOSIT TO O-DEPOSIT.
           MOVE TOTAL-SALES TO O-TOT-SALES.

           WRITE PRTLINE FROM DATA-LINE
               AFTER ADVANCING 2 LINES
                   AT EOP 
                       PERFORM 9100-VALID-HEADER.

       2400-ERROR.
           MOVE I-REC TO ERROR-RECORD.

           WRITE ERRLINE FROM ERROR-LINE
               AFTER ADVANCING 2 LINES
                   AT EOP
                       PERFORM 9200-ERROR-HEADER.
           ADD 1 TO GT-ERRORS.

       3000-CLOSING.
           PERFORM 9100-VALID-HEADER.

           WRITE PRTLINE FROM GT-POP-HEADING
             AFTER ADVANCING 3 LINES.

           PERFORM
               VARYING SUB FROM 1 BY 1
                   UNTIL SUB > 3
                       MOVE POP-NAME(SUB) TO GT-POP(SUB)
                       MOVE POP-QTY(SUB) TO GT-POP-QTY(SUB).

           WRITE PRTLINE FROM GT-POP-LINE
             AFTER ADVANCING 2 LINES.

           PERFORM
               VARYING SUB FROM 4 BY 1
               UNTIL SUB > 6
                   SUBTRACT 3 FROM SUB GIVING TEAM-SUB
                   MOVE POP-NAME(SUB) TO GT-POP(TEAM-SUB)
                   MOVE POP-QTY(SUB) TO GT-POP-QTY(TEAM-SUB).

           WRITE PRTLINE FROM GT-POP-LINE
               AFTER ADVANCING 2 LINES.

           WRITE PRTLINE FROM GT-TEAM-HEADING
             AFTER ADVANCING 3 LINES.

           PERFORM 3100-TEAM-GT
               VARYING SUB FROM 1 BY 1
                   UNTIL SUB > 5.

           MOVE GT-ERRORS TO GT-ERROR.

           WRITE ERRLINE FROM GT-ERROR-LINE
               AFTER ADVANCING 3 LINES.

           CLOSE INPT.
           CLOSE PRTOUT.
           CLOSE ERROUT.

       3100-TEAM-GT.
           MOVE TEAM(SUB) TO GT-TEAM.
           MOVE TEAM-TOTAL(SUB) TO GT-TEAM-TOT.
           WRITE PRTLINE FROM GT-TEAM-LINE
               AFTER ADVANCING 2 LINES.

       9000-READ.
           READ INPT
               AT END
                   MOVE 'NO' TO MORE-RECS.

       9100-VALID-HEADER.
           ADD 1 TO PG-DATA.
           MOVE PG-DATA TO PG.

           WRITE PRTLINE FROM COMP-TITLE1
               AFTER ADVANCING PAGE.
           WRITE PRTLINE FROM COMP-TITLE2
               AFTER ADVANCING 1 LINE.
           WRITE PRTLINE FROM SALES-TITLE
               AFTER ADVANCING 1 LINE.
           WRITE PRTLINE FROM COLUMB-HEADINGS
               AFTER ADVANCING 2 LINES.
                     
       9200-ERROR-HEADER.
           ADD 1 TO PG-ERROR
           MOVE PG-ERROR TO PG.

           WRITE ERRLINE FROM COMP-TITLE1
               AFTER ADVANCING PAGE.
           WRITE ERRLINE FROM COMP-TITLE2
               AFTER ADVANCING 1 LINE.
           WRITE ERRLINE FROM ERROR-TITLE
               AFTER ADVANCING 1 LINE.
           WRITE ERRLINE FROM ERROR-HEADINGS
               AFTER ADVANCING 2 LINES.

       end program COBCJF06.