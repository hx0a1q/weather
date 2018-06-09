//
//  ViewController.swift
//  Weather
//
//  Created by Yusuf U on 9.06.2018.
//  Copyright © 2018 Yusuf U. All rights reserved.
//

import UIKit
class RootViewController: UIViewController {
    
    private enum Constants{
        static let topViewHeight: CGFloat = 150
    }
    private let dayViewController = DayViewController()
    private let weekViewController = WeekViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        add(controller: dayViewController, frame: CGRect(x: 0, y: 0, width: view.frame.width, height: Constants.topViewHeight))
        add(controller: weekViewController, frame: CGRect(x: 0, y: Constants.topViewHeight, width: view.frame.width, height: view.frame.height - Constants.topViewHeight))
    }
    
    private func setup(){
        view.backgroundColor = .white
    }
    
    private func add<T: UIViewController>(controller: T, frame: CGRect) {
        addChildViewController(controller)
        view.addSubview(controller.view)
        controller.view.frame = frame
        controller.didMove(toParentViewController: self)
    }
}

