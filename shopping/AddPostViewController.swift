//
//  Constants.swift
//  shopping
//
//  Created by 松尾龍磨 on 2019/11/04.
//  Copyright © 2019 松尾龍磨. All rights reserved.
//
import UIKit

class AddPostViewController: UIViewController {

    @IBOutlet var textView: UITextView! //投稿内容を入力するUITextView

    var postArray: [String] = [] //全ての投稿を格納した配列

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }

    @IBAction func back() {
        self.dismiss(animated: true, completion: nil) //画面を戻る。
    }

    @IBAction func savePost() {

        if let text = textView.text, !text.isEmpty { //textが何か入力されていたら

            let database = UserDefaults.standard // データベースを取得

            postArray.append(text) //全ての投稿が入った配列に入力した投稿を追加。

            database.set(postArray, forKey: "posts") // 投稿をデータベースに保存する

            self.dismiss(animated: true, completion: nil) //画面を戻る

        }else { //アラートを出して入力不備をユーザーに知らせる。
            let alert = UIAlertController(title: "入力不備", message: "文字を入力してください", preferredStyle: .alert)
            present(alert, animated: true, completion: {
                sleep(1) //アラートの表示時間となる
                alert.dismiss(animated: true, completion: nil) //アラートの削除
            })
        }
    }

}

extension UITextView {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesBegan(touches, with: event) // ここを忘れるとタップしても呼ばれません。
        self.resignFirstResponder()
    }
}
