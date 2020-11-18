#chalange 1
for numRows in range(7,0,-1):
    row = "" #starts the row blank
    for stars in range(numRows): #concatinates the number of stars equal to the num rows left
        row = row + "*"
    print(row)

#chalange 2
row = "#" #starts row off with just a lonely hashtag
for numRows in range(7):
    if numRows == 0:#row 0 has no spaces so don't add any spaces to the middle
        row = row
    elif numRows % 3 == 0:#if the row is divisible by three(counting from 0) add three spaces
        row += "   "
    else:#if the row is not divisible by three add two spaces
        row += "  "
    print(row+"#")#prints the row adding a hashtag on the end, but does not change sthe string row