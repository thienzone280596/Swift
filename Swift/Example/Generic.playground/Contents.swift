
import Cocoa
import Foundation


func determineHigherValue<T:Comparable>(valueOne:T, valueTwo:T) {
  let higherValue = valueOne > valueTwo ? valueOne : valueTwo
  print("\(higherValue) is higher value")
}

determineHigherValue(valueOne: 3, valueTwo: 8)
determineHigherValue(valueOne: "abc", valueTwo: "abcd")
