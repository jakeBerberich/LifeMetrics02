//
//  MeasurementSubfileVC.swift
//  LifeMetrics02
//
//  Created by Jake Berberich on 12/30/17.
//  Copyright © 2017 Jake Berberich. All rights reserved.
//

import Foundation
import UIKit

class MeasurementSubfileVC: UITableViewController {
    
    var metricItemArray = [metricItems]()
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJson()
        
        
    }
    
    func getJson() {
        let path = Bundle.main.path(forResource: "metric", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            self.metricItemArray = try JSONDecoder().decode([metricItems].self, from: data)
            metricItemArray.sort(by:{ $0.metricItem < $1.metricItem})
        } catch   { print("error")
            
        }
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return metricItemArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        let metricRow = self.metricItemArray[indexPath.row]
        
        cell.textLabel?.text = metricRow.metricItem
        cell.detailTextLabel?.text = ("\(metricRow.attribute)   \( metricRow.defaultUI)")
        return cell
    }
    
    
     
}
