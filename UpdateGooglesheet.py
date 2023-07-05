import gspread
from oauth2client.service_account import ServiceAccountCredentials
import datetime

scope = ['https://spreadsheets.google.com/feeds', 'https://www.googleapis.com/auth/drive']
creds = ServiceAccountCredentials.from_json_keyfile_name('client_secret.json', scope)
client = gspread.authorize(creds)

sheet = client.open('SheetName').sheet1

def update_sheet():
    now = datetime.datetime.now()
    sheet.update_cell(1, 1, now.strftime("%Y-%m-%d %H:%M:%S"))

update_sheet()