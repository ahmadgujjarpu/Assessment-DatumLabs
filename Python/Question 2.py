def MisMatchedValues (fstring1,fstring2)
    # Splitted the strings
    String1Array=string1.split( )
    String2Array=string2.split( )
    #got lenth of first array
    n=len(String1Array)
    #Declared an array to get Mismatched case values List
    MismatchedList=[]
    # Added loop to go through both the List indexes
    for i in range(0,n)
        # Stored indexed value of array into string variables
        string1ArrayValue=String1Array[i]
        string2ArrayValue=String2Array[i]
        # Stored the length of string1ArrayValue
        s1Valuelength=len(string1ArrayValue)
        # Apply Condition to check if both the values matches till the first value length
        if(string1ArrayValue[0s1Valuelength]==string2ArrayValue[0s1Valuelength])
            continue;
        else
            # if not matched append to to MismatchedList array
            MismatchedList.append(string1ArrayValue)
            MismatchedList.append(string2ArrayValue)
    return MismatchedList;

#Stored strings in variables
string1=Datumlabs is an awesome place
string2=Datumlabs.io Is an AWESOME place
print(MisMatchedValues(string1,string2))
