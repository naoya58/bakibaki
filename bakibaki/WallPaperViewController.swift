//
//  WallPaperViewController.swift
//  bakibaki
//
//  Created by Naoya Taniguchi on 2018/11/04.
//  Copyright © 2018年 Naoya Taniguchi. All rights reserved.
//

import UIKit

class WallPaperViewController: UIViewController {
    
    var receiveNum: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func CloseButton(_ sender: Any) {
        
        let WallPapersSB = UIStoryboard(name: "WallPapers", bundle: nil)
        let navigationVC = WallPapersSB.instantiateInitialViewController() as! UINavigationController
//        let WallPapersVC = navigationVC.topViewController as! WallPapersViewController
        
        present(navigationVC, animated: true) {
            print("go to WallPapers")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
