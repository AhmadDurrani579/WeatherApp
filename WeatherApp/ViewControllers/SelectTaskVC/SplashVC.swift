//
//  SplashVC.swift
//  WeatherApp
//
//  Created by Ahmed Durrani on 12/06/2020.
//  Copyright © 2020 MauqahTechnology. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction private func btnweatherFind_pressed(_ sender : UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "WeatherVC") as? WeatherVC else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func btnGPS_Pressed(_ sender : UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "GPSFinderVC") as? GPSFinderVC else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)

        
    }

}
