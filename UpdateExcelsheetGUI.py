import tkinter as tk
import xlwings as xw
from datetime import datetime

def update_excel():
    wb = xw.Book('Example.xlsx')
    sht1 = wb.sheets['Sheet']
    sht1.range('B2').value = datetime.now()

root = tk.Tk()
root.title("Excel Updater")

submit_button = tk.Button(root, text="Submit", command=update_excel)
submit_button.pack()

root.mainloop()