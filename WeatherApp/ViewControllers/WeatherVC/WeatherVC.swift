//
//  WeatherVC.swift
//  WeatherApp
//
//  Created by Ahmed Durrani on 12/06/2020.
//  Copyright © 2020 MauqahTechnology. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController  {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtField: UITextField!
    let weatherViewModel = WeatherViewModel()
    var citiesArray: [String] = []
    var idsArray : [Int] = []
    var listArray: [WeatherResponseModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction private func btnSearch_Pressed(_ sender : UIButton) {
        guard let text = txtField.text, !text.isEmpty else {
            Toast.show(message: "Enter cities", controller: self)
            return
        }
        //Getting cities name seperated by comma and checking
        citiesArray = text.components(separatedBy: ",")
        if citiesArray.last == "" {
            citiesArray.removeLast()
        }
        if citiesArray.count < 3 || citiesArray.count > 7{
            Toast.show(message: "Min 3 cities & Max 7 Cities", controller: self)
            return
        }


        for city in citiesArray {
            //Trim city name from spaces at start
            let trimmedCityName = city.trimmingCharacters(in: .whitespaces)
            if let item = cityIds.first(where: {$0.name == trimmedCityName}) {
                idsArray.append(item.id)
            }
        }
        //Fetch Data for these IDs
        fetch(idArray: idsArray)
        txtField.text = ""
        txtField.resignFirstResponder()
        idsArray.removeAll()

    }
    
    @IBAction private func btnBack_Pressed(_ sender : UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func fetch(idArray: [Int]) {
        let ids = (idArray.map{String($0)}).joined(separator: ",")
        let url = "\(BASEURL)group?id=\(ids)&units=metric&appid=\(API_KEY)"
        self.weatherViewModel.fetchWeatherForLocation(urlString: url, view: self.view)
    }
}
