//
//  TableViewController.swift
//  Weather_Task
//
//  Created by Пользователь on 05/08/2022.
//  Copyright © 2022 Пользователь. All rights reserved.
//

import UIKit

// MARK: - Saved cities list setup

class TableViewController: UITableViewController {

    var arrayOfCities = UserDefaults.standard.object(forKey: "savedCities") as? [String]

    var insert = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.arrayOfCities?.count ?? 0
        
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let cities = arrayOfCities?[indexPath.row]
        cell.textLabel!.text = cities

        return cell
    }
    
    // MARK: - Deleting cells methods
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            tableView.beginUpdates()
            arrayOfCities!.remove(at: indexPath.row)
            UserDefaults.standard.set(arrayOfCities, forKey: "savedCities")
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    // MARK: - Selecting row and passing to VC
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.insert = (arrayOfCities?[indexPath.row])!
        NotificationCenter.default.post(name: Notification.Name("city"), object: insert)
        
        self.dismiss(animated: true, completion: nil)
    }

}
