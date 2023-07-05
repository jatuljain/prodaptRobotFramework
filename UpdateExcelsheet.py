import xlwings as xw
from datetime import datetime

wb = xw.Book('Example.xlsx')
sht1 = wb.sheets['Sheet']
sht1.range('B2').value = datetime.now()