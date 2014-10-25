#!/usr/bin/env xcrun swift

// Defining a Base Class

class Vehicle {
  var currentSpeed = 0.0
  var description: String {
    return "traveling at \(currentSpeed) miles per hour"
  }
  func makeNoise() {}
}

let someVehicle = Vehicle()
println("Vehicle: \(someVehicle.description)")

// Subclassing

class Bicycle: Vehicle {
  var hasBasket = false
}
let bicycle = Bicycle()
bicycle.hasBasket = true

bicycle.currentSpeed = 15.0
println("Bicycle: \(bicycle.description)")

class Tandem: Bicycle {
  var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
println("Tandem: \(tandem.description)")

// Overriding

class Train: Vehicle {
  override func makeNoise() {
    println("Choo Choo")
  }
}

let train = Train()
train.makeNoise()

class Car: Vehicle {
  var gear = 1
  override var description: String {
    return super.description + " in gear \(gear)"
  }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
println("Car: \(car.description)")

class AutomaticCar: Car {
  override var currentSpeed: Double {
    didSet {
      gear = Int(currentSpeed / 10.0) + 1
    }
  }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
println("AutomaticCar: \(automatic.description)")
