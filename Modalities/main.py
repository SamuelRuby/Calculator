from tkinter import *
import math
from pygame import mixer
import speech_recognition

def click(value):
    def click(value):
        ex = entryField.get()  # 789 ex[0:len(ex)-1]
        
        if value == 'C':
            ex = ex[0:len(ex) - 1]  # 78
            entryField.delete(0, END)
            entryField.insert(0, ex)
            return

        elif value == 'CE':
            entryField.delete(0, END)

        elif value == '√':
            answer = math.sqrt(eval(ex))

root = Tk()
root.title('Smart Calculator')
root.config(bg='IndianRed')
root.geometry('680x486+100+100')

logoImage = PhotoImage(file='Modalities\logo.png')
logoLabel = Label(root, image=logoImage, bg='IndianRed')
logoLabel.grid(row=0, column=0)

entryField = Entry(root, font=('arial', 20, 'bold'), bg='IndianRed', fg='white', bd=10, relief=SUNKEN, width=30)
entryField.grid(row=0, column=0, columnspan=8)

micImage = PhotoImage(file='Modalities\microphone.png')
micButton = Button(root, image=micImage, bd=0, bg='IndianRed', activebackground='IndianRed'
                   )
micButton.grid(row=0, column=7)

button_text_list = ["C", "CE", "√", "+", "π", "cosθ", "tanθ", "sinθ",
                    "1", "2", "3", "-", "2π", "cosh", "tanh", "sinh",
                    "4", "5", "6", "*", chr(8731), "x\u02b8", "x\u00B3", "x\u00B2",
                    "7", "8", "9", chr(247), "ln", "deg", "rad", "e",
                    "0", ".", "%", "=", "log₁₀", "(", ")", "x!"]
rowvalue = 1
columnvalue = 0
for i in button_text_list:

    button = Button(root, width=5, height=2, bd=2, relief=SUNKEN, text=i, bg='IndianRed', fg='white',
                    font=('arial', 18, 'bold'), activebackground='IndianRed', command=lambda button=i: click(button))
    button.grid(row=rowvalue, column=columnvalue, pady=1)
    columnvalue += 1
    if columnvalue > 7:
        rowvalue += 1
        columnvalue = 0

root.mainloop()