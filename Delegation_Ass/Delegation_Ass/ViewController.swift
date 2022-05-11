//
//  ViewController.swift
//  Delegation_Ass
//
//  Created by Mohd Raza on 11/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        // Do any additional setup after loading the view.
    }
    func createButton(){
        let button = UIButton(frame: CGRect(x: 80, y: 220, width: 300, height: 100))
         button.setTitle("Choose Background Color", for: .normal)
         button.backgroundColor = .white

         button.setTitleColor(UIColor.black, for: .normal)
         button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
         view.addSubview(button)
    }
    @objc func buttonTapped(){
        let vc=ViewController1()
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        vc.selectDelegate = self
        present(vc, animated: true)
        
    }

}
extension ViewController: ChangeBgColorDelegate{
    func didTapColor(color: UIColor) {
        view.backgroundColor = color
    }
}

