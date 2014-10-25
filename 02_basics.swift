#!/usr/bin/env xcrun swift

// Constants and Variables

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

var x = 0.0, y = 0.0, z = 0.0

var welcomMessage: String
welcomMessage = "Hello"

var red, green, blue: Double

let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

var friendlyWelcom = "Hello!"
friendlyWelcom = "Bonjour!"

let languageName = "Swift"

println(friendlyWelcom)
println("This is a string")
println("The current value of friendlyWelcom is \(friendlyWelcom)")

let cat = "🐱"; println(cat)

// Integers

let minValue = UInt8.min
let maxValue = UInt8.max
println("minValue \(minValue) maxValue \(maxValue)")

// Type Safety and Type Inference

let meaningOfLife = 42
let pi = 3.14159
let anotherPi = 3 + 0.14159

// Numeric Literals

let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

// Numeric Type Conversion

//let cannotBeNegative: UInt8 = -1
//let tooBig: Int8 = Int8.max + 1

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

let three = 3
let pointOneFourOneFiveNine = 0.14159
let doublePi = Double(3) + pointOneFourOneFiveNine

let integerPi = Int(pi)

// Type Aliases

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

// Booleans

let orangeAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
  println("Mmm, tasty turnips!")
} else {
  println("Eww, turnips are horrible.")
}

// Tuples

let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
println("The status code is \(statusCode)")
println("The status message is \(statusMessage)")

let (justTheStatusCode, _) = http404Error
println("The status code is \(justTheStatusCode)")

println("The status code is \(http404Error.0)")
println("The status message is \(http404Error.1)")

let http200Status = (statusCode: 200, description: "OK")
println("The status code is \(http200Status.statusCode)")
println("The status message is \(http200Status.description)")

// Optionals

let possibleNumber = "123"
let convertedNumber = possibleNumber.toInt()
println("convertedNumber \(convertedNumber)")

var serverResponseCode: Int? = 404
serverResponseCode = nil

var surverAnswer: String?

if convertedNumber != nil {
  println("convertedNumber contains some integer value.")
}

if convertedNumber != nil {
  println("convertedNumber has an integer value of \(convertedNumber).")
}

if let actualNumber = possibleNumber.toInt() {
  println("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
  println("\'\(possibleNumber)\' could not be converted to an integer")
}

let possibleString: String? = "An optional string."
let forcedString: String = possibleString!
println(forcedString)

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString
println(implicitString)

if assumedString != nil {
  println(assumedString)
}

if let definiteString = assumedString {
  println(definiteString)
}

// Assertions

let age = -3
assert(age >= 0, "A person's age cannot be less than zero")
assert(age >= 0)
