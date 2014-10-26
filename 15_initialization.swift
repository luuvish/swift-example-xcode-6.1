#!/usr/bin/env xcrun swift

// Initializers

struct Fahrenheit {
  var temperature: Double
  init() {
    temperature = 32.0
  }
}
var f = Fahrenheit()
println("The default temperature is \(f.temperature)​° Fahrenheit")

// Default Property Values

struct Fahrenheit2 {
  var temperature = 32.0
}

// Initialization Parameters

struct Celsius {
  var temperatureInCelsius: Double
  init(fromFahrenheit fahrenheit: Double) {
    temperatureInCelsius = (fahrenheit - 32.0) / 1.8
  }
  init(fromKelvin kelvin: Double) {
    temperatureInCelsius = kelvin - 273.15
  }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)

// Local and External Parameter Names

struct Color {
  let red, green, blue: Double
  init(red: Double, green: Double, blue: Double) {
    self.red = red
    self.green = green
    self.blue = blue
  }
  init(white: Double) {
    red = white
    green = white
    blue = white
  }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)
//let veryGreen = Color(0.0, 1.0, 0.0)

// Initializer Parameters Without External Names

struct Celsius1 {
  var temperatureInCelsius: Double
  init(fromFahrenheit fahrenheit: Double) {
    temperatureInCelsius = (fahrenheit - 32.0) / 1.8
  }
  init(fromKelvin kelvin: Double) {
    temperatureInCelsius = kelvin - 273.15
  }
  init(_ celsius: Double) {
    temperatureInCelsius = celsius
  }
}
let bodyTemperature = Celsius1(37.0)

// Optional Property Types

