//
//  WeekViewController.swift
//  Weather
//
//  Created by Yusuf U on 9.06.2018.
//  Copyright © 2018 Yusuf U. All rights reserved.
//

import UIKit

class WeekViewController: WeatherBaseViewController{
    
    var days: [WeatherDataDailyData]?{
        didSet{
            updateView()
        }
    }
    lazy var tableView: UITableView = {
       let tv = UITableView(frame: .zero, style: .plain)
        tv.delegate = self
        tv.dataSource = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        return tv
    }()
    
    private func updateView() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .yellow
        addSubviews()
        setupLayouts()
    }
    
    private func addSubviews() {
        containerView.addSubview(tableView)
    }
    
    private func setupLayouts() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(containerView).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
    }
}
extension WeekViewController: UITableViewDelegate{
    
}
extension WeekViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath)
        return cell
    }
}

