//
//  Splash Screen VC.swift
//  NoteBook
//
//  Created by Squid Rewards on 04/07/2019.
//  Copyright © 2019 Caolan. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SplashScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        sleep(3)
        let mainStorybaord = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let loggedInViewController = mainStorybaord.instantiateViewController(withIdentifier: "NavControl2") as? UINavigationController else{
            print("Cant find View Controller")
            return
        }
        
        GlobalV.dbRef = Database.database().reference().child("Home Screen")
        //updateDB()
        self.present(loggedInViewController, animated: true, completion: nil)

    }

    
    func updateDB(){
        
        let ref = Database.database().reference().child("Home Screen").child("Instagram").child("Los Angeles")
        ref.observeSingleEvent(of: .value) { snapshot in
            
            let ref2  = Database.database().reference().child("Home Screen").child("LA Places")
            ref2.setValue(snapshot)
        }
    }

}
