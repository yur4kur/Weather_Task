//
//  ForecastModel.swift
//  Weather_Task
//
//  Created by Пользователь on 04/08/2022.
//  Copyright © 2022 Пользователь. All rights reserved.
//

import Foundation

struct ForecastModel: Codable {
    struct List: Codable {
        var dt: Date
        var dt_txt: String
        struct Main: Codable {
            var temp_min: Double
            var temp_max: Double
            var temp: Double
        }
        var main: Main
        struct Weather: Codable {
            var main: String
            var icon: String
        }
        var weather: [Weather]
    }
    var list: [List]
    var cod: String
}
