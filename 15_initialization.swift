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
