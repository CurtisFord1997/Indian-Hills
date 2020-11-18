       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBCJF02.
       DATE-WRITTEN. 12/11/19
       AUTHOR. CURTIS FORD.
       DATE-COMPILED.

      *****************************************************
      *THIS PROGRAM PRINTS A REPORT THAT GROUPS BOATS BY TYPE, AND
      *RUNS A SUBTOTAL LINE FOR EACH BOAT TYPE BREAK.
      *****************************************************

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT INPT
               ASSIGN TO 'C:\COBOL\CBLBOAT1.DAT'
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT PRTOUT
               ASSIGN TO 'C:\COBOL\BOATRPT1.PRT'
               ORGANIZATION IS RECORD SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD  INPT
           LABEL RECORD IS STANDARD
           DATA RECORD IS INPT-REC
           RECORD CONTAINS 42 CHARACTERS.

       01  INPT-REC.
           05 I-LAST-NAME         PIC X(15).
           05 I-STATE             PIC X(2).
           05 I-BOAT-COST         PIC 9(6)V99.
           05 I-PURCHASE-DATE.
               10 I-YYYY-REC.
                   15 I-YY12      PIC 99.
                   15 I-YY34      PIC 99.
               10 I-MM-REC        PIC 99.
               10 I-DD-REC        PIC 99.
           05 I-BOAT-TYPE         PIC X.
           05 I-ACCESSORY-PACKAGE PIC 9.
           05 I-PREP-DELIVER-COST PIC 9(5)V99.

       FD  PRTOUT
           LABEL RECORD IS OMITTED
           RECORD CONTAINS 132 CHARACTERS
           DATA RECORD IS PRTLINE
           LINAGE IS 60 WITH FOOTING AT 54.

       01 PRTLINE                  PIC X(132).

       WORKING-STORAGE SECTION.
       01 WORK-AREA.
           05  MORE-RECS           PIC XXX         VALUE 'YES'.

       01 CURRENT-DATE-AND-TIME.
           05 I-DATE.
               10 I-YYYY          PIC 9(4).
               10 I-MM            PIC 99.
               10 I-DD            PIC 99.
           05 I-TIME              PIC X(11).

       01 COMPANY-TITLE.   
           05 FILLER              PIC X(6)         VALUE 'DATE:'.
           05 O-MM                PIC 99.
           05 FILLER              PIC X            VALUE '/'.
           05 O-DD                PIC 99.
           05 FILLER              PIC X            VALUE '/'.
           05 O-YYYY              PIC 9(4).
           05 FILLER              PIC X(40)        VALUE SPACE.
           05 FILLER              PIC X(19)
               VALUE "FORD'S BOATS INC".
           05 FILLER              PIC X(49)        VALUE SPACE.
           05 FILLER              PIC X(6)         VALUE "PAGE:".
           05 O-PG-CTR            PIC Z9.

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

       01 BOAT-SUB-LINE.
           05 FILLER               PIC X(23)       VALUE SPACE.
           05 FILLER               PIC X(14)
               VALUE 'SUBTOTALS FOR '.
           05 SUB-BOAT-TYPE        PIC X(23).
           05 FILLER               PIC X(14)
               VALUE 'NUMBER SOLD:  '.
           05 SUB-NUM-SOLD         PIC Z,ZZ9.
           05 FILLER               PIC X(38)       VALUE SPACE.
           05 SUB-TOTAL-COST       PIC $$$$,$$$,$$$.99.

       01 GRAND-TOTALS-LINE.
           05 FILLER               PIC X(23)       VALUE SPACE.
           05 FILLER               PIC X(37)
               VALUE 'GRAND TOTALS'.
           05 FILLER               PIC X(13)
               VALUE 'NUMBER SOLD: '.
           05 GT-NUM-SOLD          PIC ZZ,ZZ9.
           05 FILLER               PIC X(35)       VALUE SPACE.
           05 GT-TOTAL-COST        PIC $$$,$$$,$$$,$$$.99.

       01 BLANK-LINE               PIC X(132)      VALUE SPACE.

       01 CALC-VAR.
           05 C-TOTAL-COST         PIC 9(7)V99.
           05 C-SUB-TOTAL-COST     PIC 9(9)V99     VALUE 0.
           05 C-GT-TOTAL-COST      PIC 9(11)V99    VALUE 0.
           05 C-SUB-NUM-SOLD       PIC 9(4)        VALUE 0.
           05 C-GT-NUM-SOLD        PIC 9(5)        VALUE 0.
           05 C-PG-NUM             PIC 9           VALUE 0.

       01 HELD-VARS.
           05 H-BOAT-TYPE          PIC X.

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
           PERFORM 9500-BOAT-INTERPRET.
           MOVE I-BOAT-TYPE TO H-BOAT-TYPE.

           PERFORM 9200-HEADINGS.

       2000-NORM.
           IF I-BOAT-TYPE NOT = H-BOAT-TYPE
               PERFORM 9300-SUBTOTALS
               PERFORM 9500-BOAT-INTERPRET
               PERFORM 9400-BOAT-HEADING
           END-IF.
           PERFORM 2100-CALCS.
           PERFORM 2200-MAINLINE.
           PERFORM 9100-READ.

       2100-CALCS.
           ADD I-BOAT-COST TO I-PREP-DELIVER-COST
               GIVING C-TOTAL-COST.

           IF I-ACCESSORY-PACKAGE = 1 
               MOVE "ELECTRONICS" TO DAT-ACC-PKG 
           ELSE
               IF I-ACCESSORY-PACKAGE = 2
                   MOVE "SKI PACKAGE" TO DAT-ACC-PKG
               ELSE
                   MOVE "FISHING PACKAGE" TO DAT-ACC-PKG
               END-IF
           END-IF.
           
           ADD 1 TO C-SUB-NUM-SOLD.
           ADD C-TOTAL-COST TO C-SUB-TOTAL-COST.

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
                   AT EOP PERFORM 9200-HEADINGS.

       3000-CLOSING.
           PERFORM 9300-SUBTOTALS.
           MOVE C-GT-NUM-SOLD TO GT-NUM-SOLD.
           MOVE C-GT-TOTAL-COST TO GT-TOTAL-COST.
           
           WRITE PRTLINE FROM GRAND-TOTALS-LINE
               AFTER ADVANCING 3 LINES.

           CLOSE INPT.
           CLOSE PRTOUT.
       9100-READ.
           READ INPT
               AT END
                   MOVE "NO" TO MORE-RECS.

       9200-HEADINGS.
           ADD 1 TO C-PG-NUM.
           MOVE C-PG-NUM TO O-PG-CTR.
           WRITE PRTLINE FROM COMPANY-TITLE
             AFTER ADVANCING PAGE.
           WRITE PRTLINE FROM COLUMB-HEADING-LINE1
             AFTER ADVANCING 2 LINES.
           WRITE PRTLINE FROM COLUMB-HEADING-LINE2
             AFTER ADVANCING 1 LINE.

           PERFORM 9400-BOAT-HEADING.

       9300-SUBTOTALS.
           MOVE C-SUB-NUM-SOLD TO SUB-NUM-SOLD.
           MOVE C-SUB-TOTAL-COST TO SUB-TOTAL-COST.

           WRITE PRTLINE FROM BOAT-SUB-LINE
               AFTER ADVANCING 2 LINES.

           ADD C-SUB-NUM-SOLD TO C-GT-NUM-SOLD.
           ADD C-SUB-TOTAL-COST TO C-GT-TOTAL-COST.

           COMPUTE C-SUB-NUM-SOLD = 0.
           COMPUTE C-SUB-TOTAL-COST = 0.

           MOVE I-BOAT-TYPE TO H-BOAT-TYPE.

       9400-BOAT-HEADING.
           WRITE PRTLINE FROM BOAT-TYPE-HEADER-LINE
               AFTER ADVANCING 2 LINES.
           WRITE PRTLINE FROM BLANK-LINE
               AT EOP
                   PERFORM 9200-HEADINGS.

       9500-BOAT-INTERPRET.
           EVALUATE I-BOAT-TYPE
               WHEN "B"
                   MOVE "BASS BOAT" TO BOAT-HEADER
                   MOVE BOAT-HEADER TO SUB-BOAT-TYPE
               WHEN "P"
                   MOVE "PONTOON" TO BOAT-HEADER 
                   MOVE BOAT-HEADER TO SUB-BOAT-TYPE
               WHEN "S"
                     MOVE "SKI BOAT" TO BOAT-HEADER 
                   MOVE BOAT-HEADER TO SUB-BOAT-TYPE
               WHEN "J"
                   MOVE "JOHN BOAT" TO BOAT-HEADER 
                   MOVE BOAT-HEADER TO SUB-BOAT-TYPE
               WHEN "C"
                   MOVE "CANOE" TO BOAT-HEADER 
                   MOVE BOAT-HEADER TO SUB-BOAT-TYPE
               WHEN "R"
                   MOVE "CABIN CRUISER" TO BOAT-HEADER 
                   MOVE BOAT-HEADER TO SUB-BOAT-TYPE
           END-EVALUATE.