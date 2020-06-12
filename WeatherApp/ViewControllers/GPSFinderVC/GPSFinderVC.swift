//
//  GPSFinderVC.swift
//  WeatherApp
//
//  Created by Ahmed Durrani on 12/06/2020.
//  Copyright © 2020 MauqahTechnology. All rights reserved.
//

import UIKit
import CoreLocation

class GPSFinderVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let locationManager = CLLocationManager()
    let geoCoder = CLGeocoder()
    
    private let weatherViewModel = WeatherViewModel()
    var listArray: [WeatherResponseModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
        //For use in foreground
        locationManager.requestWhenInUseAuthorization()
            
        //Check if user allows
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        tableView.registerCells([
            Task1Cell.self
            ])

        self.weatherViewModel.cityData.bind { (data) in
            guard let data = data else {
                return
            }
            self.listArray = data.list
            self.tableView.delegate = self
            self.tableView.dataSource = self

            self.tableView.reloadData()
        }
    }
    
    func fetchCity(location: CLLocation){
        //Get City Name
        location.fetchCityAndCountry { city, error in
            guard let city = city, error == nil else { return }
            self.title = city
            //API Call for city
            let url = "\(BASEURL)forecast?q=\(city)&appid=\(API_KEY)"
            self.weatherViewModel.fetchWeatherForLocation(urlString: url, view: self.view)
        }
    }
    
    @IBAction private func btnBack_Pressed(_ sender : UIButton) {
           self.navigationController?.popViewController(animated: true)
       }
}

extension GPSFinderVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocation = manager.location else { return }
        self.fetchCity(location: locValue)
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed getting location \(error)")
    }
}
