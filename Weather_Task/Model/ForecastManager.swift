//
//  ForecastManager.swift
//  Weather_Task
//
//  Created by Пользователь on 04/08/2022.
//  Copyright © 2022 Пользователь. All rights reserved.
//

import Foundation

struct ForecastManager {
    
    func fetchForecast(for location: String, completion: @escaping(ForecastModel) -> Void) {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(location)&appid=871486b6e485f1f4b2602c115d27413f&units=metric") else {
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error fetching forecast: \(error.localizedDescription)")
            }
            guard let jsonData = data else { return}
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            
            do {
                let decodedData = try decoder.decode(ForecastModel.self, from: jsonData)
                completion(decodedData)
            } catch {
                print("Error decoding data")
            }
        }
        dataTask.resume()
    }
    
}
