//
//  UserDataModel.swift
//  Chandan_Chavan_ios_Assignment
//
//  Created by Rushikesh Nikam on 22/01/19.
//  Copyright © 2019 chandan chavan. All rights reserved.
//

import Foundation
import UIKit
class UserDataModel: NSObject {
    var username :String
    var email :String
    var dateOfJoining :String
    var temeratureDisplayUnit :String
    var sound :String
    var notification :String
    var dateProbationEnds :String
    var probationDuration :String
    var dateBecomePerment : String
    var probationlength : String

    override init() {
        self.username = ""
        self.email = ""
        self.dateOfJoining = ""
        self.temeratureDisplayUnit = ""
        self.sound = ""
        self.notification = ""
        self.dateProbationEnds = ""
        self.probationDuration = ""
        self.dateBecomePerment = ""
        self.probationlength = ""

    }
    convenience init(jsonObject : Any?) {
        self.init()
        if let data = jsonObject as? [String : Any] {
            self.username = data["username"] as? String ?? ""
            self.email = data["email"] as? String ?? ""
            self.dateOfJoining = data["dateOfJoining"] as? String ?? ""
            self.temeratureDisplayUnit = data["temeratureDisplayUnit"] as? String ?? ""
            self.sound = data["sound"] as? String ?? ""
            self.notification = data["notification"] as? String ?? ""
            self.dateProbationEnds = data["dateProbationEnds"] as? String ?? ""
            self.probationDuration = data["probationDuration"] as? String ?? ""
            self.dateBecomePerment = data["probationDuration"] as? String ?? ""
            self.probationlength = data["probationlength"] as? String ?? ""
        }
    }
}
