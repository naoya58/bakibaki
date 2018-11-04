//
//  WallPapersViewController.swift
//  bakibaki
//
//  Created by Naoya Taniguchi on 2018/11/03.
//  Copyright © 2018年 Naoya Taniguchi. All rights reserved.
//

import UIKit

class WallPapersViewController: UIViewController,UICollectionViewDataSource,
UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    var receiveNum: Int?

    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        
        collectionView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        // "Cell" はストーリーボードで設定したセルのID
        let testCell:UICollectionViewCell =
            collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",for: indexPath)
        
        // Tag番号を使ってImageViewのインスタンス生成
        let imageView = testCell.contentView.viewWithTag(1) as! UIImageView
        // 画像配列の番号で指定された要素の名前の画像をUIImageとする
        let cellImage = UIImage(named: "blue")
        // UIImageをUIImageViewのimageとして設定
        imageView.image = cellImage
        
        return testCell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // section数は１つ
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        // 要素数を入れる、要素以上の数字を入れると表示でエラーとなる
        return 30
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    @IBAction func backButton(_ sender: Any) {
        let MainSB = UIStoryboard(name: "Main", bundle: nil)
        let VC = MainSB.instantiateInitialViewController()
        present(VC!, animated: true) {
            print("go to MainStoryboard")
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let num = indexPath.row

        print("num",num)
        
        let WallPaperSB = UIStoryboard(name: "WallPaper", bundle: nil)
        let WallPaperVC = WallPaperSB.instantiateInitialViewController() as! WallPaperViewController
        
        WallPaperVC.receiveNum = num
        
        present(WallPaperVC, animated: true) {
            print("go to WallPaper")
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
