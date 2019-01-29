//
//  UserDetailViewController.swift
//  Chandan_Chavan_ios_Assignment
//
//  Created by Rushikesh Nikam on 22/01/19.
//  Copyright © 2019 chandan chavan. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblDOB: UILabel!
    @IBOutlet weak var lblTempratureDisplayUnit: UILabel!
    @IBOutlet weak var lblSound: UILabel!
    @IBOutlet weak var lblNotification: UILabel!
    @IBOutlet weak var lblDateProbationEnds: UILabel!
    @IBOutlet weak var lblProbationDuration: UILabel!
    @IBOutlet weak var lblDateBecomesPersant: UILabel!
     @IBOutlet weak var lblProbationLength: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "View Details"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
