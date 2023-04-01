//
//  HelperFuncation.swift
//  Motton Challnge
//
//  Created by salah waleed on 01/04/2023.
//

import Foundation
 
class HelperFuncation {
    
    static func getImg (urlImg:String) -> Data {
       let url = URL(string: urlImg)
        do{
            let data = try Data(contentsOf:url!)
           
                 
         return data
           
        }catch{
            print(error.localizedDescription)
        }
        return Data()
    }
}
