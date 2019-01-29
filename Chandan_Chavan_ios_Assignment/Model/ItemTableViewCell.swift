//
//  ItemTableViewCell.swift
//  Chandan_Chavan_ios_Assignment
//
//  Created by Rushikesh Nikam on 29/01/19.
//  Copyright © 2019 chandan chavan. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(data : ItemDataModel) -> Void {
       // self.lblTitle.text = data.username
    }
}
