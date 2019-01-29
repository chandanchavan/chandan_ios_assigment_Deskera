//
//  EditTiitleViewController.swift
//  Chandan_Chavan_ios_Assignment
//
//  Created by Rushikesh Nikam on 22/01/19.
//  Copyright © 2019 chandan chavan. All rights reserved.
//

import UIKit
protocol setUserData : class
{
    func PassEditedObject(data : UserDataModel)

}
class EditTiitleViewController: UIViewController {
    @IBOutlet weak var btnEdit: UINavigationItem!
    @IBOutlet weak var txtUserName: UITextField!
    weak var tablevcDelgate : setUserData?
    var userData = UserDataModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUserName.delegate = self
        txtUserName.isUserInteractionEnabled = false
        txtUserName.text = userData.username
        let button1 = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(EditBarButtonPressed(_:)))
        self.navigationItem.rightBarButtonItem  = button1
        // Do any additional setup after loading the view.
    }
    @objc func EditBarButtonPressed(_: UIBarButtonItem) {
        txtUserName.isUserInteractionEnabled = true
        userData.username = txtUserName.text ?? userData.username
        let item = self.navigationItem.rightBarButtonItem!
        if item.title == "Save"
        {
           tablevcDelgate?.PassEditedObject(data: userData)
        self.navigationController?.popViewController(animated: true)
        }
        
    }
 
    @IBAction func btnBackClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
extension EditTiitleViewController : UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let item = self.navigationItem.rightBarButtonItem!
        item.title = "Save"
//        let button = item.customView as? UIButton
//        button?.setTitle("Save", for: .normal)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        userData.username = txtUserName.text ?? userData.username
    }
}
