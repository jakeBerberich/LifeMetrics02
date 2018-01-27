//
//  ChoiceSummarySubfileVC.swift
//  LifeMetrics02
//
//  Created by Jake Berberich on 1/13/18.
//  Copyright © 2018 Jake Berberich. All rights reserved.
//

import UIKit

class ChoiceSummarySubfileVC: UITableViewController {
   
    var dailyMetricArray = [DailyMetric]()
    var allDailyMetricArray = [DailyMetric]()
    var allDailySummary = [DailySummary]()
    let remoteJobs = RemoteFunctions() // create instance for call remote functions
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
 
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dailyMetricArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let dailyRow = self.dailyMetricArray[indexPath.row]
        // Configure the cell...
        cell.textLabel?.text = ("\(dailyRow.category)  \(dailyRow.metric)")
        cell.detailTextLabel?.text = (" \(dailyRow.dayName)  \(dailyRow.forDate) ")
        return cell
    }
 
    
    @IBAction func saveTheDay(_ sender: Any) {
        let scoreArray: [Int] = dailyMetricArray.map({return $0.score})
        let  dailyTotal: Int = scoreArray.reduce(0, +)
        let newDay = DailySummary(forDate: dailyMetricArray[0].forDate, dayName: dailyMetricArray[0].dayName, totalScore: dailyTotal)
        
     
            allDailySummary = remoteJobs.returnStoredData() // data will not initally be present on first run
    
        allDailySummary.append(newDay)
        remoteJobs.writeJsonToStorage(inArray: allDailySummary) // store data locally
       
        allDailyMetricArray =  remoteJobs.returnDailyDetail()
   
        for item in dailyMetricArray {
            allDailyMetricArray.append(item)
        }
        remoteJobs.dailyDetailToStorage(inArray: allDailyMetricArray)
        dailyMetricArray.removeAll()
       tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }

 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dailyMetricArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
  
    
    
    

}
