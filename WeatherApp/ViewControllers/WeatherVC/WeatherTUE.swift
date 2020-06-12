//
//  WeatherTUE.swift
//  WeatherApp
//
//  Created by Ahmed Durrani on 12/06/2020.
//  Copyright © 2020 MauqahTechnology. All rights reserved.
//

import Foundation
import UIKit

extension WeatherVC: UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: Task1Cell.self, for: indexPath)
        cell.configure(city: listArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
}
