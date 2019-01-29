//
//  MyTableViewCell.swift
//  Chandan_Chavan_ios_Assignment
//
//  Created by Rushikesh Nikam on 22/01/19.
//  Copyright © 2019 chandan chavan. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var backgroundCellView: UIView!

    @IBOutlet weak var btnCheckBox: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundCellView?.layer.cornerRadius = 8.0
        self.backgroundCellView?.layer.masksToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setData(data : UserDataModel) -> Void {
        self.lblTitle.text = data.username
    }
    func setDataWithSelectedItems (data : UserDataModel)->Void
    {
        self.lblTitle.text = data.username
    }
}
