//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Ahmed Durrani on 12/06/2020.
//  Copyright © 2020 MauqahTechnology. All rights reserved.
//

import Foundation
import UIKit
//import SVProgressHUD

public class WeatherViewModel {
    let cityData: Box<GroupResponseModel?> = Box(value: nil)
    func fetchWeatherForLocation(urlString: String , view : UIView ) {
        showProgressIndicator(view: view)
        NetworkService.weatherDataForLocation(URLstr: urlString) {
            [weak self] (response, error) in
            guard error == nil else {
                print("Error")
                return
            }
            guard
                let self = self,
                let weatherResponse = response
                else {
                    return
            }
            hideProgressIndicator(view: view)
            self.cityData.value = weatherResponse
        }
    }
    
}
