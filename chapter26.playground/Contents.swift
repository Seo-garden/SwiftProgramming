import UIKit

let tuples: [(Int, Int)] = [(1,2), (1,-1), (1,0), (0,2)]
// 값 바인딩, 와일드카드 패턴
for tuple in tuples {
    switch tuple {
    case let (x,y) where x == y : print("x == y")
    case let (x,y ) where x == -y : print("x == -y")
    case let (x,y) where x > y : print("x > y")     //값 바인딩
    case (1, _) : print("x == 1")
    case (_, 2) : print("y == 2")                   //와일드카드
    default: print("\(tuple), \(tuple)")
    }
}
var repeatCount : Int = 0
//값 바인딩 패턴
for tuple in tuples {
    switch tuple {
    case let (x,y) where x == y && repeatCount > 2 : print("x == y")
    case let (x,y) where repeatCount < 2 : print("\(x), \(y)")
    default : print("Nothing")
    }
    repeatCount += 1
}

let firstValue : Int = 50
let secondValue : Int = 30

switch firstValue + secondValue {
case let total where total > 100 : print("total > 100")
case let total where total < 0 : print("total < 0")
case let total where total == 0 : print("total == 0")
case let total : print(total)
}
//26-2
let arrayOfOptionalInts : [Int?] = [nil, 2, 3, nil, 5]
for case let number? in arrayOfOptionalInts where number > 2 {
    print("Found a \(number)")
}
//26-5
protocol SelfPrintable {
    func printSelf()
}
struct Person: SelfPrintable{}
extension Int : SelfPrintable {}
extension UInt : SelfPrintable {}
extension String : SelfPrintable{}
extension Double : SelfPrintable {}

extension SelfPrintable where Self : FixedWidthInteger, Self: SignedInteger {
    func printSelf() {
        print("FixedWidthInteger 와 SignedInteger 을 준수하면서 SelfPrintable 을 준수하는 타입 \(type(of: self))")
    }
}
extension SelfPrintable where Self : CustomStringConvertible {
    func printSelf(){
        print("CustomStringConvertible 을 준수하면서 SelfPrintable 을 준수하는 타입 \(type(of: self))")
    }
}
extension SelfPrintable {
    func printSelf(){
        print("그 외의 SelfPrintable 을 준수하는 타입 \(type(of: self))")
    }
}
//26-6
//타입 매개변수 T 가 BinaryInteger 프로토콜을 준수하는 타입
func doubled<T>(integerValue : T) -> T where T: BinaryInteger {
    return integerValue * 2
}
func doubled2<T : BinaryInteger>(integerValue: T) -> T{         //위의 코드와 동일한 표현
    return integerValue * 2
}
//타입 매개변수 T 와 U 가 CustomStringCOnvertible 프로토콜을 준수하는 타입
func prints<T, U>(first: T, second : U) where T: CustomStringConvertible, U:CustomStringConvertible {
    print(first)
    print(second)
}
func prints2<T: CustomStringConvertible, U: CustomStringConvertible>(first: T, second: U){
    print(first)
    print(second)
}

