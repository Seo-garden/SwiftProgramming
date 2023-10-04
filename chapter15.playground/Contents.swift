import UIKit
//15-1
let numbers: [Int] = [0,1,2,3,4]

var doubledNumbers: [Int] = [Int]()
var strings: [String] = [String]()

//for 구문 사용
for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}
print(doubledNumbers)
print(strings)
//map 메서드 사용
doubledNumbers = numbers.map({(number: Int) -> Int in
    return number * 2})
strings = numbers.map({(number: Int) -> String in
    return "\(number)"})
print(doubledNumbers)
print(strings)
//15-2
var doubleNumbers = numbers.map({(number: Int)-> Int in
    return number * 2
})
doubleNumbers = numbers.map({return $0 * 2})
print(doubledNumbers)

doubleNumbers = numbers.map({$0 * 2})
print(doubledNumbers)

doubleNumbers = numbers.map{$0 * 2 }
print(doubledNumbers)

//15-4
let alphabetDictionary: [String: String] = ["a" : "A", "b" : "B"]
var keys: [String] = alphabetDictionary.map({(tuple: (String, String)) -> String
    in return tuple.0})
keys = alphabetDictionary.map{$0.0}
let values: [String] = alphabetDictionary.map{$0.1}
print(keys)
print(values)

var numberSet: Set<Int> = [1,2,3,4,5]
let resultSet = numberSet.map{ $0 * 2}
print(resultSet)

let optionalInt: Int? = 3
let resultInt: Int? = optionalInt.map {$0 * 2}
print(resultInt)

let range: CountableClosedRange = (0...3)
let resultRange: [Int] = range.map{$0 * 2}
print(resultRange)
