import Foundation

var numbers: [Int] = [1,2,3]

func nonReferenceParameter(arr : [Int]){
    var copiedArr: [Int] = arr
    copiedArr[1] = 1
}

func referenceParameter(arr: inout [Int]){
    arr[1] = 1
}

nonReferenceParameter(arr: numbers)
print(numbers[1])
referenceParameter(arr: &numbers)
print(numbers[1])

//import Foundation
//
//var numbers: [Int] = [1,2,3]
//
//func nonReferenceParameter(_ arr : [Int]){
//var copiedArr: [Int] = arr
//copiedArr[1] = 1
//}
//
//func referenceParameter(_ arr: inout [Int]){
//arr[1] = 1
//}
//
//nonReferenceParameter(numbers)
//print(numbers[1])
//referenceParameter(&numbers)
//print(numbers[1])

//import Foundation
//
//func sayHello(_ name: String, times: Int = 3 ) -> String{
//    var result : String = ""
//    for _ in 0..<times{
//        result += "Hello \(name)"
//    }
//    return result
//}
//
//print(sayHello("상호"))
