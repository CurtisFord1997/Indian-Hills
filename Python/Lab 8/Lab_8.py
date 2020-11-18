#This program lets the user select any or all of the services listed
#it also returns the total 

import tkinter
import tkinter.messagebox

class Lab_8:
    def __init__(self):
        #create main window
        self.main_window = tkinter.Tk()

        #sets two zones(frames) top for list, bottorm for return and stuff
        self.top_frame = tkinter.Frame(self.main_window)
        self.bottom_frame = tkinter.Frame(self.main_window)

        #Create IntVar objects to use with the Checkbuttons
        self.cb_Oil = tkinter.IntVar()
        self.cb_Lube = tkinter.IntVar()
        self.cb_Radiator = tkinter.IntVar()
        self.cb_Transm = tkinter.IntVar()
        self.cb_Inspect = tkinter.IntVar()
        self.cb_Muffler = tkinter.IntVar()
        self.cb_Tire = tkinter.IntVar()

        #Set the intVar objects to 0
        self.cb_Oil.set(0)
        self.cb_Lube.set(0)
        self.cb_Radiator.set(0)
        self.cb_Transm.set(0)
        self.cb_Inspect.set(0)
        self.cb_Muffler.set(0)
        self.cb_Tire.set(0)

        #Create the Checkbutton widgets in the top_frame
        self.cb_Oil_box = tkinter.Checkbutton(self.top_frame, text = 'Oil change', variable=self.cb_Oil)
        self.cb_Lube_box = tkinter.Checkbutton(self.top_frame, text = 'Lube job', variable=self.cb_Lube)
        self.cb_Radiator_box = tkinter.Checkbutton(self.top_frame, text = 'Radiator flush', variable=self.cb_Radiator)
        self.cb_Transm_box = tkinter.Checkbutton(self.top_frame, text = 'Transmission flush', variable=self.cb_Transm)      
        self.cb_Inspect_box = tkinter.Checkbutton(self.top_frame, text = 'Inspection', variable=self.cb_Inspect)
        self.cb_Muffler_box = tkinter.Checkbutton(self.top_frame, text = 'Muffler replacement', variable=self.cb_Muffler)        
        self.cb_Tire_box = tkinter.Checkbutton(self.top_frame, text = 'Tire rotation', variable=self.cb_Tire)
        
        #list of the checkboxes
        self.cb_Oil_box.pack()
        self.cb_Lube_box.pack()
        self.cb_Radiator_box.pack()
        self.cb_Transm_box.pack()
        self.cb_Inspect_box.pack()
        self.cb_Muffler_box.pack() 
        self.cb_Tire_box.pack()

        #Create an OK button and a Quit button. 
        self.ok_button = tkinter.Button(self.bottom_frame, text = 'Total Charges', command = self.compute_choice) 
        self.quit_button = tkinter.Button(self.bottom_frame, text = 'Exit', command = self.main_window.destroy) 
        
        #Pack the Buttons
        self.ok_button.pack(side='left')
        self.quit_button.pack(side='left') 

        #Pack the frames
        self.top_frame.pack()
        self.bottom_frame.pack()

        #Start the main loop
        tkinter.mainloop()

    def compute_choice(self):
        totCost = 0

        if self.cb_Oil.get() == 1:
            totCost += 30
        if self.cb_Lube.get() == 1:
            totCost += 20
        if self.cb_Radiator.get() == 1:
            totCost += 40
        if self.cb_Transm.get() == 1:
            totCost += 100
        if self.cb_Inspect.get() == 1:
            totCost += 35
        if self.cb_Muffler.get() == 1:
            totCost += 200
        if self.cb_Tire.get() == 1:
            totCost += 20

        self.message = 'The service costs: $'+str(totCost)

        tkinter.messagebox.showinfo('Cost', self.message)

lab_8 = Lab_8()