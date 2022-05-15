//
//  ContactDetailsViewController.swift
//  UITableView_Programmatically
//
//  Created by Mohd Raza on 15/05/22.
//

import UIKit

class ContactDetailsViewController: UIViewController {
    
    let userName = UILabel()
    let userPhone = UILabel()
    let userEmail = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        userName.font = UIFont.systemFont(ofSize: 22)
        userPhone.font = UIFont.systemFont(ofSize: 20)
        userEmail.font = UIFont.systemFont(ofSize: 20)
        userName.frame = CGRect(x:50, y:100, width:300, height: 50)
        userPhone.frame = CGRect(x:50, y:150, width:300, height: 50)
        userEmail.frame = CGRect(x:50, y:200, width:300, height: 50)
        
       
        self.view.backgroundColor = .yellow
        self.view.addSubview(userName)
        self.view.addSubview(userPhone)
        self.view.addSubview(userEmail)
        
        

        // Do any additional setup after loading the view.
    }
    func setNamePhoneEmail(_ name : String , _ phone: String, _ email: String ){
        userName.text = "Name : " + name
        userPhone.text = "Phone Number : "+phone
        userEmail.text = "Email : " + email
    }
    

    

}
