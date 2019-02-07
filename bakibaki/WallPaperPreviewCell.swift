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
//import SkeletonView


class WallPaperPreviewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.setSkelton()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)!
//        self.setSkelton()
//    }
//
//    func setSkelton() {
//        isSkeletonable = true
//        imageView.isSkeletonable = true
//        let gradient = SkeletonGradient(baseColor: UIColor.amethyst)
//        imageView.showGradientSkeleton(usingGradient: gradient) // Gradient
//    }
    
    func configure(data: Image) {
        imageView.backgroundColor = UIColor.lightGray
//
//        imageView.isSkeletonable = true
//        let gradient = SkeletonGradient(baseColor: UIColor.amethyst)
//        imageView.showGradientSkeleton(usingGradient: gradient) // Gradient
        
        
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    
//        NSLayoutConstraint.activate([imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
//                                     imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
//                                     imageView.heightAnchor.constraint(equalToConstant: frame.height / 2),
//                                     imageView.widthAnchor.constraint(equalToConstant: frame.width / 2)])
       

        
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
