//
//  Stringable.swift
//  Weather
//
//  Created by Yusuf U on 16.06.2018.
//  Copyright © 2018 Yusuf U. All rights reserved.
//

import Foundation
protocol Stringable {
    var string: String { get }
}

extension Stringable{
    var string:String{
        return String(describing: self)
    }
}
