//
//  CustomView.swift
//  Ass2
//
//  Created by Mohd Raza on 04/05/22.
//

import UIKit

class CustomView: UIView {
    
    var count = 0
    var round=0
    var popup:UIView!
    var dict:[Int:Int]=[:]
    let mySlider = UISlider()
    let roundlabel = UILabel()
    let labelScore = UILabel()
    let labelRandom = UILabel()
    let buttonInfoo = UIButton()
    let buttonStart = UIButton()
    let hitMe = UILabel()
    
    public override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor=UIColor.green
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubviews()
        labelRandomm()
        sliderr()
        addConstraints()
        buttonStartOver()
        allLabels()
       buttonInfo()
        
    }
    func addSubviews(){
        self.addSubview(labelScore)
        self.addSubview(roundlabel)
        self.addSubview(hitMe)
        self.addSubview(labelRandom)
        self.addSubview(buttonInfoo)
        self.addSubview(mySlider)
        self.addSubview(buttonStart)
    }
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    func allLabels(){
        labelScore.text = "Score: "
        roundlabel.text="Round: \(round)"
        hitMe.text="Hit ME"
        hitMe.textColor=UIColor.blue
        hitMe.font = hitMe.font.withSize(25)
        
    }
    func labelRandomm(){
        labelRandom.textAlignment = .center
        count = Int.random(in: 1..<100)
        labelRandom.text = "Try to Hit as close as possible to:   \(count)"
    }
    
    func buttonStartOver(){
        buttonStart.setTitle("Start Over", for: .normal)
        buttonStart.setTitleColor(UIColor.red, for: .normal)
        buttonStart.addTarget(self, action: #selector(startOnClick), for: .touchUpInside)
        
    }
    
    @objc func startOnClick() {
        count=0
        round=0
        roundlabel.text="Round: \(round)"
        labelScore.text = "Score: "
        mySlider.value=0
        dict=[:]
    }
    
    func buttonInfo(){
        buttonInfoo.setTitle("Info", for: .normal)
        buttonInfoo.setTitleColor(UIColor.red, for: .normal)
        buttonInfoo.addTarget(self, action: #selector(infoOnClick), for: .touchUpInside)
        
    }
    
    @objc func infoOnClick() {
        showAlert()
    }
    
    func sliderr(){
        mySlider.minimumValue = 0
        mySlider.maximumValue = 100
        mySlider.isContinuous=false
        mySlider.addTarget(self, action: #selector(self.sliderValueDidChange), for: .valueChanged)
        
    }
    
    @objc func sliderValueDidChange(){
        let sliderValue = Int(mySlider.value)
        var score = 100 - (2 * abs(sliderValue - count))
        if(score<0){
            score=0
        }
        
        round+=1
        roundlabel.text="Round: \(round)"
        labelScore.text = "Score: \(score)"
        count = Int.random(in: 1..<100)
        labelRandom.text = "Try to Hit as close as possible to:   \(count)"
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
       
        popup.addSubview(lb)
        self.addSubview(popup)

        // set the timer
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.dismissAlert), userInfo: nil, repeats: false)
      }
    @objc func dismissAlert(){
        // Dismiss the view from here
        popup.removeFromSuperview()
      }
    func addConstraints(){
        labelRandom.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelRandom.leadingAnchor.constraint( equalTo: self.leadingAnchor),
            labelRandom.trailingAnchor.constraint( equalTo: self.trailingAnchor),
            labelRandom.bottomAnchor.constraint( greaterThanOrEqualTo: mySlider.topAnchor, constant: -50),////, constant : -100),
            labelRandom.topAnchor.constraint( equalTo: self.topAnchor, constant:30 )
            ])
        mySlider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
   
            mySlider.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:50),
            mySlider.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:-50 ),
            mySlider.bottomAnchor.constraint(greaterThanOrEqualTo: hitMe.topAnchor, constant: -20)
            ])
        
        hitMe.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hitMe.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            hitMe.bottomAnchor.constraint(lessThanOrEqualTo: labelScore.topAnchor, constant: 70 )
        ])
        
        labelScore.translatesAutoresizingMaskIntoConstraints=false
        NSLayoutConstraint.activate([
            labelScore.leadingAnchor.constraint(lessThanOrEqualTo: self.leadingAnchor, constant: 40),
            labelScore.trailingAnchor.constraint(equalTo: roundlabel.leadingAnchor, constant: -110 ),
            labelScore.bottomAnchor.constraint(equalTo: buttonStart.topAnchor, constant: -50)
        ])
        
        roundlabel.translatesAutoresizingMaskIntoConstraints=false
        NSLayoutConstraint.activate([
            roundlabel.trailingAnchor.constraint(equalTo: self.trailingAnchor , constant:-30),
            roundlabel.bottomAnchor.constraint(equalTo: labelScore.bottomAnchor)
        ])
        
        buttonStart.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStart.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            buttonStart.trailingAnchor.constraint(lessThanOrEqualTo: buttonInfoo.leadingAnchor, constant: -140 ),
            buttonStart.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:-50)
        ])
               
        buttonInfoo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonInfoo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20 ),
            buttonInfoo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:  -50)
                                    ])

    }
    
}
