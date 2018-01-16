//
//  Alert.swift
//  LifeMetrics02
//
//  Created by Jake Berberich on 1/15/18.
//  Copyright © 2018 Jake Berberich. All rights reserved.
//

// https://www.youtube.com/watch?v=4EAGIiu7SFU

import Foundation
import UIKit

class Alert {
    
    class func showBasic(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
}
