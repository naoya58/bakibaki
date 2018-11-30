//
//  WallPaperPreviewCell.swift
//  bakibaki
//
//  Created by Naoya Taniguchi on 2018/11/27.
//  Copyright © 2018年 Naoya Taniguchi. All rights reserved.
//

import UIKit
import FirebaseStorage
import Pring

class WallPaperPreviewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    
    func configure(data: Image) {
        
        imageView.backgroundColor = UIColor.lightGray
        
        guard let file = data.imageFile else { return }
        
        
        let _ = file.getData { (data, error) in
            
            if let data = data {
                self.imageView.image = UIImage(data: data)
            } else {
                print("not found image")
            }
        }
    }
}
