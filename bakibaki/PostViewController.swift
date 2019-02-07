//
//  PostViewController.swift
//  bakibaki
//
//  Created by Naoya Taniguchi on 2018/11/25.
//  Copyright © 2018年 Naoya Taniguchi. All rights reserved.
//

import UIKit
import FirebaseStorage
import Pring
import SVProgressHUD

class PostViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textField: UITextField!
    
    var pickerView: UIPickerView = UIPickerView()
    let list = ["", "1", "2", "3", "4", "5", "6", "7", "8", "9","10","11","12"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.showsSelectionIndicator = true
        
        let toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        
//        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done())
        
        
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        toolbar.setItems([cancelItem, doneItem], animated: true)
        
        self.textField.inputView = pickerView
        self.textField.inputAccessoryView = toolbar


        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.textField.text = list[row]
    }
    
    @objc func cancel() {
        self.textField.text = ""
        self.textField.endEditing(true)
    }
    
    @objc func done() {
        self.textField.endEditing(true)
    }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }

    
    @IBAction func chooseButton(_ sender: Any) {
        showPickerVC()
    }
    
    @IBAction func backButton(_ sender: Any) {
        back()
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if let textNum = textField.text {
            //textField.text 有る時
            savePostData(num: Int(textNum)!)
        } else {
            //textField.text がnilの時
            // 入力しろってアラートを出す
            showAlert()
        }
    }
    
    func savePostData(num: Int) {
        let image: Image = Image()
        let jpedData = imageView.image?.jpegData(compressionQuality: 1.0)
        let imageFile = File(data: jpedData!, name: nil, mimeType: .jpeg)
        
        //        let newFile: File = File(data: PNG_DATA, mimeType: .png)
        //
        //        let imageX = File(data: UIImageJPEGRepresentation(imageView.image!, 1)!)
        //
        //
        //        File(data: data, name: nil, mimeType: )
        //
        //        let imageData = File(imageView.image)
        
        image.imageFile = imageFile
        image.num = num
       
         // ぐるぐる表示
        SVProgressHUD.show()
        image.save { (ref, error) in
            if let error = error{
                SVProgressHUD.showError(withStatus: "どんまい")
                print("error:", error)
            }else{
                //save成功
                 SVProgressHUD.showSuccess(withStatus: "成功だよ")
                print("save")
            }
        }
    }

    func back(){
        self.dismiss(animated: true, completion: nil)
//        let MainSB = UIStoryboard(name: "Main", bundle: nil)
//        let VC = MainSB.instantiateInitialViewController()
//        present(VC!, animated: true) {
//            print("go to MainStoryboard")
//        }
}
    
    func showAlert() {
         // UIalertContoller 出す
        // ① UIAlertControllerクラスのインスタンスを生成
        // タイトル, メッセージ, Alertのスタイルを指定する
        // 第3引数のpreferredStyleでアラートの表示スタイルを指定する
        let alert: UIAlertController = UIAlertController(title: "アラート表示", message: "保存してもいいですか？", preferredStyle:  UIAlertController.Style.alert)
        
        // ② Actionの設定
        // Action初期化時にタイトル, スタイル, 押された時に実行されるハンドラを指定する
        // 第3引数のUIAlertActionStyleでボタンのスタイルを指定する
        // OKボタン
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
            print("OK")
        })
        // ③ UIAlertControllerにActionを追加
        alert.addAction(defaultAction)
        // ④ Alertを表示
        present(alert, animated: true, completion: nil)
    }
    
}

extension PostViewController : UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func showPickerVC() {
        // カメラロールが利用可能か？
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // 写真を選ぶビュー
            let pickerView = UIImagePickerController()
            // 写真の選択元をカメラロールにする
            // 「.camera」にすればカメラを起動できる
            pickerView.sourceType = .photoLibrary
            // デリゲート
            pickerView.delegate = self
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
