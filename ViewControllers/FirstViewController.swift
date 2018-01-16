//
//  FirstViewController.swift
//  LifeMetrics02
//
//  Created by Jake Berberich on 12/29/17.
//  Copyright © 2017 Jake Berberich. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var restoreDailyLabel: UIButton!
    
    let remoteJobs = RemoteFunctions() // create instance for call remote functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func testRestoreFromUserData(_ sender: Any) {
        Alert.showBasic(title: "Retrieve Data", message: "you are about to retrieve", vc: self)
      let restoredDaily =  remoteJobs.returnStoredData()
        let restoredDetail = remoteJobs.returnDailyDetail()
       
    }
    
    func firstRun() {
        
    }
}

