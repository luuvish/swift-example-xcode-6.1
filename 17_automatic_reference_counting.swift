#!/usr/bin/env xcrun swift

// ARC in Action

class Person {
  let name: String
  init(name: String) {
    self.name = name
    println("\(name) is being initialized")
  }
  deinit {
    println("\(name) is being deinitialized")
  }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil

// Strong Reference Cycles Between Class Instances

class Person1 {
  let name: String
  init(name: String) { self.name = name }
  var apartment: Apartment1?
  deinit { println("\(name) is being deinitialized") }
}

class Apartment1 {
  let number: Int
  init(number: Int) { self.number = number }
  var tenant: Person1?
  deinit { println("Apartment #\(number) is being deinitialized") }
}

var john1: Person1?
var number173: Apartment1?

john1 = Person1(name: "John Appleseed")
number173 = Apartment1(number: 73)

john1!.apartment = number173
number173!.tenant = john1

john1 = nil
number173 = nil

// Weak References

class Person2 {
  let name: String
  init(name: String) { self.name = name }
  var apartment: Apartment2?
  deinit { println("\(name) is being deinitialized") }
}

class Apartment2 {
  let number: Int
  init(number: Int) { self.number = number }
  weak var tenant: Person2?
  deinit { println("Apartment #\(number) is being deinitialized") }
}

var john2: Person2?
var number273: Apartment2?

john2 = Person2(name: "John Appleseed")
number273 = Apartment2(number: 73)

john2!.apartment = number273
number273!.tenant = john2

john2 = nil
number273 = nil

// Unowned References

class Customer {
  let name: String
  var card: CreditCard?
  init(name: String) {
    self.name = name
  }
  deinit { println("\(name) is being deinitialized") }
}

class CreditCard {
  let number: UInt64
  unowned let customer: Customer
  init(number: UInt64, customer: Customer) {
    self.number = number
    self.customer = customer
  }
  deinit { println("Card #\(number) is being deinitialized") }
}

var john3: Customer?
john3 = Customer(name: "John Appleseed")
john3!.card = CreditCard(number: 1234_5678_9012_3456, customer: john3!)

john3 = nil

// Unowned References and Implicitly Unwrapped Optional Properties

class Country {
  let name: String
  let capitalCity: City!
  init(name: String, capitalName: String) {
    self.name = name
    self.capitalCity = City(name: capitalName, country: self)
  }
}

class City {
  let name: String
  unowned let country: Country
  init(name: String, country: Country) {
    self.name = name
    self.country = country
  }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
println("\(country.name)'s capital city is called \(country.capitalCity.name)")

// Strong Reference Cycles for Closures

class HTMLElement {
  let name: String
  let text: String?

  lazy var asHTML: () -> String = {
    if let text = self.text {
      return "<\(self.name)>\(text)</\(self.name)>"
    } else {
      return "<\(self.name) />"
    }
  }

  init(name: String, text: String? = nil) {
    self.name = name
    self.text = text
  }

  deinit {
    println("\(name) is being deinitialized")
  }
}

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
println(paragraph!.asHTML())
paragraph = nil

// Weak and Unowned References

class HTMLElement1 {
  let name: String
  let text: String?

  lazy var asHTML: () -> String = {
    [unowned self] in
    if let text = self.text {
      return "<\(self.name)>\(text)</\(self.name)>"
    } else {
      return "<\(self.name) />"
    }
  }

  init(name: String, text: String? = nil) {
    self.name = name
    self.text = text
  }

  deinit {
    println("\(name) is being deinitialized")
  }
}

var paragraph1: HTMLElement1? = HTMLElement1(name: "p", text: "hello, world")
println(paragraph1!.asHTML())
paragraph1 = nil
