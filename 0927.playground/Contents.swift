import UIKit
import Foundation
import SwiftUI

//public struct SomeType {
//    private var privateVariable = 0
//    fileprivate var fileprivateVariable = 0
//}
//
//extension SomeType {
//    public func publicMethod(){
//        print("\(self.privateVariable), \(self.fileprivateVariable)")
//    }
//    fileprivate func fileprivateMethod(){
//        print("\(self.privateVariable), \(self.fileprivateVariable)")
//    }
//    private func privateMethod(){
//        print("\(self.privateVariable), \(self.fileprivateVariable)")
//    }
//}
//struct AnotherType {
//    var someInstance: SomeType = SomeType()
//    
//    mutating func someMethod() {
//        self.someInstance.publicMethod()
//        
//        self.someInstance.fileprivateVariable = 100
//        self.someInstance.fileprivateMethod()
//    }
//}
//12-7
//private typealias PointValue: Int
//
//enum Point: PointValue {
//    case x, y
//}
//12-8
//public struct SomeType {
//    private var privateVariable = 0
//    fileprivate var fileprivateVariable = 0
//}
//extension SomeType {
//    public func publicMethod(){
//        print("\(self.privateVariable), \(self.fileprivateVariable)1")
//    }
//    private func privateMethod(){
//        print("\(self.privateVariable), \(self.fileprivateVariable)2")
//    }
//    fileprivate func fileprivateMethod(){
//        print("\(self.privateVariable), \(self.fileprivateVariable)3")
//    }
//}
//
//struct AnotherType {
//    var someInstance: SomeType = SomeType()
//    
//    mutating func someMethod(){
//        self.someInstance.publicMethod()
//        self.someInstance.fileprivateVariable = 100
//        self.someInstance.fileprivateMethod()
//    }
//}
//var anotherInstance = AnotherType()
//anotherInstance.someMethod()
public struct SomeType {
    private var count: Int = 0
    
    public var publicStoredProperty: Int = 0
    
    public private(set) var publicGetOnlyStoredProperty: Int = 0
    
    internal var internalComputedProperty: Int {
        get {
            return count
        }
        set {
            count += 1
        }
    }
    internal private(set) var internalGetOnlyComputedProperty: Int{
        get {
            return count
        }
        set {
            count += 1
        }
    }
    public subscript() -> Int{
        get {
            return count
        }
        set {
            count += 1
        }
    }
    public internal(set) subscript(some: Int) -> Int{
        get {
            return count
        }
        set {
            count += 1
        }
    }
}
var someInstance: SomeType = SomeType()

print(someInstance.publicStoredProperty)
someInstance.publicStoredProperty = 100

print(someInstance.publicGetOnlyStoredProperty)
//someInstance.publicGetOnlyStoredProperty

print(someInstance.internalComputedProperty)
someInstance.internalComputedProperty

print(someInstance.internalGetOnlyComputedProperty)

print(someInstance[])
someInstance[] = 100

print(someInstance[0])
someInstance[] = 100
