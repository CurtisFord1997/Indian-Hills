       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBCJF01.
       DATE-WRITTEN. 12/10/19.
       AUTHOR. CURTIS FORD.
       DATE-COMPILED .

      ******************************************************************
      *THIS PROGRAM CALCULATES ESTIMATES FOR PAINTING JOBS BASED ON
      *WALL SQUARE FOOTAGE (WALL - DOOR) DOR REPRESENTS VOID SPACE LIKE
      *DOORS, WINDOWS, WALKWAYS ETC.
      ******************************************************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT PAINT
               ASSIGN TO 'C:\COBOL\PAINTEST.DAT'
               ORGANIZATION IS LINE SEQUENTIAL.

           SELECT PRTOUT
               ASSIGN TO 'C:\COBOL\PJOBEST.PRT'
               ORGANIZATION IS RECORD SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD  PAINT
           LABEL RECORD IS STANDARD
           DATA RECORD IS PAINT-REC
           RECORD CONTAINS 23 CHARACTERS.

       01 PAINT-REC.
           05 PAINT-EST-NO         PIC X(4).
           05 PAINT-DATE.
               10 PAINT-YY         PIC 9(4).
               10 PAINT-MM         PIC 99.
               10 PAINT-DD         PIC 99.
           05 PAINT-WALL-SQ-FT     PIC 9(4).
           05 PAINT-DOOR-SQ-FT     PIC 9(3).
           05 PAINT-PRICE-GAL      PIC 99V99.

       FD PRTOUT
           LABEL RECORD IS OMITTED
           RECORD CONTAINS 132 CHARACTERS
           DATA RECORD IS PRTLINE
           LINAGE IS 60 WITH FOOTING AT 56.

       01 PRTLINE                  PIC X(132).

       WORKING-STORAGE SECTION.
       01 WORK-AREA.
           05 MORE-RECS            PIC XXX VALUE 'YES'.

       01 CURRENT-DATE-AND-TIME.
           05 I-DATE.
               10 I-YYYY           PIC 9(4).
               10 I-MM             PIC 99.
               10 I-DD             PIC 99.
           05 I-TIME               PIC X(11).

       01 COMPANY-TITLE.
           05 FILLER               PIC X(6) VALUE 'DATE:'.
           05 O-MM                 PIC 99.
           05 FILLER               PIC X VALUE '/'.
           05 O-DD                 PIC 99.
           05 FILLER               PIC X VALUE '/'.
           05 O-YYYY               PIC 9(4).
           05 FILLER               PIC X(39) VALUE SPACE.
           05 FILLER               PIC X(22)
               VALUE "FORD'S PAINT ESTIMATOR".
           05 FILLER               PIC X(47) VALUE SPACE.
           05 FILLER               PIC X(6) VALUE "PAGE:".
           05 O-PG-CTR PIC Z9.

       01 COLUMB-HEADING-LINE1.
           05 FILLER               PIC X(12) VALUE "ESTIMATE".
           05 FILLER               PIC X(18) VALUE SPACE.
           05 FILLER               PIC X(11) VALUE " WALL".
           05 FILLER               PIC X(11) VALUE " DOOR".
           05 FILLER               PIC X(11) VALUE "TOTAL".
           05 FILLER               PIC X(13) VALUE "GALLONS".
           05 FILLER               PIC X(14) VALUE "PRICE/".
           05 FILLER               PIC X(17) VALUE "   PAINT".
           05 FILLER               PIC X(17) VALUE "   LABOR".
           05                      PIC X(8) VALUE "  TOTAL".




       01 COLUMB-HEADING-LINE2.
           05 FILLER               PIC X(12) VALUE " NUMBER".
           05 FILLER               PIC X(18) VALUE "ESTIMATE DATE".
           05 FILLER               PIC X(11) VALUE "SQ/FT".
           05 FILLER               PIC X(11) VALUE "SQ/FT".
           05 FILLER               PIC X(11) VALUE "SQ/FT".
           05 FILLER               PIC X(13) VALUE " NEEDED".
           05 FILLER               PIC X(14) VALUE "GALLON".
           05 FILLER               PIC X(17) VALUE "ESTIMATE".
           05 FILLER               PIC X(17) VALUE "ESTIMATE".
           05 FILLER               PIC X(8) VALUE "ESTIMATE".

       01 BLANK-LINE.
           05 FILLER               PIC X(132) VALUE SPACE.

       01 DETAIL-LINE1.
           05 FILLER               PIC XX VALUE SPACE.
           05 O-PAINT-EST-NO       PIC X(4).
           05 FILLER               PIC X(7) VALUE SPACE.
           05 O-PAINT-MONTH        PIC 99.
           05 FILLER               PIC X VALUE "/".
           05 O-PAINT-DAY          PIC 99.
           05 FILLER               PIC X VALUE "/".
           05 O-PAINT-YEAR         PIC 9999.
           05 FILLER               PIC X(7) VALUE SPACE.
           05 O-PAINT-WALL-SQ-FT   PIC Z,ZZ9.
           05 FILLER               PIC X(7) VALUE SPACE.
           05 O-PAINT-DOOR-SQ-FT   PIC ZZ9.
           05 FILLER               PIC X(7) VALUE SPACE.
           05 O-PAINT-TOT-SQ-FT    PIC Z,ZZ9.
           05 FILLER               PIC X(7) VALUE SPACE.
           05 O-GAL-NEED           PIC ZZZ.99.
           05 FILLER               PIC X(7) VALUE SPACE.
           05 O-PAINT-PRICE-GAL    PIC ZZ.99.
           05 FILLER               PIC X(6) VALUE SPACE.
           05 O-PAINT-EST          PIC $ZZ,ZZZ.99.
           05 FILLER               PIC X(7) VALUE SPACE.
           05 O-LABOR-EST          PIC $ZZ,ZZZ.99.
           05 FILLER               PIC X(6) VALUE SPACE.
           05 O-TOT-EST            PIC $ZZZ,ZZZ.99.

       01 TOTAL-LINE.
           05 FILLER               PIC X(34) VALUE "GRAND TOTALS:".
           05 FILLER               PIC X(17) VALUE "TOTAL ESTIMATES:".
           05 GT-NUM-EST           PIC ZZ9.
           05 FILLER               PIC X(7) VALUE SPACE.
           05 GT-GAL-NEEDED        PIC ZZ,ZZZ.99.
           05 FILLER               PIC X(15) VALUE SPACE.
           05 GT-PAINT-EST         PIC $$,$$$,$$$.99.
           05 FILLER               PIC X(4) VALUE SPACE.
           05 GT-LABOR-EST         PIC $$,$$$,$$$.99.
           05 FILLER               PIC X(3) VALUE SPACE.
           05 GT-TOT-EST           PIC $$$,$$$,$$$.99.

       01 CALCUATED-VARIABLES.
           05 C-PG-CTR             PIC 99 VALUE 0.
           05 C-DATA-LINE.
               10 C-TOT-SQ-FT      PIC S9999 VALUE 0.
               10 C-GAL-NEEDED     PIC 999V99 VALUE 0.
               10 C-PAINT-EST      PIC 9(5)V99 VALUE 0.
               10 C-LABOUR-EST     PIC 9(5)V99 VALUE 0.
               10 C-TOTAL-EST      PIC 9(6)V99 VALUE 0.
           05 C-GT-LINE.
               10 C-GT-NUM-EST     PIC 999 VALUE 0.
               10 C-GT-GAL-NEEDED  PIC 9(5)V99 VALUE 0.
               10 C-GT-PAINT-EST   PIC 9(7)V99 VALUE 0.
               10 C-GT-LABOUR-EST  PIC 9(7)V99 VALUE 0.
               10 C-GT-TOT-EST     PIC 9(8)V99 VALUE 0.

       01 CONSTANT-VARIABLES.
           05 SQ-FT-PER-GAL        PIC 999 VALUE 115.
           05 HOURS-PER-GAL        PIC 9 VALUE 3.
           05 LABOUR-CST-PER-GALON PIC 99V99 VALUE 23.55.

       PROCEDURE DIVISION.
       0000-MAIN.
           PERFORM 1000-INIT.
           PERFORM 2000-MAINLINE
             UNTIL MORE-RECS = "NO".
           PERFORM 3000-CLOSING.
           STOP RUN.

       1000-INIT.
           OPEN INPUT PAINT.
           OPEN OUTPUT PRTOUT.

           MOVE FUNCTION CURRENT-DATE TO CURRENT-DATE-AND-TIME.
           MOVE I-YYYY TO O-YYYY.
           MOVE I-MM TO O-MM.
           MOVE I-DD TO O-DD.

           PERFORM 9000-READ.
           PERFORM 9100-HEADINGS.

       2000-MAINLINE.
           PERFORM 2100-CALCS.
           PERFORM 2200-OUTPUT.
           PERFORM 9000-READ.

       2100-CALCS.
           SUBTRACT PAINT-DOOR-SQ-FT FROM PAINT-WALL-SQ-FT 
               GIVING C-TOT-SQ-FT.
           DIVIDE SQ-FT-PER-GAL INTO C-TOT-SQ-FT GIVING C-GAL-NEEDED.
           MULTIPLY PAINT-PRICE-GAL BY C-GAL-NEEDED 
               GIVING C-PAINT-EST.
           COMPUTE C-LABOUR-EST = (C-GAL-NEEDED*HOURS-PER-GAL*
               LABOUR-CST-PER-GALON).
           ADD C-PAINT-EST TO C-LABOUR-EST GIVING C-TOTAL-EST.

           ADD 1 TO C-GT-NUM-EST.
           ADD C-GAL-NEEDED TO C-GT-GAL-NEEDED.
           ADD C-PAINT-EST TO C-GT-PAINT-EST.
           ADD C-LABOUR-EST TO C-GT-LABOUR-EST.
           ADD C-TOTAL-EST TO C-GT-TOT-EST.
           PERFORM 2210-OUTPUT-MOVE.

       2200-OUTPUT.
           WRITE PRTLINE
               FROM DETAIL-LINE1
                   AFTER ADVANCING 1 LINES
                       AT EOP
                           PERFORM 9100-HEADINGS.

       2210-OUTPUT-MOVE.
           MOVE PAINT-EST-NO TO O-PAINT-EST-NO.
           MOVE PAINT-MM TO O-PAINT-MONTH.
           MOVE PAINT-DD TO O-PAINT-DAY.
           MOVE PAINT-YY TO O-PAINT-YEAR.
           MOVE PAINT-WALL-SQ-FT TO O-PAINT-WALL-SQ-FT.
           MOVE PAINT-DOOR-SQ-FT TO O-PAINT-DOOR-SQ-FT.
           MOVE C-TOT-SQ-FT TO O-PAINT-TOT-SQ-FT.
           MOVE C-GAL-NEEDED TO O-GAL-NEED.
           MOVE PAINT-PRICE-GAL TO O-PAINT-PRICE-GAL.
           MOVE C-PAINT-EST TO O-PAINT-EST.
           MOVE C-LABOUR-EST TO O-LABOR-EST.
           MOVE C-TOTAL-EST TO O-TOT-EST.

       3000-CLOSING.
           PERFORM 3100-TOTAL-LINE-MOVE.
           WRITE PRTLINE
               FROM TOTAL-LINE
                   AFTER ADVANCING 3 LINES.
           CLOSE PAINT.
           CLOSE PRTOUT.

       3100-TOTAL-LINE-MOVE.
           MOVE C-GT-NUM-EST TO GT-NUM-EST.
           MOVE C-GT-GAL-NEEDED TO GT-GAL-NEEDED.
           MOVE C-GT-PAINT-EST TO GT-PAINT-EST.
           MOVE C-GT-LABOUR-EST TO GT-LABOR-EST.
           MOVE C-GT-TOT-EST TO GT-TOT-EST.

       9000-READ.
           READ PAINT
               AT END
                   MOVE "NO" TO MORE-RECS.

       9100-HEADINGS.
           ADD 1 TO C-PG-CTR.
           MOVE C-PG-CTR TO O-PG-CTR.
           WRITE PRTLINE FROM COMPANY-TITLE
               AFTER ADVANCING PAGE.
           WRITE PRTLINE FROM COLUMB-HEADING-LINE1
               AFTER ADVANCING 2 LINES.
           WRITE PRTLINE FROM COLUMB-HEADING-LINE2
               AFTER ADVANCING 1 LINE.
           WRITE PRTLINE FROM BLANK-LINE
               AFTER ADVANCING 1 LINE.