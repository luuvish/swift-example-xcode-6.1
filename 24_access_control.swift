#!/usr/bin/env xcrun swift

// Access Control Syntax

public class SomePublicClass {}
internal class SomeInternalClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
private func somePrivateFunction() {}

// Custom Types

public class SomePublicClass1 {       // explicitly public
  public var somePublicProperty = 0   // explicitly public
  var someInternalProperty = 0        // implicity internal
  private func somePrivateMethod() {} // explicitly private
}

class SomeInternalClass1 {            // implicity internal
  var someInternalProperty = 0        // implicity internal
  private func somePrivateMethod() {} // explicitly private
}

private class SomePrivateClass1 {     // explicitly private
  var somePrivateProperty = 0         // implicity private
  func somePrivateMethod() {}         // implicity private
}

// Subclassing

public class A {
  private func someMethod() {}
}

internal class B: A {
  override internal func someMethod() {}
}

public class A1 {
  private func someMethod() {}
}

internal class B1: A1 {
  override internal func someMethod() {
    super.someMethod()
  }
}

// Getters and Setters

struct TrackedString {
  private(set) var numberOfEdits = 0
  var value: String = "" {
    didSet {
      numberOfEdits++
    }
  }
}

var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
println("The number of edits is \(stringToEdit.numberOfEdits)")

public struct TrackedString1 {
  public private(set) var numberOfEdits = 0
  public var value: String = "" {
    didSet {
      numberOfEdits++
    }
  }
  public init() {}
}
