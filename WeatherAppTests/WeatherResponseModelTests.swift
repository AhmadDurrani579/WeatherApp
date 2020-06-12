//
//  WeatherResponseModelTests.swift
//  WeatherAppTests
//
//  Created by Ahmed Durrani on 12/06/2020.
//  Copyright © 2020 MauqahTechnology. All rights reserved.
//

import XCTest
@testable import WeatherApp

class WeatherResponseModelTests: XCTestCase {

    var exampleJSONData: Data!
    var weather: GroupResponseModel!
    
    override func setUp() {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "group", withExtension: "json") else {
            return
            
        }
//        let url = bundle.url(forResource: "city.list", withExtension: "json")!
        exampleJSONData = try! Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        weather = try! decoder.decode(GroupResponseModel.self, from: exampleJSONData)
    }
    
    func testDecodeTemp() throws {
        XCTAssertEqual(weather.list[0].main.temp_min, -11)
    }

    func testDecodeDesc() throws {
        XCTAssertEqual(weather.list[0].weather[0].description, "clear sky")
    }

}
