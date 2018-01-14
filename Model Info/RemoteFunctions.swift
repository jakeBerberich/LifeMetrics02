//
//  RemoteFunctions.swift
//  LifeMetrics02
//
//  Created by Jake Berberich on 1/14/18.
//  Copyright © 2018 Jake Berberich. All rights reserved.
//

import Foundation
class RemoteFunctions {
    var metricCategoryArray = [metricCategory]()
    var metricItemArray = [metricItems]()
    
//    func performRemoteJob() {
//        print("do remote stuff")
//        var remoteValue: String = "remote String Value"
//        print(remoteValue)
//    }
//    
//    func returnSomeData() -> (String) {
//        var returnData: String = "jakeMan"
//        return returnData
//    }
    
    func returnJson() -> ([metricItems], [metricCategory]) {
 
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
        
        return (metricItemArray, metricCategoryArray)
    }
    
    }
