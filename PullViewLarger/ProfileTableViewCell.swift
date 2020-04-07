//
//  ProfileTableViewCell.swift
//  PullViewLarger
//
//  Created by Takuya Aso on 2020/04/07.
//  Copyright © 2020 Takuya Aso. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var profileBaseView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var rideCountLabel: UILabel!
    @IBOutlet weak var topRideLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.profileBaseView.layer.cornerRadius = self.profileBaseView.frame.width / 2
        self.profileBaseView.layer.borderColor = UIColor.white.cgColor
        self.profileBaseView.layer.borderWidth = 2.0
        self.profileBaseView.layer.shadowColor = UIColor.black.cgColor
        self.profileBaseView.layer.shadowOpacity = 0.5
        self.profileBaseView.layer.shadowOffset = .zero
        self.profileBaseView.layer.shadowRadius = 5.0
        self.profileImageView.clipsToBounds = true
        self.profileImageView.layer.cornerRadius = self.profileBaseView.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
