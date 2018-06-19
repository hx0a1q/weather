//
//  ViewController.swift
//  Weather
//
//  Created by Yusuf U on 9.06.2018.
//  Copyright © 2018 Yusuf U. All rights reserved.
//

import UIKit
import MapKit
class RootViewController: UIViewController {
    
    private enum Constants{
        static let topViewHeight: CGFloat = 200
    }
    private let dayViewController = DayViewController()
    private let weekViewController = WeekViewController()
    private lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.distanceFilter = 1000.0
        locationManager.desiredAccuracy = 1000.0
        return locationManager
    }()
    var dataManager: DataManager = {
        return DataManager(url: API.AuthenticatedBaseURL)
    }()
    private var currentLocation: CLLocation? {
        didSet {
            fetchWeatherData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        add(controller: dayViewController, y: 0, height: Constants.topViewHeight)
        add(controller: weekViewController, y: Constants.topViewHeight, height: view.frame.height - Constants.topViewHeight)
        
        fetchWeatherData()
    }
    
    @objc func applicationDidBecomeActive(notification: Notification){
        requestLocation()
    }
    
    private func setup(){
        view.backgroundColor = .white
    }
    
    private func setupNotificationHandle() {
        NotificationCenter.default.addObserver(self, selector: #selector(RootViewController.applicationDidBecomeActive(notification:)), name: Notification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    //func add(viewController: )
    
    private func add<T: WeatherBaseViewController>(controller: T, y: CGFloat, height:CGFloat) {
        addChildViewController(controller)
        view.addSubview(controller.view)
        controller.view.frame = CGRect(x: 0, y: y, width: view.frame.width, height: height)
        controller.didMove(toParentViewController: self)
    }
    
    private func requestLocation() {
        locationManager.delegate = self
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            locationManager.requestLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    private func fetchWeatherData() {
        dataManager.getWeather(latitude: Defaults.latitude, longitude: Defaults.longitude) { (weatherData, weatherDataError) in
            if let error = weatherDataError{
                print(error.localizedDescription)
            }else if let weatherData = weatherData{
                self.dayViewController.weatherData = weatherData
                self.weekViewController.days = weatherData.daily.data
            }else {
                print("Unknown error!")
            }
        }
    }
}

extension RootViewController: MKMapViewDelegate{
    
    
}

extension RootViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            manager.requestLocation()
        }else {
            currentLocation = CLLocation(latitude: Defaults.latitude, longitude: Defaults.longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            currentLocation = location
            manager.delegate = self
            manager.stopUpdatingLocation()
        }else{
            currentLocation = CLLocation(latitude: Defaults.latitude, longitude: Defaults.longitude)
        }
    }
}


