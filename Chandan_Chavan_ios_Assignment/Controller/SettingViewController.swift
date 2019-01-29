//
//  SettingViewController.swift
//  Chandan_Chavan_ios_Assignment
//
//  Created by Rushikesh Nikam on 22/01/19.
//  Copyright © 2019 chandan chavan. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var lblTemperatureDisplayUnit: UILabel!
    @IBOutlet weak var lblUnits: UILabel!
    
    @IBOutlet weak var lblSound: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnViewDisplayClicked(_ sender: Any) {
        
        print("button tapped")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pushVC = storyboard.instantiateViewController(withIdentifier: "userdetail")as!UserDetailViewController
        self.navigationController?.pushViewController(pushVC, animated: true)
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
