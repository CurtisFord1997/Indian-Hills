       identification division.
       program-id. COBCJF03.
       DATE-WRITTEN. 01/09/20
       AUTHOR. CURTIS FORD.
       DATE-COMPILED.


      *****************************************************
      *THIS PROGRAM PRINTS A REPORT PRINTS A MINOR SUB LINE BASED ON ST
      *AND PRINTS A MAJOR SUB LINE BASED ON BOAT TYPE.
      *****************************************************

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT INPT
               ASSIGN TO 'C:\COBOL\CBLBOAT1.DAT'
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT PRTOUT
               ASSIGN TO 'C:\COBOL\BOATRPT2.PRT'
               ORGANIZATION IS RECORD SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD  INPT
           LABEL RECORD IS STANDARD
           DATA RECORD IS INPT-REC
           RECORD CONTAINS 42 CHARACTERS.

       01 INPT-REC.
           05 I-LAST-NAME          PIC X(15).
           05 I-STATE              PIC X(2).
           05 I-BOAT-COST          PIC 9(6)V99.
           05 I-PURCHASE-DATE.
               10 I-YYYY-REC.
                   15 I-YY12       PIC 99.
                   15 I-YY34       PIC 99.
               10 I-MM-REC         PIC 99.
               10 I-DD-REC         PIC 99.
           05 I-BOAT-TYPE          PIC X.
           05 I-ACCESSORY-PACKAGE  PIC 9.
           05 I-PREP-DELIVER-COST  PIC 9(5)V99.

       FD  PRTOUT
           LABEL RECORD IS OMITTED
           RECORD CONTAINS 132 CHARACTERS
           DATA RECORD IS PRTLINE
           LINAGE IS 60 WITH FOOTING AT 53.

       01 PRTLINE                  PIC X(132).

       WORKING-STORAGE SECTION.
       01 WORK-AREA.
           05 MORE-RECS            PIC XXX         VALUE 'YES'.

       01 CURRENT-DATE-AND-TIME.
           05 I-DATE.
               10 I-YYYY           PIC 9(4).
               10 I-MM             PIC 99.
               10 I-DD             PIC 99.
           05 I-TIME               PIC X(11).

       01 COMPANY-TITLE.
           05 FILLER               PIC X(6)        VALUE 'DATE:'.
           05 O-MM                 PIC 99.
           05 FILLER               PIC X           VALUE '/'.
           05 O-DD                 PIC 99.
           05 FILLER               PIC X           VALUE '/'.
           05 O-YYYY               PIC 9(4).
           05 FILLER               PIC X(40)       VALUE SPACE.
           05 FILLER               PIC X(19)       VALUE 
               "FORD'S BOATS INC.".
           05 FILLER               PIC X(49)       VALUE SPACE.
           05 FILLER               PIC X(6)        VALUE "PAGE:".
           05 O-PG-CTR             PIC Z9.

       01 COLUMB-HEADING-LINE1.
           05 FILLER               PIC X(23)       VALUE "CUSTOMER".
           05 FILLER               PIC X(21)       VALUE SPACE.
           05 FILLER               PIC X(13)       VALUE "BOAT".
           05 FILLER               PIC X(19)       VALUE "PURCHASE".
           05 FILLER               PIC X(30)       VALUE "ACCESSORY".
           05 FILLER               PIC X(21)       VALUE "PREP".
           05 FILLER               PIC X(5)        VALUE "TOTAL".

       01 COLUMB-HEADING-LINE2.
           05 FILLER               PIC X(23)       VALUE "LAST NAME".
           05 FILLER               PIC X(21)       VALUE "STATE".
           05 FILLER               PIC X(13)       VALUE "COST".
           05 FILLER               PIC X(19)       VALUE "DATE".
           05 FILLER               PIC X(30)       VALUE "PACKAGE".
           05 FILLER               PIC X(21)       VALUE "COST".
           05 FILLER               PIC X(5)        VALUE " COST".

       01 DATA-LINE.
           05 DAT-LAST-NAME        PIC X(24).
           05 DAT-STATE            PIC X(14).
           05 DAT-BOAT-COST        PIC ZZZ,ZZZ.99.
           05 FILLER               PIC X(9)        VALUE SPACE.
           05 DAT-MM               PIC 99.
           05 FILLER               PIC X(1)        VALUE '/'.
           05 DAT-DD               PIC 99.
           05 FILLER               PIC X(1)        VALUE '/'.
           05 DAT-YY               PIC 99.
           05 FILLER               PIC X(11)       VALUE SPACE.
           05 DAT-ACC-PKG          PIC X(24).
           05 DAT-PREP-COST        PIC ZZZ,ZZZ.99.
           05 FILLER               PIC X(10)       VALUE SPACE.
           05 DAT-TOTAL-COST       PIC Z,ZZZ,ZZZ.99.

       01 BOAT-TYPE-HEADER-LINE.
           05 FILLER               PIC X(11)       VALUE 'BOAT TYPE: '.
           05 BOAT-HEADER          PIC X(13).
           05 FILLER               PIC X(108)      VALUE SPACE.

       01 BOAT-MINOR-LINE.
           05 FILLER               PIC X(10)       VALUE SPACE.
           05 FILLER               PIC X(14)       VALUE 
               'SUBTOTALS FOR '.
           05 MINOR-STATE          PIC X(13).
           05 MINOR-BOAT-TYPE      PIC X(23).
           05 FILLER               PIC X(15)       VALUE 'NUMBER SOLD:'.
           05 MINOR-NUM-SOLD       PIC Z,ZZ9.
           05 FILLER               PIC X(37)       VALUE SPACE.
           05 MINOR-TOTAL-COST     PIC $$$$,$$$,$$$.99.

       01 BOAT-MAJOR-LINE.
           05 FILLER               PIC X(10)       VALUE SPACE.
           05 FILLER               PIC X(27)       VALUE 
               'SUBTOTALS FOR '.
           05 MAJOR-BOAT-TYPE      PIC X(23).
           05 FILLER               PIC X(14)       VALUE 'NUMBER SOLD:'.
           05 MAJOR-NUM-SOLD       PIC Z,ZZZ9.
           05 FILLER               PIC X(34)       VALUE SPACE.
           05 MAJOR-TOTAL-COST     PIC $$$,$$$,$$$,$$$.99.

       01 GRAND-TOTALS-LINE.
           05 FILLER               PIC X(23)       VALUE SPACE.
           05 FILLER               PIC X(37)       VALUE 'GRAND TOTALS'.
           05 FILLER               PIC X(13)       VALUE 
               'NUMBER SOLD: '.
           05 GT-NUM-SOLD          PIC ZZZ,ZZ9.
           05 FILLER               PIC X(31)       VALUE SPACE.
           05 GT-TOTAL-COST        PIC $$,$$$,$$$,$$$,$$$.99.

       01 BLANK-LINE               PIC X(132)      VALUE SPACE.

       01 CALC-VAR.
           05 C-TOTAL-COST         PIC 9(7)V99.
           05 MINOR-SUB-VARS.
               10 C-MINOR-NUM-SOLD PIC 9(4)        VALUE ZERO.
               10 C-MINOR-TOT-COST PIC 9(9)V99     VALUE ZERO.
           05 MAJOR-SUB-VARS.
               10 C-MAJOR-NUM-SOLD PIC 9(5)        VALUE ZERO.
               10 C-MAJOR-TOT-COST PIC 9(11)V99    VALUE ZERO.
           05 GT-SUB-VARS.
               10 C-GT-NUM-SOLD    PIC 9(6)        VALUE ZERO.
               10 C-GT-TOT-COST    PIC 9(13)V99    VALUE ZERO.
           05 C-PG-NUM             PIC 9           VALUE ZERO.
           05 C-MARKUP-PRCNT       PIC 9V999       VALUE ZERO.
           05 C-COST-PKG-ACC       PIC 9(4)V99     VALUE ZERO.

       01 HELD-VARS.
           05 H-BOAT-TYPE          PIC X.
       01 CONST-VARS.
           05 TAX-RATE             PIC 9V99        VALUE 0.06.

       PROCEDURE DIVISION.
       0000-MAIN.
           PERFORM 1000-INIT.
           PERFORM 2000-NORM
               UNTIL MORE-RECS = "NO".
           PERFORM 3000-CLOSING.
           STOP RUN.

       1000-INIT.
           OPEN INPUT INPT.
           OPEN OUTPUT PRTOUT.

           MOVE FUNCTION CURRENT-DATE TO CURRENT-DATE-AND-TIME.
           MOVE I-YYYY TO O-YYYY.
           MOVE I-MM TO O-MM.
           MOVE I-DD TO O-DD.

           PERFORM 9100-READ.
           
           MOVE I-BOAT-TYPE TO H-BOAT-TYPE.
           MOVE I-STATE TO DAT-STATE.

           PERFORM 9200-BOAT-INTERPRET.
           PERFORM 9300-HEADINGS.

       2000-NORM.
           IF I-BOAT-TYPE NOT = H-BOAT-TYPE
               PERFORM 9400-MINOR-BREAK
               PERFORM 9500-MAJOR-BREAK
               PERFORM 9400-BOAT-HEADING
           ELSE
               IF (DAT-STATE NOT = I-STATE)
                   PERFORM 9400-MINOR-BREAK
               END-IF
           END-IF.
           PERFORM 2100-CALCS.
           PERFORM 2200-MAINLINE.
           PERFORM 9100-READ.

       2100-CALCS.
           IF I-ACCESSORY-PACKAGE = 1
               MOVE "ELECTRONICS" TO DAT-ACC-PKG
               MOVE 5415.30 TO C-COST-PKG-ACC
           ELSE
               IF I-ACCESSORY-PACKAGE = 2
                   MOVE "SKI PACKAGE" TO DAT-ACC-PKG
                   MOVE 3980 TO C-COST-PKG-ACC
               ELSE
                   MOVE "FISHING PACKAGE" TO DAT-ACC-PKG
                   MOVE 345.45 TO C-COST-PKG-ACC
               END-IF
           END-IF.

           COMPUTE C-TOTAL-COST ROUNDED = (I-BOAT-COST*(1 + 
               C-MARKUP-PRCNT)).
           COMPUTE C-TOTAL-COST ROUNDED = (C-TOTAL-COST + C-COST-PKG-ACC
               + I-PREP-DELIVER-COST) * (1+TAX-RATE).

           ADD 1 TO C-MINOR-NUM-SOLD.
           ADD C-TOTAL-COST TO C-MINOR-TOT-COST.

       2200-MAINLINE.
           MOVE I-LAST-NAME TO DAT-LAST-NAME.
           MOVE I-STATE TO DAT-STATE.
           MOVE I-BOAT-COST TO DAT-BOAT-COST.
           MOVE I-MM-REC TO DAT-MM.
           MOVE I-DD-REC TO DAT-DD.
           MOVE I-YY34 TO DAT-YY.
           MOVE I-BOAT-COST TO DAT-BOAT-COST
           MOVE I-PREP-DELIVER-COST TO DAT-PREP-COST.
           MOVE C-TOTAL-COST TO DAT-TOTAL-COST.

           WRITE PRTLINE FROM DATA-LINE
               AFTER ADVANCING 1 LINE
                   AT EOP
                       PERFORM 9300-HEADINGS.

       3000-CLOSING.
           PERFORM 9400-MINOR-BREAK.
           PERFORM 9500-MAJOR-BREAK.
           MOVE C-GT-NUM-SOLD TO GT-NUM-SOLD.
           MOVE C-GT-TOT-COST TO GT-TOTAL-COST.

           WRITE PRTLINE FROM GRAND-TOTALS-LINE
               AFTER ADVANCING 3 LINES.

           CLOSE INPT.
           CLOSE PRTOUT.
       9100-READ.
           READ INPT
               AT END
                   MOVE "NO" TO MORE-RECS.

       9200-BOAT-INTERPRET.
           EVALUATE I-BOAT-TYPE
               WHEN "B"
                   MOVE "BASS BOAT" TO BOAT-HEADER
                   MOVE BOAT-HEADER TO MINOR-BOAT-TYPE
                   MOVE .33 TO C-MARKUP-PRCNT
               WHEN "P"
                   MOVE "PONTOON" TO BOAT-HEADER
                   MOVE BOAT-HEADER TO MINOR-BOAT-TYPE
                   MOVE .25 TO C-MARKUP-PRCNT

               WHEN "S"
                   MOVE "SKI BOAT" TO BOAT-HEADER
                   MOVE BOAT-HEADER TO MINOR-BOAT-TYPE
                   MOVE .425 TO C-MARKUP-PRCNT
               WHEN "J"
                   MOVE "JOHN BOAT" TO BOAT-HEADER
                   MOVE BOAT-HEADER TO MINOR-BOAT-TYPE
                   MOVE .33 TO C-MARKUP-PRCNT
               WHEN "C"
                   MOVE "CANOE" TO BOAT-HEADER
                   MOVE BOAT-HEADER TO MINOR-BOAT-TYPE
                   MOVE .20 TO C-MARKUP-PRCNT
               WHEN "R"
                   MOVE "CABIN CRUISER" TO BOAT-HEADER
                   MOVE BOAT-HEADER TO MINOR-BOAT-TYPE
                   MOVE .30 TO C-MARKUP-PRCNT
           END-EVALUATE.
       9300-HEADINGS.
           ADD 1 TO C-PG-NUM.
           MOVE C-PG-NUM TO O-PG-CTR.
           WRITE PRTLINE FROM COMPANY-TITLE
               AFTER ADVANCING PAGE.
           WRITE PRTLINE FROM COLUMB-HEADING-LINE1
               AFTER ADVANCING 2 LINES.
           WRITE PRTLINE FROM COLUMB-HEADING-LINE2
               AFTER ADVANCING 1 LINE.

           PERFORM 9400-BOAT-HEADING.

       9400-MINOR-BREAK.
           MOVE DAT-STATE TO MINOR-STATE.
           MOVE C-MINOR-NUM-SOLD TO MINOR-NUM-SOLD.
           MOVE C-MINOR-TOT-COST TO MINOR-TOTAL-COST.

           WRITE PRTLINE FROM BOAT-MINOR-LINE
               AFTER ADVANCING 2 LINES.
           WRITE PRTLINE FROM BLANK-LINE.

           MOVE MINOR-BOAT-TYPE TO MAJOR-BOAT-TYPE.

           ADD C-MINOR-NUM-SOLD TO C-MAJOR-NUM-SOLD.
           ADD C-MINOR-TOT-COST TO C-MAJOR-TOT-COST.

           COMPUTE C-MINOR-NUM-SOLD = 0.
           COMPUTE C-MINOR-TOT-COST = 0.

           MOVE I-STATE TO DAT-STATE.

       9500-MAJOR-BREAK.
           MOVE C-MAJOR-NUM-SOLD TO MAJOR-NUM-SOLD.
           MOVE C-MAJOR-TOT-COST TO MAJOR-TOTAL-COST.

           WRITE PRTLINE FROM BOAT-MAJOR-LINE.

           ADD C-MAJOR-NUM-SOLD TO C-GT-NUM-SOLD.
           ADD C-MAJOR-TOT-COST TO C-GT-TOT-COST.

           COMPUTE C-MAJOR-NUM-SOLD = 0.
           COMPUTE C-MAJOR-TOT-COST = 0.

           MOVE I-BOAT-TYPE TO H-BOAT-TYPE.

           PERFORM 9200-BOAT-INTERPRET.

       9400-BOAT-HEADING.
           WRITE PRTLINE FROM BOAT-TYPE-HEADER-LINE
               AFTER ADVANCING 2 LINES.
           WRITE PRTLINE FROM BLANK-LINE
               AT EOP
                   PERFORM 9300-HEADINGS.
       END PROGRAM.