//
//  Extension.swift
//  bakibaki
//
//  Created by Naoya Taniguchi on 2018/12/08.
//  Copyright © 2018年 Naoya Taniguchi. All rights reserved.
//

import UIKit

class Extension: NSObject {

}

extension UIButton {
    func btnShadow(radius: CGFloat, opacity: Float){
        self.layer.masksToBounds = false
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}
