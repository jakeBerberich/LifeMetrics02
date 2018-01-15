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

struct Personal {
    var myName: String
    var birthDate: Date
    var phoenixDate: Date
    var startBodyWeight: Double
    var targetBodyWeight: Double
    var currentBodyWeight: Float
    var heightInches: Float
    var gender: String
}

struct PickerValues {
    var metric: String
    var metricItems: [String]
}

var bodyMassIndex: Double = 0

class Category {
    var category: String
    var metrics: [String]
    
    
    init(category: String, metrics:[String] ){
        self.category = category
        self.metrics = metrics
        
    }
}

struct DailyMetric: Codable {
    var category: String
    var metric: String
    var score: Int
    var forDate: String
    var dayName: String
}

struct DailySummary: Codable  {
    var forDate: String
    var dayName: String
    var totalScore: Int
}
