//
//  ViewController.swift
//  Ass1
//
//  Created by Mohd Raza on 02/05/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let screenSize:CGRect=UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        // Do any additional setup after loading the view.
        let customView = CustomViewClass(frame: CGRect(x:0, y:0, width:screenWidth, height:screenHeight))
        view.addSubview(customView)
     
        
    }


}

