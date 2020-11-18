import tkinter
import tkinter.messagebox

import pickle

class Game:
    
    def __init__(self):
        #Create the main window widget
        self.main_window = tkinter.Tk()

        
        self.welcome_frame = tkinter.Frame(self.main_window)
        self.textFeild_frame = tkinter.Frame(self.main_window)
        self.button_frame = tkinter.Frame(self.main_window)

        
        self.welcome_label = tkinter.Label(self.welcome_frame, text = 'Welcome:')
        
        self.welcome_label.pack(side = 'left')
       
        
      
        self.new_entry = tkinter.Entry(self.textFeild_frame, width=10)
        self.new_entry.pack(side = 'left')
      
       
        
       #Create the Checkbutton widgets in the frame
        self.Save_button = tkinter.Button(self.button_frame, text ='Save Key', command = self.readInStuff)
        self.New_button = tkinter.Button(self.button_frame, text = 'New Game', command = self.newGame)
        self.Save_button.pack(side = 'left')
        self.New_button.pack(side = 'left')
       

       
        self.welcome_frame.pack()
        self.textFeild_frame.pack()
        
        self.button_frame.pack() 
       
       
        tkinter.mainloop()

    
    def newGame(self):
        get1 = self.new_entry.get()
        if get1 =="":
            
            tkinter.messagebox.showinfo('Message!!!', 'please enter your word')
        else:
            contun = True
            for line in open("users.txt","r").readlines(): 
                login_info = line.split() 
                if get1 == login_info[0]:
                    contun = False
            if contun:
                with open('users.txt',"a") as f:
                    f.write(get1 + "\n")   
                f.close()
                theGame.set_saveKey(theGame, get1)
                self.main_window.destroy()
            else:
                tkinter.messagebox.showinfo('Message!',"Savekey alerady taken")

                
                
        
    def readInStuff(self):
        get1 = self.new_entry.get()
        for line in open("users.txt","r").readlines(): 
            login_info = line.split() 
            if get1 == login_info[0]:
                tkinter.messagebox.showinfo('Message!!!', 'Congragulation you match the Game!!!!')
                #read-in the file that partains to the savekey
                try:
                    pickle_in = open(get1+".pickle", 'rb')
                    loadedGame = pickle.load(pickle_in)
                    pickle_in.close()
                    print(loadedGame)
                except:
                    print("stuff went arry")
                #create object from that
                self.main_window.destroy()
                
        tkinter.messagebox.showinfo('Message!!!', 'please try a gain')

