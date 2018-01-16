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
    var allDailySummaryArray = [DailySummary]() // all the daily metric details
    var allDailyDetailArray = [DailyMetric]()
    var allDailySummaryKey: String = "allDailySummary"
    var allDailyDetailKey: String = "allDailyDetail"
    
    var jsonEncoder = JSONEncoder()
    var jsonDecoder = JSONDecoder()
//----------------------------------------------------------------------------------------------------------------------------
    func returnStoredData()-> [DailySummary] {
        // return a stored json string from userDefaults
        
            var getBack = UserDefaults.standard.object(forKey: allDailySummaryKey) as!  String
        
        print("return from User Defaults \(getBack)")
        // the returned string has an extra set of [] that need to be droped
        let sliced = String(getBack.characters.dropFirst())
        let sliced2 = String(sliced.characters.dropLast())
        getBack = sliced2 // slimmed down Json string
        
        let newJsonData = getBack.data(using: .utf8)! // convert string back to Data
        print("new json data \(newJsonData)")
        
            if let newData = getBack.data(using: String.Encoding.utf8) {
                print("value of new data \(newData)")
                do {
                    let decoder = JSONDecoder()
                     self.allDailySummaryArray =  try decoder.decode([DailySummary].self , from: newData)
                    
                    for items in allDailySummaryArray {
                        print(items.dayName)
                    }
                }
                catch { print("error")
        
                }
            }
        return (allDailySummaryArray)
    }
//----------------------------------------------------------------------------------------------------------------------------
    func writeJsonToStorage(inArray:[DailySummary])  {
        
            do {
              let jsonData = try  jsonEncoder.encode([inArray])
                let jsonString = String(data: jsonData, encoding: .utf8)
                if  let jsonString = jsonString {
                    print("encoding the string \(jsonString)")
        
                    UserDefaults.standard.set(jsonString, forKey: allDailySummaryKey)
                }
        
            } catch { print("error in encoding")
        
        }
    }
//----------------------------------------------------------------------------------------------------------------------------
    func dailyDetailToStorage(inArray:[DailyMetric])  {
        
        do {
            let jsonData = try  jsonEncoder.encode([inArray])
            let jsonString = String(data: jsonData, encoding: .utf8)
            if  let jsonString = jsonString {
                print("encoding the string \(jsonString)")
                
                UserDefaults.standard.set(jsonString, forKey: allDailyDetailKey)
            }
            
        } catch { print("error in encoding")
            
        }
    }
    
//----------------------------------------------------------------------------------------------------------------------------
    
    func returnDailyDetail()-> [DailyMetric] {
        // return a stored json string from userDefaults
        var getBack = UserDefaults.standard.object(forKey: allDailyDetailKey) as!  String
        print("return from User Defaults \(getBack)")
        // the returned string has an extra set of [] that need to be droped
        let sliced = String(getBack.characters.dropFirst())
        let sliced2 = String(sliced.characters.dropLast())
        getBack = sliced2 // slimmed down Json string
        
        let newJsonData = getBack.data(using: .utf8)! // convert string back to Data
        print("new json data \(newJsonData)")
        
        if let newData = getBack.data(using: String.Encoding.utf8) {
            print("value of new data \(newData)")
            do {
                let decoder = JSONDecoder()
                self.allDailyDetailArray =  try decoder.decode([DailyMetric].self , from: newData)
                
                for items in allDailyDetailArray {
                    print(items.metric)
                }
            }
            catch { print("error")
                
            }
        }
        return (allDailyDetailArray)
    }
    
//----------------------------------------------------------------------------------------------------------------------------
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
//----------------------------------------------------------------------------------------------------------------------------
    }
