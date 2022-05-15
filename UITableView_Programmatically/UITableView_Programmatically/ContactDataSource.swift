//
//  ContactDataSource.swift
//  UITableView_Programmatically
//
//  Created by Mohd Raza on 15/05/22.
//

import UIKit

class ContactDataSource : NSObject, UITableViewDataSource {
    var myTableView: UITableView!
    let contactArray = [ContactDataModel("John", UIImage(named: "five")!,"9532125488", "john@gmail.com"), ContactDataModel("Sam", UIImage(named: "one")!,"6852925488", "sam@gmail.com"), ContactDataModel("Salman", UIImage(named: "seven")!,"7894525488", "john@gmail.com"), ContactDataModel("Raju", UIImage(named: "two")!,"7894525488", "raju@gmail.com")]

    
    init(_ tableView: UITableView) {
            self.myTableView = tableView
    }
    


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath as IndexPath) as! CustomTableViewCell
        cell.imgUser.image = contactArray[indexPath.row].contactImage
        cell.userName.text = contactArray[indexPath.row].contactName
        
        return cell
    }
    
}
