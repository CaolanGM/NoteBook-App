//
//  StandardTextCell.swift
//  NoteBook
//
//  Created by Squid Rewards on 05/07/2019.
//  Copyright © 2019 Caolan. All rights reserved.
//

import UIKit

class StandardTextCell: UITableViewCell {

    @IBOutlet weak var cellText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setCell(_ cellTextP:String){
        cellText.text = cellTextP
        cellText.numberOfLines = 10
    }
}
