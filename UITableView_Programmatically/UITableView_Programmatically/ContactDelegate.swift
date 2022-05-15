//
//  ContactDelegate.swift
//  UITableView_Programmatically
//
//  Created by Mohd Raza on 15/05/22.
//

import UIKit
protocol MoreDetails{
    func currentSelected(_ indexPath: IndexPath)
}
class ContactDelegate: NSObject, UITableViewDelegate {
    
    var presentingController: MoreDetails?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       //print("tapped")
        presentingController?.currentSelected(indexPath)
      
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0{
            return 60
        }
        return 100
    }
}
