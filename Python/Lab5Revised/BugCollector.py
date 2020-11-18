#Curtis Ford 3/25/2020
#bug catcher program, asks for 7 days of bug catching and accumulates them.

#does the stuff in order
def main():
    bugs = init()
    bugs = inpt(bugs)
    outpt(bugs)

#describes what the program does and initilizes variables
def init():
    bugs = 0 #initilizes bug accumulator
    print("This program asks you for 7 days of bug catching.")
    return bugs

#runs a for loop that calls the input verifying module, returns total bugs caught
def inpt(bugs):
    for x in range(7):  #runs 7 times
       bugs += verify(bugs)
    return bugs

#Loops until valid number is entered and asks for an input of bugs, then returns the new amount of bugs collected
def verify(bugs):
    #inalid = True
    #while(inalid):
    try:
        bugs += int(input("How many bugs have you caught today?"))#asks the user how many bugs they caught that day and adds it to the bug accumulator.
        #inalid = False
    except ValueError:
        #print("Error: Non-numeric please try again.")
        #invalid = True
        bugs += 0
    return bugs;

#displays total bugs
def outpt(bugs):
    print("You have caught",format(bugs,","),"bugs this week.")#prints how many bugs the person has caught over the course of 7days 

main()

