//
//  View2.swift
//  MVC_Assignment
//
//  Created by Mohd Raza on 12/05/22.
//

import UIKit


class PersonImagesView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    let label = UILabel()
    let tapButton = UIButton()

    public override init(frame: CGRect) {
        super.init(frame:frame)
        label.frame = CGRect(x: 80, y: 450, width: 300 , height: 50)
        tapButton.frame = CGRect(x: 120, y: 550, width: 110, height: 80)
        
    }
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    func setLabelText(_ imagesLeft: String) {
        label.text = imagesLeft
        label.font = UIFont.systemFont(ofSize: 30.0)
        self.addSubview(label)
    }
    func addImageToUIImageView(_ imgName1 : UIImage, _ imgName2: UIImage, _ imgName3 : UIImage, _ imgName4: UIImage ){
        let yourImage1: UIImage = imgName1
        let imageView1 = UIImageView(image: yourImage1)
        imageView1.frame = CGRect(x: 0 , y:50, width: 180, height:180)
        self.addSubview(imageView1)
        
        let yourImage2: UIImage = imgName2
        let imageView2 = UIImageView(image: yourImage2)
        imageView2.frame = CGRect(x: 0 , y:250, width: 180, height:180)
        self.addSubview(imageView2)
        
        let yourImage3: UIImage = imgName3
        let imageView3 = UIImageView(image: yourImage3)
        imageView3.frame = CGRect(x: 200 , y:50, width: 180, height:180)
        self.addSubview(imageView3)
        
        let yourImage4: UIImage = imgName4
        let imageView4 = UIImageView(image: yourImage4)
        imageView4.frame = CGRect(x: 200 , y:250, width: 180, height:180)
        self.addSubview(imageView4)
        
    }
    func dimissButton(){
        tapButton.isUserInteractionEnabled = true
        
        tapButton.setTitle("Dismiss", for: .normal)
        tapButton.backgroundColor = .yellow
        tapButton.setTitleColor(UIColor.black, for: .normal)
        tapButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.addSubview(tapButton)
        
    }
    @objc func buttonTapped(){
       
        self.removeFromSuperview()
        
    }
   

}
