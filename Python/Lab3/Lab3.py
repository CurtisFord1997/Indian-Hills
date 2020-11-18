#damage
#Curtis, Luke, Gosa

import random
import time

playerHealth = 120


print("The hero and the monster are facing off in an epic life or death battle.\nWho will SURVIVE!!! Press enter to continue.")
ipt = input()
x = 0
winCounter=0

while x < 3:    #Loops to make the hero fight three monster peons
    monsterHealth = random.randint(40,110)  #gives the monster random health between 40 and 110
    while playerHealth > 0 and monsterHealth > 0:   #loops the monster fight until one of them dies
        damage = random.randint(0,25) #does a random amount of damage to the monster
        monsterHealth -= damage
        print("The player strikes  inflicting",damage,"the monster has",monsterHealth,"HP left.")
        
        time.sleep(.5) #waits half a second befor the monster attack
        if monsterHealth > 0:   #if the monster is still alve it does the monster attack, which runs the same way as the player attack
            damage = random.randint(0,25)
            playerHealth -= damage
            print("The monster strikes inflicting",damage,"the player has",playerHealth,"HP left.\n")
        time.sleep(1)

    if playerHealth > 0:
        print("The hero wins!")
        print("Press enter to continue.")
        inpt = input()
        x+= 1
        winCounter+=1

        if winCounter < 3: #heals the hero a random amount between the peons, does not heal after
            randomHeal = random.randint(0,100)
            playerHealth += randomHeal
            print("A new monster spawns and the gods take pity on the hero.\nA random heal is granted, the hero's health has been increased by",randomHeal,"to", playerHealth)
            print("Press enter to continue.")
        
        inpt = input()
    else:
        print("The hero has been slain by a peon!")
        x = 3
    

if winCounter == 3: #if the player won against all three peons they get to fight the boss
    print("\n\nAfter defeating the three rounds of monsters the hero lifts his eyes to see that there is a boss...\nWill he survive this final encounter?")
    randomHeal = random.randint(100,200) #gives a random heal to the player
    playerHealth += randomHeal
    print("A random heal is granted, the hero's health has been increased by",randomHeal,"to", playerHealth)
    monsterHealth = 250
    print("Press enter to continue.")

    #loops and until the random damage gets the player or the boss health to zero
    while playerHealth > 0 and monsterHealth > 0:
        damage = random.randint(0,25)
        monsterHealth -= damage
        print("The player strikes  inflicting",damage,"the boss has",monsterHealth,"HP left.")
        time.sleep(1) #waits one second to display the monster attack
        if monsterHealth > 0:
            damage = random.randint(5,30)
            playerHealth -= damage
            print("The boss strikes inflicting",damage,"the player has",playerHealth,"HP left.\n")
        time.sleep(2)

    if playerHealth > 0:
        print("The hero wins!\nNow you can go back to your boring life.")
        x+= 1
        winCounter+=1
    else:
        print("The hero has been slain by the boss!")
        x = 3

#add crits
#more heroes / monsters

#after win, random heal
#after win, random drop for uprades
#after win, Boss Battle