//
//  ProgrammaticallyViewController.swift
//  ui_view_controller
//
//  Created by Mohd Raza on 06/05/22.
//

import UIKit

class ProgrammaticallyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.green
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 101))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text="This is programmatic view controller"
        label.numberOfLines=3
        self.view.addSubview(label)
        
        let button = UIButton(frame: CGRect(x: 100, y: 500, width: 200, height: 100))
        button.titleLabel?.numberOfLines = 2
        button.setTitle("Dismiss", for: .normal)
         button.backgroundColor = .yellow
         button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        view.addSubview(button)
            // Do any additional setup after loading the view.
    }
    @objc func buttonTapped(){
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    override func viewDidLayoutSubviews() {
        
        print("##viewDidLayoutSubviews")
    }
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews()")
    }
    override func viewDidAppear(_ animated: Bool) {
        
        print("##viewDidAppear")
    }
    override func viewWillAppear(_ animated: Bool) {
        
        print("##viewWillAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        print("##viewWillDisappear")
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        
        
        print("##viewWillTransition")
        
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
