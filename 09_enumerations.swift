#!/usr/bin/env xcrun swift

// Enumeration Syntax

enum CompassPoint {
  case North
  case South
  case East
  case West
}

enum Planet {
  case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

var directionToHead = CompassPoint.West
directionToHead = .East

// Matching Enumeration Values with a Switch Statement

directionToHead = .South
switch directionToHead {
case .North:
  println("Lots of planets have a north")
case .South:
  println("Watch out for penguins")
case .East:
  println("Where the sun rises")
case .West:
  println("Where the skies are blue")
}

let somePlanet = Planet.Earth
switch somePlanet {
case .Earth:
  println("Mostly harmless")
default:
  println("Not a safe place for humans")
}

// Associated Values

enum Barcode {
  case UPCA(Int, Int, Int, Int)
  case QRCode(String)
}

var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
productBarcode = .QRCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .UPCA(let numberSystem, let manufacturer, let product, let check):
  println("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case .QRCode(let productCode):
  println("QR code: \(productCode).")
}

switch productBarcode {
case let .UPCA(numberSystem, manufacturer, product, check):
  println("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .QRCode(productCode):
  println("QR code: \(productCode).")
}

// Raw Values

enum ASCIIControlCharacter: Character {
  case Tab = "\t"
  case LineFeed = "\n"
  case CarriageReturn = "\r"
}

enum Planet1: Int {
  case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

let earthOrder = Planet1.Earth.rawValue

let possiblePlanet = Planet1(rawValue: 7)

let positionToFind = 9
if let somePlanet = Planet1(rawValue: positionToFind) {
  switch somePlanet {
  case .Earth:
    println("Mostly harmless")
  default:
    println("Not a safe place for humans")
  }
} else {
  println("There isn't a planet at position \(positionToFind)")
}
