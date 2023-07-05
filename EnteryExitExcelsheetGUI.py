import tkinter as tk
import xlwings as xw
from datetime import datetime

def update_excel():
    wb = xw.Book('Example.xlsx')
    sht1 = wb.sheets['Sheet']
    sht1.range('B2').value = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

root = tk.Tk()
root.title("Excel Updater")

entry_button = tk.Button(root, text="Entry", command=update_excel)
entry_button.pack()

exit_button = tk.Button(root, text="Exit", command=root.destroy)
exit_button.pack()

root.mainloop()