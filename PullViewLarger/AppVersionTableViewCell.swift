//
//  AppVersionTableViewCell.swift
//  PullViewLarger
//
//  Created by Takuya Aso on 2020/04/08.
//  Copyright © 2020 Takuya Aso. All rights reserved.
//

import UIKit

class AppVersionTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
