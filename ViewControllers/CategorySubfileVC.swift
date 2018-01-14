//
//  CategorySubfileVCTableViewController.swift
//  LifeMetrics02
//
//  Created by Jake Berberich on 12/29/17.
//  Copyright © 2017 Jake Berberich. All rights reserved.
//

import UIKit

class CategorySubfileVC: UITableViewController {
    
    var metricCategoryArray = [metricCategory]()
    var metricItemArray = [metricItems]()
    
    
     let remoteJobs = RemoteFunctions() // create instance for call remote functions
    
    @IBOutlet weak var categoryLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        returnJson()
        
    }
    func returnJson() { // decode Json to arrays
        metricItemArray = remoteJobs.returnJson().0
        metricCategoryArray = remoteJobs.returnJson().1
    }
    
 
  // create an array subset for the selected category
    func buildPickerOptions<T>(choice: T ){
        let selection:String = choice as! String
        let pickerOptions = metricItemArray.filter({return $0.metricItem == selection})
      
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return metricCategoryArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let categoryRow = self.metricCategoryArray[indexPath.row]
// cell.categoryLabel?.text = categoryRow.metric
     cell.textLabel?.text = categoryRow.metric
        cell.detailTextLabel?.text = categoryRow.comments
        return cell
    }
    
    
    
}


