#!/usr/bin/env xcrun swift

// Property Requirements

protocol FullyNamed {
  var fullName: String { get }
}

struct Person: FullyNamed {
  var fullName: String
}
let john = Person(fullName: "John Appleseed")

class Starship: FullyNamed {
  var prefix: String?
  var name: String
  init(name: String, prefix: String? = nil) {
    self.name = name
    self.prefix = prefix
  }
  var fullName: String {
    return (prefix != nil ? prefix! + " " : "") + name
  }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")

// Method Requirements

protocol RandomNumberGenerator {
  func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
  var lastRandom = 42.0
  let m = 139968.0
  let a = 3877.0
  let c = 29573.0
  func random() -> Double {
    lastRandom = ((lastRandom * a + c) % m)
    return lastRandom / m
  }
}
let generator = LinearCongruentialGenerator()
println("Here's a random number: \(generator.random())")
println("And another one: \(generator.random())")

// Mutating Method Requirements

protocol Togglable {
  mutating func toggle()
}

enum OnOffSwitch: Togglable {
  case Off, On
  mutating func toggle() {
    switch self {
    case Off:
      self = On
    case On:
      self = Off
    }
  }
}
var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()

// Protocols as Types

class Dice {
  let sides: Int
  let generator: RandomNumberGenerator
  init(sides: Int, generator: RandomNumberGenerator) {
    self.sides = sides
    self.generator = generator
  }
  func roll() -> Int {
    return Int(generator.random() * Double(sides) + 1)
  }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
  println("Random dice roll is \(d6.roll())")
}

// Delegation

protocol DiceGame {
  var dice: Dice { get }
  func play()
}
protocol DiceGameDelegate {
  func gameDidStart(game: DiceGame)
  func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
  func gameDidEnd(game: DiceGame)
}

class SnakesAndLadders: DiceGame {
  let finalSquare = 25
  let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
  var square = 0
  var board: [Int]
  init() {
    board = [Int](count: finalSquare + 1, repeatedValue: 0)
    board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
    board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
  }
  var delegate: DiceGameDelegate?
  func play() {
    square = 0
    delegate?.gameDidStart(self)
    gameLoop: while square != finalSquare {
      let diceRoll = dice.roll()
      delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
      switch square + diceRoll {
      case finalSquare:
        break gameLoop
      case let newSquare where newSquare > finalSquare:
        continue gameLoop
      default:
        square += diceRoll
        square += board[square]
      }
    }
    delegate?.gameDidEnd(self)
  }
}

class DicegameTracker: DiceGameDelegate {
  var numberOfTurns = 0
  func gameDidStart(game: DiceGame) {
    numberOfTurns = 0
    if game is SnakesAndLadders {
      println("Started a new game of Snakes and Ladders")
    }
    println("The game is using a \(game.dice.sides)-sided dice")
  }
  func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
    ++numberOfTurns
    println("Rolled a \(diceRoll)")
  }
  func gameDidEnd(game: DiceGame) {
    println("The game lasted for \(numberOfTurns) turns")
  }
}

let tracker = DicegameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()

// Adding Protocol Conformance with an Extension

protocol TextRepresentable {
  func asText() -> String
}

extension Dice: TextRepresentable {
  func asText() -> String {
    return "A \(sides)-sided dice"
  }
}

let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
println(d12.asText())

extension SnakesAndLadders: TextRepresentable {
  func asText() -> String {
    return "A game of Snakes and Ladders with \(finalSquare) squares"
  }
}
println(game.asText())

// Declaring Protocol Adoption with an Extension

struct Hamster {
  var name: String
  func asText() -> String {
    return "A hamster named \(name)"
  }
}
extension Hamster: TextRepresentable {}

let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
println(somethingTextRepresentable.asText())

// Collections of Protocol Types

let things: [TextRepresentable] = [game, d12, simonTheHamster]

for thing in things {
  println(thing.asText())
}

// Protocol Inheritance

protocol PrettyTextRepresentable: TextRepresentable {
  func asPrettyText() -> String
}

extension SnakesAndLadders: PrettyTextRepresentable {
  func asPrettyText() -> String {
    var output = asText() + ":\n"
    for index in 1...finalSquare {
      switch board[index] {
      case let ladder where ladder > 0:
        output += "▲ "
      case let snake where snake < 0:
        output += "▼ "
      default:
        output += "○ "
      }
    }
    return output
  }
}

println(game.asPrettyText())

// Protocol Composition

protocol Named {
  var name: String { get }
}
protocol Aged {
  var age: Int { get }
}
struct Person1: Named, Aged {
  var name: String
  var age: Int
}
func wishHappyBirthday(celebrator: protocol<Named, Aged>) {
  println("Happy birthday \(celebrator.name) - you're \(celebrator.age)!")
}
let birthdayPerson = Person1(name: "Malcolm", age: 21)
wishHappyBirthday(birthdayPerson)

// Checking for Protocol Conformance

@objc protocol HasArea {
  var area: Double { get }
}

class Circle: HasArea {
  let pi = 3.1415927
  var radius: Double
  var area: Double { return pi * radius * radius }
  init(radius: Double) { self.radius = radius }
}
class Country: HasArea {
  var area: Double
  init(area: Double) { self.area = area }
}

class Animal {
  var legs: Int
  init(legs: Int) { self.legs = legs }
}

let objects: [AnyObject] = [
  Circle(radius: 2.0),
  Country(area: 243_610),
  Animal(legs: 4)
]

for object in objects {
  if let objectWithArea = object as? HasArea {
    println("Area is \(objectWithArea.area)")
  } else {
    println("Something that doesn't have an area")
  }
}

// Optional Protocol Requirements

@objc protocol CounterDataSource {
  optional func incrementForCount(count: Int) -> Int
  optional var fixedIncrement: Int { get }
}

@objc class Counter {
  var count = 0
  var dataSource: CounterDataSource?
  func increment() {
    if let amount = dataSource?.incrementForCount?(count) {
      count += amount
    } else if let amount = dataSource?.fixedIncrement? {
      count += amount
    }
  }
}

class ThreeSource: CounterDataSource {
  let fixedIncrement = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
  counter.increment()
  println(counter.count)
}

class TowardsZeroSource: CounterDataSource {
  func incrementForCount(count: Int) -> Int {
    if count == 0 {
      return 0
    } else if count < 0 {
      return 1
    } else {
      return -1
    }
  }
}

counter.count = -4
counter.dataSource = TowardsZeroSource()
for _ in 1...5 {
  counter.increment()
  println(counter.count)
}
