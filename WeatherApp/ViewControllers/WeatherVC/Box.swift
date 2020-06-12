//
//  Box.swift
//  WeatherApp
//
//  Created by Ahmed Durrani on 12/06/2020.
//  Copyright © 2020 MauqahTechnology. All rights reserved.
//

import Foundation

final class Box<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet{
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?){
        self.listener = listener
        listener?(value)
    }
}
