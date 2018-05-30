//
//  UsersTableCell.swift
//  RxSwift-Setup
//
//  Created by Prem Pratap Singh on 30/05/18.
//  Copyright © 2018 Prem Pratap Singh. All rights reserved.
//

import UIKit

class UsersTableCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupView(user: User) {
        bgView.layer.cornerRadius = 10
        bgView.layer.borderColor = UIColor.black.cgColor
        bgView.layer.borderWidth = 1
        
        nameLabel.text = user.name
    }
}
