//
//  CategorySubfileVCTableViewController.swift
//  LifeMetrics02
//
//  Created by Jake Berberich on 12/29/17.
//  Copyright © 2017 Jake Berberich. All rights reserved.
//

import UIKit

class CategorySubfileVC: UITableViewController {
    
var allDailyMetricArray = [DailyMetric]()
    
    
     let remoteJobs = RemoteFunctions() // create instance for call remote functions
    
    @IBOutlet weak var categoryLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        returnAllDailyMetrics()
        tableView.reloadData()
        
    }
    
    
    func returnAllDailyMetrics() { // decode Json to arrays
        allDailyMetricArray = remoteJobs.returnDailyDetail()
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allDailyMetricArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let categoryRow = self.allDailyMetricArray[indexPath.row]
        // cell.categoryLabel?.text = categoryRow.metric
        cell.textLabel?.text = ("Category: \(categoryRow.category)  \(categoryRow.forDate)")
        cell.detailTextLabel?.text = categoryRow.dayName
        return cell
    }
    
    
    
}


