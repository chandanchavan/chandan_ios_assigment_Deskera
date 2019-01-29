//
//  ProfileViewController.swift
//  Chandan_Chavan_ios_Assignment
//
//  Created by Rushikesh Nikam on 22/01/19.
//  Copyright © 2019 chandan chavan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var imgViewForUser: UIImageView!
    
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var lblHobby: UILabel!
    
    @IBOutlet weak var txtHooby: UITextField!
    
    @IBOutlet weak var lblDOJ: UILabel!
    
    @IBOutlet weak var txtDOJ: UITextField!
    
    var arrOFUserData = [UserDataModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        imgViewForUser.layer.borderWidth = 1
        imgViewForUser.layer.masksToBounds = false
        imgViewForUser.layer.borderColor = UIColor.black.cgColor
        imgViewForUser.layer.cornerRadius = imgViewForUser.frame.height/2
        imgViewForUser.clipsToBounds = true
        getData()
    }
    func getData() -> Void {
        NetworkManager.sharedInstance.getDataFromLocalJson { (response, error) in
            guard let jsondata = response as? [String :AnyObject] else {
                return
            }
            if let data = jsondata["users"] as? [[String : Any]]
            {
                for user  in data {
                    let obj = UserDataModel(jsonObject: user as [String : AnyObject])
                    self.arrOFUserData.append(obj)
                }
            }
            
            DispatchQueue.main.async {
                self.txtEmail.text = self.arrOFUserData[0].username
                self.txtDOJ.text = self.arrOFUserData[0].dateOfJoining
                self.lblUserName.text = self.arrOFUserData[0].username
            }
            
        }
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