class LevelPane(object):
    """Creates a Level Pan that the user can interact with"""
    invlist = []
    def __init__(self):
    #def __init__(self,game, level):
        self.main_window = tkinter.Tk(className = "Level "+str(theGame.level))
        #self.main_window = tkinter.Tk(className = "Level "+str(game.getLevel()))

        #creates two areas, one fo rthe level items and one for the inventory
        self.item_area = tkinter.Frame(master = self.main_window, pady =20, padx = 40)
        self.inventory_area = tkinter.Frame(master = self.main_window, pady = 20, padx = 40)
         
        
        #calls the function to return a list of textvariables to be used as the labels on the buttons
        self.optlist = self.option_btn_naming()

        #a header fo the Level Items
        self.items_label = tkinter.Label(master = self.item_area, text = 'Level Items: Choose 1')

        #Creates all the button items for the level items
        self.firstButton = tkinter.Button(master = self.item_area, width=20, pady=20, textvariable = self.optlist[0], command=lambda: self.itemChoice(self.optlist[0]))
        self.secondButton = tkinter.Button(master = self.item_area, width=20, pady=20, textvariable = self.optlist[1], command=lambda: self.itemChoice(self.optlist[1]))
        self.thirdButton = tkinter.Button(master = self.item_area, width=20, pady=20, textvariable = self.optlist[2], command=lambda: self.itemChoice(self.optlist[2]))
        self.fourthButton = tkinter.Button(master = self.item_area, width=20, pady=20, textvariable = self.optlist[3], command=lambda: self.itemChoice(self.optlist[3]))
        self.fifthButton = tkinter.Button(master = self.item_area, width=20, pady=20, textvariable = self.optlist[4], command=lambda: self.itemChoice(self.optlist[4]))
        self.sixthButton = tkinter.Button(master = self.item_area, width=20, pady=20, textvariable = self.optlist[5], command=lambda: self.itemChoice(self.optlist[5]))

        #places the items label in the grid in the item_area
        self.items_label.grid(row = 0, column= 0, columnspan=6, pady =10)

        #Places all the buttons in the grid in the item_area
        self.firstButton.grid(row = 1, column = 0)
        self.secondButton.grid(row = 1, column = 1)
        self.thirdButton.grid(row = 1, column = 2)
        self.fourthButton.grid(row = 1, column = 3)
        self.fifthButton.grid(row = 1, column = 4)
        self.sixthButton.grid(row = 1, column = 5)

        
        
        #Uses a funtion to create all the textvariables used in the inventory buttons
        self.Inv_btn_naming()

        #a header for the inventory slots
        self.inventory_label = tkinter.Label(master = self.inventory_area, text = 'Inventory')

        #Uses a funtion to create all the textvariables used in the inventory buttons
        self.invlist = self.Inv_btn_naming()


        #creates all the button items for the inventory lists
        self.Inv1_Btn = tkinter.Button(self.inventory_area, width=20, pady=20, textvariable = self.invlist[0])
        self.Inv2_Btn = tkinter.Button(self.inventory_area, width=20, pady=20, textvariable = self.invlist[1])
        self.Inv3_Btn = tkinter.Button(self.inventory_area, width=20, pady=20, textvariable = self.invlist[2])
        self.Inv4_Btn = tkinter.Button(self.inventory_area, width=20, pady=20, textvariable = self.invlist[3]) 
        self.Inv5_Btn = tkinter.Button(self.inventory_area, width=20, pady=20, textvariable = self.invlist[4])
        self.Inv6_Btn = tkinter.Button(self.inventory_area, width=20, pady=20, textvariable = self.invlist[5])

        #place all the items in the inventory area

        self.inventory_label.grid(row = 0, column= 0, columnspan=6, pady =10)

        self.Inv1_Btn.grid(row = 1, column = 0)
        self.Inv2_Btn.grid(row = 1, column = 1)
        self.Inv3_Btn.grid(row = 1, column = 2)
        self.Inv4_Btn.grid(row = 1, column = 3)
        self.Inv5_Btn.grid(row = 1, column = 4)
        self.Inv6_Btn.grid(row = 1, column = 5)

        #packs the item area and the inventory area
        self.item_area.pack()
        self.inventory_area.pack()

        self.main_window.mainloop()

    def option_btn_naming(self):
        optlistt = []
        theLevel = Level(theGame.level)        
        for val in theLevel.select:            
            self.var = tkinter.StringVar()
            self.var.set(val)
            optlistt.append(self.var)
        return optlistt

    def Inv_btn_naming(self):
        invlist = []     
        for value in theGame.get_inventory(theGame):
            var = tkinter.StringVar()
            var.set(value)
            invlist.append(var)

        while (len(invlist) < 6):
            var = tkinter.StringVar()
            var.set('')
            invlist.append(var)
        return invlist

    def itemChoice(self,choice):
        ans = tkinter.messagebox.askquestion('Selection','Are you sure you want to select the '+choice.get())
        if ans == 'yes':
            if(len(theGame.get_inventory(theGame)) < 1):
                theGame.set_inventory(theGame, {choice.get()})
            else:
                self.tempList = theGame.get_inventory(theGame)
                self.tempList.add(choice.get())
                theGame.set_inventory(theGame,self.tempList)
            
            self.temppList = self.Inv_btn_naming()

            for x in range(6):
                 self.invlist[x].set(self.temppList[x].get())

            if theGame.level < 6:
                theGame.level += 1
                try:
                    pickle_out = open(theGame.saveKey + ".pickle", 'wb')
                    pickle.dump(theGame, pickle_out)
                    pickle_out.close()
                except:
                    print("fi")


                self.tempppList = self.option_btn_naming()
            
                for x in range(6):
                    self.optlist[x].set(self.tempppList[x].get())

            else:
                self.main_window.destroy()

