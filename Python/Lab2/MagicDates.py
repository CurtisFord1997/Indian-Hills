day = int(input("Please enter the month in numeric form. "))
month = int(input("Please enter the daty in numeric form. "))
year = int(input("Please enter the year. "))

if day*month == year:
    print("The date", day,"/",month,"/",year,"is magic")
else:
    print("The date", day,"/",month,"/",year,"is not magic")