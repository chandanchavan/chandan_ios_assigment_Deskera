//
//  ContentVC.swift
//  PageViewControllerWithTabs
//
//  Created by Leela Prasad on 22/03/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit


class ContentVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    var arrOFUserData:[ItemDataModel] = []
     var dataArr :[ItemDataModel] = []
    var pageIndex: Int = 0
    var strTitle: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = strTitle
        NetworkManager.sharedInstance.getItemsData { (response, error) in
            guard let jsondata = response as? [String :AnyObject] else {
                return
            }
            if let data = jsondata["users"] as? [[String : Any]]
            {
                for user  in data {
                    let obj = ItemDataModel(jsonObject: user as [String : AnyObject])
                    self.arrOFUserData.append(obj)
                }
            }
            
            DispatchQueue.main.async {
                self.tableView .reloadData()
                
            }
        }
    }

}
extension ContentVC: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as!ItemTableViewCell
        cell.setData(data: dataArr[indexPath.row])
        return cell
    }
}
