//
//  ValuePickerVC.swift
//  LifeMetrics02
//
//  Created by Jake Berberich on 12/31/17.
//  Copyright © 2017 Jake Berberich. All rights reserved.
//

import Foundation
import UIKit

class ValuePickerVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    class Category {
        var category: String
        var metrics: [String]

        init(category: String, metrics:[String]) {
            self.category = category
            self.metrics = metrics
        }
    }
    var categories = [Category]()
    
    
    @IBOutlet weak var valueChoiceLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    
var metricMeasurementArray = [metricItems]()
var metricCategoryArray = [metricCategory]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categories.append(Category(category: "Sleep", metrics: ["Great", "Fair", "Poor"]))
        categories.append(Category(category: "Cardio", metrics: ["Walk", "Bike", "None"]))
        categories.append(Category(category: "Weight", metrics: ["Even", "Down", "Up"]))
        
        getJson()
       pickerView.delegate = self
        pickerView.dataSource = self
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return categories.count
        }
        else {
            let selectedCategory = pickerView.selectedRow(inComponent: 0)
            return categories[selectedCategory].metrics.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return categories[row].category
        }
        else {
            let selectedCategory = pickerView.selectedRow(inComponent: 0)
            return categories[selectedCategory].metrics[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadComponent(1)
        let selectedCategory = pickerView.selectedRow(inComponent: 0)
        let selectedMetric = pickerView.selectedRow(inComponent: 1)
        let category = categories[selectedCategory].category
        let metric = categories[selectedCategory].metrics[selectedMetric]
        print ("selected: \(category)  \(metric)")
        valueChoiceLabel.text = ("Category: \(category)  Metric: \(metric)")
        
    }
    
    // create an array subset for the selected category
    func buildPickerOptions<T>(choice: T ) {
        let selection:String = choice as Any as! String
        let pickerOptions = metricMeasurementArray.filter({return $0.metricItem == selection})
        print(pickerOptions)
        
      
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
            self.metricMeasurementArray = try JSONDecoder().decode([metricItems].self, from: data)
            
        } catch   { print("error")
            
        }
        
        
    }
    
    
}
