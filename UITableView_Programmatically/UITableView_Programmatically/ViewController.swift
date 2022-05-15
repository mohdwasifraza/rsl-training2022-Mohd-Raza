//
//  ViewController.swift
//  UITableView_Programmatically
//
//  Created by Mohd Raza on 14/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    override func viewDidAppear(_ animated: Bool) {
        let vc = ContactViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated:true)
    }
}

