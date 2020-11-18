#Curtis ford
#lab 7
#4/19/2020 (the pandemic)

#This program grades the written portion of a driver's licesce exam based on a hardcoded list. it will display if they passed or failed, 
#how many they got right, how many they got right, and how many they got wrong, along with how many they got wrong.

import sys
def main():
    stuAns  = init()
    incorrAns = compare(stuAns)
    display(incorrAns)
    closing()

#sets up the answers list, and returns it
def init():
    stuAns = reading()
    return stuAns

#creates a list of the first twenty answers in the dat file. if no lines, assumes it was left blank, will be counted wrong later
def reading():
    stuAns = []
    while (len(stuAns) < 21):
        try:
            stuAns.append(inputValue())
        except:
            stuAns.append('')
    return stuAns

#gets an answer from the dat file
def inputValue():
    iData = inputFile.readline().rstrip('\n').lower()
    return iData

#compares the answers the student gave to the answers and returns a list of the question numbers that were incorrect.
def compare(stuAns):
    corrAns = ['a','c','a','a','d','b','c','a','c','b','a','d','c','a','d','c','b','b','d','a']
    incorrect =[]
    for ans in range(0,20):
        if corrAns[ans] != stuAns[ans].lower():
            incorrect.append(ans+1)
    return incorrect

#prints out the results of the test
def display(incorrect):
    print("The student", passFail(incorrect), "the test." )
    print("They got", numRight(incorrect), "questions correct.")
    print("They got the following", str(len(incorrect)), "questions incorrect:")
    print(listWrong(incorrect))

#determines if the person passed the test or not
def passFail(incorrect):
    if(len(incorrect) < 6):
        return "passed"
    else:
        return "did not pass"
    
#Determines the number of questions the person got right and returns a string
def numRight(incorrect):
    return(str(20-len(incorrect)))

#creates a list that includes all the incorrect questions
def listWrong(incorrect):
    theList = ''
    for x in incorrect:
        theList += str(x) + '\n'
    return theList


#initilizes the file source
def fileInit():
    try:
        return open('answers.dat', 'r')
    except IOError:  
        print('File not found, program exiting')
        sys.exit(0)

#closes the file
def closing():
    inputFile.close()

inputFile = fileInit()
main()
