//
//  ViewController.swift
//  shopping
//
//  Created by 松尾龍磨 on 2019/11/04.
//  Copyright © 2019 松尾龍磨. All rights reserved.
//

import UIKit
 
class ViewController: UIViewController, UITextFieldDelegate  {
 
    @IBOutlet var textField:UITextField!
    @IBOutlet var label:UILabel!
 
    var testText:String = "default"
 
 
    // UserDefaults のインスタンス
    let userDefaults = UserDefaults.standard
 
    override func viewDidLoad() {
        super.viewDidLoad()
 
        // textFiel の情報を受け取るための delegate を設定
        textField.delegate = self
 
        // デフォルト値
        userDefaults.register(defaults: ["DataStore": "default"])
 
        label.text = readData()
 
    }
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
 
        testText = textField.text!
 
        label.text = testText
 
        // キーボードを閉じる
        textField.resignFirstResponder()
 
        saveData(str: testText)
 
        return true
    }
 
    func saveData(str: String){
 
        // Keyを指定して保存
        userDefaults.set(str, forKey: "DataStore")
        userDefaults.synchronize()
 
    }
 
    func readData() -> String {
        // Keyを指定して読み込み
        let str: String = userDefaults.object(forKey: "DataStore") as! String
 
        return str
    }
 
 
    @IBAction func buttonTapped(_ sender : AnyObject) {
        // Key の値を削除
        userDefaults.removeObject(forKey: "DataStore")
 
        // Keyを指定して読み込み
        let str: String = userDefaults.object(forKey: "DataStore") as! String
 
        label.text = str
    }
}
