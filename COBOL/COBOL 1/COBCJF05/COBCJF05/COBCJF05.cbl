       identification division.
       program-id. COBCJF05.
       DATE-WRITTEN. 1/31/20
       AUTHOR. CURTIS FORD.
       DATE-COMPILED.

      ******************************************************************
      *THIS PROGRAM CREATES A PRINT REPORT AND AN ERROR REPORT BY 
      *VALIDATING INPUT DATA
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
           05 I-ZIP
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
           05 FILLER           PIC X(3)    VALUE SPACE.
           05 POP1             PIC X(17).
           05 POP1-QTY         PIC ZZZ,ZZ9.
           05 FILLER           PIC X(6)    VALUE SPACE.
           05 POP2             PIC X(17).
           05 POP2-QTY         PIC ZZZ,ZZ9.
           05 FILLER           PIC X(6)    VALUE SPACE.
           05 POP3             PIC X(17).
           05 POP3-QTY         PIC ZZZ,ZZ9.
           05 FILLER           PIC X(45)   VALUE SPACE.
       
       01 GT-TEAM-HEADING      PIC X(132)  VALUE "TEAM TOTALS:".

       01 GT-TEAM-LINE.
           05 FILLER           PIC XXX     VALUE SPACE.
           05 GT-TEAM          PIC XX.
           05 GT-TEAM-TOT      PIC $$$$,$$$,$$$.99.
           05 FILLER           PIC X(112)  VALUE SPACE.

       01 GT-ERROR-LINE
           05 FILLER           PIC X(13)   VALUE 'TOTAL ERRORS'
           05 GT-ERROR         PIC Z,ZZ9.
           05 FILLER           PIC X(101)  VALUE SPACE.

      *CALCULATION VARIABLES
       01 DATA-LINE-VARS.
           05 DEPOSIT          PIC 999V99.
           05 TOTAL-SALES      PIC 9(4)V99.
           05 PG-DATA          PIC 99      VALUE ZERO.

       01 ERROR-LINE-VARS.
           05 ERR-SW           PIC XXX.
           05 PG-ERROR         PIC 99      VALUE ZERO.

      *GRAND TOTALS
       01 POP-GT.
           05 GT-CKE           PIC 9(6)    VALUE ZERO.
           05 GT-DIET-CKE      PIC 9(6)    VALUE ZERO.
           05 GT-MELLOW        PIC 9(6)    VALUE ZERO.
           05 GT-CHRY-CKE      PIC 9(6)    VALUE ZERO.
           05 GT-DIET-CHRY-CKE PIC 9(6)    VALUE ZERO.
           05 GT-SPRITE        PIC 9(6)    VALUE ZERO.

       01 TEAM-GT.
           05 GT-A             PIC 9(9)V99 VALUE ZERO.
           05 GT-B             PIC 9(9)V99 VALUE ZERO.
           05 GT-C             PIC 9(9)V99 VALUE ZERO.
           05 GT-D             PIC 9(9)V99 VALUE ZERO.
           05 GT-E             PIC 9(9)V99 VALUE ZERO.

       01 GT-ERRORS            PIC 9(4)    VALUE ZERO.

       01 JOB-DATA.
           05 FILLER.
               10 FILLER PIC X VALUE "M".
               10 FILLER PIC X(15) VALUE "MANAGEMENT".
               10 FILLER PIC 99V99 VALUE 43.00.
           05 FILLER.
               10 FILLER       PIC X       VALUE "I".
               10 FILLER       PIC X(15)   VALUE "INTERN".
               10 FILLER       PIC 99V99   VALUE 15.00.
           05 FILLER.
               10 FILLER       PIC X       VALUE "C".
               10 FILLER       PIC X(15)   VALUE "CAFETERIA LADY".
               10 FILLER       PIC 99V99   VALUE 16.00.
           05 FILLER.
               10 FILLER       PIC X       VALUE "P".
               10 FILLER       PIC X(15)   VALUE "PROJECT MANAGER".
               10 FILLER       PIC 99V99   VALUE 42.50.

       01 JOB-TABLE REDEFINES JOB-DATA.
           05 JOB OCCURS 4.
               10 JOB-KEY PIC X.
               10 JOB-TITLE PIC X(15).
               10 JOB-PAY PIC 99V99.


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
                   MOVE 'LAST NAME REQUIRED' TO ERROR-DESCR
               WHEN I-FNAME = SPACES
                   MOVE 'FIRST NAME REQUIRED' TO ERROR-DESCR
               WHEN I-ADDRESS = SPACES
                   MOVE 'ADDRESS REQUIRED' TO ERROR-DESCR
               WHEN I-CITY = SPACES
                   MOVE 'CITY REQIRED' TO ERROR-DESCR
               WHEN I-STATE = SPACES 
                   MOVE 'STATE REQIRED' TO ERROR-DESCR
               WHEN NOT VAL-STATE
                   MOVE 'STATE INVALID, NEED IA, IL, MI, MO, NE, OR WI'
                     TO ERROR-DESCR
               WHEN I-ZIP NOT NUMERIC
                   MOVE 'ZIP CODE NOT NUMERIC' TO ERROR-DESCR
               WHEN I-POP-TYPE NOT NUMERIC
                   MOVE 'POP TYPE NOT NUMERIC, NEED VALUES 1-6'
                       TO ERROR-DESCR
               WHEN NOT VAL-POP-TYPE 
                   MOVE 'POP-TYPE NEEDS TO BE 1-6' TO ERROR-DESCR
               WHEN I-CASES NOT NUMERIC
                   MOVE 'CASES NOT NUMERIC' TO ERROR-DESCR
               WHEN I-CASES < 1 
                   MOVE 'AT LEAST ONE CASE REQUIRED' TO ERROR-DESCR
               WHEN NOT VAL-TEAM
                   MOVE 'NOT A VALID TEAM. ONLY A THROUGH E'
                       TO ERROR-DESCR
               WHEN OTHER
                   MOVE 'NO' TO ERR-SW
           END-EVALUATE.

       2100-X.
           EXIT.

       2200-CALCS.
           IF (I-STATE = 'IA' OR 'NE' OR 'WI')
               COMPUTE DEPOSIT ROUNDED= 0.05 * 24 * I-CASES
           ELSE
               IF I-STATE = 'MI'
                   COMPUTE DEPOSIT ROUNDED= 0.1 * 24 * I-CASES
               ELSE
                   MOVE 0 TO DEPOSIT
               END-IF
           END-IF.

           COMPUTE TOTAL-SALES = I-CASES * 18.71 + DEPOSIT.

           EVALUATE I-POP-TYPE
               WHEN 1
                   ADD I-CASES TO GT-CKE
                   MOVE 'COKE' TO O-POP-TYPE
               WHEN 2
                   ADD I-CASES TO GT-DIET-CKE
                   MOVE 'DIET COKE' TO O-POP-TYPE
               WHEN 3
                   ADD I-CASES TO GT-MELLOW
                   MOVE 'MELLO YELLOW' TO O-POP-TYPE
               WHEN 4
                   ADD I-CASES TO GT-CHRY-CKE
                   MOVE 'CHERRY COKE' TO O-POP-TYPE
               WHEN 5
                   ADD I-CASES TO GT-DIET-CHRY-CKE
                   MOVE 'DIET CHERRY COKE' TO O-POP-TYPE
               WHEN 6
                   ADD I-CASES TO GT-SPRITE
                   MOVE 'SPRITE' TO O-POP-TYPE
           END-EVALUATE.

           EVALUATE I-TEAM
               WHEN 'A'
                   ADD TOTAL-SALES TO GT-A
               WHEN 'B'
                   ADD TOTAL-SALES TO GT-B
               WHEN 'C'
                   ADD TOTAL-SALES TO GT-C
               WHEN 'D'
                   ADD TOTAL-SALES TO GT-D
               WHEN 'E'
                   ADD TOTAL-SALES TO GT-E
           END-EVALUATE.

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

           MOVE 'COKE' TO POP1.
           MOVE GT-CKE TO POP1-QTY.
           MOVE 'DIET COKE' TO POP2.
           MOVE GT-DIET-CKE TO POP2-QTY.
           MOVE 'MELLOW YELLO' TO POP3.
           MOVE GT-MELLOW TO POP3-QTY.

           WRITE PRTLINE FROM GT-POP-LINE
             AFTER ADVANCING 2 LINES.

           MOVE 'CHERRY COKE' TO POP1.
           MOVE GT-CHRY-CKE TO POP1-QTY.
           MOVE 'DIET CHERRY COKE' TO POP2.
           MOVE GT-DIET-CHRY-CKE TO POP2-QTY.
           MOVE 'SPRITE' TO POP3.
           MOVE GT-SPRITE TO POP3-QTY.

           WRITE PRTLINE FROM GT-POP-LINE
             AFTER ADVANCING 2 LINES.

           WRITE PRTLINE FROM GT-TEAM-HEADING
             AFTER ADVANCING 3 LINES.

           MOVE 'A' TO GT-TEAM.
           MOVE GT-A TO GT-TEAM-TOT.
           WRITE PRTLINE FROM GT-TEAM-LINE
             AFTER ADVANCING 2 LINES.

           MOVE 'B' TO GT-TEAM.
           MOVE GT-B TO GT-TEAM-TOT.
           WRITE PRTLINE FROM GT-TEAM-LINE
             AFTER ADVANCING 2 LINES.

           MOVE 'C' TO GT-TEAM.
           MOVE GT-C TO GT-TEAM-TOT.
           WRITE PRTLINE FROM GT-TEAM-LINE
             AFTER ADVANCING 2 LINES.

           MOVE 'D' TO GT-TEAM.
           MOVE GT-D TO GT-TEAM-TOT.
           WRITE PRTLINE FROM GT-TEAM-LINE
             AFTER ADVANCING 2 LINES.

           MOVE 'E' TO GT-TEAM.
           MOVE GT-E TO GT-TEAM-TOT.
           WRITE PRTLINE FROM GT-TEAM-LINE
             AFTER ADVANCING 2 LINES.

           MOVE GT-ERRORS TO GT-ERROR.
           WRITE ERRLINE FROM GT-ERROR-LINE
               AFTER ADVANCING 3 LINES.

           CLOSE INPT.
           CLOSE PRTOUT.
           CLOSE ERROUT.

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

       end program COBCJF05.