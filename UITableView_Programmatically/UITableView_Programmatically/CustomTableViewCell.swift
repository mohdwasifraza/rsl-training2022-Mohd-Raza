//
//  CustomTableViewCell.swift
//  UITableView_Programmatically
//
//  Created by Mohd Raza on 14/05/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    let imgUser = UIImageView()
    let userName = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)        
        imgUser.clipsToBounds = true
        contentView.addSubview(imgUser)
        contentView.addSubview(userName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        imgUser.image = nil
        userName.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imgUser.frame = CGRect(x:20 , y:3, width: 150, height: contentView.frame.size.height)
        userName.frame = CGRect(x:40 + imgUser.frame.size.width , y:3, width: contentView.frame.size.width - 10 - imgUser.frame.size.width, height: contentView.frame.size.height)
    }
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 
