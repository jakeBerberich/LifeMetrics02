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
    override func viewDidLoad() {
        super.viewDidLoad()
   loadAboutMe()
      
    }
    func loadAboutMe()  {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let birthday = DateComponents(calendar: .current, year: 1954, month: 11, day: 02).date!
        let aboutMe = Personal(myName: "Jake Berberich", birthDate: birthday, startBodyWeight: 231, targetBodyWeight: 225, currentBodyWeight: 230, heightInches: 73, gender: "Male")
        myNameLabel.text = aboutMe.myName
        birthdayLabel.text     =  formatter.string(from: aboutMe.birthDate)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
        
    }

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//
//
//        // Configure the cell...
//
//
//        return cell
//    }
//

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
