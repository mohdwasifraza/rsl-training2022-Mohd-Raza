//
//  ViewController1.swift
//  Delegation_Ass
//
//  Created by Mohd Raza on 11/05/22.
//

import UIKit
protocol ChangeBgColorDelegate{
    func didTapColor(color: UIColor)
}

class ViewController1: UIViewController {
    var selectDelegate : ChangeBgColorDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
        createButtons()

        // Do any additional setup after loading the view.
    }
    func createButtons(){
        let button1 = UIButton(frame: CGRect(x: 80, y: 220, width: 300, height: 60))
         button1.setTitle("", for: .normal)
         button1.backgroundColor = .green
         //button1.setTitleColor(UIColor.black, for: .normal)
         button1.addTarget(self, action: #selector(self.buttonTapped1), for: .touchUpInside)
         view.addSubview(button1)
        let button2 = UIButton(frame: CGRect(x: 80, y: 320, width: 300, height: 60))
         button2.setTitle("", for: .normal)
         button2.backgroundColor = .yellow
         //button2.setTitleColor(UIColor.black, for: .normal)
         button2.addTarget(self, action: #selector(self.buttonTapped2), for: .touchUpInside)
         view.addSubview(button2)
        let button3 = UIButton(frame: CGRect(x: 80, y: 420, width: 300, height: 60))
         button3.setTitle("", for: .normal)
         button3.backgroundColor = .gray
         //button3.setTitleColor(UIColor.black, for: .normal)
         button3.addTarget(self, action: #selector(self.buttonTapped3), for: .touchUpInside)
         view.addSubview(button3)
    }
    @objc func buttonTapped1(){
        selectDelegate.didTapColor(color: .green)
        dismiss(animated: true, completion: nil)
    }
    @objc func buttonTapped2(){
        selectDelegate.didTapColor(color: .yellow)
        dismiss(animated: true, completion: nil)
    }
    @objc func buttonTapped3(){
        selectDelegate.didTapColor(color: .gray)
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
