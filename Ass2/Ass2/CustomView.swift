//
//  CustomView.swift
//  Ass2
//
//  Created by Mohd Raza on 04/05/22.
//

import UIKit

class CustomView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    
    
    //labelS.center = CGPoint(x: 160, y: 285)
    var count = 0
    var round=0
    var popup:UIView!
    var dict:[Int:Int]=[:]
    let mySlider = UISlider(frame:CGRect(x: 50, y: 400, width: 280, height: 20))
    let roundlabel = UILabel(frame: CGRect(x: 220, y: 650, width: 100, height: 50))
    let labelS = UILabel(frame: CGRect(x: 110, y: 650, width: 100, height: 50))
    let label = UILabel(frame: CGRect(x: 20 , y: 200, width: 400, height: 15))
    
    public override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor=UIColor.green
        labelRandom()
        sliderr()
        buttonStartOver()
        allLabels()
        buttonInfo()
        
    }
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    func allLabels(){
        labelS.text = "Score: "
        self.addSubview(labelS)
        
        roundlabel.text="Round: \(round)"
        self.addSubview(roundlabel)
        
        let hitMe = UILabel(frame: CGRect(x: 170, y: 450, width: 100, height: 50))
        hitMe.text="Hit ME"
        hitMe.textColor=UIColor.blue
        hitMe.font = hitMe.font.withSize(25)
        self.addSubview(hitMe)
        
    }
    func labelRandom(){
        //label.center = CGPoint(x: 160, y: 285)
        
        label.textAlignment = .center
        count = Int.random(in: 1..<100)
        label.text = "Try to Hit as close as possible to:   \(count)"
        self.addSubview(label)
        
    }
    func buttonStartOver(){
        let button = UIButton(frame:CGRect(x:0, y:650, width:100, height:50))
        button.setTitle("Start Over", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.addTarget(self, action: #selector(startOnClick), for: .touchUpInside)
        //button.isEnabled = false
        self.addSubview(button)
    }
    
    @objc func startOnClick() {
        count=0
        round=0
        roundlabel.text="Round: \(round)"
        labelS.text = "Score: "
        mySlider.value=0
        dict=[:]
    }
    func buttonInfo(){
        let button = UIButton(frame:CGRect(x:300, y:650, width:100, height:50))
        button.setTitle("Info", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.addTarget(self, action: #selector(infoOnClick), for: .touchUpInside)
        //button.isEnabled = false
        self.addSubview(button)
    }
    @objc func infoOnClick() {
        showAlert()
        
    }
    func sliderr(){
        
        mySlider.minimumValue = 0
        mySlider.maximumValue = 100
        mySlider.isContinuous=false
        mySlider.addTarget(self, action: #selector(self.sliderValueDidChange), for: .valueChanged)
        self.addSubview(mySlider)
                        
    }
    
    @objc func sliderValueDidChange(){
        let sliderValue = Int(mySlider.value)
        var score = 100 - (2 * abs(sliderValue - count))
        if(score<0){
            score=0
        }
        
        
        round+=1
        roundlabel.text="Round: \(round)"
        labelS.text = "Score: \(score)"
        let count = Int.random(in: 1..<100)
        label.text = "Try to Hit as close as possible to:   \(count)"
        if round != 0{
            dict[round] = score
        }
        
    
    
    }
    
      func showAlert() {
        // customise your view
        popup = UIView(frame: CGRect(x: 100, y: 200, width: 200, height: 500))
        popup.backgroundColor = UIColor.red
        let lb = UILabel(frame: CGRect(x: 30, y: 20, width: 300, height: 450))
          
          var txt=""
          for i in 0..<dict.count{
              let val = dict[i+1] ?? 0
              txt = txt + "Round \(i+1) score is \(val) \n"
              
          }
          lb.numberOfLines = dict.count
          lb.text=txt
       
        popup.addSubview(lb)        // show on screen
        self.addSubview(popup)

        // set the timer
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.dismissAlert), userInfo: nil, repeats: false)
      }
    @objc func dismissAlert(){
        // Dismiss the view from here
        popup.removeFromSuperview()
      }
    
}
