//
//  DatePickerVC.swift
//  LifeStyles01
//
//  Created by Jake Berberich on 12/9/17.
//  Copyright © 2017 Jake Berberich. All rights reserved.
//

import UIKit

class DatePickerVC: UIViewController {
    @IBOutlet weak var datePicked: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    var dateToReurn: String = "blanks"
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func savedDate(_ sender: UIButton) {
      
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        datePicked.text = formatter.string(from: datePicker.date)
        print(datePicked.text!)
        
        
        dismiss(animated: true)
        
    }
    @IBAction func dateSelectedFromPicker (_ : AnyObject) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        datePicked.text = formatter.string(from: datePicker.date)
        print(datePicked.text!)
        dateToReurn = formatter.string(from: datePicker.date)
    }
    

    

}
