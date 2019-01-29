//
//  TableViewController.swift
//  Chandan_Chavan_ios_Assignment
//
//  Created by Rushikesh Nikam on 22/01/19.
//  Copyright © 2019 chandan chavan. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    var arrOFUserData : [UserDataModel] = []
    var filteredArray :[UserDataModel] = []
    var searchActive : Bool = false
    var selectedIndex : Int = 0
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
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
                self.tableView .reloadData()
               
            }
        }
    }

    @IBAction func btnAddClicked(_ sender: Any) {
    }
    @IBAction func btnEditClicked(_ sender: Any) {
    }
}
extension TableViewController : UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate
{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
           return filteredArray.count
        }
        else
        {
            return self.arrOFUserData.count
        }
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        if(searchActive) {
            cell.setData(data: filteredArray[indexPath.row])
        }
        else{
            cell.setData(data: arrOFUserData[indexPath.row])
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pushVC = storyboard.instantiateViewController(withIdentifier: "edittitlevc")as!EditTiitleViewController
        pushVC.userData = self.arrOFUserData[indexPath.row]
        pushVC.tablevcDelgate = self
        self.navigationController?.pushViewController(pushVC, animated: true)
        //self.present(pushVC, animated:true, completion:nil)
    }
    
    private func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.filteredArray = arrOFUserData.filter({ (userDataModel) -> Bool in
            let tmp: NSString = userDataModel.username as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        if( self.filteredArray.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tableView.reloadData()
    }
}
extension TableViewController : setUserData
{
    func PassEditedObject(data: UserDataModel) {
        arrOFUserData.remove(at: selectedIndex)
        arrOFUserData.insert(data, at: selectedIndex)
        let indexpath = IndexPath(row: selectedIndex, section: 0)
        self.tableView.reloadRows(at: [indexpath], with: .none)
    }
    
    
}
