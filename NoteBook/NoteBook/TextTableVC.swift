//
//  MainTableVC.swift
//  NoteBook
//
//  Created by Squid Rewards on 04/07/2019.
//  Copyright © 2019 Caolan. All rights reserved.
//

import UIKit
import FirebaseDatabase


class TextTableVC: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topNav: UINavigationItem!
    
    var sectionsArray:[String] = []
    
    var ref:DatabaseReference?
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsArray.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row < sectionsArray.count)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StandardTextCell",for: indexPath) as! StandardTextCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.setCell(sectionsArray[indexPath.row])
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "StandardTextEntryCell") as! StandardTextEntryCell
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            cell.setCell()
            cell.add=self.add
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row < sectionsArray.count)
        {
            let section = sectionsArray[indexPath.row]
            GlobalV.dbRef = ref?.child(section)
            let sb = UIStoryboard(name: "Main", bundle: nil)
            guard let txtTable = sb.instantiateViewController(withIdentifier: "TextTableVC") as? TextTableVC else{
                print("Cant find View Controller")
                return
            }
            self.navigationController?.pushViewController(txtTable, animated: true)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        ref = GlobalV.dbRef
        
        topNav.title = ref?.key
        ref!.observeSingleEvent(of: .value) { snapshot in
            
            for case let section as DataSnapshot in snapshot.children {
                
                let sectionName = section.key
                self.sectionsArray.append(sectionName)
            }
            self.tableView.reloadData()
        }
    }
    
    
    
    func add(_ test:String) -> () {
        
        print("Text table",test)
        
        
        ref?.child(test).setValue("empty")
        sectionsArray.append(test)
        tableView.reloadData()
    }
    
    
}
