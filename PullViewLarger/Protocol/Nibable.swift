//
//  Nibable.swift
//  PullViewLarger
//
//  Created by Takuya Aso on 2020/04/08.
//  Copyright © 2020 Takuya Aso. All rights reserved.
//

import UIKit

protocol Nibable: NSObjectProtocol {
    static var nibName: String { get }
    static var nib: UINib { get }
}

extension Nibable {
    static var nibName: String {
        return className
    }

    static var nib: UINib {
        return UINib(nibName: nibName, bundle: Bundle(for: self))
    }
}
