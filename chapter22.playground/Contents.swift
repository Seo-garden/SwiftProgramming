import UIKit
import Foundation
//22-2
prefix operator **

prefix func ** <T: BinaryInteger> (value : T) -> T {
    return value * value
}

let minusFive = -5
let five : UInt = 5

let sqrtMinusFive : Int = **minusFive
let sqrtFive: UInt = **five

print(sqrtMinusFive)
//22-6
func swapTwoValues<T> (_ a : inout T, _ b : inout T) {
    var temporaryA : T = a
    a = b
    b = temporaryA
}
//22-8
struct Stack<Element> {
    var items = [Element]()
    mutating func push (_ item: Element){
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var doubleStack : Stack<Double> = Stack<Double>()

doubleStack.push(1.0)
print(doubleStack.items)
doubleStack.push(2.0)
print(doubleStack.items)
doubleStack.pop()
print(doubleStack.items)

var stringStack : Stack<String> = Stack<String>()

stringStack.push("1")
print(stringStack.items)
stringStack.push("2")
print(stringStack.items)
stringStack.pop()
print(stringStack.items)

var anyStack: Stack<Any> = Stack<Any>()

anyStack.push(1.0)
print(anyStack.items)
anyStack.push("2")
print(anyStack.items)
anyStack.push(3)
print(anyStack.items)
anyStack.pop()
print(anyStack.items)
//22-9
extension Stack {
    var topElement: Element? {
        return self.items.last
    }
}
print(doubleStack.topElement)
print(stringStack.topElement)
print(anyStack.topElement)
//22-16
protocol Container {
    associatedtype ItemType
    var count : Int {get}
    mutating func append(_ item : ItemType)
    subscript (i : Int) -> ItemType {get}
}
//22-17
class MyContainer : Container {
    var items: Array<Int> = Array<Int> ()
    var count : Int {
        return items.count
    }
    func append(_ item : Int) {
        items.append(item)
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}
//22-18
struct IntStack : Container {
    var items = [Int]()
    mutating func push(_ item : Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}
//22-19
struct IntStack2 : Container {
    typealias ItemType = Int
    
    var items = [ItemType]()
    
    mutating func push(_ item : ItemType){
        items.append(item)
    }
    mutating func pop() -> ItemType {
        return items.removeLast()
    }
    mutating func append(_ item: ItemType) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}
//22-20
struct Stack3<Element>: Container {
    var items = [Element]()
    mutating func push(_ item : Element){
        return items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    mutating func append(_ item : Element){
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}
