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
        let customView = CustomView()
        self.view.addSubview(customView)
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor ),
            customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customView.bottomAnchor.constraint( equalTo: view.safeAreaLayoutGuide.bottomAnchor )
            ])
    }


}

