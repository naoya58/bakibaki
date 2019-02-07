//
//  WallPapersViewController.swift
//  bakibaki
//
//  Created by Naoya Taniguchi on 2018/11/03.
//  Copyright © 2018年 Naoya Taniguchi. All rights reserved.
//

import UIKit
import FirebaseStorage
import Pring
//import SkeletonView

class WallPapersViewController: UIViewController,UICollectionViewDataSource,
UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    var receiveNum: Int?
    var dataSource: DataSource<Image>?
    

    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
//        collectionView.isSkeletonable = true
        
//        collectionView.showAnimatedGradientSkeleton() // Gradient animated
        
//        let gradient = SkeletonGradient(baseColor: UIColor.amethyst)
//        collectionView.showGradientSkeleton(usingGradient: gradient) // Gradient
        
       
        
//        collectionView.startSkeletonAnimation()
        
       
        

        
        guard let receiveNum = receiveNum else {return}
        
        self.dataSource = Image
            .order(by: \Image.updatedAt)
            .where(\Image.num, isEqualTo: receiveNum)
            .dataSource().on({ (snapshot, changes) in
                guard let collectionView: UICollectionView = self.collectionView else { return }
                switch changes {
                case .initial:
                    collectionView.reloadData()
                case .update(let deletions, let insertions, let modifications):
                    collectionView.performBatchUpdates({
                        collectionView.insertItems(at: insertions.map { IndexPath(row: $0, section: 0) })
                        collectionView.deleteItems(at: deletions.map { IndexPath(row: $0, section: 0) })
                        collectionView.reloadItems(at: modifications.map { IndexPath(row: $0, section: 0) })
                    }, completion: nil)
                 case .error(let error):
                    debugPrint(error)
                }
            }).listen()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    //UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell =
            collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",for: indexPath) as! WallPaperPreviewCell
        
        guard let imageData = self.dataSource?[indexPath.item] else { return cell}
        cell.configure(data: imageData)
        
//        view.stopSkeletonAnimation()
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // section数は１つ
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        // 要素数を入れる、要素以上の数字を入れると表示でエラーとなる
        return self.dataSource?.count ?? 0
    }
    

    
    // Screenサイズに応じたセルサイズを返す
    
    // UICollectionViewDelegateFlowLayoutの設定が必要
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let space: CGFloat = 1.0
        
        let widthSize:CGFloat = UIScreen.main.bounds.width/3 - space
        let heightSize:CGFloat = UIScreen.main.bounds.height/3 - space
        
        return CGSize(width: widthSize, height: heightSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    @IBAction func backButton(_ sender: Any) {
       self.dismiss(animated: true, completion: nil)
        
    }
    
    //画面遷移
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        

        let image = dataSource?[indexPath.item]
        
        let WallPaperSB = UIStoryboard(name: "WallPaper", bundle: nil)
        let WallPaperVC = WallPaperSB.instantiateInitialViewController() as! WallPaperViewController
        

        WallPaperVC.receiveImage = image
        
        present(WallPaperVC, animated: true) {
            print("go to WallPaper")
        }
        
    }
    
    //SkeletonCollectionViewDataSource
//    func numSections(in collectionSkeletonView: UICollectionView) -> Int {
//        return 1
//    }
    
//    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
//        return "Cell"
//    }

    
}

//extension WallPapersViewController: SkeletonCollectionViewDataSource {
//
//
//    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
//        return "Cell"
//    }
//
//    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.dataSource?.count ?? 0
//    }

    // MARK: - UICollectionViewDataSource
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
//        return cell
//
//    }
//}

