//
//  StyleSheet.swift
//  Weather
//
//  Created by Yusuf U on 9.06.2018.
//  Copyright © 2018 Yusuf U. All rights reserved.
//

import UIKit

enum Stylesheet {
    static let windSpeedLabel = Style<UILabel> {
        $0.font = Font.windSpeedLabel
    }
    static let dayLabel = Style<UILabel> {
        $0.font = Font.dayTitleFont
    }
    static let containerView = Style<UIView> {
        $0.backgroundColor = .white
    }
    static let errorLabel = Style<UILabel> {
        $0.font = Font.errorTitleFont
        $0.textColor = Color.secondaryText
    }
    static let errorButton = Style<UIButton> {
        $0.setTitleColor(Color.secondaryText, for: .normal)
        $0.setTitle("Demo Error", for: .normal)
    }
    static let summaryLabel = Style<UILabel> {
        $0.font = Font.summaryTitleFont
        $0.textColor = Color.accentColor
        $0.numberOfLines = 0
    }
    static let dateTitleLabel = Style<UILabel> {
        $0.font = Font.dateTitleFont
        $0.textColor = Color.white
        $0.numberOfLines = 0
    }
    static let timeTitleLabel = Style<UILabel> {
        $0.font = Font.timeTitleFont
        $0.textColor = Color.lightPrimary
    }
    static let icon = Style<UIImageView> {
        $0.contentMode = .scaleAspectFit
        $0.tintColor = Color.accentColor
        $0.image = #imageLiteral(resourceName: "ICON")
    }
}
