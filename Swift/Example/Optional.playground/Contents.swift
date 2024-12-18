import Cocoa

struct User {
  var name: String
  var age: Int
}

let user:User = User(name: "John", age: nil)

//IF Let
if let age = user.age {
  print("User's age is \(age)")
} else {
  print("User has no age")
}

//Guard Let
func checkAge(_ age: Int?) {
  guard let age else {
    print("User has no age")
    return
  }
  
  if age >= 40 {
    print("You are old")
  }
}

checkAge(user.age)

//Nil Coalesing
let age1 = user.age ?? 29


//FORCE Unwrap
//let age2 = user.age!
//print(age2)

//Optional Chaning

var optionalUser:User?
let name = optionalUser?.name ?? "Not Given"
