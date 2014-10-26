#!/usr/bin/env xcrun swift

// Optional Chaining as an Alternative to Forced Unwrapping

class Person {
  var residence: Residence?
}

class Residence {
  var numberOfRooms = 1
}

let john = Person()

//let roomCount = john.residence!.numberOfRooms

if let roomCount = john.residence?.numberOfRooms {
  println("John's residence has \(roomCount) room(s).")
} else {
  println("Unable to retrieve the number of rooms.")
}

john.residence = Residence()

if let roomCount = john.residence?.numberOfRooms {
  println("John's residence has \(roomCount) room(s).")
} else {
  println("Unable to retrieve the number of rooms.")
}

// Defining Model Classes for Optional Chaining

class Person1 {
  var residence: Residence1?
}

class Residence1 {
  var rooms = [Room1]()
  var numberOfRooms: Int {
    return rooms.count
  }
  subscript(i: Int) -> Room1 {
    get {
      return rooms[i]
    }
    set {
      rooms[i] = newValue
    }
  }
  func printNumberOfRooms() {
    println("The number of rooms is \(numberOfRooms)")
  }
  var address: Address1?
}

class Room1 {
  let name: String
  init(name: String) { self.name = name }
}

class Address1 {
  var buildingName: String?
  var buildingNumber: String?
  var street: String?
  func buildingIdentifier() -> String? {
    if buildingName != nil {
      return buildingName
    } else if buildingNumber != nil {
      return buildingNumber
    } else {
      return nil
    }
  }
}

// Chaining

let john1 = Person1()
if let roomCount = john1.residence?.numberOfRooms {
  println("John's residence has \(roomCount) room(s).")
} else {
  println("Unable to retrieve the number of rooms.")
}

let someAddress = Address1()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john1.residence?.address = someAddress

// Calling Methods Through Optional Chaining

if john1.residence?.printNumberOfRooms() != nil {
  println("It was possible to print the number of rooms.")
} else {
  println("It was not possible to print the number of rooms.")
}

if (john1.residence?.address = someAddress) != nil {
  println("It was possible to set the address.")
} else {
  println("It was not possible to set the address.")
}

// Accessing Subscripts Through Optional Chaining

if let firstRoomName = john1.residence?[0].name {
  println("The first room name is \(firstRoomName).")
} else {
  println("Unable to retrieve the first room name.")
}

john1.residence?[0] = Room1(name: "Bathroom")

let johnsHouse = Residence1()
johnsHouse.rooms.append(Room1(name: "Living Room"))
johnsHouse.rooms.append(Room1(name: "Kitchen"))
john1.residence = johnsHouse

if let firstRoomName = john1.residence?[0].name {
  println("The first room name is \(firstRoomName).")
} else {
  println("Unable to retrieve the first room name.")
}

// Accessing Subscripts of Optional Type

var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0]++
testScores["Brian"]?[0] = 72
println("testScores \(testScores)")

// Linking Multiple Levels of Chaining

if let johnsStreet = john1.residence?.address?.street {
  println("John's street name is \(johnsStreet).")
} else {
  println("Unable to retrieve the address.")
}

let johnsAddress = Address1()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john1.residence!.address = johnsAddress

if let johnsStreet = john1.residence?.address?.street {
  println("John's street name is \(johnsStreet).")
} else {
  println("Unable to retrieve the address.")
}

// Chaining on Methods with Optional Return Values

if let buildingIdentifier = john1.residence?.address?.buildingIdentifier() {
  println("John's building identifier is \(buildingIdentifier).")
}

if let beginsWithThe =
  john1.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
  if beginsWithThe {
    println("John's building identifier begins with \"The\".")
  } else {
    println("John's building identifier does not begin with \"The\".")
  }
}
