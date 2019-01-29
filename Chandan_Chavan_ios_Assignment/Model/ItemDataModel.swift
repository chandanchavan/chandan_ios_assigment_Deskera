//
//  ItemDataModel.swift
//  Chandan_Chavan_ios_Assignment
//
//  Created by Rushikesh Nikam on 23/01/19.
//  Copyright © 2019 chandan chavan. All rights reserved.
//

import Foundation
import UIKit
class ItemDataModel: NSObject {
    var name :String
    var discription :String
    var categories :String
    
    
    override init() {
        self.name = ""
        self.categories = ""
        self.discription = ""
        
    }
    convenience init(jsonObject : Any?) {
        self.init()
        if let data = jsonObject as? [String : Any] {
            self.name = data["name"] as? String ?? ""
            self.discription = data["discription"] as? String ?? ""
            self.categories = data["categories"] as? String ?? ""
           
        }
    }
}
