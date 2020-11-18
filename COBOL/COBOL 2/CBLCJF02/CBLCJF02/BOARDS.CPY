       01 BOARD-AREA.
           05 FILLER         PIC X(18)      VALUE "Shane Hybrid 52999".
           05 FILLER         PIC X(18)      VALUE "Watson Hybrid46999".
           05 FILLER         PIC X(18)      VALUE "Peak Hybrid  00899".
           05 FILLER         PIC X(18)      VALUE "FLX          64999".
           05 FILLER         PIC X(18)      VALUE "Slab         57999".
           05 FILLER         PIC X(18)      VALUE "Deluxe Hybrid49900".
           05 FILLER         PIC X(18)      VALUE "B.O.B. Grind 54999".
           05 FILLER         PIC X(18)      VALUE "Super Trip   49950".
           05 FILLER         PIC X(18)      VALUE "Tex          42999".
           05 FILLER         PIC X(18)      VALUE "Witness      29999".
           05 FILLER         PIC X(18)      VALUE "S4           34999".
           05 FILLER         PIC X(18)      VALUE "Nemesis      29999".
           05 FILLER         PIC X(18)      VALUE "Nemesis Grind27999".
           05 FILLER         PIC X(18)      VALUE "Wing         54999".
           05 FILLER         PIC X(18)      VALUE "Angel        39999".
           05 FILLER         PIC X(18)      VALUE "Melissa Grind49900".
           05 FILLER         PIC X(18)      VALUE "Star         27899".
           05 FILLER         PIC X(18)      VALUE "Jett Grind   34999".
		   
	   01 BOARD-TABLE REDEFINES BOARD-AREA.
		   05 RANDNAME3 OCCURS 18.
		        10 BRD-NME   PIC X(13).
			    10 BRD-COST  PIC 999V99.

       01 CURRENT-DATE-AND-TIME.
           05 I-DATE.
               10 I-YYYY     PIC 9(4).
               10 I-MM       PIC 99.
               10 I-DD       PIC 99.
           05 I-TIME         PIC X(11).

       

       01 BOARD-GT-TABLE.
           05 BOARD-SALES    PIC 9(5)V99    OCCURS 18.