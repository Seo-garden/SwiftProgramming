//0921
import UIKit
import Foundation
//7-15
//typealias MoveFunc = (Int) -> Int
//
//func functionForMove(_ shouldGoLeft : Bool) -> MoveFunc {
//    func goRight(currentPosition: Int) -> Int{  //변환 타입이 그대로 이기때문에 와일드카드 식별자를 사용하지 않아도 된다.
//        return currentPosition + 1
//    }
//
//    func goLeft(currentPosition: Int) -> Int{   //
//        return currentPosition - 1
//    }
//
//    return shouldGoLeft ? goLeft : goRight
//}
//
//var position: Int = 3
//
//let moveToZero: MoveFunc = functionForMove(position > 0)
//print("원점으로 돌아갑니다.")
//
//while position != 0{
//    print("\(position)")
//    position = moveToZero(position)
//}
//print("원점 도착!")
//7-16
//func crashAndBurn() -> Never{
//    fatalError("Something very, very bad happend")
//}
//
//crashAndBurn()
//
//func someFunction(isAllisgood : Bool) {
//    guard isAllisgood else {
//        print("마을에 도둑이 들었습니다.")
//        crashAndBurn()
//    }
//    print("All is well")
//}
//someFunction(isAllisgood: true)
//someFunction(isAllisgood: false)
//7-17
//func say(_ something: String) -> String {
//    print(something)
//    return something
//}
//
//@discardableResult func discadableResultSay (_ something: String) -> String {
//    print(something)
//    return something
//}
//
//say("hello")
//
//discadableResultSay("hello")
//8-4
//func checkOptionalValue(value optionalValue: Any?){
//    switch optionalValue {
//    case .none:
//        print("This Optional variable is nil")
//    case .some(let value):
//        print("Value is \(value)")
//    }
//}
//var myName: String? = "yagom"
//checkOptionalValue(value: myName)
//
//myName = nil
//checkOptionalValue(value: myName)
//8-5
//let numbers: [Int?] = [2, nil, -4, nil, 100]
//
//for number in numbers {
//    switch number {
//    case .some(let value) where value < 0:
//        print("Negative value \(value)")
//    
//    case .some(let value) where value > 10:
//        print("Positive value \(value)")
//    case .some(let value) :
//        print("value \(value)")
//    case .none:
//        print("nil")
//    }
//    
//}
//8-6
//var myName : String? = "yagom"
//
//var yagom : String = myName!
//
//myName = nil
////yagom = myName!
//
//if myName != nil {
//    print("my name is \(myName!)")
//} else {
//    print("My name == nil")
//}
//8-7
var myName: String? = "yagom"

if let name = myName {
    print("My name is \(myName)")
} else {
    print("myName == nil")
}
if var name = myName {
    name = "wizplan"
    print("My name is \(name)")
} else {
    print("my name == nil")
}
