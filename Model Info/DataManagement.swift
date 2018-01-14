//
//  DataManagement.swift
//  LifeMetrics02
//
//  Created by Jake Berberich on 12/29/17.
//  Copyright © 2017 Jake Berberich. All rights reserved.
//

import Foundation


func writeDataToStorage()  {
    let jsonEncoder = JSONEncoder()
    
//    do {
//      //  let jsonData = try  jsonEncoder.encode([peopleArray])
//        let jsonString = String(data: jsonData, encoding: .utf8)
//        if  let jsonString = jsonString {
//            print("encoding the string \(jsonString)")
//            
//            UserDefaults.standard.set(jsonString, forKey: "arrayData")
//        }
//        
//    } catch { print("error in encoding")
//        
//}
}

//---------------------------------------------------------------------------------
func returnStoredData() {
    // return a stored json string from userDefaults
    var getBack = UserDefaults.standard.object(forKey: "arrayData") as!  String
    print("return from User Defaults \(getBack)")
    // the returned string has an extra set of [] that need to be droped
    let sliced = String(getBack.characters.dropFirst())
    let sliced2 = String(sliced.characters.dropLast())
    getBack = sliced2 // slimmed down Json string
    
    let newJsonData = getBack.data(using: .utf8)! // convert string back to Data
    print("new json data \(newJsonData)")
    
    
//    if let newData = getBack.data(using: String.Encoding.utf8) {
//        print("value of new data \(newData)")
//        do {
//            let decoder = JSONDecoder()
//            let   peopleArray =  try decoder.decode([people].self , from: newData)
//            print("array returned from decoder \(peopleArrayJson)")
//            for people in peopleArray {
//                print(people.fullName)
//            }
//        }
//        catch { print("error")
//
//        }
//    }
    func returnData() {
        print("remote return data selected")
    }
}
//----------------------------------------------------------------------------------
