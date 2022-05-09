//
//  ViewController.swift
//  ui_view_controller
//
//  Created by Mohd Raza on 06/05/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let button = UIButton(frame: CGRect(x: 100, y: 500, width: 200, height: 100))
        button.titleLabel?.numberOfLines = 2
        button.setTitle("Programmatically view Controller", for: .normal)
         button.backgroundColor = .blue
         button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        view.addSubview(button)
    }
   
    @objc func buttonTapped(){
        let vc=ProgrammaticallyViewController()
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)    }

    @IBAction func buttonTap() {
        let vc=XibViewController()
        //vc.modalTransitionStyle = .partialCurl
        present(vc, animated: true)
    }
    

        
       // @objc func buttonTapped() {
                        //Write button action here
         //   let vc = nibViewController()
           //present(vc, animated: true)
            
        //}

    //@IBAction func didTapButton() {
        //let vc = nibViewController()
       // present(vc, animated: true)
   // }
    
}

