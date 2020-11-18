# This program reads in a file of players and scores, prints first and second place, and average

# Curtis Ford
# 3/29/20
import sys

def main():
    name, score = init()
    while(name[3] != ''):
        name, score = placing(name,score)
        name[3], score[3] = reading()
    output(name,score)
    closing()

def init():
    #we have to use the global keyword to modify global variables
    firstName, firstScore = reading()
    secondScore = firstScore + 1
    totScore = firstScore
    #firstPlace,secondPlace,currentName
    name = ['', firstName,'',firstName]
    #firstPlace,SecondPlace,CurrentScore,totalScore,numScores
    score = [0,firstScore,secondScore,firstScore,totScore,0]
    return name, score

def reading():
    iname = inputValue()
    if (iname == ''):
        iscore = 0
    else:
        iscore = int(inputValue())
    
    return iname,iscore

def inputValue():
    iData = inputFile.readline().rstrip('\n')
    return iData

def placing(name,score):
    if(score[5] == 0):
        if(score[3] != 0):
            #adds 1 to playercounter
            score[5] += 1

    else:
        #adds to total scores
        score[4] += score[3]
        #adds 1 to playercounter
        score[5] += 1
        #if the most recent score is better than the previous best, it moves the previous best scores to the second best scores spot
        if(score[3] < score[1]):
            #moving previous best score and name to the second best slot
            score[2] = score[1]
            name[2] = name[1]
            #moving in the new best score
            score[1] = score[3]
            name[1] = name[3]
        #if the new score is equal to the best score it adds the new person's name on to the current best
        elif(score[3] == score[1]):
            name[1] = name[1] + ' and ' + name[3]
        #if the most recent score (3) is better than the second best it is moved into the second best scores spot
        elif(score[3] < score[2]):
            name[2] = name[3]
            score[2] = score[3]
        #if the new score is equal to the second best score it adds the new person's name on to the current second best
        elif(score[3] == score[2]):
            name[2] = name[2] + ' and ' + name[3]

    return name,score

def output(name,score):
    if(name[1] != ''):
        print(name[1] + " came in first at " + str(score[1]))
        print(name[2] + " came in second at " + str(score[2]))
        print("The average score was: " + format((score[4]/score[5]),'0.1f'))
    else:
        print("The file was empty, no data to display.")

def fileInit():
    try:
        return open('golf.dat', 'r')
    except IOError:
        print('File not found, program exiting')
        sys.exit(0)

def closing():
    inputFile.close()

inputFile = fileInit()
main()
    