class FinalScreen(object):
    def __init__(self):
        self.main_window = tkinter.Tk(className = theGame.saveKey)
        
        self.box = tkinter.Text(self.main_window, height = 11)

        self.box.pack()

        self.effects =''

        for x in theGame.inventory:
            self.effects += x + ': '  + Level.invDict[x] + '\n'

        self.box.insert(tkinter.END,"The effects of your choices are:\n\n"+self.effects+"\n\nGame over, please exit")



        self.main_window.mainloop()

class GameObj():
    saveKey = ''
    level = 1
    inventory = set([])

    def __init__(self):
        self.saveKey = ''
        self.level = 1
        self.inventory = set([])

    #saveKey
    def get_saveKey(self):
        return self.saveKey

    def set_saveKey(self, key):
        self.saveKey = key

    #Level
    def get_level(self):
        return self.level

    def set_level(self, lvl):
        self.level = lvl

    #Inventory
    def get_inventory(self):
        return self.inventory

    def set_inventory(self, inv):
        self.inventory = inv


class Level():
    select = {}

    def __init__(self, lvl):
        if lvl == 1:
            self.select = {"Red Potion", 
                       "Blue Potion", 
                       "Green Potion", 
                       "Yellow Potion", 
                       "Pink Potion", 
                       "Black Potion"}
        elif lvl == 2:
            self.select = {"Tunic", 
                       "Wig", 
                       "Makeup", 
                       "Stilts",
                       "Inflatable Muscles", 
                       "Eye Patch"}
        elif lvl == 3:
            self.select = set(["Enchanted Scroll", 
                       "Shield", 
                       "Sword", 
                       "Rope", 
                       "Funny Drink", 
                       "Shovel"])
        elif lvl == 4:
            self.select = set(['Rock',
                              'Paper',
                              'Scissors',
                              'Lizard',
                              'Spock',
                              'Item'])

        elif lvl == 5: 
            self.select = set(['Watermelon',
                              'Red Apple',
                              'Green Apple',
                              'Golden Apple',
                              'Carrot',
                              'Olive'])
        elif lvl == 6:
            self.select = set(['Helmet',
                              'Greeves',
                              'Boots',
                              'Socks',
                              'Breastplate',
                              'Battle axe'])

    #Get/Set Selection
    def get_inv(self, lvl):
        return select([])

    def set_inv(self, selection):
        self.select = selection

    #Selection Dictionary
    invDict = {"Red Potion" : "Grow", 
               "Blue Potion": "Shrink", 
               "Green Potion":"Fire Breathing", 
               "Yellow Potion":"Swamp breath", 
               "Pink Potion":"Girl power", 
                "Black Potion":"invincibilty", 
               "Wig": "Disguise", 
               "Enchanted Scroll": "Multi-Lingual", 
               "Funny Drink": "Hallucinations",
               "Tunic": "Invisibility", 
                "Wig":"Increaseed Attractiveness", 
                "Makeup":"Shapeshifting", 
                "Stilts":"Clumsyness",
                "Inflatable Muscles":"Overconfidence", 
                "Eye Patch":"Cool Factor",
                "Enchanted Scroll":"Purple hair", 
                "Shield":"Lock Jaw", 
                "Sword":"Missing Fingers", 
                "Rope":"Animal Translating", 
                "Funny Drink":"Gnomes everywhere!", 
                "Shovel":"No friends",
                'Rock':"A headache",
                'Paper':"A Papercut",
                'Scissors':"Long nose hair",
                'Lizard':"Limb regeneration",
                'Spock':"IQ over 9000",
                'Item':"Big feet",
                'Watermelon':'heaven',
                'Red Apple':'nutrition',
                'Green Apple':'poison',
                'Golden Apple':"Black and white vision",
                'Carrot':"Carrot fingers",
                'Olive':"oil",
                'Helmet':'impared vision',
                'Greeves':'magnet powers',
                'Boots':"feather falling",
                'Socks':'ninjaness',
                'Breastplate':'a broken heart',
                'Battle axe':'missing limbs'}



def main():
    
    game = Game()
    thePane = LevelPane()
    finallScreen = FinalScreen()

theGame = GameObj
main()
