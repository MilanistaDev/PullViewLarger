//
//  UITableView+Cell.swift
//  PullViewLarger
//
//  Created by Takuya Aso on 2020/04/08.
//  Copyright © 2020 Takuya Aso. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        return className
    }
}

extension UITableView {
    func register<T: UITableViewCell>(_ cellType: T.Type) where T: Nibable {
        register(T.nib, forCellReuseIdentifier: T.identifier)
    }

    func register<T: UITableViewCell>(_ cellType: T.Type) {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(with cellType: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
}
