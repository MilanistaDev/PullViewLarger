//
//  ProfileTableViewCell.swift
//  PullViewLarger
//
//  Created by Takuya Aso on 2020/04/07.
//  Copyright © 2020 Takuya Aso. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var rideCountLabel: UILabel!
    @IBOutlet weak var topRideLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
