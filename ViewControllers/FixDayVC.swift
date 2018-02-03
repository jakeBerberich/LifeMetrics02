//
//  FixDayVC.swift
//  LifeMetrics02
//
//  Created by Jake Berberich on 2/3/18.
//  Copyright © 2018 Jake Berberich. All rights reserved.
//

import UIKit

class FixDayVC: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var fromDateLabel: UILabel!
    @IBOutlet weak var newDateLabel: UILabel!
    @IBOutlet weak var fixModelLabel: UILabel!
    
    @IBOutlet weak var whichDate: UISegmentedControl!
    @IBOutlet weak var modeControl: UISegmentedControl!
    
    var fromDate: String = "blanks"
    var newDate:  String = "blanks"

    var dateMode: String = "from"
    var fixMode: String = "move"
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    func inzInitalValues() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        fromDateLabel.text = formatter.string(from: datePicker.date)
        
        //dateToReturn = formatter.string(from: datePicker.date)
        let formatterDayOfWeek = DateFormatter()
        formatterDayOfWeek.dateFormat = "EEEE"
        fixModelLabel.text = fixMode
        
    }

    @IBAction func dateModeChanged(_ sender: Any) {
        if whichDate.selectedSegmentIndex == 0 {
            dateMode = "from"
        } else {
            dateMode = "newDate"
           modeControl.selectedSegmentIndex = 0
              fixModelLabel.text = "Move to Date"        }
        
    }
    
    @IBAction func fixModeChanged(_ sender: Any) {
        if modeControl.selectedSegmentIndex == 0 {
            fixMode = "move"
            fixModelLabel.text = "Move to Date"
        } else {
            fixMode = "delete"
            fixModelLabel.text = "Delete This Date"
            newDateLabel.text = "Delete Mode"
        }
    }
    
    
    @IBAction func selectThisDate(_ sender: Any) {
        let formatter = DateFormatter()
        let formatterDayOfWeek = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatterDayOfWeek.dateFormat = "EEEE"
        if dateMode == "from" {
           fromDateLabel.text = formatter.string(from: datePicker.date)
        } else {
            newDateLabel.text = formatter.string(from: datePicker.date)        }
        
       // dateToReturn = formatter.string(from: datePicker.date)
        
        
    }
}
