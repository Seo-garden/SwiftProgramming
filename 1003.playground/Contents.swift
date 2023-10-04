import UIKit
//13-17
typealias VoidVoidClosure = () -> Void
let firstClosure: VoidVoidClosure = {
    print("Closure A")
}
let secondClosure: VoidVoidClosure = {
    print("Closure B")
}

func returnOneClosure(first: @escaping VoidVoidClosure, second: @escaping VoidVoidClosure,
                      shouldReturnFirstClosure: Bool) -> VoidVoidClosure {
    return shouldReturnFirstClosure ? first : second
}
let returnedClosure: VoidVoidClosure = returnOneClosure(first: firstClosure, second: secondClosure, shouldReturnFirstClosure: true)

returnedClosure()

var closures: [VoidVoidClosure] = []

func appendClosure(closure: @escaping VoidVoidClosure){
    closures.append(closure)
}
//13-18
typealias VoidVoidClosure = () -> Void
func functionWithNoescapeClosure(closure: VoidVoidClosure) {
    closure()
}
func functionWithEscapingClosure(completionHandler: @escaping VoidVoidClosure) -> VoidVoidClosure {
    return completionHandler
}
class SomeClass {
    var x = 10
    func runNoescapeClosure() {
        functionWithNoescapeClosure {
            x = 200
        }
    }
    func runEscapingClosure() -> VoidVoidClosure {
        return functionWithEscapingClosure {
            self.x = 100
        }
    }
}
let instance : SomeClass = SomeClass()

instance.runNoescapeClosure()
print(instance.x)

let returnedClosure: VoidVoidClosure = instance.runEscapingClosure()
returnedClosure()
print(instance.x)
//13-20
let numbers: [Int] = [2,4,6,8]

let evenNumberPredicate = {(number: Int) -> Bool in
    return number % 2 == 0
}
let oddNumberPredicate = {(number: Int) -> Bool in
    return number % 2 == 1
}
func hasElements(in array: [Int], match predicate: (Int) -> Bool) -> Bool {
    return withoutActuallyEscaping(predicate, do:{escapablePredicate in
        return (array.lazy.filter {escapablePredicate($0) }.isEmpty == false)
    })
}

let hasEvenNumber = hasElements(in: numbers, match: evenNumberPredicate)
let hasOddNumber = hasElements(in: numbers, match: oddNumberPredicate)

print(hasEvenNumber)
print(hasOddNumber)
//13-21
var customersInLine: [String] = ["YoangWha", "SangYong", "SungHun", "HaMi"]
print(customersInLine)

let customerProvider: () -> String = {
    return customersInLine.removeFirst()
}
print(customersInLine.count)

print("Now serving \(customerProvider())")
print(customersInLine.count)
//13-22
var customersInLine: [String] = ["YoangWha", "SangYong", "SungHun", "HaMi"]
func serveCustomer(_ customerProvider: () -> String) {
    print("Now serving \(customerProvider())")
}
serveCustomer({customersInLine.removeFirst()})
//13-23
var customersInLine : [String] = ["YoangWha", "SangYong", "SungHun", "HaMi"]
func serveCustomer(_ customerProvider: @autoclosure () -> String){
    print("Now serving \(customerProvider())")
}
serveCustomer(customersInLine.removeFirst())
//13-24
var customersInLine : [String] = ["minjae", "innoceive", "sopress"]
func returnProvider(_ customerProvider: @autoclosure @escaping () -> String) -> (() -> String) {
    return customerProvider
}
let customerProvider: () -> String = returnProvider(customersInLine.removeFirst())
print("Now serving \(customerProvider())")
