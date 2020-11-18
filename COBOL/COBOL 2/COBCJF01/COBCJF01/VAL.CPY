        01 VAL-REC.
			05 O-CAMPGROUND		PIC X(25).
			05 O-SITE			PIC X99.
			05 O-DATE			PIC 9(8).
			05 O-END-DATE		PIC 9(8).
			05 O-LEN-STAY		PIC 99.
			05 O-NAME			PIC X(42).
			05 O-AMT			PIC S9(3)V99.
			05 O-CCTYPE			PIC X(16).
			05 O-CCNUM.
               10 NUM-FST       PIC 9(4).
               10 FILLER        PIC X          VALUE '-'.
               10 NUM-SND       PIC 9(4).
               10 FILLER        PIC X          VALUE '-'.
               10 NUM-THRD      PIC 9(4).
               10 FILLER        PIC X          VALUE '-'.
               10 NUM-FOURTH    PIC 9(4).
			05 O-CCEXP			PIC 9(8).