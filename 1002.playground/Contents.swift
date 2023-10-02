import UIKit
import SwiftUI

//13-1, //13-3
let names : [String] = ["wizplan", "eric", "yagom", "jenny"]

func backwards(first: String, second: String) -> Bool {
    print("\(first), \(second) 비교중")
    return first > second
}

let reversed : [String] = names.sorted(by: backwards)
print(reversed)

//13-4
let reversed1: [String] = names.sorted(by: { (first: String, second: String) -> Bool in
    return first > second
})
print(reversed1)
//13-5 후행 클로저의 사용
let reversed2: [String] = names.sorted() {(first: String, second: String) -> Bool in
    return first > second
}
let reversed3: [String] = names.sorted {(first: String, second: String) -> Bool in
    return first > second
}
func doSomething(do: (String) -> Void, onSuccess: (Any) -> Void, onFailure: (Error) -> Void){
    
}
doSomething{(someString: String) in
} onSuccess: { (result : Any) in
} onFailure: { (error: Error) in
}
//13-6 클로저의 타입 유추 어차피 sorted 메서드를 사용해서 first, second 는 string 타입으로 인지하고 어차피 반환타입은 Bool 타입이기 때문에 생략이 가능하다.
let reversed4: [String] = names.sorted {(first, second) in return first > second}
//13-7 단축 인자 이름 사용
let reversed5: [String] = names.sorted {return $0 > $1}
//13-8 암시적 반환 표현의 사용
let reversed6: [String] = names.sorted {$0 > $1}
//13-11 makeIncrementer(forIncrement:) 함수
func makeIncrementer(_ amount: Int) -> (() -> Int) {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementByTwo: (() -> Int) = makeIncrementer(_ : 2)

let first: Int = incrementByTwo()
let second: Int = incrementByTwo()
let third: Int = incrementByTwo()
