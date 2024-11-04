from datetime import datetime, timedelta
import pytz

def is_daylight_saving(date, tz):
    # Checks if a given date is in daylight saving time.
    # Returns True if the date is in daylight saving time, False otherwise.
    timezone = pytz.timezone(tz)
    date = timezone.localize(datetime.strptime(date, '%Y-%m-%d'))
    return date.dst() != timedelta(0)

# Example 1
date = '2024-04-16'
tz = 'US/Eastern'

if is_daylight_saving(date, tz):
    print('Yes, date is in DayLight Saving')
else:
    print('No, date is not in DayLight Saving')

# Example 2
date = '2024-11-16'
tz = 'Europe/Amsterdam'

if is_daylight_saving(date, tz):
    print('Yes, date is in DayLight Saving')
else:
    print('No, date is not in DayLight Saving')