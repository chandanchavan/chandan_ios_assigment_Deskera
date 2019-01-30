//
//  FavouriteTableViewCell.swift
//  Chandan_Chavan_ios_Assignment
//
//  Created by Rushikesh Nikam on 23/01/19.
//  Copyright © 2019 chandan chavan. All rights reserved.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var btnCheck: UIButton!
    
    @IBOutlet weak var backgroundCellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setData(data : ItemDataModel) -> Void {
        
            self.lblName.text = data.name
            self.descLabel.text = data.discription
            self.categoryLabel.text = data.categories
        self.backgroundCellView?.layer.cornerRadius = 8.0
        self.backgroundCellView?.layer.masksToBounds = true
        
        
        imgView.layer.borderWidth = 1
        imgView.layer.masksToBounds = false
        imgView.layer.borderColor = UIColor.black.cgColor
        imgView.layer.cornerRadius = imgView.frame.height/2
        imgView.clipsToBounds = true
    }
}

