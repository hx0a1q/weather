//
//  DayViewController.swift
//  Weather
//
//  Created by Yusuf U on 9.06.2018.
//  Copyright © 2018 Yusuf U. All rights reserved.
//

import UIKit
import SnapKit

class DayViewController: UIViewController{
    
    private let dateLabel = UILabel(style: Stylesheet.headLabel)
    
    private enum Constants{
        static let topSpace = Size.bigSpace
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DayView")
        setupViews()
        
        dateLabel.text = "12 KASIM ANKARA"
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        addSubviews()
        setupLayouts()
    }
    
    private func addSubviews() {
        view.addSubview(dateLabel)
    }
    
    private func setupLayouts() {
        dateLabel.snp.makeConstraints { (make) in
            if #available(iOS 11, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(Constants.topSpace)
            } else {
                make.top.equalToSuperview().offset(Constants.topSpace)
            }
            make.centerX.equalToSuperview()
        }
        
    }
}
