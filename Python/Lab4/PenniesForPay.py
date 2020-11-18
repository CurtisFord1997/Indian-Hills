#initialize vars
payRate = .01
pay = 0

#prompt for input
print("You get one penny your first day of work and each day your pay rate doubles.\nIf you enter in more than 93 days the formatting will get wonky.\n and after 1030 it'll be infinity-ish")
lengthOfTime = int(input("How long do you want to work?\n"))

#column headings
print(" Day\t\t\tPay")

#loops for as many times as the user asked
for x in range (lengthOfTime):
    print (format(x+1,"4.0f")+"\t$"+format(payRate,"37,.2f" ))
    pay += payRate #accumulate pay
    payRate *=2 #Multiply payRate by 2

#prints totals
print("\nTotal:\t$"+format(pay,"37,.2f"))