//
//  ViewController.swift
//  bakibaki
//
//  Created by Naoya Taniguchi on 2018/10/28.
//  Copyright © 2018年 Naoya Taniguchi. All rights reserved.
//

import UIKit



class ViewController: UIViewController,UICollectionViewDataSource,
UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    @IBOutlet var TimeLabel: UILabel!
    
    @IBOutlet var collectionView: UICollectionView!

    
    @IBOutlet var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //スクロール停止
        collectionView.isScrollEnabled = false
        
        //現在の日付を取得
        let date:Date = Date()
        
        //日付のフォーマットを指定する。
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        
        //日付をStringに変換する
        let sDate = format.string(from: date)
        
        TimeLabel.text = sDate
        
        //画像表示ランダム
//        let img1 = UIImage(named:"無題45")!
//        let img2 = UIImage(named:"無題46")!
//        let img3 = UIImage(named:"無題47")!
//
//        let random = arc4random() % 10
//        print(random)
//        if ( random > 7 ) {
//            imageView.image = img1
//        } else if ( random > 4 ) {
//            imageView.image = img2
//        } else {
//            imageView.image = img3
//        }
    }
    
    
    @IBAction func NextButton(_ sender: Any) {
        //画面遷移
        let PostSB = UIStoryboard(name: "Post", bundle: nil)
        let PostVC = PostSB.instantiateInitialViewController() as! PostViewController
        
        present(PostVC, animated: true) {
            print("go to Post")
        }
        
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        // "Cell" はストーリーボードで設定したセルのID
        let testCell:UICollectionViewCell =
            collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",for: indexPath)
        
//        // Tag番号を使ってImageViewのインスタンス生成
//        let imageView = testCell.contentView.viewWithTag(1) as! UIImageView
//        // 画像配列の番号で指定された要素の名前の画像をUIImageとする
//        let cellImage = UIImage(named: "purple")
//        // UIImageをUIImageViewのimageとして設定
//        imageView.image = cellImage
        
        return testCell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // section数は１つ
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        // 要素数を入れる、要素以上の数字を入れると表示でエラーとなる
        return 12
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
        let heightSize:CGFloat = UIScreen.main.bounds.height/4 - space
        
        return CGSize(width: widthSize, height: heightSize)
    }
    
    // Cell が選択された場合
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let num = indexPath.row + 1
        
        print("num",num)
        
        let WallPapersSB = UIStoryboard(name: "WallPapers", bundle: nil)
        let navigationVC = WallPapersSB.instantiateInitialViewController() as! UINavigationController
        let WallPapersVC = navigationVC.topViewController as! WallPapersViewController
        
        WallPapersVC.receiveNum = num
        
        present(navigationVC, animated: true) {
            print("go to WallPapers")
        }
        
    }
}




