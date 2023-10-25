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

