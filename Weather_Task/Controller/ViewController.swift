//
//  ViewController.swift
//  Weather_Task
//
//  Created by Пользователь on 04/08/2022.
//  Copyright © 2022 Пользователь. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Header outlets
    
    @IBOutlet weak var favouritesButton: UIButton!
    @IBOutlet var field: UITextField!
    @IBOutlet var searchButton: UIButton!
    
    // MARK: - Weather grid outlets
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var weatherConditionLabel: UILabel!
    @IBOutlet weak var currentFeelsTempLabel: UILabel!
    
    
    // MARK: - Forecast table outlet
    
    @IBOutlet weak var forecastView: UITableView!
    
    
    public var savedCities = ["Moscow", "London", "Paris", "Rome"]
    public var location = ""
    
    // MARK: - Properties
    
    let dateFormatter = DateFormatter()
    
    let reuseIdentifier = "customCell"
    
    
    // MARK: - Fetching properties
    
    var fetchedWeather = WeatherModel() {
        didSet {
            DispatchQueue.main.async {
                self.updateView()
            }
        }
    }
    
    var fetchedList: [ForecastModel.List]? {
        didSet {
            DispatchQueue.main.async {
                self.forecastView.reloadData()
            }
        }
    }
    
    // MARk: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Helpers
        
        dateFormatter.dateFormat = "E, hh:mm a"
        
        field.delegate = self
        
        forecastView.delegate = self
        forecastView.dataSource = self
    }
    
     // MARK: - PopUp ViewController Setup
    
    @IBAction func favouritesTapped() {
        guard let popVC = storyboard?.instantiateViewController(withIdentifier: "popVC") else {
            return
        }
        
    }
    
    // MARK: - Saving cities method
    
    @IBAction func addToFavouritesTapped() {
        if location.isEmpty == false {
            savedCities.append(location)
        }
        
        
    }
    
    
    // MARK: - Search method
    
    @IBAction func searchButtonTapped() {
        if location.isEmpty == false {
            
            // MARK: - Fetcheing weather
            
            let weatherManager = WeatherManager()
            
            weatherManager.fetchWeather(for: location) { (weatherData) in
                DispatchQueue.main.async { [self] in
                }
                self.fetchedWeather = weatherData
            }
            
            // MARK: - Fetching forecast
            
            let forecastManager = ForecastManager()
            forecastManager.fetchForecast(for: location) { (forecasts) in
                DispatchQueue.main.async {
                }
                self.fetchedList = forecasts.list
            }
        } else {
            return
        }

    }
}


// Mark: - UITableViewDelegate & UITableViewDataSource Methods

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CustomCell
        
        guard let list = fetchedList?[indexPath.row] else { return UITableViewCell() }
        cell.forecastImage.image = UIImage(named: list.weather[0].icon)
        cell.minTLabel.text = Int(list.main.temp_min).description + "°   /"
        cell.maxTLabel.text = Int(list.main.temp_max).description + "°"
        cell.dateLabel.text = dateFormatter.string(from: list.dt)
        return cell
    }
    
    
}

// MARK - UITextFieldDelegate method

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if let cityName = textField.text {
            location = cityName
            searchButtonTapped()
        }
        return true
    }
}

extension ViewController {
    
    //MARK: - Weather update method
        
    func updateView() {
            cityNameLabel.text = fetchedWeather.name
        weatherConditionLabel.text = fetchedWeather.weather[0].description.capitalized
            currentTemperatureLabel.text = Int((fetchedWeather.main.temp)).description + "°"
        currentFeelsTempLabel.text = "Feels: " + Int((fetchedWeather.main.feels_like)).description + "°"
        }
}


