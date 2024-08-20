# Deined input array
RawNmubers=[1,1,"None","None",2,"None","None"]
#Defined Output array
NumbersList=[]
#Defined Number variable to store last not none value
lastnumber=1
# Loop to go through all the values of raw list
for i in RawNmubers:
    # Condition to check non None value
    if(i!="None"):
        # Append the for item into new list
        NumbersList.append(i)
        #Set the current value to this variable
        lastnumber=i
    else:
        # Append lastnumber value to list
        NumbersList.append(lastnumber)
# print new list
print(NumbersList)
