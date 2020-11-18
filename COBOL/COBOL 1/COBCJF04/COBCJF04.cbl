       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBCJF04.
       DATE-WRITTEN. 1/13/20
       AUTHOR. CURTIS FORD.
       DATE-COMPILED.

      ******************************************************************
      *THIS PROGRAM CALCULATES HOW MUCH A CONDO STAY WILL COST INCLUDING
      *ANY FEES OR DEALS THAT MIGHT APPLY
      ******************************************************************

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT INPT
               ASSIGN TO 'C:\COBOL\OZARK.DAT'
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT PRTOUT
               ASSIGN TO 'C:\COBOL\VACATION.PRT'
               ORGANIZATION IS RECORD SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD  INPT
           LABEL RECORD IS STANDARD
           DATA RECORD IS I-REC
           RECORD CONTAINS 31 CHARACTERS.

       01 I-REC.
           05 I-GUEST              PIC X(20).
           05 I-CONDO              PIC XX.
           05 I-BEDROOMS           PIC 9.
           05 I-NIGHTS             PIC 99.
           05 I-PETS               PIC X.
           05 I-HOTTUB             PIC X.
           05 I-DOCKSLIP           PIC 99V99.

       FD  PRTOUT
           LABEL RECORD IS OMITTED
           RECORD CONTAINS 132 CHARACTERS
           DATA RECORD IS PRTLINE
           LINAGE IS 60 WITH FOOTING AT 54.

       01 PRTLINE PIC X(132).

       WORKING-STORAGE SECTION.
       01 WORK-AREA.
           05 MORE-RECS            PIC XXX VALUE 'YES'.

       01 CURRENT-DATE-AND-TIME.
           05 I-DATE.
               10 I-YYYY           PIC 9(4).
               10 I-MM             PIC 99.
               10 I-DD             PIC 99.
           05 I-TIME               PIC X(11).
       
       01 BLANK-LINE               PIC X(132)  VALUE SPACE.

       01 COMP-TITLE1.
           05 FILLER               PIC X(6)    VALUE 'DATE:'.
           05 COMP-DATE.
               10 MM               PIC 99.
               10 FILLER           PIC X       VALUE '/'.
               10 DD               PIC 99.
               10 FILLER           PIC X       VALUE '/'.
               10 YYYY             PIC 9999.
           05 FILLER               PIC X(42)   VALUE SPACE.
           05 FILLER               PIC X(66)   VALUE 'PMG MANAGEMENT'.
           05 FILLER               PIC X(6)    VALUE 'PAGE:'.
           05 PG                   PIC Z9.

       01 COMP-TITLE2.
           05 FILLER               PIC X(50)   VALUE 'COBCJF04'.
           05 FILLER               PIC X(21)
               VALUE 'LAKE OF THE OZARKS -'.
           05 REPORT-MONTH         PIC X(61).

       01 COLUMB-HEADINGS1.
           05 FILLER               PIC X(37)   VALUE SPACE.
           05 FILLER               PIC X(11)   VALUE ' STAY'.
           05 FILLER               PIC X(12)   VALUE 'NIGHT'.
           05 FILLER               PIC X(6)    VALUE 'CONDO'.
           05 FILLER               PIC X(10)   VALUE 'CLEANING'.
           05 FILLER               PIC X(14)   VALUE 'DOCK SLIP'.
           05 FILLER               PIC X(16)   VALUE SPACE.
           05 FILLER               PIC X(16)   VALUE '   DEAL'.
           05 FILLER               PIC X(10)   VALUE 'AMOUNT'.

       01 COLUMB-HEADINGS2.
           05 FILLER               PIC X(17)   VALUE 'CONDOMINIUM'.
           05 FILLER               PIC X(20)   VALUE 'GUEST NAME'.
           05 FILLER               PIC X(11)   VALUE 'NIGHTS'.
           05 FILLER               PIC X(12)   VALUE '  FEE'.
           05 FILLER               PIC X(6)    VALUE '  FEE'.
           05 FILLER               PIC X(10)   VALUE '     FEE'.
           05 FILLER               PIC X(14)   VALUE '      FEE'.
           05 FILLER               PIC X(16)   VALUE 'SUBTOTAL'.
           05 FILLER               PIC X(16)   VALUE 'AMOUNT'.
           05 FILLER               PIC X(10)   VALUE '   DUE'.

       01 DAT-LINE.
           05 DAT-CONDO            PIC X(17).
           05 DAT-GUEST            PIC X(20).
           05 FILLER               PIC X(2)    VALUE SPACE.
           05 DAT-NIGHTS           PIC Z9.
           05 FILLER               PIC X(3)    VALUE SPACE.
           05 DAT-NIGHT-FEE        PIC $$,$$$.99.
           05 FILLER               PIC X       VALUE SPACE.
           05 DAT-CONDO-FEE        PIC $$$$,$$$.99.
           05 FILLER               PIC X(2)    VALUE SPACE.
           05 DAT-CLN-FEE          PIC $$$$.99.
           05 FILLER               PIC X(2)    VALUE SPACE.
           05 DAT-DOCK-FEE         PIC $$,$$$.99.
           05 FILLER               PIC X(2)    VALUE SPACE.
           05 DAT-SUB              PIC $$$$,$$$.99.
           05 FILLER               PIC X(4)    VALUE SPACE.
           05 DAT-DEAL             PIC $$$,$$$.99+.
           05 FILLER               PIC X(4)    VALUE SPACE.
           05 DAT-DUE              PIC $$$$,$$$.99.
           05 DAT-AST              PIC X(4).

       01 GT-LINE1.
           05 FILLER               PIC X(84)   VALUE "GRAND TOTALS:".
           05 GT-SUB               PIC $$$,$$$,$$$.99.
           05 FILLER               PIC X       VALUE SPACE.
           05 GT-DEAL              PIC $$,$$$,$$$.99+.
           05 FILLER               PIC X       VALUE SPACE.
           05 GT-DUE               PIC $$$,$$$,$$$.99.
           05 FILLER               PIC X(4)    VALUE SPACE.

       01 GT-LINE2.
           05 FILLER               PIC X(12)   VALUE SPACE.
           05 FILLER               PIC X(19)
               VALUE "NUMBER OF RENTALS:".
           05 GT-RENTALS           PIC ZZ9.
           05 FILLER               PIC X(6)    VALUE SPACE.
           05 FILLER               PIC X(13)   VALUE "FREE NIGHTS:".
           05 GT-FREE-NIGHTS       PIC ZZ.9.
           05 FILLER               PIC X(3)    VALUE SPACE.
           05 FILLER               PIC X(15)   VALUE "FREE CLEANING:".
           05 GT-FREE-CLN          PIC Z9.
           05 FILLER               PIC X(55)   VALUE SPACE.

       01 GT-LINE3.
           05 FILLER               PIC X(14)   VALUE SPACE.
           05 FILLER               PIC X(10)   VALUE "PET FEES:".
           05 GT-PET-FEE           PIC $$$,$$$.99.
           05 FILLER               PIC X(19)   VALUE SPACE.
           05 FILLER               PIC X(14)   VALUE "HOT TUB FEES:".
           05 GT-HOTTUB-FEE        PIC $$$,$$$.99.
           05 FILLER               PIC X(55)   VALUE SPACE.

       01 CALC-VARS.
           05 C-PG                 PIC 99          VALUE ZERO.
           05 C-DAT.
               10 C-ROOM-CHARGE    PIC 999V99.
               10 C-DAT-NIGHT-FEE  PIC 9(4)V99.
               10 C-DAT-CONDO-FEE  PIC 9(6)V99.
               10 C-DAT-CLN-FEE    PIC 999V99.
               10 C-DAT-SUB        PIC 9(6)V99.
               10 C-DEAL-PET       PIC 9(5)V99.
               10 C-DEAL-HOTTUB    PIC 9(5)V99.
               10 C-DEAL-CLN       PIC S999V99.
               10 C-DEAL-NIGHTS    PIC S9(4)V99.
               10 C-DAT-DOCK-FEE   PIC 9(4)V99.
               10 C-DAT-DEAL       PIC S9(5)V99.
               10 C-DAT-DUE        PIC 9(6)V99.
           05 C-GT.
               10 C-GT-SUB         PIC 9(8)V99     VALUE ZERO.
               10 C-GT-DEAL        PIC S9(7)V99    VALUE ZERO.
               10 C-GT-DUE         PIC 9(8)V99     VALUE ZERO.
               10 C-GT-RENTALS     PIC 999         VALUE ZERO.
               10 C-GT-FREE-NIGHTS PIC 99V9        VALUE ZERO.
               10 C-GT-FREE-CLN    PIC 99          VALUE ZERO.
               10 C-GT-PET-FEE     PIC 9(5)V99     VALUE ZERO.
               10 C-GT-HOTTUB-FEE  PIC 9(5)V99     VALUE ZERO. 

       PROCEDURE DIVISION.
       0000-MAIN.
           PERFORM 1000-INIT.
           PERFORM 2000-BODY
               UNTIL MORE-RECS = 'NO'.
           PERFORM 3000-CLOSING.
           DIVIDE 43 BY 4 GIVING MM REMAINDER MM.
           WRITE PRTLINE FROM COMP-TITLE1
             AFTER ADVANCING PAGE.
           WRITE PRTLINE FROM COMP-TITLE2
             AFTER ADVANCING 1 LINE.
           STOP RUN.

       1000-INIT.
           OPEN INPUT INPT.
           OPEN OUTPUT PRTOUT.

           MOVE FUNCTION CURRENT-DATE TO CURRENT-DATE-AND-TIME.
           MOVE I-YYYY TO YYYY.
           MOVE I-MM TO MM.
           MOVE I-DD TO DD.

           PERFORM 1100-MONTH-INTERPERET.
           PERFORM 9100-READ.
           PERFORM 9200-HEADINGS.

       1100-MONTH-INTERPERET.
           EVALUATE I-MM
               WHEN 1
                   MOVE 'JANUARY' TO REPORT-MONTH
               WHEN 2
                   MOVE 'FEBRUARY' TO REPORT-MONTH
               WHEN 3
                   MOVE 'MARCH' TO REPORT-MONTH
               WHEN 4
                   MOVE 'APRIL' TO REPORT-MONTH
               WHEN 5
                   MOVE 'MAY' TO REPORT-MONTH
               WHEN 6
                   MOVE 'JUNE' TO REPORT-MONTH
               WHEN 7
                   MOVE 'JULY' TO REPORT-MONTH
               WHEN 8
                   MOVE 'AUGUST' TO REPORT-MONTH
               WHEN 9
                   MOVE 'SEPTEMBER' TO REPORT-MONTH
               WHEN 10
                   MOVE 'OCTOBER' TO REPORT-MONTH
               WHEN 11
                   MOVE 'NOVEMBER' TO REPORT-MONTH
               WHEN 12
                   MOVE 'DECEMBER' TO REPORT-MONTH
           END-EVALUATE.

       2000-BODY.
           PERFORM 2100-INTERPERET.
           PERFORM 2200-DAT-LINE.
           PERFORM 9100-READ.

       2100-INTERPERET.
           EVALUATE I-CONDO
               WHEN 'HB'
                   MOVE 'HORSESHOE BEND' TO DAT-CONDO
                   PERFORM 2110-HB
               WHEN 'OB'
                   MOVE 'OSAGE BEACH' TO DAT-CONDO
                   PERFORM 2120-OB
               WHEN 'PP'
                   MOVE 'PISTOL POINT' TO DAT-CONDO
                   PERFORM 2130-PP
               WHEN 'RB'
                   MOVE 'REGATTA BAY' TO DAT-CONDO
                   PERFORM 2140-RB
               WHEN 'SB'
                   MOVE 'SHAWNEE BEND' TO DAT-CONDO
                   PERFORM 2150-SB
               WHEN 'L'
                   MOVE 'LEDGES' TO DAT-CONDO
                   PERFORM 2160-L
               WHEN 'HT'
                   MOVE 'HARBOUR TOWNE' TO DAT-CONDO
                   PERFORM 2170-HT
               WHEN 'CP'
                   MOVE 'COMPASSE POINTE' TO DAT-CONDO
                   PERFORM 2180-CP
           END-EVALUATE.

       2110-HB.
           MOVE 99.50 TO C-ROOM-CHARGE.
           MOVE 100 TO C-DAT-CLN-FEE.
           PERFORM 9300-COMMON-CALC.

           IF I-PETS = 'Y'
             COMPUTE C-DEAL-PET ROUNDED = .1 * C-DAT-CONDO-FEE
             ADD C-DEAL-PET TO C-GT-PET-FEE
           ELSE
               MOVE 0 TO C-DEAL-PET
           END-IF.

           IF I-HOTTUB = 'Y'
               COMPUTE C-DEAL-HOTTUB ROUNDED = .05 * C-DAT-CONDO-FEE
               ADD C-DEAL-HOTTUB TO C-GT-HOTTUB-FEE
           ELSE
               MOVE 0 TO C-DEAL-HOTTUB
           END-IF.

           COMPUTE C-DAT-DEAL = C-DEAL-PET + C-DEAL-HOTTUB.
           COMPUTE C-DAT-DUE = C-DAT-SUB + C-DAT-DEAL.
           ADD C-DAT-DEAL TO C-GT-DEAL.
           ADD C-DAT-DUE TO C-GT-DUE.

       2120-OB.
           MOVE 188 TO C-ROOM-CHARGE.
           MOVE 150 TO C-DAT-CLN-FEE.
           PERFORM 9300-COMMON-CALC.

           IF I-PETS = 'Y'
               COMPUTE C-DEAL-PET ROUNDED = .1 * C-DAT-CONDO-FEE
               ADD C-DEAL-PET TO C-GT-PET-FEE
           ELSE
               MOVE 0 TO C-DEAL-PET
           END-IF.

           IF I-NIGHTS >= 7
               MOVE C-DAT-NIGHT-FEE TO C-DEAL-NIGHTS
               ADD 1 TO C-GT-FREE-NIGHTS
           ELSE
               MOVE 0 TO C-DEAL-NIGHTS
           END-IF.

           COMPUTE C-DAT-DEAL = C-DEAL-PET - C-DEAL-NIGHTS.
           COMPUTE C-DAT-DUE = C-DAT-SUB + C-DAT-DEAL.
           ADD C-DAT-DEAL TO C-GT-DEAL.
           ADD C-DAT-DUE TO C-GT-DUE.

       2130-PP.
           MOVE 50 TO C-ROOM-CHARGE.
           MOVE 75 TO C-DAT-CLN-FEE.
           PERFORM 9300-COMMON-CALC.
           MOVE 0 TO C-DAT-DEAL.
           COMPUTE C-DAT-DUE = C-DAT-SUB + C-DAT-DEAL.
           ADD C-DAT-DUE TO C-GT-DUE.

       2140-RB.
           MOVE 62.1 TO C-ROOM-CHARGE.
           MOVE 75 TO C-DAT-CLN-FEE.
           PERFORM 9300-COMMON-CALC.

           IF I-NIGHTS > 5
               MOVE C-DAT-CLN-FEE TO C-DEAL-CLN
               ADD 1 TO C-GT-FREE-CLN
           ELSE
               MOVE 0 TO C-DEAL-CLN
           END-IF

       	   COMPUTE C-DAT-DEAL = 0 - C-DEAL-CLN.
           COMPUTE C-DAT-DUE = C-DAT-SUB + C-DAT-DEAL.
           ADD C-DAT-DEAL TO C-GT-DEAL.
           ADD C-DAT-DUE TO C-GT-DUE.

       2150-SB.
           MOVE 100 TO C-ROOM-CHARGE.
           MOVE 150 TO C-DAT-CLN-FEE.
           PERFORM 9300-COMMON-CALC.

           IF I-PETS = 'Y'
               COMPUTE C-DEAL-PET = .1 * C-DAT-CONDO-FEE
               MOVE C-DEAL-PET TO C-DAT-DEAL
               ADD C-DEAL-PET TO C-GT-DEAL
               ADD C-DEAL-PET TO C-GT-PET-FEE
           ELSE
               MOVE 0 TO C-DAT-DEAL
           END-IF

           COMPUTE C-DAT-DUE = C-DAT-SUB + C-DAT-DEAL.
           ADD C-DAT-DUE TO C-GT-DUE.

       2160-L.
           MOVE 76.35 TO C-ROOM-CHARGE.
       	   MOVE 0 TO C-DAT-CLN-FEE.
           PERFORM 9300-COMMON-CALC.

           IF I-HOTTUB = 'Y'
               COMPUTE C-DEAL-HOTTUB ROUNDED = .075 * C-DAT-CONDO-FEE
               MOVE C-DEAL-HOTTUB TO C-DAT-DEAL
               ADD C-DEAL-HOTTUB TO C-GT-HOTTUB-FEE
           ELSE
               MOVE 0 TO C-DAT-DEAL
           END-IF

           COMPUTE C-DAT-DUE = C-DAT-SUB + C-DAT-DEAL.
           ADD C-DAT-DEAL TO C-GT-DEAL.
           ADD C-DAT-DUE TO C-GT-DUE.

       2170-HT.
           MOVE 50 TO C-ROOM-CHARGE.
           MOVE 100 TO C-DAT-CLN-FEE.
           PERFORM 9300-COMMON-CALC.

           IF I-NIGHTS >= 3
               COMPUTE C-DEAL-NIGHTS ROUNDED = .5 * C-DAT-NIGHT-FEE
               ADD 0.5 TO C-GT-FREE-NIGHTS
               COMPUTE C-DAT-DEAL = 0 - C-DEAL-NIGHTS
           ELSE
               MOVE 0 TO C-DAT-DEAL
           END-IF.

           COMPUTE C-DAT-DUE = C-DAT-SUB + C-DAT-DEAL.
           ADD C-DAT-DEAL TO C-GT-DEAL.
           ADD C-DAT-DUE TO C-GT-DUE.

       2180-CP.
           MOVE 125 TO C-ROOM-CHARGE.
           MOVE 0 TO C-DAT-CLN-FEE.
           PERFORM 9300-COMMON-CALC.

           IF I-NIGHTS >= 5
               COMPUTE C-DEAL-NIGHTS = C-DAT-NIGHT-FEE
               ADD 1 TO C-GT-FREE-NIGHTS
               COMPUTE C-DAT-DEAL = 0 - C-DEAL-NIGHTS
           ELSE
               MOVE 0 TO C-DAT-DEAL
           END-IF.

           COMPUTE C-DAT-DUE = C-DAT-SUB + C-DAT-DEAL.
           ADD C-DAT-DEAL TO C-GT-DEAL.
           ADD C-DAT-DUE TO C-GT-DUE.

       2200-DAT-LINE.
           MOVE I-GUEST TO DAT-GUEST.
           MOVE I-NIGHTS TO DAT-NIGHTS.
           MOVE C-DAT-NIGHT-FEE TO DAT-NIGHT-FEE.
           MOVE C-DAT-CONDO-FEE TO DAT-CONDO-FEE.
           MOVE C-DAT-CLN-FEE TO DAT-CLN-FEE.
           MOVE C-DAT-DOCK-FEE TO DAT-DOCK-FEE.
           MOVE C-DAT-SUB TO DAT-SUB.
           MOVE C-DAT-DEAL TO DAT-DEAL.
           MOVE C-DAT-DUE TO DAT-DUE.

           IF C-DAT-DUE > 750 
               MOVE '****' TO DAT-AST
           ELSE
               MOVE '    ' TO DAT-AST
           END-IF.

           WRITE PRTLINE FROM DAT-LINE
             AFTER ADVANCING 1 LINE
               AT EOP
                   PERFORM 9200-HEADINGS.

       3000-CLOSING.
           MOVE C-GT-SUB TO GT-SUB.
           MOVE C-GT-DEAL TO GT-DEAL.
           MOVE C-GT-DUE TO GT-DUE.

           MOVE C-GT-RENTALS TO GT-RENTALS.
           MOVE C-GT-FREE-NIGHTS TO GT-FREE-NIGHTS.
           MOVE C-GT-FREE-CLN TO GT-FREE-CLN.

           MOVE C-GT-PET-FEE TO GT-PET-FEE.
           MOVE C-GT-HOTTUB-FEE TO GT-HOTTUB-FEE.

           WRITE PRTLINE FROM GT-LINE1
             AFTER ADVANCING 3 LINES.
           WRITE PRTLINE FROM GT-LINE2
             AFTER ADVANCING 2 LINES.
           WRITE PRTLINE FROM GT-LINE3
             AFTER ADVANCING 1 LINE.

       9100-READ.
           READ INPT
               AT END
                   MOVE "NO" TO MORE-RECS.

       9200-HEADINGS.
           ADD 1 TO C-PG.
           MOVE C-PG TO PG.

           WRITE PRTLINE FROM COMP-TITLE1
             AFTER ADVANCING PAGE.
           WRITE PRTLINE FROM COMP-TITLE2
             AFTER ADVANCING 1 LINE.

           WRITE PRTLINE FROM COLUMB-HEADINGS1
             AFTER ADVANCING 2 LINES.
           WRITE PRTLINE FROM COLUMB-HEADINGS2
             AFTER ADVANCING 1 LINE.
           WRITE PRTLINE FROM BLANK-LINE
             AFTER ADVANCING 1 LINE.

       9300-COMMON-CALC.
           COMPUTE C-DAT-NIGHT-FEE = C-ROOM-CHARGE * I-BEDROOMS.
           COMPUTE C-DAT-CONDO-FEE = C-DAT-NIGHT-FEE * I-NIGHTS.
           COMPUTE C-DAT-DOCK-FEE = I-DOCKSLIP * I-NIGHTS.
           COMPUTE C-DAT-SUB = C-DAT-CONDO-FEE + C-DAT-CLN-FEE +
               C-DAT-DOCK-FEE.
           ADD C-DAT-SUB TO C-GT-SUB.
           ADD 1 TO C-GT-RENTALS.
       END PROGRAM COBCJF04.