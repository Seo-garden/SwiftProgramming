import UIKit
import Foundation
import SwiftUI

let names: [String] = ["wizplan", "eric", "yagom", "jenny"]
//13-3
func backwards(first: String, second: String) -> Bool {
    print("\(first), \(second) 비교중")
    return first > second
}
let reversed: [String] = names.sorted(by: backwards)
print(reversed)


//13-4
let reserved: [String] = names.sorted(by: { (first: String, second: String) -> Bool in
    return first > second
})
print(reserved)
