//
//  ViewController.swift
//  shopping
//
//  Created by 松尾龍磨 on 2019/11/04.
//  Copyright © 2019 松尾龍磨. All rights reserved.
//

import UIKit

class TLViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var table: UITableView!
    var postArray: [String] = [] //全投稿が入った配列

    override func viewDidLoad() {
        super.viewDidLoad()

        table.delegate = self //デリゲート指定
        table.dataSource = self //データソース指定
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        readData() //viewWillAppearに書くことで追加後、前の画面に戻ってもすぐに更新がみれます。

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func readData() { //UserDefaultsからデータを取得

        let database = UserDefaults.standard

        if let postArray = database.stringArray(forKey: "posts") {

            self.postArray = postArray

            table.reloadData() //cellの更新

        }

    }

    //セクション毎のセルの個数を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return postArray.count
        }
    }

    //cellの情報を決めるところ。
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 { //最初のセクションは追加ボタンの設定
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")

            let addPostButton = UIButton(type: UIButton.ButtonType.contactAdd)

//            addPostButton.addTarget(self, action: #selector(addPost), for: UIControl.Event.touchUpInside)

            cell?.accessoryView = addPostButton

            return cell!

        }else {

            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            cell?.textLabel?.text = postArray[indexPath.row]

            return cell!
        }
    }

    //セクションの数を設定するところ
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }


//    @objc func addPost() {
//        performSegue(withIdentifier: "toAddPost", sender: nil) //画面遷移をするコード
//    }

    //ここでは画面遷移の時に遷移先の画面で使いたいデータを送ることができる。
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addPostViewController = segue.destination as! AddPostViewController //遷移先の画面取得
        addPostViewController.postArray = self.postArray
    }
}
