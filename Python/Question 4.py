# funtion to find nth highest value
def findNthHighestValue(dict1,n):
    #created a list to add values of dictionary and order descending by value
    SortedDictValues=sorted(list(dict1.values()),reverse=True)
    # Get nth highest value
    valueToCheck=SortedDictValues[n-1]
    KeyTofind=""
    # loop through dictionary
    for i,j in dict1.items():
        if(j==valueToCheck):
           # find the value and end the loop
            KeyTofind=i
            break;
        else:
            continue;
    return(KeyTofind);


dict={"a": 1, "b": 2, "c": 100, "d": 30}
n = 2
# Called the funtion
print(findNthHighestValue(dict,n))
