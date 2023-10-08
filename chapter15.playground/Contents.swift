import UIKit
//15-1
//let numbers: [Int] = [0,1,2,3,4]
//
//var doubledNumbers: [Int] = [Int]()
//var strings: [String] = [String]()
//
////for 구문 사용
//for number in numbers {
//    doubledNumbers.append(number * 2)
//    strings.append("\(number)")
//}
//print(doubledNumbers)
//print(strings)
////map 메서드 사용
//doubledNumbers = numbers.map({(number: Int) -> Int in
//    return number * 2})
//strings = numbers.map({(number: Int) -> String in
//    return "\(number)"})
//print(doubledNumbers)
//print(strings)
////15-2
//var doubleNumbers = numbers.map({(number: Int)-> Int in
//    return number * 2
//})
//doubleNumbers = numbers.map({return $0 * 2})
//print(doubledNumbers)
//
//doubleNumbers = numbers.map({$0 * 2})
//print(doubledNumbers)
//
//doubleNumbers = numbers.map{$0 * 2 }
//print(doubledNumbers)
//
////15-4
//let alphabetDictionary: [String: String] = ["a" : "A", "b" : "B"]
//var keys: [String] = alphabetDictionary.map({(tuple: (String, String)) -> String
//    in return tuple.0})
//keys = alphabetDictionary.map{$0.0}
//let values: [String] = alphabetDictionary.map{$0.1}
//print(keys)
//print(values)
//
//var numberSet: Set<Int> = [1,2,3,4,5]
//let resultSet = numberSet.map{ $0 * 2}
//print(resultSet)
//
//let optionalInt: Int? = 3
//let resultInt: Int? = optionalInt.map {$0 * 2}
//print(resultInt)
//
//let range: CountableClosedRange = (0...3)
//let resultRange: [Int] = range.map{$0 * 2}
//print(resultRange)
//15.2 필터
//15-5
//let numbers: [Int] = [0,1,2,3,4,5]
//
//let evenNumbers: [Int] = numbers.filter{ (number: Int) -> Bool in
//    return number % 2 == 0
//}
//print(evenNumbers)
//
//let oddNumbers: [Int] = numbers.filter{ $0 % 2 == 1}
//print(oddNumbers)
//15-7
let numbers: [Int] = [1,2,3]

var sum: Int = numbers.reduce(0, {(result: Int, next: Int) -> Int in
    print("\(result) + \(next)")
    return result + next
})
print(sum)

let substract: Int = numbers.reduce(0, {(result: Int, next: Int) -> Int in
    print("\(result) - \(next)")
    return result - next
})

let sumFromThere : Int = numbers.reduce(3){
    print("\($0) + \($1)")
    return $0 + $1
}
print(sumFromThere)

var subtractFromThree : Int = numbers.reduce(3){
    print("\($0) - \($1)")
    return $0 - $1
}

print(subtractFromThree)

let names: [String] = ["Chope", "Jay", "Joker", "Nova"]

let reducenames: String = names.reduce("yagom's friends : "){
    return $0 + ", " + $1
}

print(reducenames)

sum = numbers.reduce(into : 0, {(result: inout Int, next: Int) in
    print("\(result) + \(next)")
    result += next
})

print(sum)

subtractFromThree = numbers.reduce(into: 3, {
    print("\($0) - \($1)")

    $0 -= $1
})
print(subtractFromThree)

var doubledNumbers: [Int] = numbers.reduce(into: [1,2]) {(result: inout
                                                          [Int], next: Int) in
    print("result: \(result) next: \(next)")
    guard next.is else {
        return
    }
    print("\(result) append \(next)")
    result.append(next * 2)
}

print(doubledNumbers)

doubledNumbers = [1,2] + numbers.filter{$0.isMultiple(of: 2)}.map{$0 * 2}
print(doubledNumbers)
var upperCasedNames: [String]
upperCasedNames = names.reduce(into: [], {
    $0.append($1.uppercased())
})
print(upperCasedNames)
