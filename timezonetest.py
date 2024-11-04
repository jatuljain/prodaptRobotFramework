import time

def is_dst():
    return  time.daylight


value = is_dst()
print("DST is :", value)