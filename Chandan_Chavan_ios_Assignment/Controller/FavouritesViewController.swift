//
//  FavouritesViewController.swift
//  Chandan_Chavan_ios_Assignment
//
//  Created by Rushikesh Nikam on 22/01/19.
//  Copyright © 2019 chandan chavan. All rights reserved.
//

import UIKit

class FavouritesViewController: UIViewController {
    @IBOutlet weak var myFavDataTableView: UITableView!
var arrOFUserData = [ItemDataModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

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
extension FavouritesViewController :  UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrOFUserData.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : FavouriteTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavouriteTableViewCell
        cell.setData(data: arrOFUserData[indexPath.row])
        return cell
    }
    
}
