import UIKit
import Foundation
//17-3
struct Student {
    var name: String
    var number: Int
}
class School {
    var number: Int = 0
    var students: [Student] = [Student]()
    
    func addStudent(name: String) {
        let student: Student = Student(name: name, number: self.number)
        self.students.append(student)
        self.number += 1
    }
    func addStudents(names: String...){
        for name in names {
            self.addStudent(name: name)
        }
    }
    subscript(index: Int = 0) -> Student? {
        if index < self.number {
            return self.students[index]
        }
        return nil
    }
}
let highSchool: School = School()

highSchool.addStudents(names: "MiJeong", "JuHyun", "JiYoung", "Seonguk", "Moonduk")
let aStudent: Student? = highSchool[1]
print("\(aStudent?.number) \(aStudent?.name)")
Optional("JuHyun")
print(highSchool[0]?.name)
//17-3
struct Student {
    var name: String
    var number: Int
}
class School {
    var number: Int = 0
    var students : [Student] = [Student]()
    
    func addStudent(name: String){
        let student: Student = Student(name: name, number: self.number)
        self.students.append(student)
        self.number += 1
    }
    func addStudents(names: String...){
        for name in names {
            self.addStudent(name: name)
        }
    }
    subscript(index: Int) -> Student? {
        get {
            if index < self.number {
                return self.students[index]
            }
            return nil
        }
        set {
            guard var newStudent: Student = newValue else {
                return
            }
            var number: Int = index
            
            if index > self.number {
                number = self.number
                self.number += 1
            }
            
            newStudent.number = number
            self.students[number] = newStudent
        }
    }
    subscript(name: String) -> Int? {
        get {
            return self.students.filter {$0.name == name}.first?.number
        }
        set {
            guard var number: Int = newValue else {
                return
            }
            if number > self.number {
                number = self.number
                self.number += 1
            }
            
            let newStudent: Student = Student(name: name, number: number)
            self.students[number] = newStudent
        }
    }
    subscript(name: String, number:Int) -> Student? {
        return self.students.filter{$0.name == name && $0.number == number}.first
    }
}

let highSchool: School = School()
highSchool.addStudents(names: "MiJeong", "JuHyun", "JiYoung", "Seonguk", "Moonduk")

let aStudent: Student? = highSchool[1]
print("\(aStudent?.number) \(aStudent?.name)")

print(highSchool["MiJeong"])
print(highSchool["DongJin"])

highSchool[0] = Student(name: "HongJun", number: 0)
highSchool["MangGu"] = 1

print(highSchool["JuHyun"])
print(highSchool["MangGu"])
print(highSchool["SeongUk", 3])
print(highSchool["HeeJin", 3])

enum School1 : Int {
    case elementary = 1, middle, high, university
    
    static subscript(level : Int) -> School1? {
        return Self(rawValue: level)
    }
}

let school: School1? = School1[2]

print(school)
