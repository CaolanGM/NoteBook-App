//
//  StandardTextEntryCell.swift
//  NoteBook
//
//  Created by Squid Rewards on 05/07/2019.
//  Copyright © 2019 Caolan. All rights reserved.
//

import UIKit

class StandardTextEntryCell: UITableViewCell {

    @IBOutlet weak var textEntry: UITextField!
    
    var add: ((_ testStr:String) -> ())?
    
    @IBAction func addLine(_ sender: Any) {
        
        print("Text add clicked")

        
        let text = textEntry.text
        if(!text!.isEqual(""))
        {
            print("Text",text)
            add?(text!)
            textEntry.text = ""
        }
        else
        {
            print("No text")
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(){
        textEntry.borderStyle = UITextField.BorderStyle.none
    }
    
    
    
    
}


