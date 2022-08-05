//
//  WeatherModel.swift
//  Weather_Task
//
//  Created by Пользователь on 04/08/2022.
//  Copyright © 2022 Пользователь. All rights reserved.
//

import Foundation

struct WeatherModel: Codable {
    struct Weather: Codable {
        var description: String = ""
        var icon: String = ""
    }
    var weather: [Weather] = []
    struct Main: Codable {
        var temp: Double = 0.0
        var feels_like: Double = 0.0
    }
    var main: Main = Main()
    var name: String = ""
}
