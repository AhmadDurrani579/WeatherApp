
//  Utilities.swift
//  WeatherApp
//
//  Created by Ahmed Durrani on 11/06/2020.
//  Copyright © 2020 MauqahTechnology. All rights reserved.


let  BASEURL = "http://api.openweathermap.org/data/2.5/"
let  API_KEY = "0a0b8acc5ecffa0f5b5718f62e22cac3"

import Foundation
import UIKit
let PROGRESS_INDICATOR_VIEW_TAG:Int = 10


/* Show Progress Indicator */
func showProgressIndicator(view:UIView){
    view.isUserInteractionEnabled = false
    // Create and add the view to the screen.
    let progressIndicator = ProgressIndicator(text: "Please wait..")
    progressIndicator.tag = PROGRESS_INDICATOR_VIEW_TAG
    view.addSubview(progressIndicator)
    
}

/* Hide progress Indicator */
func hideProgressIndicator(view:UIView){
    
    view.isUserInteractionEnabled = true
    
    if let viewWithTag = view.viewWithTag(PROGRESS_INDICATOR_VIEW_TAG) {
        viewWithTag.removeFromSuperview()
    }
}
