//
//  PhotoViewController.swift
//  bakibaki
//
//  Created by Naoya Taniguchi on 2018/11/25.
//  Copyright © 2018年 Naoya Taniguchi. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController,UIImagePickerControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func openButton(_ sender: Any) {
        // カメラロールが利用可能か？
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // 写真を選ぶビュー
            let pickerView = UIImagePickerController()
            // 写真の選択元をカメラロールにする
            // 「.camera」にすればカメラを起動できる
            pickerView.sourceType = .photoLibrary
            // デリゲート
            pickerView.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            // ビューに表示
            self.present(pickerView, animated: true)
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 選択した写真を取得する
        guard let image = info[.originalImage] as? UIImage else {
            print("image not found")
            return
        }
        
        imageView.image = image
        
        self.dismiss(animated: true)
        
    }
   
}
