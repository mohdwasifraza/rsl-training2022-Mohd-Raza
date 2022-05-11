import UIKit


class Student{
    var name : String
    var studentId : String
    var branch : String
    var year : Int
    var grade : String
    
    init(_ name:String, _ studentId : String, _ branch :String, _ year : Int, _ grade : String) {
        self.name=name
        self.studentId=studentId
        self.branch=branch
        self.year=year
        self.grade=grade
    }
    func viewProfessorDetails(){
        let size=College.shared.professorArray.count
        for i in 0..<size{
            print(i+1 ,"Professor's name is ", College.shared.professorArray[i].name)
            print(i+1 , "Professor's id is ", College.shared.professorArray[i].professorId)
            print(i+1 , "Professor's branch is ",College.shared.professorArray[i].branch)
        }
        
    }
    
}
class Professor{
    var name : String
    var professorId : String
    var branch : String
    
    init(_ name:String, _ professorId : String, _ branch :String) {
        self.name=name
        self.professorId=professorId
        self.branch=branch
        
    }
    func updateStudentGrades(name: String, grade:String){
        let size=College.shared.studentArray.count
        for i in 0..<size{
            if College.shared.studentArray[i].name == name {
                print("Before upgradation - Name :", College.shared.studentArray[i].name ," and Grade is ", College.shared.studentArray[i].grade)
                College.shared.studentArray[i].grade = grade
                print("After upgradation - Name :", College.shared.studentArray[i].name ," and Grade is ", College.shared.studentArray[i].grade)
            }
            
        }
    }
}
class College{
    static let shared = College()
    private init(){}
    
    var studentArray = [Student]()
    var professorArray = [Professor]()
    func createStudentArray(){
        
        studentArray.append(Student("Wasif","7889456","ECE",2018,"A"))
        studentArray.append(Student("Akhilesh","9889456","CSE",2019,"A"))
        studentArray.append(Student("Amit","7889456","ME",2019,"A"))
    }
    
    func createProfessorArray(){
        professorArray.append(Professor("Prof. Newton","7896","ECE"))
        professorArray.append(Professor("Prof. Einstein","4569","CSE"))
    }
    
}
College.shared.createStudentArray()
College.shared.createProfessorArray()
let student1 = Student("Wasif","7889456","ECE",2018,"A")
student1.viewProfessorDetails()
print()
let professor1 = Professor("Prof. Newton","7896","ECE")
professor1.updateStudentGrades(name: "Wasif", grade: "B")
