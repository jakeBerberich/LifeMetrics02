//
//  Structures.swift
//  LifeMetrics02
//
//  Created by Jake Berberich on 12/29/17.
//  Copyright © 2017 Jake Berberich. All rights reserved.
//

import Foundation
struct metricCategory: Codable {
    var metric: String
    var order: Int
    var activated: Bool
    var comments: String
}

struct metricItems: Codable {
    var metricItem: String
    var attribute: String
    var factor: Int
    var defaultUI: Bool
}

struct personal {
    var myName: String
    var birthDate: Date
    var startBodyWeight: Double
    var targetBodyWeight: Double
    var currentBodyWeight: Int
    var heightInches: Double
    var gender: String
}

var bodyMassIndex: Double = 0


    

