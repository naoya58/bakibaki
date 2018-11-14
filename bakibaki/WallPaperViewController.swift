//
//  WallPaperViewController.swift
//  bakibaki
//
//  Created by Naoya Taniguchi on 2018/11/04.
//  Copyright © 2018年 Naoya Taniguchi. All rights reserved.
//

import UIKit

class WallPaperViewController: UIViewController {
    

    @IBOutlet var UIImage: UIImageView!
    
    var receiveNum: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SaveButton(_ sender: Any) {

        // UIImage を取得
        let targetImage = UIImage.image!

        // UIImage の画像をカメラロールに画像を保存
        UIImageWriteToSavedPhotosAlbum(targetImage, self, #selector(self.showResultOfSaveImage(_:didFinishSavingWithError:contextInfo:)), nil)

    }

    // 保存を試みた結果をダイアログで表示
    @objc func showResultOfSaveImage(_ image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutableRawPointer) {
        
        var title = "保存完了"
        var message = "カメラロールに保存しました"

        if error != nil {
            title = "エラー"
            message = "保存に失敗しました"
        }

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        // OKボタンを追加
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        // UIAlertController を表示
        self.present(alert, animated: true, completion: nil)
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
