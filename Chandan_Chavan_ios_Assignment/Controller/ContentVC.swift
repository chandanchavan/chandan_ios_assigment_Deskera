//
//  ContentVC.swift
//  PageViewControllerWithTabs
//
//  Created by Leela Prasad on 22/03/18.
//  Copyright © 2018 Leela Prasad. All rights reserved.
//

import UIKit

protocol getFavArray : class {
    func btnFavTap(_ sender: FavouriteTableViewCell)
}
class ContentVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    weak var delegateForContentvc : getFavArray?
    var selectedIndex : Int = 0
    var dataArr = [ItemDataModel]()
    var favArray = [ItemDataModel]()
    var pageIndex: Int = 0
    var strTitle: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = view
        //nameLabel.text = strTitle
                    DispatchQueue.main.async {
                        self.tableView .reloadData()
        
                    }
    }

}
extension ContentVC: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as!FavouriteTableViewCell
        cell.setData(data: dataArr[indexPath.row])
        cell.btnCheck.addTarget(self, action: #selector(SwiftyTableViewController.heartTapped(_:)), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if selectedIndex == 0 {
            
        }
        favArray.append(dataArr[indexPath.row])
    }
}
