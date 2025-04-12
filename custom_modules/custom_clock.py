from datetime import datetime

now = datetime.now()
s2 = now.strftime(" %H:%M:%S - %d/%m/%Y")
print(s2)