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
    
  
    
    var categoryArray = [Category]()
    var dailyMetricArray = [DailyMetric]()
    
    var dateToReturn: String = "blanks"
    var findCategory: String = "blanks"
    var findAtribute: String = "blanks"
    var dailyScore: Int = 0
    
    @IBOutlet weak var valueChoiceLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var selectedDate: UILabel!
    
    var metricItemArray = [metricItems]()   // raw values from Json
    var metricCategoryArray = [metricCategory]()  // raw values from Json
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            getJson()
        buildPickerData()
           pickerView.delegate = self
           pickerView.dataSource = self
      inzDateValue()
        
        
    }
    
        func buildPickerData() {
        let subCategories = Set(metricItemArray.map{$0.metricItem})
        print(subCategories)
        for picker in subCategories {
        let  filtered =  metricItemArray.filter({$0.metricItem == picker})
            categoryArray.append(Category(category: picker, metrics: filtered.map({$0.attribute})))
        }
         
    }
    func inzDateValue() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        selectedDate.text = formatter.string(from: datePicker.date)
        print(selectedDate.text!)
        dateToReturn = formatter.string(from: datePicker.date)
        
    }
    @IBAction func selectThisDate(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        selectedDate.text = formatter.string(from: datePicker.date)
        print(selectedDate.text!)
        dateToReturn = formatter.string(from: datePicker.date)
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadComponent(1)
        let selectedCategory = pickerView.selectedRow(inComponent: 0)
        let  selectedMetric = pickerView.selectedRow(inComponent: 1)
        let category = categoryArray[selectedCategory].category
        let metric = categoryArray[selectedCategory].metrics[selectedMetric]
       // print ("selected: \(category)  \(metric)")
        valueChoiceLabel.text = ("Category: \(category)  Metric: \(metric)")
        findCategory = category
        findAtribute = metric
    }
    
    
    @IBAction func buildThisMeasurement(_ sender: Any) {
        
        for item in metricItemArray where item.metricItem == findCategory && item.attribute == findAtribute {
            print(" \(dateToReturn)  \(item.metricItem)  \(item.attribute)  \(item.factor)")
            let daily = DailyMetric(category: item.metricItem, metric: item.attribute, score: item.factor, forDate: dateToReturn)
            dailyMetricArray.append(daily)
            print(dailyMetricArray)
        }
    
    }
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return categoryArray.count
        }
        else {
            let selectedCategory = pickerView.selectedRow(inComponent: 0)
            return categoryArray[selectedCategory].metrics.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return categoryArray[row].category
        }
        else {
            let selectedCategory = pickerView.selectedRow(inComponent: 0)
            return categoryArray[selectedCategory].metrics[row]
        }
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let destinationVC = segue.destination as! ChoiceSummarySubfileVC
        destinationVC.dailyMetricArray = dailyMetricArray
    }
    
    @IBAction func unwindBack(sender: UIStoryboardSegue) {
        let sourceViewController = sender.source as! ChoiceSummarySubfileVC
        dailyMetricArray = sourceViewController.dailyMetricArray
        
    }
}
