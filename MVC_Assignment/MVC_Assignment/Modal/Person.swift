//
//  modal.swift
//  MVC_Assignment
//
//  Created by Mohd Raza on 12/05/22.
//

import Foundation
import UIKit
protocol updatePersonDetails{
    func updateDetails()
}
class Person{
    var updateDelegate : updatePersonDetails!
    let firstName :String
    let lastName : String
    let age : Int
    let city : String
    let height : Float
    let images = [UIImage(named: "per"),UIImage(named: "one"),UIImage(named: "two"),UIImage(named: "three"),UIImage(named: "four"),UIImage(named: "five"),UIImage(named: "six"),]
    var profileViewed : Bool
    init(){
        self.firstName="wasif"
        self.lastName="raza"
        self.age=25
        self.city="pune"
        self.height=5.6
        self.profileViewed = false
    }
    func updateBooleanValue(){
        self.updateDelegate.updateDetails()
    }
    
}
