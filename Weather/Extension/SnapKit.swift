//
//  SnapKit.swift
//  Weather
//
//  Created by Yusuf U on 10.06.2018.
//  Copyright © 2018 Yusuf U. All rights reserved.
//

import SnapKit
import UIKit

extension UIView {
    var safeArea: ConstraintBasicAttributesDSL {
        #if swift(>=3.2)
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.snp
        }
        return self.snp
        #else
        return self.snp
        #endif
    }
}
