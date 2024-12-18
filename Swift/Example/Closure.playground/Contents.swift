import Cocoa
import Foundation


struct Student {
  let name: String
  let testScores: Int
}

let students = [Student(name: "Luke", testScores: 88),
              Student(name: "Han", testScores: 73),
              Student(name: "Leia", testScores: 95),
              Student(name: "Chewy", testScores: 78),
              Student(name: "Obi-Wan", testScores: 65),
              Student(name: "Ahsoka", testScores: 86),
              Student(name: "Yoda", testScores: 66),]
var topStudentFilter:(Student) -> Bool = { student in
  return student.testScores >= 80
}

func topStudentFilterF (student:Student) -> Bool {
  return student.testScores >= 70
}


let topStudents = students.filter(topStudentFilter)

let studentRabking = topStudents.sorted {
  student1, student2 in
  return student1.testScores > student2.testScores
}

for student in topStudents {
  print(student.name)
}
