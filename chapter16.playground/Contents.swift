import UIKit

func addThree(_ num: Int) -> Int{
    return num + 3
}
addThree(2)
print(addThree(2))
//16-7
func doubledEven(_ num: Int) -> Int? {
    if num.isMultiple(of: 2){
        return num * 2
    }
    return nil
}
Optional(3).flatMap(doubledEven)
//16-8
let optionals: [Int?] = [1,2,nil,5]

let mapped: [Int?] = optionals.map{$0}
let compactMapped: [Int] = optionals.compactMap{$0}

print(mapped)
print(compactMapped)
//16-9
let multipleContainer = [[1,2,Optional.none], [2, 3, Optional.none], [4,5,Optional.none]]

let mappedMultipleContainer = multipleContainer.map{$0.map {$0}}
let flatmappedMultipleContainer = multipleContainer.flatMap{$0.flatMap{$0}}
print(mappedMultipleContainer)
print(flatmappedMultipleContainer)
//16-10
func stringToInteger(_ string: String) -> Int? {
    return Int(string)
}

func integerToString(_ integer: Int) -> String? {
    return "\(integer)"
}
var optionalString: String? = "2"

let flattenResult = optionalString.flatMap(stringToInteger).flatMap(integerToString).flatMap(stringToInteger)

print(flattenResult)
//16-12
var result: Int?
if let string: String = optionalString {
    if let number: Int = stringToInteger(string){
        if let finalString: String = integerToString(number){
            if let finalNumber: Int = stringToInteger(finalString){
                result = Optional(finalNumber)
            }
        }
    }
}
print(result)

if let string: String = optionalString,
   let number: Int =  stringToInteger(string),
   let finalString: String = integerToString(number),
   let finalNumber: Int = stringToInteger(finalString){
    result = Optional(finalNumber)
}
print(result)
