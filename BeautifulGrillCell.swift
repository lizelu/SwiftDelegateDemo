//
//  BeautifulGrillCell.swift
//  SwiftTestDemo
//
//  Created by Mr.LuDashi on 15/12/18.
//  Copyright © 2015年 ZeluLi. All rights reserved.
//

import UIKit

class BeautifulGrillCell: UITableViewCell {

    @IBOutlet var girlImageView: UIImageView!
    
    @IBOutlet var girlNameLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
