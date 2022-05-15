//
//  ContactViewController.swift
//  UITableView_Programmatically
//
//  Created by Mohd Raza on 14/05/22.
//

import UIKit

class ContactViewController: UIViewController {

   
    var myTableView: UITableView!
    var contactDataSource: ContactDataSource!
    var contactDelegate: ContactDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contacts"
        

        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))

        contactDataSource = ContactDataSource(myTableView)
        contactDelegate = ContactDelegate()
        contactDelegate.presentingController = self
        myTableView.register(CustomTableViewCell.self,  forCellReuseIdentifier: CustomTableViewCell.identifier) 
        myTableView.dataSource = contactDataSource
        myTableView.delegate = contactDelegate
        
        let customView = UIView(frame: CGRect(x : 0,y : 0, width : myTableView.frame.size.width, height : 50))
        customView.backgroundColor = .yellow
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: customView.frame.size.width, height: 50))
        label.text = "Contacts"
        label.textAlignment = .center;
        label.font = UIFont.systemFont(ofSize: 25)
        customView.addSubview(label)
        myTableView.tableHeaderView = customView
        self.view.addSubview(myTableView)
        
    }
    
    
}
    extension ContactViewController: MoreDetails{
        func currentSelected(_ indexPath: IndexPath) {
            print(indexPath)
            let vc=ContactDetailsViewController()
            
            vc.setNamePhoneEmail(contactDataSource.contactArray[indexPath.row].contactName, contactDataSource.contactArray[indexPath.row].contactNumber, contactDataSource.contactArray[indexPath.row].contactEmail)
            present(vc, animated: true)
        }


    }


