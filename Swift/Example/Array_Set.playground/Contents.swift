import Cocoa

var swiftUIDevs:Set = ["Sean", "James"]
var swiftDevs:Set = ["Sean", "James", "Olivia", "Maya", "Leo"]
var kotlinDevs:Set = ["Elijah", "Olivia", "Maya", "Leo", "Dan"]
var experimentalDevs:Set = ["Sean", "Ava", "Maya", "Leo", "Olivia"]

//Intersect (lấy phần giao nhau giữa 2 mảng Set
let experiencingSwiftDevs = swiftUIDevs.intersection(experimentalDevs)

//subtract Lấy phần bên trái
let jrSwiftDevs = swiftDevs.subtracting(experimentalDevs)
//Disjont check if [A] is disjoint with [B] or not
let specialList = swiftUIDevs.isDisjoint(with: kotlinDevs)


//symetric different lấy cả 2 bỏ phần giao
swiftDevs.symmetricDifference(kotlinDevs)


//Sub set (kiểm tra [a] có phải là con của [b] không
swiftUIDevs.isSubset(of: swiftDevs)

//Kieemr tra [b] co phai con [a] khong
swiftDevs.isSuperset(of: swiftUIDevs)
