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
    
 
    var metricCategoryArray = [metricCategory]()
    var metricItemArray = [metricItems]()
    
    @IBOutlet weak var categoryLabel: UILabel!
    let remoteJobs = RemoteFunctions() // create instance for call remote functions
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     returnJson()
    }
    
    func returnJson() { // decode Json to arrays
        metricItemArray = remoteJobs.returnJson().0
        metricCategoryArray = remoteJobs.returnJson().1
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
