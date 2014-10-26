#!/usr/bin/env xcrun swift

// Bitwise Operators

let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits
println("invertedBits \(invertedBits)")

let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b00111111
let middleFourBits = firstSixBits & lastSixBits
println("middleFourBits \(middleFourBits)")

let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits
println("combinedbits \(combinedbits)")

let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits
println("outputBits \(outputBits)")

let shiftBits: UInt8 = 4
println(shiftBits << 1)
println(shiftBits << 2)
println(shiftBits << 5)
println(shiftBits << 6)
println(shiftBits >> 2)

let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16
let greenComponent = (pink & 0x00FF00) >> 8
let blueComponent = pink & 0x0000FF
println("\(redComponent) \(greenComponent) \(blueComponent)")

// Value Overflow

var willOverflow = UInt8.max
willOverflow = willOverflow &+ 1
println("willOverflow \(willOverflow)")

// Value Underflow

var willUnderflow = UInt8.min
willUnderflow = willUnderflow &- 1
println("willUnderflow \(willUnderflow)")

var signedUnderflow = Int8.min
signedUnderflow = signedUnderflow &- 1
println("signedUnderflow \(signedUnderflow)")

// Division by Zero

let x = 1
let y = x &/ 0

// Precedence and Associativity

println(2 + 3 * 4 % 5)

// Operator Functions

struct Vector2D {
  var x = 0.0, y = 0.0
}
func + (left: Vector2D, right: Vector2D) -> Vector2D {
  return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector
println("combinedVector (\(combinedVector.x), \(combinedVector.y))")

// Prefix and Postfix Operators

prefix func - (vector: Vector2D) -> Vector2D {
  return Vector2D(x: -vector.x, y: -vector.y)
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
let alsoPositive = -negative
println("alsoPositive (\(alsoPositive.x), \(alsoPositive.y))")

// Compound Assignment Operators

func += (inout left: Vector2D, right: Vector2D) {
  left = left + right
}

var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd
println("original (\(original.x), \(original.y))")

prefix func ++ (inout vector: Vector2D) -> Vector2D {
  vector += Vector2D(x: 1.0, y: 1.0)
  return vector
}

var toIncrement = Vector2D(x: 3.0, y: 4.0)
let afterIncrement = ++toIncrement
println("afterIncrement (\(afterIncrement.x), \(afterIncrement.y))")

// Equivalence Operators

func == (left: Vector2D, right: Vector2D) -> Bool {
  return (left.x == right.x) && (left.y == right.y)
}
func != (left: Vector2D, right: Vector2D) -> Bool {
  return !(left == right)
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
  println("These two vectors are equivalent.")
}

// Custom Operators

prefix operator +++ {}

prefix func +++ (inout vector: Vector2D) -> Vector2D {
  vector += vector
  return vector
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled
println("afterDoubling (\(afterDoubling.x), \(afterDoubling.y))")

infix operator +- { associativity left precedence 140 }
func +- (left: Vector2D, right: Vector2D) -> Vector2D {
  return Vector2D(x: left.x + right.x, y: left.y - right.y)
}
let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
println("plusMinusVector (\(plusMinusVector.x), \(plusMinusVector.y))")
