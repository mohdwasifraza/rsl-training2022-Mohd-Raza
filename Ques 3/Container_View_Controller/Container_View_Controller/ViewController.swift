//
//  ViewController.swift
//  Container_View_Controller
//
//  Created by Mohd Raza on 06/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    let blueController = UIViewController()
    let blueView = UIView(frame: CGRect(x: 100, y: 350, width: 300, height: 150))

    override func viewDidLoad() {
        super.viewDidLoad()
        contentViewContoller()
        containerViewController()
        
        
        


        
    }
    func containerViewController(){
        let conButton = UIButton(frame: CGRect(x: 120, y: 560, width: 200, height: 100))
        conButton.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 45)
        conButton.setTitle("tap me", for: .normal)
        conButton.setTitleColor(.black, for: .normal)
        conButton.addTarget(self,action:#selector(buttonClicked),
                            for:.touchUpInside)
        view.addSubview(conButton)
        let blueLabel = UILabel(frame: CGRect(x: 95, y: 260, width: 180, height: 50))
       
        blueLabel.text = "Sample Label"
        blueLabel.font = UIFont.systemFont(ofSize: 20.0)
        blueLabel.textAlignment = .center
        view.addSubview(blueLabel)
        
        
    }
    @objc func buttonClicked(){
        blueController.view.isHidden = !blueController.view.isHidden
    
        
    }
    func contentViewContoller(){
        // Create a child view controller and add it to the current view controller.
        

        // call ad child in parent view controller.
        addChild(blueController)

        // Create view for the view controller.
        
        blueView.backgroundColor = UIColor.blue

        let blueLabel = UILabel(frame: CGRect(x: 95, y: 60, width: 80, height: 30))
       
        blueLabel.text = "Blue label"
        blueLabel.textAlignment = .center
        blueView.addSubview(blueLabel)

        // Set child controller's view.
        blueController.view = blueView
        
        
        let conButton = UIButton(frame: CGRect(x: 200, y: 60, width: 100, height: 30))
       
        conButton.setTitle("button", for: .normal)
        conButton.setTitleColor(.yellow, for: .normal)
        blueView.addSubview(conButton)

        // Set child controller's view.
        blueController.view = blueView        // Add child controller's view as subview to parent view controller's root view.
        view.addSubview(blueController.view)
        
        let TextField =  UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
        TextField.text = "Sample Text"
        TextField.textColor = .yellow
        blueView.addSubview(TextField)
        // Call didMoveToParentViewController passing the reference to parent view controller.
        blueController.didMove(toParent: self)
        
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
             print("Landscape")
             blueView.frame = CGRect(x: 100, y: 50, width: 300, height: 150)
                
        }
    }
  
    

}

