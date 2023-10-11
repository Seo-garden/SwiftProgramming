import UIKit
//18-1
class Person {
    var name: String = ""
    var age : Int = 0
    var introduction: String {
        return "이름 : \(name), 나이 : \(age)"
    }
    func speak(){
        print("가나다라마바사")
    }
}
let yagom: Person = Person()
yagom.name = "yagom"
yagom.age = 99
print(yagom.introduction)
yagom.speak()
//18-2
class Student: Person {
    var grade: String = "F"
    func study(){
        print("study hard")
    }
}

yagom.name = "yagom"
yagom.age = 99
print(yagom.introduction)
yagom.speak()

let jay: Student = Student()
jay.name = "jay"
jay.age = 10
jay.grade = "A"
print(jay.introduction)
jay.speak()
jay.study()
//18-3
class UniversityStudent: Student {
    var major: String = ""
}
let jenny: UniversityStudent = UniversityStudent()
jenny.major = "Art"
jenny.speak()
jenny.study()
//18-4
class Person {
    var name: String = ""
    var age: Int = 0
    var introduction: String {
        return "이름: \(name), 나이 : \(age)"
    }
    func speak(){
        print("가나다라마바사")
    }
    class func introduceClass() -> String {
        return "인류의 소원은 평화입니다."
    }
}
class Student: Person {
    var grade: String = "F"
    func study(){
        print("study hard")
    }
    override func speak() {
        print("저는 학생입니다.")
    }
}
class UniversityStudent : Student {
    var major: String = ""
    class func introduceClass() {
        print(super.introduceClass())
    }
    override class func introduceClass() -> String {
        return "대학생의 소원은 A+ 입니다."
    }
    override func speak() {
        super.speak()
        print("대학생이죠")
    }
}
let yagom: Person = Person()
yagom.speak()

let jay: Student = Student()
jay.speak()

let jenny: UniversityStudent = UniversityStudent()
jenny.speak()

print(Person.introduceClass())
//18-5
class Person {
    var name: String = ""
    var age: Int = 0
    var koreanAge: Int {
        return self.age + 1
    }
    var introduction: String {
        return "이름 : \(name), 나이 : \(age)"
    }
}
class Student: Person {
    var grade: String = "F"
    override var introduction: String {
        return super.introduction + " " + "학점 : \(self.grade)"
    }
    override var koreanAge: Int {
        get {
            return super.koreanAge
        }
        set(newValue) {
            self.age = newValue - 1
        }
    }
}
let yagom: Person = Person()
yagom.name = "yagom"
yagom.age = 55
print(yagom.introduction)
print(yagom.koreanAge)

let jay: Student = Student()
jay.name = "jay"
jay.age = 14
jay.koreanAge = 15
print(jay.introduction)
print(jay.koreanAge)
//18-6
class Person {
    var name: String = ""
    var age : Int = 0 {
        didSet {
            print("Person age : \(self.age)")
        }
    }
    var koreanAge: Int {
        return self.age + 1
    }
    var fullName: String {
        get {
            return self.name
        }
        set {
            self.name = newValue
        }
    }
}
class Student: Person {
    override var age: Int {
        didSet{
            print("Student age: \(self.age)")
        }
    }
    override var koreanAge: Int {
        get {
            return super.koreanAge
        }
        set {
            self.age = newValue - 1
        }
    }
    override var fullName: String {
        didSet {
            print("Full Name : \(self.fullName)")
        }
    }
}
let yagom: Person = Person()
yagom.name = "yagom"
yagom.age = 55
yagom.fullName = "Jo Yagom"
print(yagom.koreanAge)

let jay : Student = Student()

jay.name = "jay"
jay.age = 14
jay.koreanAge = 15
jay.fullName = "Kim Jay"
print(jay.koreanAge)
//18-7
class School {
    var students: [Student] = [Student]()
    
    subscript(number: Int) -> Student {
        print("School subscripts")
        return students[number]
    }
}
class MiddleSchool: School {
    var middleStudents : [Student] = [Student]()
    
    override subscript(index: Int) -> Student {
        print("MiddleSchool subscript")
        return middleStudents[index]
    }
}
let university: School = School()
university.students.append(Student())
university[0]

let middle: MiddleSchool = MiddleSchool()
middle.middleStudents.append(Student())
middle[0]
//18-9
class Person {
    var name: String
    var age: Int
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
}
class Student: Person {
    var major: String
    init(name: String, age: Int, major: String) {
        self.major = "Swift"
        super.init(name: name, age: age)
    }
    convenience init(name: String){
        self.init(name: name, age: 7, major: "")
    }
}
let yagom: Student = Student(name: "yagom")

print(yagom.name)
print(yagom.age)
print(yagom.major)
//18-10
class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    convenience init(name: String){
        self.init(name: name, age: 0)
    }
}
class Student: Person {
    var major: String
    
    override init(name: String, age: Int){
        self.major = "Swift"
        super.init(name: name, age: age)
    }
    convenience init(name: String){
        self.init(name: name, age: 7)
    }
}
//18-11
class Person {
    var name: String
    var age: Int
    
    init(){
        self.name = "Uknown"
        self.age = 0
    }
    init?(name: String, age: Int){
        if name.isEmpty {
            return nil
        }
        self.name = name
        self.age = age
        
    }
    init?(age: Int){
        if age < 0 {
            return nil
        }
        self.name = "Unknown"
        self.age = age
    }
}
class Student: Person {
    var major: String
    override init?(name: String, age: Int){
        self.major = "Swift"
        super.init(name: name, age: age)
    }
    override init(age: Int){
        self.major = "Swift"
        super.init()
    }
}
//18-12
class Person {
    var name: String
    init(name: String){
        self.name = name
    }
    convenience init(){
        self.init(name: "Uknown")
    }
}
class Student: Person {
    var major: String = "Swift"
}
let yagom: Person = Person(name: "yagom")
let hana: Student = Student(name: "hana")

print(yagom.name)
print(hana.name)

let wizplan: Person = Person()
let jinsung: Student = Student()

print(wizplan.name)
print(jinsung.name)
