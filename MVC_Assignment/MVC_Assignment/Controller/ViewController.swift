//
//  ViewController.swift
//  MVC_Assignment
//
//  Created by Mohd Raza on 12/05/22.
//

import UIKit

class ViewController: UIViewController, updatePersonDetails, ViewPersonDetails{
    
    var bc = Person()
    var vc = PersonDetailsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetup()
    }
    
    func viewSetup(){
        initializeView()
        self.vc.setFirstName(self.bc.firstName)
        self.vc.setLastName(self.bc.lastName)
        self.vc.setAge(self.bc.age)
        self.vc.setHeight(self.bc.height)
        self.vc.setCity(self.bc.city)
        self.vc.addImageToUIImageView(self.bc.images[0]!)
        self.vc.setProfileViewed(self.bc.profileViewed)
        
    }
    func didTapButton() {
        updateDetails()
        let perImg = PersonImagesView()
        perImg.frame = CGRect(x:0, y:0, width:view.frame.size.width
                              , height:view.frame.size.height)
        perImg.backgroundColor = .gray
        perImg.addImageToUIImageView(self.bc.images[1]!, self.bc.images[2]!, self.bc.images[4]!, self.bc.images[3]!)
        let str = String(self.bc.images.count - 4) + " more profile images"
        perImg.setLabelText(str)
        perImg.dimissButton()
        view.addSubview(perImg)
    }
    
    func initializeView(){
        self.vc.frame = CGRect(x:20, y:300, width:self.vc.frame.size.width, height:self.vc.frame.size.height)
        self.vc.personDelegate=self
        self.vc.isUserInteractionEnabled = true
        view.addSubview(vc)
    }
    
    func updateDetails() {
        self.bc.profileViewed = true
        self.vc.setProfileViewed(self.bc.profileViewed)
    }
    
    


}

