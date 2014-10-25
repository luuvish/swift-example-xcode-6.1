#!/usr/bin/env xcrun swift

// Assignment Operator

let b = 10
var a = 5
a = b

let (x, y) = (1, 2)

// Arithmetic Operators

1 + 2
5 - 3
2 * 3
10.0 / 2.5

"hello, " + "world"

9 % 4 // 1
-9 % 4 // -1
8 % 2.5 // 0.5

var i = 0
++i

var a1 = 0
let b1 = ++a1
let c = a1++

let three = 3
let minusThree = -three
let plusThree = -minusThree

let minusSix = -6
let alsoMinusSix = +minusSix

// Compound Assignment Operators

var a2 = 1
a2 += 2

// Comparison Operators

1 == 1
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1

let name = "world"
if name == "world" {
  println("hello, world")
} else {
  println("I'm sorry \(name), but I don't recognize you")
}

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

// Nil Coalescing Operator

let defaultColorName = "red"
var userDefinedColorName: String?
var colorNameToUse = userDefinedColorName ?? defaultColorName
println("colorNameToUse \(colorNameToUse)")

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
println("colorNameToUse \(colorNameToUse)")

// Range Operators

for index in 1...5 {
  println("\(index) times 5 is \(index * 5)")
}

// Half-Open Range Operator

let names = ["Anne", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
  println("Person \(i + 1) is called \(names[i])")
}

// Logical Operators

let allowedEntry = false
if !allowedEntry {
  println("ACCESS DENIED")
}

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
  println("Welcome!")
} else {
  println("ACCESS DENIED")
}

let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
  println("Welcome!")
} else {
  println("ACCESS DENIED")
}

if enteredDoorCode && passedRetinaScan ||
   hasDoorKey || knowsOverridePassword {
  println("Welcome!")
} else {
  println("ACCESS DENIED")
}

if (enteredDoorCode && passedRetinaScan) ||
   hasDoorKey || knowsOverridePassword {
  println("Welcome!")
} else {
  println("ACCESS DENIED")
}
