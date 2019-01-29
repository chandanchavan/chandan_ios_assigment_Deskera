//
//  NetworkManager.swift
//  Chandan_Chavan_ios_Assignment
//
//  Created by Rushikesh Nikam on 23/01/19.
//  Copyright © 2019 chandan chavan. All rights reserved.
//
import Foundation
class NetworkManager : NSObject {
    static let sharedInstance = NetworkManager()
    override init() {}
func getDataFromLocalJson(completion : @escaping (_ response : Any? , _ error : Error?) -> Void)->Void {
    let url = Bundle.main.url(forResource: "UserData", withExtension: "json")
    
    guard let jsonData = url else{return}
    guard let data = try? Data(contentsOf: jsonData) else { return }
    do {
        print(data)
        let jsonData = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        print(jsonData)
        if let data = jsonData as? [String : AnyObject] {
            completion(data,nil)
        }
    }catch {
        print(error)
        completion(nil, error)
    }
}
    func getItemsData(completion:@escaping(_ respons: Any?,_ error :Error?)->Void) -> Void {
        
        let url = Bundle.main.url(forResource: "ItemsData", withExtension: "json")
        guard let jsondata = url else{return}
        guard let data = try? Data(contentsOf: jsondata) else {return}
        do
        {
         let jsondata = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        if let data = jsondata as? [String :AnyObject]
        {
            completion(data,nil)
        }
        }
        catch{
            print(error)
            completion(nil, error)
        }
    }
}
