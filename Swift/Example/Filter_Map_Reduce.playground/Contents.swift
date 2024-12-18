import Cocoa

struct IndieApp {
  let name:String
  let monthlyPrice:Double
  let users:Int
}

let appPortfolio: [IndieApp] = [
  IndieApp(name: "Creator View", monthlyPrice: 11.99, users: 4356),
  IndieApp(name: "FitHero", monthlyPrice: 0.0, users: 1756),
  IndieApp(name: "Buckets", monthlyPrice: 3.99, users: 7598),
  IndieApp(name: "Connect Four", monthlyPrice: 1.99, users: 34081),
]

//Filter
//let freeApps = appPortfolio.filter{$0.monthlyPrice  == 0.0}
//print(freeApps)
var hightUsers: [IndieApp] = []
for app in appPortfolio {
  if app.users > 5000 {
    hightUsers.append(app)
  }
}
print(hightUsers)

// Map
let appNames = appPortfolio.map{$0.name}.sorted()
print(appNames)

//Reduce
let  numbers = [3,5,9,12, 18]
let sum = numbers.reduce(100, +)
print(sum)
let totalUsers = appPortfolio.reduce(0, {$0 + $1.users})
print(totalUsers)

//Channings

let recurringRevenue = appPortfolio.map{$0.monthlyPrice * Double($0.users)}
print(recurringRevenue)
