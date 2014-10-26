#!/usr/bin/env xcrun swift

func swapTwoInts(inout a: Int, inout b: Int) {
  let temporaryA = a
  a = b
  b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
println("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func swapTwoStrings(inout a: String, inout b: String) {
  let temporaryA = a
  a = b
  b = temporaryA
}

func swapTwoDoubles(inout a: Double, inout b: Double) {
  let temporaryA = a
  a = b
  b = temporaryA
}

// Generic Functions

func swapTwoValues<T>(inout a: T, inout b: T) {
  let temporaryA = a
  a = b
  b = temporaryA
}

someInt = 3
anotherInt = 107
swapTwoValues(&someInt, &anotherInt)
println("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
println("someString is now \(someString), and anotherString is now \(anotherString)")

// Generic Types

struct Stack<T> {
  var items = [T]()
  mutating func push(item: T) {
    items.append(item)
  }
  mutating func pop() -> T {
    return items.removeLast()
  }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")

var fromTheTop = stackOfStrings.pop()
println("fromTheTop \(fromTheTop)")

// Extending a Generic Type

extension Stack {
  var topItem: T? {
    return items.isEmpty ? nil : items[items.count - 1]
  }
}

if let topItem = stackOfStrings.topItem {
  println("The top item on the stack is \(topItem).")
}

// Type Constraints in Action

func findStringIndex(array: [String], valueToFind: String) -> Int? {
  for (index, value) in enumerate(array) {
    if value == valueToFind {
      return index
    }
  }
  return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findStringIndex(strings, "llama") {
  println("The index of llama is \(foundIndex)")
}

func findIndex<T: Equatable>(array: [T], valueToFind: T) -> Int? {
  for (index, value) in enumerate(array) {
    if value == valueToFind {
      return index
    }
  }
  return nil
}

let dobuleIndex = findIndex([3.14159, 0.1, 0.25], 9.3)
let stringIndex = findIndex(["Mike", "Malcolm", "Andrea"], "Andrea")

// Associated Types

protocol Container {
  typealias ItemType
  mutating func append(item: ItemType)
  var count: Int { get }
  subscript(i: Int) -> ItemType { get }
}

struct Stack1<T>: Container {
  var items = [T]()
  mutating func push(item: T) {
    items.append(item)
  }
  mutating func pop() -> T {
    return items.removeLast()
  }

  mutating func append(item: T) {
    self.push(item)
  }
  var count: Int {
    return items.count
  }
  subscript(i: Int) -> T {
    return items[i]
  }
}

extension Array: Container {}

// Where Clauses

func allItemsMatch<C1: Container, C2: Container
                   where C1.ItemType == C2.ItemType, C1.ItemType: Equatable>
  (someContainer: C1, anotherContainer: C2) -> Bool {
  if someContainer.count != anotherContainer.count {
    return false
  }

  for i in 0..<someContainer.count {
    if someContainer[i] != anotherContainer[i] {
      return false
    }
  }
  return true
}

var stackOfStrings1 = Stack1<String>()
stackOfStrings1.push("uno")
stackOfStrings1.push("dos")
stackOfStrings1.push("tres")

var arrayOfStrings = ["uno", "dos", "tres"]

if allItemsMatch(stackOfStrings1, arrayOfStrings) {
  println("All items match.")
} else {
  println("Not all items match.")
}
