//
//  MainTableVC.swift
//  NoteBook
//
//  Created by Squid Rewards on 04/07/2019.
//  Copyright © 2019 Caolan. All rights reserved.
//

import UIKit

class MainTableVC: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row < 4)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StandardTextCell",for: indexPath) as! StandardTextCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "StandardTextEntryCell") as! StandardTextEntryCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.setCell()
            return cell
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    

}
