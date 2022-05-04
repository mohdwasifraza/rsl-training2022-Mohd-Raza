//
//  CustomViewClass.swift
//  Ass1
//
//  Created by Mohd Raza on 02/05/22.
//

import UIKit

class CustomViewClass: UIView {

  
    var count=0
    let button = UIButton(frame:CGRect(x:100, y:100, width:100, height:100))
    
    
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    let eyeImage = UIImage(named: "eye.jpg")
    let myImageView:UIImageView = UIImageView()
    let mySlider = UISlider(frame:CGRect(x: 80, y: 400, width: 100, height: 20))
    let switchOnOff = UISwitch(frame:CGRect(x: 250, y: 150, width: 0, height: 0))
    public override init(frame: CGRect) {
        super.init(frame:frame)
        buttonCount()
        labelL()
        sliderr()
        image()
        switchCount()
        backgroundTapCount()
        
        
    }
    
    func buttonCount(){
        button.setTitle("Count Button", for: .normal)
        button.backgroundColor = .systemGray
        button.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        button.isEnabled = false
        self.addSubview(button)
        
    }
    func labelL(){
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "\(count)"
        self.addSubview(label)
        
    }
    @objc func onClick() {
        count=count+1
        label.text="\(count)"
        backgroundColorChange()
        
    }
    func image(){
        
        myImageView.contentMode = UIView.ContentMode.scaleAspectFit
        myImageView.frame = CGRect(x: 80, y: 500, width: 200, height: 200)
        myImageView.image = eyeImage
        self.addSubview(myImageView)
        
    }
    func sliderr(){
        mySlider.minimumValue = 0
        mySlider.maximumValue = 1
        mySlider.addTarget(self, action: #selector(self.sliderValueDidChange), for: .valueChanged)
        self.addSubview(mySlider)
                        
    }
    
    func switchCount(){
        switchOnOff.addTarget(self, action: #selector(self.switchStateDidChange(_:)), for: .valueChanged)
        switchOnOff.setOn(false, animated: false)
        self.addSubview(switchOnOff)
        
    }
    
    func backgroundTapCount(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        //tap.cancelsTouchesInView = false
       self.addGestureRecognizer(tap)
        
    }
    func backgroundColorChange(){
        if count==0{
            self.backgroundColor = UIColor.white
        }
        else if count<0{
            self.backgroundColor = UIColor.red
        }
        else{
            self.backgroundColor = UIColor.green
            
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        //handling code
        count=count-1
        label.text="\(count)"
        backgroundColorChange()
    }
    @objc func switchStateDidChange(_ sender:UISwitch){
        if (sender.isOn == true){
            
            button.isEnabled = true
            
        }
        else{
            button.isEnabled = false
            
        }
        
    }
    @objc func sliderValueDidChange(){
        myImageView.alpha = CGFloat(mySlider.value)
    }
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
}
