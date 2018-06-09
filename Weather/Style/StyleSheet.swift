//
//  StyleSheet.swift
//  Weather
//
//  Created by Yusuf U on 9.06.2018.
//  Copyright © 2018 Yusuf U. All rights reserved.
//

import UIKit

enum Stylesheet {
    static let headLabel = Style<UILabel> {
        $0.font = Font.headerLabelFont
        $0.textColor = Color.theme1
        $0.numberOfLines = 0
    }
    
    static let image = Style<UIImageView> {
        $0.contentMode = .center
        $0.backgroundColor = .darkGray
    }
}
