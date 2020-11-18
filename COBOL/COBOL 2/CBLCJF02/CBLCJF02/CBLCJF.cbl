       identification division.
       program-id. CBLCJF.

       environment division.
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
           SELECT INPT
               ASSIGN TO "C:/COBOLSP20/WAKEBOARDS.DAT"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT PRTOUT
               ASSIGN TO "C:/COBOLSP20/WAKEBOARDS.PRT"
               ORGANIZATION IS RECORD SEQUENTIAL.

       data division.
       FILE SECTION.
       FD INPT
           LABEL RECORD IS STANDARD
           DATA RECORD IS I-REC
           RECORD CONTAINS 16 CHARACTERS.

       01 I-WAKEBOARD.
           05 I-UPC          PIC X(12).
           05 I-BOARD        PIC 99.
           05 I-LENGTH       PIC XX.

       01 UPC-BREAKUP REDEFINES I-WAKEBOARD.
           05 XX             PIC XX.
           05 XXX-X          PIC XXX.
           05 X-XXX-X        PIC XXX.
           05 XXXX           PIC X(4).
           05 FILLER         PIC X(4).
       FD PRTOUT
           LABEL RECORD IS STANDARD
           DATA RECORD IS VAL-REC
           RECORD CONTAINS 96 CHARACTERS
           LINAGE IS 60 WITH FOOTING AT 56.

       01 PRTLINE PIC X(132).

       working-storage section.
      *LINES
       01 BLANK-LINE         PIC X(132)     VALUE SPACE.

       01 COMPANY-TITLE-LINE.
           05 FILLER         PIC X(6)       VALUE 'DATE:'.
           05 COMP-DATE.
               10 MM         PIC 99.
               10 FILLER     PIC X          VALUE '/'.
               10 DD         PIC 99.
               10 FILLER     PIC X          VALUE '/'.
               10 YYYY       PIC 9(4).
           05 FILLER         PIC X(43)      VALUE SPACE.
           05 FILLER         PIC X(65)      VALUE 'DETAIL REPORT'.
           05 FILLER         PIC X(6)       VALUE 'PAGE:'.
           05 PG             PIC Z9.

       01 COMP-TITLE2.
           05 FILLER         PIC X(59)      VALUE SPACE.
           05 FILLER         PIC X(73)      VALUE 'BY CURTIS FORD'.

       01 COLUMB-HEADINGS.
           05 FILLER         PIC X(16)      VALUE SPACE.
           05 FILLER         PIC X(29)      VALUE "UPC".
           05 FILLER         PIC X(29)      VALUE "BOARD NAME".
           05 FILLER         PIC X(29)      VALUE "RANGE".
           05 FILLER         PIC X(29)      VALUE "PRICE".

       01 DATA-LINE.
           05 FILLER         PIC X(16)      VALUE SPACE.
           05 O-XX           PIC XX.
           05 FILLER         PIC X          VALUE '/'.
           05 O-XXX-X        PIC XXX.
           05 FILLER         PIC X          VALUE '-'.
           05 O-X-XXX-X      PIC XXX.
           05 FILLER         PIC X          VALUE '-'.
           05 O-XXXX         PIC XXXX.
           05 FILLER         PIC X(14)      VALUE SPACE.
           05 O-BOARD        PIC X(29).
           05 O-RANGE        PIC X(8).
           05 FILLER         PIC X(18)      VALUE 'CM'.
           05 O-PRICE        PIC $$$,$$$.99.
           05 FILLER         PIC X(22)      VALUE SPACE.

       01 GRAND-TOTALS-LINE.
           05 FILLER         PIC X(84).
           05 FILLER         PIC X(15)      VALUE 'TOTAL:'.
           05 GT-PRICE       PIC $$$$,$$$.99.
           05 FILLER         PIC X(22).

       01 BOARD-GRAND-TOTALS.
           05 BOARD-HEADER.
               10 FILLER     PIC X(5)       VALUE SPACE.
               10 FILLER     PIC X(29)      VALUE 'BOARD NUMBER'.
               10 FILLER     PIC X(29)      VALUE 'BOARD NAME'.
               10 FILLER     PIC X(69)      VALUE 'SALES'.
           05 GT-BOARD-LINE.
               10 FILLER     PIC X(10)      VALUE SPACE.
               10 GT-BOARD   PIC Z9.
               10 FILLER     PIC X(22)      VALUE SPACE.
               10 GT-NAME    PIC X(29).
               10 GT-BOARD-S PIC $$$,$$$.99.
               10 FILLER     PIC X(81)      VALUE SPACE.

       01 SIZE-GRAND-TOTALS.
           05 SIZE-HEADER.
               10 FILLER     PIC X(5)       VALUE SPACE.
               10 FILLER     PIC X(29)      VALUE 'SIZE RANGE'.
               10 FILLER     PIC X(98)      VALUE 'NUBER SOLD'.
           05 GT-SIZE-LINE.
               10 FILLER     PIC X(5)       VALUE SPACE.
               10 GT-CM-MAX  PIC X(8).
               10 FILLER     PIC X(21)      VALUE 'CM'.
               10 O-GT-SIZE  PIC ZZ9.
               10 FILLER     PIC X(95)      VALUE SPACE.

      *NOT LINES
       01 GEN-INDEX          PIC 99          VALUE 0.
       01 EOF                PIC X           VALUE 'F'.
       01 C-PG               PIC 99          VALUE ZERO.

       01 SIZE-AREA.
           05 FILLER         PIC X(13)       VALUE "111-117XS0000".
           05 FILLER         PIC X(13)       VALUE "118-123S 0000".
           05 FILLER         PIC X(13)       VALUE "124-133M 0000".
           05 FILLER         PIC X(13)       VALUE "134-141L 0000".
           05 FILLER         PIC X(13)       VALUE "142-146XL0000".

       01 SIZE-TABLE REDEFINES SIZE-AREA.
           05 SIZE-CONTAINER OCCURS 5
               INDEXED BY SIZE-INDEX.
               10 CM-MAX     PIC X(7).
               10 BRD-SIZE   PIC XX.
               10 GT-SIZE    PIC 9999.

       COPY "BOARDS.CPY".
          
       01 GT-SALES           PIC 999999V99       VALUE 0.
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

           MOVE FUNCTION CURRENT-DATE TO CURRENT-DATE-AND-TIME.
           MOVE I-YYYY TO YYYY.
           MOVE I-MM TO MM.
           MOVE I-DD TO DD.
           
            PERFORM 
               VARYING GEN-INDEX FROM 1 BY 1
               UNTIL GEN-INDEX > 18
                   MOVE 0 TO BOARD-SALES(GEN-INDEX)
           END-PERFORM.

           PERFORM L3-MAJOR-HEADINGS.
           PERFORM L3-NORM-HEADINGS.

           PERFORM L3-READ.

       L2-MAINLINE.
           PERFORM L3-INTERPRET.
           PERFORM L3-CALCS.
           PERFORM L3-PRINT.
           PERFORM L3-READ.

       L2-CLOSING.
           MOVE GT-SALES TO GT-PRICE.
           WRITE PRTLINE FROM GRAND-TOTALS-LINE
               AFTER ADVANCING 2 LINES.

           PERFORM L3-MAJOR-HEADINGS.

      *COLUMN HEADINGS FOR BOARD STUFF
           WRITE PRTLINE FROM BOARD-HEADER
               AFTER ADVANCING 2 LINES.
           WRITE PRTLINE FROM BLANK-LINE
               AFTER ADVANCING 1 LINE.

           PERFORM VARYING GEN-INDEX FROM 1 BY 1
               UNTIL GEN-INDEX > 18
                   MOVE GEN-INDEX TO GT-BOARD
                   MOVE BRD-NME(GEN-INDEX) TO GT-NAME
                   MOVE BOARD-SALES(GEN-INDEX) TO GT-BOARD-S
                   WRITE PRTLINE FROM GT-BOARD-LINE
                       AFTER ADVANCING 2 LINES
           END-PERFORM.
      *COLUMN HEADINGS FOR SIZE STUFF
           WRITE PRTLINE FROM SIZE-HEADER
               AFTER ADVANCING 4 LINES.
           WRITE PRTLINE FROM BLANK-LINE 
               AFTER ADVANCING 1 LINE.

           PERFORM VARYING GEN-INDEX FROM 1 BY 1
               UNTIL GEN-INDEX > 5
                   MOVE CM-MAX(GEN-INDEX) TO GT-CM-MAX
                   MOVE GT-SIZE(GEN-INDEX) TO O-GT-SIZE
                   WRITE PRTLINE FROM GT-SIZE-LINE
           END-PERFORM.


       L3-MAJOR-HEADINGS.
      *COMPANY LINES
           ADD 1 TO C-PG.
           MOVE C-PG TO PG.
           WRITE PRTLINE FROM COMPANY-TITLE-LINE
               AFTER ADVANCING PAGE.  
           WRITE PRTLINE FROM COMP-TITLE2
               AFTER ADVANCING 1 LINE.

       L3-NORM-HEADINGS.
      *COLUMN HEADINGS FOR NORMAL DATA
           WRITE PRTLINE FROM COLUMB-HEADINGS
               AFTER ADVANCING 3 LINES.
           WRITE PRTLINE FROM BLANK-LINE
               AFTER ADVANCING 1 LINE.

       L3-READ.
           READ INPT
               AT END
                   MOVE "T" TO EOF.

       L3-INTERPRET.
           SET SIZE-INDEX TO 1.
           SEARCH SIZE-CONTAINER VARYING SIZE-INDEX
               WHEN BRD-SIZE(SIZE-INDEX) = I-LENGTH
                   MOVE CM-MAX(SIZE-INDEX) TO O-RANGE
                   ADD 1 TO GT-SIZE(SIZE-INDEX).

       L3-CALCS.
           ADD BRD-COST(I-BOARD) TO GT-SALES.
           ADD BRD-COST(I-BOARD) TO BOARD-SALES(I-BOARD).


       L3-PRINT.
           MOVE XX TO O-XX.
           MOVE XXX-X TO O-XXX-X.
           MOVE X-XXX-X TO O-X-XXX-X.
           MOVE XXXX TO O-XXXX.
           MOVE BRD-NME(I-BOARD) TO O-BOARD.
           MOVE BRD-COST(I-BOARD) TO O-PRICE.

           WRITE PRTLINE FROM DATA-LINE
               AT EOP
                   PERFORM L3-MAJOR-HEADINGS
                   PERFORM L3-NORM-HEADINGS.

       end program CBLCJF.