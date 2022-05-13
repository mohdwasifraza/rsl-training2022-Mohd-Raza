//
//  View1.swift
//  MVC_Assignment
//
//  Created by Mohd Raza on 12/05/22.
//

import UIKit
protocol ViewPersonDetails{
    func didTapButton()
}
class PersonDetailsView: UIView {
    var personDelegate : ViewPersonDetails!
    let personFirstName = UILabel()
    let personLastName = UILabel()
    
    let age = UILabel()
    let city = UILabel()
    let height = UILabel()
    let profileViewed = UILabel()
    let tapButton = UIButton()
    
    var mYourImageViewOutlet: UIImageView?
    public override init(frame: CGRect) {
        super.init(frame:frame)
        self.frame = CGRect(x:80, y:180, width:400, height: 400)
        //self.backgroundColor = .gray
        personFirstName.frame = CGRect(x:  170, y: 0, width:180, height: 25)
        personLastName.frame = CGRect(x: 300, y: 30, width: frame.size.width - 130, height: 25)
        age.frame  = CGRect(x: 300, y: 60, width: frame.size.width - 130, height: 25)
        city.frame = CGRect(x: 300, y: 90, width: frame.size.width - 130, height: 25)
        height.frame = CGRect(x: 300, y: 120, width: frame.size.width - 130, height: 25)
        profileViewed.frame = CGRect(x: 170, y: 150, width: 180, height: 25)
        tapButton.frame = CGRect(x: 100, y: 200, width: 110, height: 80)
        addButton()
    }
    
    func addButton(){
        tapButton.isUserInteractionEnabled = true
        
        tapButton.setTitle("Tap Me", for: .normal)
        tapButton.backgroundColor = .gray
        tapButton.setTitleColor(UIColor.black, for: .normal)
        tapButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.addSubview(tapButton)
        
    }
    @objc func buttonTapped(){
        //print("xyz")
        personDelegate.didTapButton()
    }
    func addImageToUIImageView(_ imgName : UIImage){
        let yourImage: UIImage = imgName
        let imageView = UIImageView(image: yourImage)
        imageView.frame = CGRect(x: 0 , y:0, width: 150, height:200)
        self.addSubview(imageView)
        
    }
        
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func setFirstName(_ firstName: String) {
        personFirstName.text = "FirstName : "+firstName
        self.addSubview(personFirstName)
    }

    func setLastName(_ lastName: String) {
        personLastName.text = "LastName : "+lastName
        self.addSubview(personLastName)
    }

    func setAge(_ agei: Int) {
        self.age.text = "Age : " + String(agei)
        self.addSubview(age)
    }
    func setCity(_ agei: String) {
        self.city.text = "City : " + agei
        self.addSubview(city)
    }
    func setHeight(_ heighte: Float){
        let string = "height : \(heighte)"
        self.height.text = string
        self.addSubview(height)
    }
    func setProfileViewed(_ viewd : Bool){
        let string = "Profile Viewed: \(viewd)"
        self.profileViewed.text = string
        self.addSubview(profileViewed)
    }

}
