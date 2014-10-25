#!/usr/bin/env xcrun swift

// String Literals

let someString = "Some string literal value"

// Initializing an Empty String

var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty {
  println("Nothing to see here")
}

// String Mutability

var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander"

// Working with Characters

for character in "Dog!🐶" {
  println(character)
}

let yenSign: Character = "¥"

// Concatenating Strings and Characters

let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

let exclamationMark: Character = "!"
welcome.append(exclamationMark)
println("welcome \(welcome)")

// String Interpolation

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
println("message \(message)")

// Unicode

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"
println("\(wiseWords, dollarSign, blackHeart, sparklingHeart)")

// Extended Grapheme Clusters

let eAcute: Character = "\u{E9}"
let combineEAcute: Character = "\u{65}\u{301}"
println("\(eAcute, combineEAcute)")

let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
println("\(precomposed, decomposed)")

let enclosedEAcute: Character = "\u{E9}\u{20DD}"
println("\(enclosedEAcute)")

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
println("\(regionalIndicatorForUS)")

// Counting Characters

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
println("unusualMenagerie has \(countElements(unusualMenagerie)) characters")

var word = "cafe"
println("the number of characters in \(word) is \(countElements(word))")

word += "\u{301}"
println("the number of characters in \(word) is \(countElements(word))")

// Comparing Strings

let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
  println("These two strings are considered equal")
}

let eAcuteQuestion = "Voulez-vous uncaf\u{E9}"
let combineEAcuteQuestion = "Voulez-vous uncaf\u{65}\u{301}"
if eAcuteQuestion == combineEAcuteQuestion {
  println("These two strings are considered equal")
}

let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"
if latinCapitalLetterA != cyrillicCapitalLetterA {
  println("These two characters are not equivalent")
}

// Prefix and Suffix Equality

let romeoAndJuliet = [
  "Act 1 Scene 1: Verona, A public place",
  "Act 1 Scene 2: Capulet's mansion",
  "Act 1 Scene 3: A room in Capulet's mansion",
  "Act 1 Scene 4: A street outside Capulet's mansion",
  "Act 1 Scene 5: The Great Hall in Capulet's mansion",
  "Act 2 Scene 1: Outside Capulet's mansion",
  "Act 2 Scene 2: Capulet's orchard",
  "Act 2 Scene 3: Outside Friar Lawrence's cell",
  "Act 2 Scene 4: A street in Verona",
  "Act 2 Scene 5: Capulet's mansion",
  "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
  if scene.hasPrefix("Act 1 ") {
    ++act1SceneCount
  }
}
println("There are \(act1SceneCount) scenes in Act 1")

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
  if scene.hasSuffix("Capulet's mansion") {
    ++mansionCount
  } else if scene.hasSuffix("Friar Lawrence's cell") {
    ++cellCount
  }
}
println("\(mansionCount) mansion scenes: \(cellCount) cell scenes")

// Unicode Representations of Strings

let dogString = "Dog!🐶"
println("\(dogString)")

for codeUnit in dogString.utf8 {
  print("\(codeUnit) ")
}
print("\n")

for codeUnit in dogString.utf16 {
  print("\(codeUnit) ")
}
print("\n")

for scalar in dogString.unicodeScalars {
  print("\(scalar.value) ")
}
print("\n")

for scalar in dogString.unicodeScalars {
  println("\(scalar)")
}
