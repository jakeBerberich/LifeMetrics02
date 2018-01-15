//
//  AboutMeTableVC.swift
//  LifeMetrics02
//
//  Created by Jake Berberich on 1/13/18.
//  Copyright © 2018 Jake Berberich. All rights reserved.
//

import UIKit

class AboutMeTableVC: UITableViewController {

    @IBOutlet weak var myNameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var sinceBornLabel: UILabel!
    @IBOutlet weak var phoenixDateLabel: UILabel!
    @IBOutlet weak var ageDatesLabel: UILabel!
    @IBOutlet weak var agePhoenixLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAboutMe()
      
    }
    func loadAboutMe()  {
        let formatterA = DateFormatter()
        
      formatterA.dateFormat = "yyyy-MM-dd"
        
        let birthday = DateComponents(calendar: .current, year: 1954, month: 11, day: 02).date!
        let startDate = DateComponents(calendar: .current, year: 2018, month: 01, day: 12).date!
        let aboutMe = Personal(myName: "Jake Berberich", birthDate: birthday, phoenixDate: startDate, startBodyWeight: 231, targetBodyWeight: 225, currentBodyWeight: 230, heightInches: 73, gender: "Male")
        myNameLabel.text = aboutMe.myName
        birthdayLabel.text  = ("Birth Day  \(formatterA.string(from: aboutMe.birthDate))")
        phoenixDateLabel.text = ("Phoenix Day  \(formatterA.string(from: aboutMe.phoenixDate))")
        
        let currentDate = Date()
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.day, .month, .year]
        
        let sinceBorn = formatter.string(from: birthday, to: currentDate)
        ageDatesLabel.text = String(describing: sinceBorn!)
        let sinceStart = formatter.string(from: startDate, to: currentDate)
        agePhoenixLabel.text = String(describing: sinceStart!)
        let weight = aboutMe.currentBodyWeight
        let height = aboutMe.heightInches
        let bmi = (weight*703)/height
        print(bmi)
        bmiLabel.text = String(bmi)
        
        
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
        
    }

    
 
}

