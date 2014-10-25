#!/usr/bin/env xcrun swift

// Closure Expressions

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwards(s1: String, s2: String) -> Bool {
  return s1 > s2
}
var reversed = sorted(names, backwards)

reversed = sorted(names, { (s1: String, s2: String) -> Bool in
  return s1 > s2
})

reversed = sorted(names, { s1, s2 in return s1 > s2 })
reversed = sorted(names, { s1, s2 in s1 > s2 })
reversed = sorted(names, { $0 > $1 })
reversed = sorted(names, >)

// Trailing Closures

func someFunctionThatTakesAClosure(closure: () -> ()) {
}

reversed = sorted(names) { $0 > $1 }

let digitNames = [
  0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
  5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map {
  (var number) -> String in
  var output = ""
  while number > 0 {
    output = digitNames[number % 10]! + output
    number /= 10
  }
  return output
}
println("strings \(strings)")

// Capturing Values

func makeIncrementor(forIncrement amount: Int) -> () -> Int {
  var runningTotal = 0
  func incrementor() -> Int {
    runningTotal += amount
    return runningTotal
  }
  return incrementor
}

let incrementByTen = makeIncrementor(forIncrement: 10)
println(incrementByTen())
println(incrementByTen())
println(incrementByTen())

let incrementBySeven = makeIncrementor(forIncrement: 7)
println(incrementBySeven())
println(incrementByTen())

// Closure Are Reference Types

let alsoIncrementByTen = incrementByTen
println(alsoIncrementByTen())
