//
//  RemoteFunctions.swift
//  LifeMetrics02
//
//  Created by Jake Berberich on 1/14/18.
//  Copyright © 2018 Jake Berberich. All rights reserved.
//

import Foundation
class RemoteFunctions {
    
    func performRemoteJob() {
        print("do remote stuff")
        var remoteValue: String = "remote String Value"
        print(remoteValue)
    }
    
    func returnSomeData() -> (String) {
        var returnData: String = "jakeMan"
        return returnData
    }
}
