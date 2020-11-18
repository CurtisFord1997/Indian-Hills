#Curtis Ford 3/11/2020
#bug catcher program, asks for 7 days of bug catching and accumulates them.


def main():
    bugs = init
    bugs = inpt(bugs)
    outpt(bugs)

def init(bugs):
    bugs = 0 #initilizes bug accumulator
    print("This program asks you for 7 days of bug catching.")

def inpt(bugs):
    #inalid = True
    for x in range(7):  #runs 7 times
        #while(inalid):
        try:
            bugs += int(input("How many bugs have you caught today?"))#asks the user how many bugs they caught that day and adds it to the bug accumulator.
            #inalid = False
        except ValueError:
            #print("Error: Non-numeric please try again.")
            bugs = 0
            #invalid = True

print("You have caught",format(bugs,","),"bugs this week.")#prints how many bugs the person has caught over the course of 7days