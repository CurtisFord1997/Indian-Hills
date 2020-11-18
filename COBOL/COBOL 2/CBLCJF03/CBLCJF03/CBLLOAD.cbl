      *THIS PROGRAM RECIEVES THE FURNATURE CODE AND RETURNS THE 
      *DESCRIPTION

       identification division.
       program-id. CBLLOAD.

       environment division.
       configuration section.

       data division.
       WORKING-STORAGE SECTION.
       01 ITEMS.
           05 FILLER               PIC X(22)
                   VALUE "SOFAS/LOVESEATS".
           05 FILLER               PIC X(22)
                   VALUE "CHAIRS".
           05 FILLER               PIC X(22)
                   VALUE "COFFEE/END TABLES".
           05 FILLER               PIC X(22)
                   VALUE "DINING ROOM TABLES".
           05 FILLER               PIC X(22)
                   VALUE "DINING ROOM CHAIRS".
           05 FILLER               PIC X(22)
                   VALUE "HUTCHES/CURIO CABINETS".
           05 FILLER               PIC X(22)
                   VALUE "LAMPS".
           05 FILLER               PIC X(22)
                   VALUE"MATTRESS/BOX SPRINGS".
           05 FILLER               PIC X(22)
                   VALUE "BEDROOM FURNITURE".

       01 ITEM-AREA REDEFINES ITEMS.
           05 ITEM-TABLE OCCURS 9.
               10 ITEM             PIC X(22).

       LINKAGE SECTION.
       01 PASSED-DATA.
           05 PD-FURN-CODE         PIC 9.
           05 PD-FURN-DESC         PIC X(22).

       procedure division USING PASSED-DATA.
           MOVE ITEM(PD-FURN-CODE) TO PD-FURN-DESC.

           goback.
           
       end program CBLLOAD.