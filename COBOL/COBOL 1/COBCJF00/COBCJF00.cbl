       IDENTIFICATION DIVISION.
       PROGRAM-ID.     COBCJF00.
       DATE-WRITTEN.   11/20/19.
       AUTHOR.         CURTIS FORD.
       DATE-COMPILED.  

      ****************************************
      *THIS PROGRAM READS A FILE AND CREATES A
      *STUDENT ROSTER REPORT
      ****************************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT STUDENT-MASTER
               ASSIGN TO INFILE.

           SELECT PRTOUT
               ASSIGN TO OUTFILE.

       DATA DIVISION.
       FILE SECTION.

       FD  STUDENT-MASTER
           LABEL RECORD IS STANDARD
           DATA RECORD IS I-REC
           RECORD CONTAINS 49 CHARACTERS.

       01  I-REC.
           05  I-ID             PIC X(7).
           05  I-NAME.
               10  I-LNAME      PIC X(15).
               10  I-FNAME      PIC X(15).
               10  I-INIT       PIC X.
           05  I-GPA            PIC 9V99.
           05  I-START-SAL      PIC 9(6)V99.

       FD  PRTOUT 
           LABEL RECORD IS OMITTED
           RECORD CONTAINS 132 CHARACTERS
           DATA RECORD IS PRTLINE
           LINAGE IS 60 WITH FOOTING AT 56.

       01  PRTLINE              PIC X(132).

       WORKING-STORAGE SECTION.
       01  WORK-AREA.
           05  C-STU-CTR        PIC 9(3)        VALUE 0.
           05  C-PG-CTR         PIC 99          VALUE 0.
           05  MORE-RECS        PIC XXX         VALUE 'YES'.

       01  CURRENT-DATE-AND-TIME.
           05  I-DATE.
               10  I-YYYY       PIC 9(4).
               10  I-MM         PIC 99.
               10  I-DD         PIC 99.
           05  I-TIME           PIC X(11).

       01  COMPANY-TITLE.
           05  FILLER           PIC X(6)        VALUE 'DATE:'.
           05  O-MM             PIC 99.
           05  FILLER           PIC X           VALUE '/'.
           05  O-DD             PIC 99.
           05  FILLER           PIC X           VALUE'/'.
           05  O-YYYY           PIC 9(4).
           05  FILLER           PIC X(36)       VALUE SPACE.
           05  FILLER           PIC X(27)       VALUE 
               "FORD'S COBOL STUDENT ROSTER".
           05  FILLER           PIC X(45)       VALUE SPACE.
           05  FILLER           PIC X(6)        VALUE "PAGE:".
           05  O-PG-CTR         PIC Z9.

       01  COLUMB-HEADING-LINE1.
           05  FILLER           PIC X(119)      VALUE SPACE.
           05  FILLER           PIC X(13)       VALUE "ANTICIPATED".

       01  COLUMB-HEADING-LINE2.
           05  FILLER           PIC X(4)        VALUE "  ID".
           05  FILLER           PIC X(23)       VALUE SPACE.
           05  FILLER           PIC X(9)        VALUE "LAST NAME".
           05  FILLER           PIC X(26)       VALUE SPACE.
           05  FILLER           PIC X(10)       VALUE "FIRST NAME".
           05  FILLER           PIC X(26)       VALUE SPACE.
           05  FILLER           PIC X(3)        VALUE "GPA".
           05  FILLER           PIC X(16)       VALUE SPACE.
           05  FILLER           PIC X(15)       VALUE "STARTING SALARY".

       01  DETAIL-LINE1.
           05  O-ID             PIC X(7).
           05  FILLER           PIC X(20)       VALUE SPACE.
           05  O-LNAME          PIC X(15).
           05  FILLER           PIC X(20)       VALUE SPACE.
           05  O-FNAME          PIC X(15).
           05  FILLER           PIC X(20)       VALUE SPACE.
           05  O-GPA            PIC Z.99.
           05  FILLER           PIC X(18)       VALUE SPACE.
           05  O-STRT-SAL       PIC $ZZZ,ZZZ.99.
           05  FILLER           PIC XX          VALUE SPACE.

       01  TOTAL-LINE.
           05  FILLER           PIC X(54)       VALUE SPACE. 
           05  FILLER           PIC X(15)       VALUE "STUDENT COUNT:".
           05  O-ST-CT          PIC ZZ9.
           05  FILLER           PIC X(60)       VALUE SPACE.

       PROCEDURE DIVISION.
       0000-MAIN.
           PERFORM 1000-INIT.
           PERFORM 2000-MAINLINE
               UNTIL MORE-RECS = "NO".
           PERFORM 3000-CLOSING.
           STOP RUN.

       1000-INIT.
           OPEN INPUT STUDENT-MASTER.
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
           ADD 1 TO C-STU-CTR.

       2200-OUTPUT.
           MOVE I-ID TO O-ID.
           MOVE I-LNAME TO O-LNAME.
           MOVE I-FNAME TO O-FNAME.
           MOVE I-GPA TO O-GPA.
           MOVE I-START-SAL TO O-STRT-SAL.
           WRITE PRTLINE
               FROM DETAIL-LINE1
                   AFTER ADVANCING 2 LINES
                       AT EOP PERFORM 9100-HEADINGS.
       3000-CLOSING.
           MOVE C-STU-CTR TO O-ST-CT.
           WRITE PRTLINE FROM TOTAL-LINE
               AFTER ADVANCING 3 lines.
           CLOSE STUDENT-MASTER.
           CLOSE PRTOUT.

       9000-READ.
           READ STUDENT-MASTER
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
