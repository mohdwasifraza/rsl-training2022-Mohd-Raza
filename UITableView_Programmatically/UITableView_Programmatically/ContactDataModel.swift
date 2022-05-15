//
//  ContactDataModel.swift
//  UITableView_Programmatically
//
//  Created by Mohd Raza on 15/05/22.
//

import Foundation
import UIKit

class ContactDataModel{
    var contactName : String
    var contactImage : UIImage
    var contactNumber : String
    var contactEmail : String
    init(_ contactName : String, _ contactImage : UIImage, _ contactNumber : String, _ contactEmail : String) {
        self.contactName = contactName
        self.contactImage = contactImage
        self.contactNumber = contactNumber
        self.contactEmail = contactEmail
    }
    
}
