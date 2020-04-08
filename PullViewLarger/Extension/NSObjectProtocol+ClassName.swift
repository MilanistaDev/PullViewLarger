//
//  NSObjectProtocol+ClassName.swift
//  PullViewLarger
//
//  Created by Takuya Aso on 2020/04/08.
//  Copyright © 2020 Takuya Aso. All rights reserved.
//

import UIKit

extension NSObjectProtocol {
    static var className: String {
        return String(describing: self)
    }
}
