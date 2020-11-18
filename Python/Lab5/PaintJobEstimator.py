#Paint Job estimator
#Curtis Ford
#3/23/2020

import math 

def main():
    print("This program prompts for the area needed to paint and the price per galon of the paint and returns all the costs.")
    #menu asks if the user wants to use the program.
    more = menu()
    while(more):
        #uses the inpt function to get data from the user
        sqFt, perGalon = inpt()
        #uses the cals method to get how many galons will need to be purchased, hours needed to paint, total cost for paint, cost for labour, and the total cost.
        gal, hrs, paintCost, labour, total = calcs(sqFt, perGalon)
        #sends the prtOut method the data from the calcs method
        prtOut(gal, hrs, paintCost, labour, total)
        #the previous three lines of code could be condensed as followes:
        #prtOut(calcs(inpt()))
        #menu asks if the user wants to use the program.
        more = menu()

def menu():
    inpt = input("Would you like to enter in a paint job? Press Y to enter another one and any other key to exit.  ")
    if(inpt == 'y' or inpt == "Y"):
        return True
    else:
        return False

    #asks for the area and price per galon from the user
def inpt():
    area = float(input("\nHow much space needs to be painted? (sqft)  "))
    price = float(input("What is the price per galon of paint?  "))
    return area, price\

#calculates how many galons will need to be purchased, hours needed to paint, total cost for paint, cost for labour, and the total cost.
def calcs(area, price):
    #I made two galons variables, one is unrounded for calculating how many hours it will take, and the other one rounds up the galons because I am assuming that you can only buy pain in units of a galon.
    galons = area / 112.0
    galonsForPrice = math.ceil(area / 112.0)
    costPaint = galonsForPrice * price
    #it takes 8 hours to paint a single galon's worth of paint
    hours = galons * 8 
    #labour is $15 per hour
    costLabour = hours * 35.00
    totCost = costPaint + costLabour 
    return galonsForPrice, hours, costPaint, costLabour, totCost

def prtOut(galons, hours, costPaint, costLabour, totCost):
    print("Galons needed:", format (galons, "1.0f"))
    print("Hours needed: ", format(hours, "2.1f"))
    print("Paint cost:    $"+ format(costPaint, "3.2f"))
    print("Labour cost:   $"+ format(costLabour, "3.2f"))
    print("Total cost:    $"+ format(totCost, "3.2f"))
    print()

main()