#Solution 1
# funtion to find occurences
def CharacterOccurences(string,character):
    #variable to count occurences
    NumberOfOccurences=0
    for i in string:
        if(i==character):
            NumberOfOccurences+=1
        else:
            continue;
    return NumberOfOccurences;

string1="mississippi"
character="p"
# Called the funtion
print(CharacterOccurences(string1,character))


# Solution 2
# Declared string and character to find variables
string1="mississippi"
character="s"
# Built in function to count occurences of character
print(string1.count(character))
