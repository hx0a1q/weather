//
//  WeatherBaseViewController.swift
//  Weather
//
//  Created by Yusuf U on 10.06.2018.
//  Copyright © 2018 Yusuf U. All rights reserved.
//

import UIKit

class WeatherBaseViewController: UIViewController{
    
    private enum Constants{
        static let topSpace = Size.minSpace
    }
    let indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        indicator.hidesWhenStopped = true
        return indicator
    }()
    let errorLabel = UILabel(style: Stylesheet.dateTitleLabel)
    let errorButton = UIButton(style: Stylesheet.errorButton)
    let containerView = UIView(style: Stylesheet.containerView)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func hideU(_ hidden: Bool){
        errorButton.isHidden = hidden
        errorLabel.isHidden = hidden
        containerView.isHidden = hidden
        indicator.startAnimating()
        indicator.isHidden = hidden
    }
    
    private func setupViews() {
        view.backgroundColor = .blue
        addSubviews()
        setupLayouts()
    }
    
    private func addSubviews() {
        view.addSubviews(indicator, errorLabel, errorButton, containerView)
    }
    
    private func setupLayouts() {
        indicator.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        errorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(indicator.snp.bottom).offset(Constants.topSpace)
            make.centerX.equalToSuperview()
        }
        errorButton.snp.makeConstraints { (make) in
            make.top.equalTo(errorLabel.snp.bottom).offset(Constants.topSpace)
            make.height.equalTo(Size.button)
            make.centerX.equalToSuperview()
        }
        containerView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
    }
    
    func imageForIcon(withName name: String) -> UIImage? {
        switch name {
        case "clear-day":
            return UIImage(named: "clear-day")
        case "clear-night":
            return UIImage(named: "clear-night")
        case "rain":
            return UIImage(named: "rain")
        case "snow":
            return UIImage(named: "snow")
        case "sleet":
            return UIImage(named: "sleet")
        case "wind", "cloudy", "partly-cloudy-day", "partly-cloudy-night":
            return UIImage(named: "cloudy")
        default:
            return UIImage(named: "clear-day")
        }
    }


}
