//
//  Style.swift
//  Weather
//
//  Created by Yusuf U on 9.06.2018.
//  Copyright © 2018 Yusuf U. All rights reserved.
//

import UIKit
public struct Style<View: UIView> {
    public let style: (View) -> Void

    public init(_ style: @escaping (View) -> Void) {
        self.style = style
    }
    
    public func apply(to view: View) {
        style(view)
    }
}
