#!/usr/bin/env xcrun swift

// Defining and Calling Functions

func sayHello(personName: String) -> String {
  let greeting = "Hello, " + personName + "!"
  return greeting
}

println(sayHello("Anna"))
println(sayHello("Brian"))

func sayHelloAgain(personName: String) -> String {
  return "Hello again, " + personName + "!"
}
println(sayHelloAgain("Anna"))

// Function Parameters and Return Values

func halfOpenRangeLength(start: Int, end: Int) -> Int {
  return end - start
}
println(halfOpenRangeLength(1, 10))

func sayHelloWorld() -> String {
  return "hello, world"
}
println(sayHelloWorld())

func sayGoodbye(personName: String) {
  println("Goodbye, \(personName)!")
}
sayGoodbye("Dave")

func printAndCount(stringToPrint: String) -> Int {
  println(stringToPrint)
  return countElements(stringToPrint)
}
func printWithoutCounting(stringToPrint: String) {
  printAndCount(stringToPrint)
}
printAndCount("hello, world")
printWithoutCounting("hello, world")

func minMax(array: [Int]) -> (min: Int, max: Int) {
  var currentMin = array[0]
  var currentMax = array[0]
  for value in array[1..<array.count] {
    if value < currentMin {
      currentMin = value
    } else if value > currentMax {
      currentMax = value
    }
  }
  return (currentMin, currentMax)
}

let bounds = minMax([8, -6, 2, 109, 3, 71])
println("min is \(bounds.min) and max is \(bounds.max)")

func minMax2(array: [Int]) -> (min: Int, max: Int)? {
  if array.isEmpty { return nil }
  var currentMin = array[0]
  var currentMax = array[0]
  for value in array[1..<array.count] {
    if value < currentMin {
      currentMin = value
    } else if value > currentMax {
      currentMax = value
    }
  }
  return (currentMin, currentMax)
}

if let bounds = minMax2([8, -6, 2, 109, 3, 71]) {
  println("min is \(bounds.min) and max is \(bounds.max)")
}

// Function Parameter Names

func join(s1: String, s2: String, joiner: String) -> String {
  return s1 + joiner + s2
}

println(join("hello", "world", ", "))

func join2(string s1: String, toString s2: String, withJoiner joiner: String)
  -> String {
  return s1 + joiner + s2
}
println(join2(string: "hello", toString: "world", withJoiner: ", "))

// Shorthand External Parameter Names

func containsCharacter(#string: String, #characterToFind: Character) -> Bool {
  for character in string {
    if character == characterToFind {
      return true
    }
  }
  return false
}

let containAVee = containsCharacter(string: "aardvark", characterToFind: "v")
println(containAVee)

// Default Parameter Values

func join3(string s1: String, toString s2: String,
           withJoiner joiner: String = " ") -> String {
  return s1 + joiner + s2
}
println(join3(string: "hello", toString: "world", withJoiner: "-"))
println(join3(string: "hello", toString: "world"))

func join4(s1: String, s2: String, joiner: String = " ") -> String {
  return s1 + joiner + s2
}
println(join4("hello", "world", joiner: "-"))

// Variadic Parameters

func arithmeticMean(numbers: Double...) -> Double {
  var total: Double = 0
  for number in numbers {
    total += number
  }
  return total / Double(numbers.count)
}
println(arithmeticMean(1, 2, 3, 4, 5))
println(arithmeticMean(3, 8.25, 18.75))

// Contant and Variable Parameters

func alignRight(var string: String, count: Int, pad: Character) -> String {
  let amountToPad = count - countElements(string)
  if amountToPad < 1 {
    return string
  }
  let padString = String(pad)
  for _ in 1...amountToPad {
    string = padString + string
  }
  return string
}
let originalString = "hello"
let paddedString = alignRight(originalString, 10, "-")
println("\(originalString) \(paddedString)")

// In-Out Parameters

func swapTwoInts(inout a: Int, inout b: Int) {
  let temporaryA = a
  a = b
  b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
println("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

// Function Types

func addTwoInts(a: Int, b: Int) -> Int {
  return a + b
}
func multiplyTwoInts(a: Int, b: Int) -> Int {
  return a * b
}

func printHelloWorld() {
  println("hello, world")
}

var mathFunction: (Int, Int) -> Int = addTwoInts
println("Result: \(mathFunction(2, 3))")

mathFunction = multiplyTwoInts
println("Result: \(mathFunction(2, 3))")

let anotherMathFunction = addTwoInts

func printMathResult(mathFunction: (Int, Int) -> Int, a: Int, b: Int) {
  println("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)

func stepForward(input: Int) -> Int {
  return input + 1
}
func stepBackward(input: Int) -> Int {
  return input - 1
}

func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
  return backwards ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)

println("Counting to zero:")
while currentValue != 0 {
  println("\(currentValue)... ")
  currentValue = moveNearerToZero(currentValue)
}
println("zero!")

// Nested Functions

func chooseStepFunction2(backwards: Bool) -> (Int) -> Int {
  func stepForward(input: Int) -> Int {
    return input + 1
  }
  func stepBackward(input: Int) -> Int {
    return input - 1
  }
  return backwards ? stepBackward : stepForward
}
var currentValue2 = -4
let moveNearerToZero2 = chooseStepFunction2(currentValue2 > 0)

while currentValue2 != 0 {
  println("\(currentValue2)... ")
  currentValue2 = moveNearerToZero2(currentValue2)
}
println("zero!")
