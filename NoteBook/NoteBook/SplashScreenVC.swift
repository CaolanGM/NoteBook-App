//
//  Splash Screen VC.swift
//  NoteBook
//
//  Created by Squid Rewards on 04/07/2019.
//  Copyright © 2019 Caolan. All rights reserved.
//

import UIKit

class SplashScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        sleep(5)
        let mainStorybaord = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let loggedInViewController = mainStorybaord.instantiateViewController(withIdentifier: "NavControl") as? UINavigationController else{
            print("Cant find View Controller")
            return
        }
        self.present(loggedInViewController, animated: true, completion: nil)

    }

    

}
