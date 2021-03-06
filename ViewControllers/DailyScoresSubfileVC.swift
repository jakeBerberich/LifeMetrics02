//
//  MeasurementSubfileVC.swift
//  LifeMetrics02
//
//  Created by Jake Berberich on 12/30/17.
//  Copyright © 2017 Jake Berberich. All rights reserved.
//

import Foundation
import UIKit

class DailyScoresSubfileVC: UITableViewController {
    
    var filterThisDate: String?
    
    var allDailyArray = [DailySummary]()
   
    
  
    let remoteJobs = RemoteFunctions() // create instance for call remote functions
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     returnDailySummary()
        tableView.reloadData()
        
    }

    func returnDailySummary() { // decode Json to
        allDailyArray =  remoteJobs.returnStoredData()
        
        
        
        allDailyArray.sort(by: {$0.forDate > $1.forDate}) // for UI
        
        tableView.reloadData()
        
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allDailyArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        let metricRow = self.allDailyArray[indexPath.row]
        
        cell.textLabel?.text = ("\( metricRow.dayName)  \(metricRow.forDate)")
        cell.detailTextLabel?.text = ("Total Score:  \(metricRow.totalScore)  ")
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = self.tableView.indexPathForSelectedRow
        let destinationVC = segue.destination as! DetailScoreHistoryVC
        destinationVC.filterThisDate = self.allDailyArray[indexPath!.row].forDate
      //  print(self.allDailyArray[indexPath!.row].forDate)
        
    }
    
    
     
}