class SurveyQuestion {
  var text: String
  var response: String?
  init(text: String) {
    self.text = text
  }
  func ask() {
    println(text)
  }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese."

// Modifying Contant Properties During Initialization

class SurveyQuestion1 {
  let text: String
  var response: String?
  init(text: String) {
    self.text = text
  }
  func ask() {
    println(text)
  }
}
let beetsQuestion = SurveyQuestion1(text: "How about beets?")
beetsQuestion.ask()
beetsQuestion.response = "I also like beets. (But not with cheese.)"

// Default Initializers

class ShoppingListItem {
  var name: String?
  var quantity = 1
  var purchased = false
}
var item = ShoppingListItem()

// Memberwise Initializers for Structure Types

struct Size {
  var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)

// Initializers Delegation for Value Types

struct Point {
  var x = 0.0, y = 0.0
}

struct Rect {
  var origin = Point()
  var size = Size()
  init() {}
  init(origin: Point, size: Size) {
    self.origin = origin
    self.size = size
  }
  init(center: Point, size: Size) {
    let originX = center.x - (size.width / 2)
    let originY = center.y - (size.height / 2)
    self.init(origin: Point(x: originX, y: originY), size: size)
  }
}

let basicRect = Rect()

let originRect = Rect(
  origin: Point(x: 2.0, y: 2.0),
  size: Size(width: 5.0, height: 5.0)
)

let centerRect = Rect(
  center: Point(x: 4.0, y: 4.0),
  size: Size(width: 3.0, height: 3.0)
)

// Initializer Inheritance and Overriding

class Vehicle {
  var numberOfWheels = 0
  var description: String {
    return "\(numberOfWheels) wheel(s)"
  }
}

let vehicle = Vehicle()
println("Vehicle: \(vehicle.description)")

class Bicycle: Vehicle {
  override init() {
    super.init()
    numberOfWheels = 2
  }
}

let bicycle = Bicycle()
println("Bicycle: \(bicycle.description)")

// Designed and Convenience Initializers in Action

class Food {
  var name: String
  init(name: String) {
    self.name = name
  }
  convenience init() {
    self.init(name: "[Unnamed]")
  }
}

let namedMeat = Food(name: "Bacon")
let mysteryMeat = Food()

class RecipeIngredient: Food {
  var quantity: Int
  init(name: String, quantity: Int) {
    self.quantity = quantity
    super.init(name: name)
  }
  override convenience init(name: String) {
    self.init(name: name, quantity: 1)
  }
}

let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppingListItem1: RecipeIngredient {
  var purchased = false
  var description: String {
    var output = "\(quantity) x \(name)"
    output += purchased ? " ✔" : " ✘"
    return output
  }
}

var breakfastList = [
  ShoppingListItem1(),
  ShoppingListItem1(name: "Bacon"),
  ShoppingListItem1(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
  println(item.description)
}

// Failable Initializers

struct Animal {
  let species: String
  init?(species: String) {
    if species.isEmpty { return nil }
    self.species = species
  }
}

let someCreature = Animal(species: "Giraffee")

if let giraffee = someCreature {
  println("An animal was initialized with a species of \(giraffee.species)")
}

let anonymousCreature = Animal(species: "")
if anonymousCreature == nil {
  println("The anonymous creature could not be initialized")
}

// Failable Initializers for Enumerations

enum TemperatureUnit {
  case Kelvin, Celsius, Fahrenheit
  init?(symbol: Character) {
    switch symbol {
    case "K":
      self = .Kelvin
    case "C":
      self = .Celsius
    case "F":
      self = .Fahrenheit
    default:
      return nil
    }
  }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
  println("This is a defined temperature unit, so initialization succeeded.")
}

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
  println("This is not a defined temperature unit, so initialization failed.")
}

// Failable Initializers for Enumerations with Raw Values

enum TemperatureUnit1: Character {
  case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}

let fahrenheitUnit1 = TemperatureUnit1(rawValue: "F")
if fahrenheitUnit1 != nil {
  println("This is a defined temperature unit, so initialization succeeded.")
}

let unknownUnit1 = TemperatureUnit1(rawValue: "X")
if unknownUnit1 == nil {
  println("This is not a defined temperature unit, so initialization failed.")
}

// Failable Initializers for Classes

class Product {
  let name: String!
  init?(name: String) {
    if name.isEmpty { return nil }
    self.name = name
  }
}

if let bowTie = Product(name: "bow tie") {
  println("The product's name is \(bowTie.name)")
}

// Propagation of Initialization Failure

class CartItem: Product {
  let quantity: Int!
  init?(name: String, quantity: Int) {
    super.init(name: name)
    if quantity < 1 { return nil }
    self.quantity = quantity
  }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
  println("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
  println("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
  println("Unable to initialize zero shirts")
}

if let oneUnnamed = CartItem(name: "", quantity: 1) {
  println("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
  println("Unable to initialize one unnamed product")
}

// Overriding a Failable Initializer

class Document {
  var name: String?
  init() {}
  init?(name: String) {
    if name.isEmpty { return nil }
    self.name = name
  }
}

class AutomaticallyNamedDocument: Document {
  override init() {
    super.init()
    self.name = "[Untitled]"
  }
  override init(name: String) {
    super.init()
    if name.isEmpty {
      self.name = "[Untitled]"
    } else {
      self.name = name
    }
  }
}

// Required Initializers

class SomeClass {
  required init() {}
}

class SomeSubclass: SomeClass {
  required init () {}
}

// Setting a Default Property Value with a Closure or Function

struct Checkerboard {
  let boardColors: [Bool] = {
    var temperaryBoard = [Bool]()
    var isBlack = false
    for i in 1...10 {
      for j in 1...10 {
        temperaryBoard.append(isBlack)
        isBlack = !isBlack
      }
      isBlack = !isBlack
    }
    return temperaryBoard
  }()
  func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
    return boardColors[(row * 10) + column]
  }
}

let board = Checkerboard()
println(board.squareIsBlackAtRow(0, column: 1))
println(board.squareIsBlackAtRow(9, column: 9))
