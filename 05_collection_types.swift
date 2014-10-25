#!/usr/bin/env xcrun swift

// Arrays

var shoppingList: [String] = ["Eggs", "Milk"]

println("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
  println("The shopping list is empty.")
} else {
  println("The shopping list is not empty.")
}

shoppingList.append("Flour")
println("shoppingList \(shoppingList)")

shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spreed", "Cheese", "Butter"]
println("shoppingList \(shoppingList)")

var firstItem = shoppingList[0]

shoppingList[0] = "Six eggs"
println("shoppingList \(shoppingList)")

shoppingList[4...6] = ["Bannas", "Apples"]
println("shoppingList \(shoppingList)")

shoppingList.insert("Maple Syrup", atIndex: 0)
println("shoppingList \(shoppingList)")

let mapleSyrup = shoppingList.removeAtIndex(0)
firstItem = shoppingList[0]
let apples = shoppingList.removeLast()

for item in shoppingList {
  println(item)
}

for (index, value) in enumerate(shoppingList) {
  println("Item \(index + 1): \(value)")
}

var someInts = [Int]()
println("someInts is of type [Int] with \(someInts.count) items.")

someInts.append(3)
someInts = []

var threeDoubles = [Double](count: 3, repeatedValue: 0.0)
var anotherThreeDoubles = [Double](count: 3, repeatedValue: 2.5)
var sixDoubles = threeDoubles + anotherThreeDoubles

println("\(threeDoubles) \(anotherThreeDoubles) \(sixDoubles)")

// Dictionaries

var airports: [String: String] = [
  "YYZ": "Toronto Pearson",
  "DUB": "Dublin"
]

println("The airports dictionary contains \(airports.count) items.")

if airports.isEmpty {
  println("The airports dictionary is empty.")
} else {
  println("The airports dictionary is not empty.")
}

airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("Dublin Airpots", forKey: "DUB") {
  println("The old value for DUB was \(oldValue).")
}

if let airportName = airports["DUB"] {
  println("The name of the airport is \(airportName).")
} else {
  println("The airport is not in the airports dictionary.")
}

airports["APL"] = "Apple International"
airports["APL"] = nil

if let removedValue = airports.removeValueForKey("DUB") {
  println("The removed airport's name is \(removedValue).")
} else {
  println("The airports dictionary does not contain a value for DUB.")
}

for (airportCode, airportName) in airports {
  println("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
  println("Airport code: \(airportCode)")
}

for airportName in airports.values {
  println("Airport name: \(airportName)")
}

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
println("namesOfIntegers \(namesOfIntegers)")
namesOfIntegers = [:]
println("namesOfIntegers \(namesOfIntegers)")
