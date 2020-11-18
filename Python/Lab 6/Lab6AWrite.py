#This program prompts the user to enter in golf players and their scores and then writes the data to a file

#curtis Ford
#3/29/2020
import sys
def main():
    keepGoing = 'y'
    while(keepGoing == 'y'):
        name = nameInput()
        score = scoreInput()
        outpt(name, score)
        keepGoing = continuePrompt()

    closing()

def init():
    print("Welcome to Springford Amateur Golf Club!\n")
    print("This program has you enter in each player's name")
    print("and score and saves the data to a file.")
    #gets what type of file creation they want append or write
    newOrAppend = typePrompt() 
    #trys to create the file depending on what the user entered (writing or appending)
    try:
        return open('golf.dat', newOrAppend)
    except IOError:
        print('Error: File creation error. Exiting program')
        sys.exit(0)

def typePrompt():
    cont = 'y'
    #loops until valid data is entered
    while cont == 'y':
        #asks the user whether they would like to create a new file or append to the one just made
        newOrAppend = input("Would you like to create a new file or append to the current one?\nEnter N (new) or A (append)\n").lower()
        if (newOrAppend == 'n' or newOrAppend == 'a'):
            cont = 'n'
            #converts the n for new to the w for write that is the option in creating the file.
            if (newOrAppend == 'n'):
                newOrAppend = 'w'

            return newOrAppend
        else:
            print("invalid entry, please try again.")
            cont = 'y'

#prompts the user for a name and weeds out the ones that are just blank space(reprompts)
def nameInput():
    keepGoing = 'y'
    while keepGoing == 'y':
        name = input("Enter the player's name: ").strip()
        if(len(name) == 0):
            print("The player needs a name, please enter their name.")
        else:
            keepGoing = 'n'

    return name

#prompts the user to input the score for the person, and weeds out all non numeric data (reprompts)
def scoreInput():
    keepGoing = 'y'
    while(keepGoing == 'y'):
        try:
            score = int(input("Enter the player's score: ").strip())
            keepGoing = 'n'
        except ValueError:
            print("Score invalid, please try again.")

    return score

#prints to the file in the format:
#name
#score
#name
#score
#...
def outpt(name, score):
    outputFile.write(name + "\n" + str(score) + "\n")

#asks the user if they want to enter in another score
def continuePrompt():
    keepGoing = 'y'
    while keepGoing == 'y':
        option = input("Do you want to enter another player? y/n\n").strip()
        if(option == 'y' or option == 'n'):
            keepGoing = 'n'
        else:
            print("Invalid input, please try again")

    return option

#closes up shop
def closing():
    outputFile.close()

outputFile = init()
main()