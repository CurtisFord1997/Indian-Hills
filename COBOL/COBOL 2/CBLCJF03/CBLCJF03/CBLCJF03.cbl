      *THIS PROGRAM TAKES INFORMATION FROM FURN.DAT AND FURNCODE.DAT
      *AND PRINTS OUT THE DAILY TOTALS FOR ALL THE SALESMEN, AND THE
      *TOALS FOR EACH PIECE OF FURNATURE.

       identification division.
       program-id. CBLCJF03.
       DATE-WRITTEN. 4/22/20.
       AUTHOR. CURTIS FORD.
       DATE-COMPILED.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPT
               ASSIGN TO "C:/COBOLSP20/FURN.DAT"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT PRTOUT
               ASSIGN TO "C:/COBOLSP20/CBLSMRY.PRT"
               ORGANIZATION IS RECORD SEQUENTIAL.
           SELECT FURN-INPUT
               ASSIGN TO "C:/COBOLSP20/FURNCODE.DAT"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD INPT
           LABEL RECORD IS STANDARD
           DATA RECORD IS ST-REC
           RECORD CONTAINS 42 CHARACTERS.

       01 ST-REC.
           05 ST-SLM-NUM           PIC 99.
               88 VAL-SLM-NUM                  VALUE 1 THRU 15.
           05 ST-DAY               PIC 9.
               88 VAL-DAY                      VALUE 1 THRU 7.
           05 ST-AMOUNT            PIC S9(5)V99.
           05 ST-FUR-CODE          PIC 9.
               88 VAL-FUR-CODE                 VALUE 1 THRU 9.
           05 ST-SALES-DATE        PIC 9(6).
           05 ST-SLM-NAME          PIC X(25).

       FD PRTOUT
           LABEL RECORD IS STANDARD
           RECORD CONTAINS 132 CHARACTERS
           DATA RECORD IS PRTLINE
           LINAGE IS 60 WITH FOOTING AT 56.

       01 PRTLINE                  PIC X(132).

       FD FURN-INPUT
           LABEL RECORD IS STANDARD
           DATA RECORD IS ST-REC
           RECORD CONTAINS 1 CHARACTERS.

       01 FURN-TYPE.
           05 FT-FURN-CODE         PIC 9.

       WORKING-STORAGE SECTION.
       01 DAILY-AREA.
           05 DAILY-TABLE  OCCURS 15.
               10 TAB-NAME         PIC X(25).
               10 DAY-SALES OCCURS 7.
                   15 DAY-SALE     PIC S9(7)V99.
               10 WEEK-SALES       PIC S9(9)V99.
                   88 INVAL-SALES              VALUE 0.

       01 DAILY-TOTALS-AREA.
           05 DAILY-TOTALS	 OCCURS 7.
       	       10  TOTAL               PIC 9(10)V99.

       01 COUNTERS.
           05 SINDX                PIC 99      VALUE 0.
           05 DINDX                PIC 99      VALUE 0.

       01 TBL-FURNITURE-INFO OCCURS 9 TIMES.
           05 TBL-FURN-TYPE            PIC X(22).
           05 TBL-FURN-TOT             PIC S9(9)V99.

      *OUTPUT LINES
       01 COMPANY-TITLE-LINE.
           05 FILLER               PIC X(6)    VALUE 'DATE:'.
           05 COMP-DATE.
               10 MM               PIC 99.
               10 FILLER           PIC X       VALUE '/'.
               10 DD               PIC 99.
               10 FILLER           PIC X       VALUE '/'.
               10 YYYY             PIC 9(4).
           05 FILLER               PIC X(36)   VALUE SPACE.
           05 FILLER               PIC X(72)      
                   VALUE 'JUST FITS FUNITURE EMPORIUM'.
           05 FILLER               PIC X(6)    VALUE 'PAGE:'.
           05 PG                   PIC Z9.

       01 BLANK-LINE               PIC X(132)  VALUE SPACE.

      *SALES REPORT LINES
       01 COMPANY-SALES-REPORT-LINE.
           05 FILLER               PIC X(59)   VALUE SPACE.
           05 FILLER               PIC X(59)   VALUE "SALES REPORT".

       01 SALESPERSON-HEADINGS.
           05 FILLER               PIC X(31)   VALUE "SALESPERSON".
           05 FILLER               PIC X(11)   VALUE "MONDAY".
           05 FILLER               PIC X(10)   VALUE "TUESDAY".
           05 FILLER               PIC X(13)   VALUE "WEDNESDAY".
           05 FILLER               PIC X(14)   VALUE "THURSDAY".
           05 FILLER               PIC X(10)   VALUE "FRIDAY".
           05 FILLER               PIC X(14)   VALUE "SATURDAY".
           05 FILLER               PIC X(12)   VALUE "SUNDAY".
           05 FILLER               PIC X(14)   VALUE "WEEKLY TOTAL".

       01 SALESPERSON-DETAIL-LINE OCCURS 15 TIMES.
           05 O-NAME               PIC X(25).
           05 FILLER               PIC X      VALUE SPACES.
           05 O-DAY-SALES OCCURS 7 TIMES.
               10 O-DAY-SALE       PIC -Z(7).99.
               10 FILLER           PIC X       VALUE SPACES.
           05 FILLER               PIC X       VALUE SPACES.
           05 O-WEEK-SALES         PIC -$$$$,$$$,$$$.99.

       01 REPORT-TOT-LINE.
           05 FILLER               PIC X(27)   VALUE "DAILY TOTALS".
           05 O-DAILY-TOTALS OCCURS 7.
               10 O-TOTAL          PIC Z(7).99.
               10 FILLER           PIC XX       VALUE SPACES.

      *SUMMARY REPORT LINES
       01 COMPANY-SUMMARY-LINE.
           05 FILLER               PIC X(59)   VALUE SPACES.
           05 FILLER               PIC X(73)   VALUE "SUMMARY REPORT".

       01 SUMMARY-HEADING.
           05 FILLER               PIC X(55)   VALUE "FURNITURE TYPE".
           05 FILLER               PIC X(77)   VALUE "WEEKLY SALES".

       01 SUMMARY-REPORT-LINE.
           05 O-ITEM               PIC X(56).
           05 O-ITEM-TOTAL         PIC $$$$,$$$.99.
           05 FILLER               PIC X(66).

       01 MISC.
           05 EOF                  PIC X       VALUE 'F'.
           05 C-PG                 PIC 99      VALUE 0.

       01 CURRENT-DATE-AND-TIME.
           05 I-DATE.
               10 I-YYYY           PIC 9(4).
               10 I-MM             PIC 99.
               10 I-DD             PIC 99.
           05 I-TIME               PIC X(11).

      *LINKAGE SECTION.
       01 PASSED-DATA.
           05 PD-FURN-CODE         PIC 9.
           05 PD-FURN-DESC         PIC X(22).

       PROCEDURE DIVISION.

       L1-MAIN.
           PERFORM L2-INIT.
           PERFORM L2-MAINLINE
             UNTIL EOF = 'T'.
           PERFORM L2-CLOSING.
           STOP RUN.

       L2-INIT.
           OPEN INPUT INPT.
           OPEN OUTPUT PRTOUT.
           OPEN INPUT FURN-INPUT.

           PERFORM L3-TABLE-INIT
               UNTIL EOF = 'E'

           CLOSE FURN-INPUT.

           MOVE FUNCTION CURRENT-DATE TO CURRENT-DATE-AND-TIME.
           MOVE I-YYYY TO YYYY.
           MOVE I-MM TO MM.
           MOVE I-DD TO DD.



      *INITIALIZE THE TABLES
           INITIALIZE DAILY-AREA.
           INITIALIZE DAILY-TOTALS-AREA.


           PERFORM L3-READ.

       L2-MAINLINE.
           PERFORM L3-CALCS.
           PERFORM L3-READ.

       L2-CLOSING.
      *HEADERS FOR SALES REPORT LINES
           PERFORM L3-GENERAL-HEADER.
           PERFORM L3-SALES-REPORT-HEADER.
           

           PERFORM L4-PRINT-SALESPERSON
             VARYING SINDX FROM 1 BY 1
             UNTIL SINDX > 15.

           PERFORM L4-PRINT-DAY-TOTALS.

      **HEADERS FOR SUMMARY REPORT
           PERFORM L3-GENERAL-HEADER.
           PERFORM L3-SUMMARY-REPORT-HEADER.

       	   PERFORM L4-PRINT-FURNATURE
       		VARYING SINDX FROM 1 BY 1
       			UNTIL SINDX > 9.

       L3-TABLE-INIT.
           READ FURN-INPUT
               AT END MOVE 'E' TO EOF.

           MOVE FT-FURN-CODE TO PD-FURN-CODE.
           MOVE SPACES TO PD-FURN-DESC.

           CALL 'CBLLOAD' USING PD-FURN-CODE
                                PD-FURN-DESC.

           MOVE PD-FURN-DESC TO TBL-FURN-TYPE(PD-FURN-CODE).
           MOVE ZEROS TO TBL-FURN-TOT(PD-FURN-CODE).

       L3-READ.
           READ INPT
               AT END
                   MOVE "T" TO EOF.

       L3-CALCS.
           MOVE ST-SLM-NAME TO TAB-NAME (ST-SLM-NUM).
           ADD ST-AMOUNT TO DAY-SALE(ST-SLM-NUM, ST-DAY).
           ADD ST-AMOUNT TO TBL-FURN-TOT(ST-FUR-CODE).

           ADD ST-AMOUNT TO WEEK-SALES(ST-SLM-NUM).

           ADD ST-AMOUNT TO TOTAL(ST-DAY).

      *TOP LINE OF HEADER
       L3-GENERAL-HEADER.
           ADD 1 TO C-PG.
           MOVE C-PG TO PG.
           WRITE PRTLINE FROM COMPANY-TITLE-LINE
               AFTER ADVANCING PAGE.

      *HEADER FOR THE SALES REPORT
       L3-SALES-REPORT-HEADER.
           WRITE PRTLINE FROM COMPANY-SALES-REPORT-LINE
               AFTER ADVANCING 1 LINE.

           WRITE PRTLINE FROM SALESPERSON-HEADINGS
               AFTER ADVANCING 2 LINES.
           WRITE PRTLINE FROM BLANK-LINE
               AFTER ADVANCING 1 LINE.

      *HEADER FOR THE SUMMARY REPORT
       L3-SUMMARY-REPORT-HEADER.
           WRITE PRTLINE FROM COMPANY-SUMMARY-LINE
               AFTER ADVANCING 1 LINE.

           WRITE PRTLINE FROM SUMMARY-HEADING
               AFTER ADVANCING 2 LINES.
           WRITE PRTLINE FROM BLANK-LINE
               AFTER ADVANCING 1 LINE.

       L4-PRINT-SALESPERSON.
           MOVE TAB-NAME (SINDX) TO O-NAME(SINDX).
           MOVE WEEK-SALES(SINDX) TO O-WEEK-SALES(SINDX).

           PERFORM L5-PRINT-SALES
             VARYING DINDX FROM 1 BY 1
             UNTIL DINDX > 7.

           IF NOT INVAL-SALES(SINDX)
               WRITE PRTLINE FROM SALESPERSON-DETAIL-LINE(SINDX)
                 AFTER ADVANCING 1 LINE.

       L4-PRINT-DAY-TOTALS.
           PERFORM L5-DAY-TOTALS-MOVE
             VARYING DINDX FROM 1 BY 1
             UNTIL DINDX > 7.

      *PRINT DAY-TOTALS LINE...
           WRITE PRTLINE FROM REPORT-TOT-LINE
               AFTER ADVANCING 2 LINES.

       L4-PRINT-FURNATURE.
           MOVE TBL-FURN-TYPE(SINDX) TO O-ITEM.
           MOVE TBL-FURN-TOT(SINDX) TO O-ITEM-TOTAL.
           WRITE PRTLINE FROM SUMMARY-REPORT-LINE
               AFTER ADVANCING 1 LINE.

       L5-PRINT-SALES.
           MOVE DAY-SALE(SINDX, DINDX) TO O-DAY-SALE(SINDX, DINDX).

       L5-DAY-TOTALS-MOVE.
           MOVE TOTAL(DINDX) TO O-TOTAL(DINDX).
           
       end program CBLCJF03.

