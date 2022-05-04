//
//  ViewController.swift
//  Ass2
//
//  Created by Mohd Raza on 04/05/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        let screenSize:CGRect=UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        // Do any additional setup after loading the view.
        let customView = CustomView(frame: CGRect(x:0, y:0, width:screenWidth, height:screenHeight))
        view.addSubview(customView)        // Do any additional setup after loading the view.
    }


}

