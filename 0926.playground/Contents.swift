import UIKit
import Foundation
import SwiftUI

//11-8
enum Student {
    case elementary, middle, high
    case none
    init(){
        self = .none
    }
    init(koreanAge: Int){
        switch koreanAge{
        case 8...13:
            self = .elementary
        case 14...16:
            self = .middle
        case 17...19:
            self = .high
        default:
            self = .none
        }
    }
    init(bornAt: Int, currentYear: Int){
        self.init(koreanAge: currentYear - bornAt + 1)
    }
}
var younger: Student = Student(koreanAge: 16)
print(younger)
younger = Student(bornAt: 1998, currentYear: 2016)
print(younger)
11-9
class Person{
    let name: String
    var age: Int?
    
    init?(name: String){
        if name.isEmpty{
            return nil
        }
        self.name = name
    }
    init?(name: String, age: Int){
        if name.isEmpty || age < 0{
            return nil
        }
        self.name = name
        self.age = age
    }
}
let yagom: Person? = Person(name: "yagom", age: 99)

if let person: Person = yagom {
    print(person.name)
} else {
    print("Person wasn't initialized")
}

let chope: Person? = Person(name: "chope", age: -10)
if let person: Person = chope {
    print(person.name)
} else {
    print("Person wasn't initialized")
}

let eric: Person? = Person(name: "", age: 30)

if let person: Person = eric {
    print(person.name)
}else {
    print("Person wasn't initialized")
}
11-12
struct Student {
    var name: String?
    var number: Int?
}
class SchoolClass {
    var students: [Student] = {
        var arr: [Student] = [Student]()
        
        for num in 1...15 {
            var student: Student = Student(name: nil, number: num)
            arr.append(student)
        }
        return arr
    }()
}
let myClass: SchoolClass = SchoolClass()
print(myClass.students.count)
11-13
class SomeClass {
    deinit{
        print("디이니셜라이저로 인한 해제")
    }
}
var instance: SomeClass? = SomeClass()
instance = nil
11-14
class FileManager {
    var fileName: String
    init(fileName: String){
        self.fileName = fileName
    }
    func openFile(){
        print("Open File: \(self.fileName)")
    }
    func modifyFile(){
        print("Modify File: \(self.fileName)")
    }
    func writeFile(){
        print("Write File: \(self.fileName)")
    }
    func closeFile(){
        print("Close File: \(self.fileName)")
    }
    deinit{
        print("Deinit instance")
        self.writeFile()
        self.closeFile()
    }
    
}
var fileManager: FileManager? = FileManager(fileName: "abc.txt")

if let manager: FileManager = fileManager {
    manager.openFile()
    manager.modifyFile()
    
}
fileManager = nil
//12-2
open class NSString: NSObject, NSCopying, NSMutableCopying, NSSecureCoding {
    open var length: Int {get}
    open func character(at index: Int) -> unichar
    public init()
    public init?(coder aDecoder: NSCoder)
}
