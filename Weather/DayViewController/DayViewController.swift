//
//  DayViewController.swift
//  Weather
//
//  Created by Yusuf U on 9.06.2018.
//  Copyright © 2018 Yusuf U. All rights reserved.
//

import UIKit
import SnapKit

class DayViewController: WeatherBaseViewController{
    
    private let dateLabel = UILabel(style: Stylesheet.dateTitleLabel)
    private let timeLabel = UILabel(style: Stylesheet.timeTitleLabel)
    private let icon = UIImageView(style: Stylesheet.icon)
    private let summaryLabel = UILabel(style: Stylesheet.summaryLabel)
    
    private enum Constants{
        static let topSpace = Size.space
        static let dateToTimeSpace = Size.minSpace
        static let iconHeight: CGFloat = Size.space * 8
    }
    
    var weatherData: WeatherData?{
        didSet{
            updateView()
        }
    }
    
    private func updateView() {
        DispatchQueue.main.async {
            self.indicator.stopAnimating()
        }
        if let data = weatherData{
            updateData(with: data)
        }else{
            errorLabel.isHidden = false
            errorLabel.text = "Cloudy was unable to fetch weather data."
        }
    }
    
    private func updateData(with weatherData: WeatherData){
        containerView.isHidden = false
        
        // date formatter
        let data = Date(timeIntervalSince1970: weatherData.currently.time)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMMM d"
        dateLabel.text = dateFormatter.string(from: data)
        summaryLabel.text = weatherData.currently.summary
        //time formatter
        let timeDate = Date(timeIntervalSince1970: weatherData.currently.time)
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = UserDefaults.timeNotation() == .twelweHour ? "hh:mm a" : "HH:mm"
        timeLabel.text = timeFormatter.string(from: timeDate)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        containerView.backgroundColor = .blue
        addSubviews()
        setupLayouts()
    }
    
    private func addSubviews() {
        containerView.addSubviews(dateLabel, timeLabel, icon, summaryLabel)
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
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.bottom)
            make.centerX.equalTo(dateLabel)
        }
        icon.snp.makeConstraints { (make) in
            make.top.equalTo(timeLabel.snp.bottom).offset(Constants.topSpace)
            make.height.equalTo(Constants.iconHeight)
            make.width.equalTo(Constants.iconHeight)
            make.centerX.equalTo(dateLabel)
        }
        summaryLabel.snp.makeConstraints { (make) in
            make.top.equalTo(icon.snp.bottom).offset(Constants.topSpace)
            make.centerX.equalTo(dateLabel)
        }
    }
}
