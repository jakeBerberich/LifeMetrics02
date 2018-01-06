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
    @IBOutlet weak var categoryLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
getJson()
      buildPickerOptions(choice: "Sleep")
        buildPickerOptions(choice: "Cardio")
    }

    func getJson() {
     let path = Bundle.main.path(forResource: "category", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            self.metricCategoryArray = try JSONDecoder().decode([metricCategory].self, from: data)
            metricCategoryArray.sort(by:{ $0.order < $1.order})
        } catch   { print("error")
            
        }
//-------------
        let path2 = Bundle.main.path(forResource: "metric", ofType: "json")
        let url2 = URL(fileURLWithPath: path2!)
        
        do {
            let data = try Data(contentsOf: url2)
            self.metricItemArray = try JSONDecoder().decode([metricItems].self, from: data)
            
        } catch   { print("error")
            
        }
        
        
    }
  // create an array subset for the selected category
    func buildPickerOptions<T>(choice: T ){
        let selection:String = choice as! String
        let pickerOptions = metricItemArray.filter({return $0.metricItem == selection})
        print(pickerOptions)
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


