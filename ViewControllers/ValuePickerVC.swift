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
    var dayNameToReturn: String = "blanks"
    var findCategory: String = "blanks"
    var findAtribute: String = "blanks"
    var dailyScore: Int = 0
    let remoteJobs = RemoteFunctions() // create instance for call remote functions
    
    @IBOutlet weak var valueChoiceLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var selectedDate: UILabel!
    
    var metricItemArray = [metricItems]()   // raw values from Json
    var metricCategoryArray = [metricCategory]()  // raw values from Json
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      returnJson()
        buildPickerData()
        pickerView.delegate = self
        pickerView.dataSource = self
        inzInitalValues()
        
        
    }
    
        func buildPickerData() {
        let subCategories = Set(metricItemArray.map{$0.metricItem})
        for picker in subCategories {
        let  filtered =  metricItemArray.filter({$0.metricItem == picker})
            categoryArray.append(Category(category: picker, metrics: filtered.map({$0.attribute})))
        }
         
    }
    func inzInitalValues() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        selectedDate.text = formatter.string(from: datePicker.date)
       
        dateToReturn = formatter.string(from: datePicker.date)
         let formatterDayOfWeek = DateFormatter()
        formatterDayOfWeek.dateFormat = "EEEE"
        dayNameToReturn = formatterDayOfWeek.string(from: datePicker.date)
    }
    
    @IBAction func selectThisDate(_ sender: Any) {
        let formatter = DateFormatter()
        let formatterDayOfWeek = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatterDayOfWeek.dateFormat = "EEEE"
        selectedDate.text = formatter.string(from: datePicker.date)
       
        dateToReturn = formatter.string(from: datePicker.date)
        dayNameToReturn = formatterDayOfWeek.string(from: datePicker.date)
//        print(dayNameToReturn)
        
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
//            print(" \(dateToReturn)  \(item.metricItem)  \(item.attribute)  \(item.factor)")
            let daily = DailyMetric(category: item.metricItem, metric: item.attribute, score: item.factor, forDate: dateToReturn, dayName: dayNameToReturn)
            dailyMetricArray.append(daily)
//            print(dailyMetricArray)
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
    
    func returnJson() { // decode Json to arrays
        metricItemArray = remoteJobs.returnJson().0
        metricCategoryArray = remoteJobs.returnJson().1
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
