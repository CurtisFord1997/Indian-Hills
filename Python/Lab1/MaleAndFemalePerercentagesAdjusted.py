males = int(input('How many males are there in the class? '))
females = int(input('How many females are there in the class? '))

if males+females > 0:
    pmales = males/(males+females)
    pfemales = females/(males+females)

    print("\nGender\t Percentage")
    print("Males\t",format(pmales,'5.1%'))
    print("Female\t",format(pfemales,'5.1%'))
else:
    print("You need at least one person in a class.")
