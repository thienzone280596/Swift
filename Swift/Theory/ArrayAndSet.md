## Swift – Difference Between Sets and Arrays
#### I. Array
An array is a linear data structure which has contiguous memory in a single variable that can store N number of elements. 

For example, if we want to take 10 inputs from the user we can’t initialise 10 variables. In this case you can make use of arrays. It can store N number of elements into a single variable. Elements can be accessed by using indexing. 
##### Syntax
> var arr:[Int] = [value 1 , value 2 , value 3, . . . . value n] 

**Example 1: Creating and initializing an Array with Integer Values**
```Swift
// Swift program to illustrate array
 
// Creating and initializing an Array with Integer Values
var arr:[Int] = [ 1, 2, 3, 4, 5 ]
 
// Display the array 
print(arr)
```
#### II. Set
Set is a data structure where no duplicate elements are present. Generally, in arrays, we can store duplicate elements, but we can’t store duplicate elements in sets. By default, it eliminates duplicate elements. Like in mathematics we can perform set operations like union, intersection, set difference …etc.
**Syntax:**
>var set_variable : Set=[value 1, value 2 , . . . . value n]
```Swift
// Swift program to illustrate set
 
// Creating and initializing set of Integer Values
var set1 : Set = [ 1, 2, 2, 2, 3, 4 ]
 
// Creating and initializing set of Integer Values
var set2 : Set = [ "GeeksforGeeks", "GFG", "Swift Programs", "Swift Programs", "GFG" ]
 
// Display the result
print(set1)
print(set2)
```