//
//  WeatherManager.swift
//  Weather_Task
//
//  Created by Пользователь on 04/08/2022.
//  Copyright © 2022 Пользователь. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    func fetchWeather(for location: String, completion: @escaping(WeatherModel) -> Void) {

        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(location)&appid=871486b6e485f1f4b2602c115d27413f&units=metric") else {
            return
        }

        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error fetching weather: \(error.localizedDescription)")
            }
            
            guard let jsonData = data else { return}

            let decoder = JSONDecoder()


            do {
                let decodedData = try decoder.decode(WeatherModel.self, from: jsonData)
                completion(decodedData)
            } catch {
                print("Error decoding data")
            }
        }
        dataTask.resume()
    }

}


