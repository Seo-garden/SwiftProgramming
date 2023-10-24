import UIKit
import Foundation

//21-4
extension Int {
    func multiple(by n : Int) -> Int{
        return self * n
    }
    mutating func multiplySelf(by n : Int){
        self = self.multiple(by: n)
    }
    static func isIntTypeInstance(_ instance : Any) -> Bool {
        return instance is Int
    }
}

print(3.multiple(by: 2))
print(4.multiple(by: 5))

var number: Int = 3
number.multiplySelf(by: 2)
print(number)

number.multiplySelf(by: 3)
print(number)
print("---")
Int.isIntTypeInstance(number)
Int.isIntTypeInstance(3)
Int.isIntTypeInstance(3.0)
Int.isIntTypeInstance("3")
