//
//  EditDataViewController.swift
//  Chandan_Chavan_ios_Assignment
//
//  Created by Rushikesh Nikam on 22/01/19.
//  Copyright © 2019 chandan chavan. All rights reserved.
//

import UIKit

class EditDataViewController: UIViewController {
    var dataArr :[UserDataModel] = []
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblSelectedItems: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnDoneClicked(_ sender: Any) {
        
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
extension EditDataViewController: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as!MyTableViewCell
        cell.setData(data: dataArr[indexPath.row])
        return cell
}
}
