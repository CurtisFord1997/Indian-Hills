#Test Average and Grade
#Curtis Ford
#3/23/2020

#calculates the average score
def calcAverage(score1, score2, score3, score4, score5):
    return ((score1+score2+score3+score4+score5)/5.0)

#determines the letter grade for the score passed to it
def determineGrade(score):
    if(score >= 90):
        grade = "A"
    elif(score >= 80):
        grade = "B"
    elif(score >= 70):
        grade = "C"
    elif(score >= 60):
        grade = "D"
    else:
        grade = "F"
    return grade

#list used to hold the scores
scores = [1,2,3,4,5]

#loops through the scores array and puts in the score that the user enters
for x in range(5):
    scores[x] = float(input("What is score "+str(x+1)+"? "))
    print("This student got a(n)",determineGrade(scores[x]))
    print()

#table heading for scores to grade table
print("  Score    Grade")

#loops through the array that held the scores and prints them out along with their corresponding letter grades
for x in range(5):
    print(format(scores[x], "7.2f")+"     ",determineGrade(scores[x]))

#calculates the average score using the calcAverage class
avg = calcAverage(scores[0],scores[1],scores[2],scores[3],scores[4])
print()
print("The average score was", format(avg, "4.2f"))
print("The average grade was a(n)", determineGrade(avg))
