//
//  ViewController.swift
//  shopping
//
//  Created by 松尾龍磨 on 2019/11/04.
//  Copyright © 2019 松尾龍磨. All rights reserved.
//

import UIKit
 
class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource{
 
 
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    var todos: Array<String> = []
    
    let userDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        textField.delegate = self
        textField.placeholder = "買う物を入力"
        if let aaa = userDefaults.object(forKey: "todos") {
            todos = aaa as! Array<String>
        }   
 
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // セルの数
        return todos.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {// セクションの数
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {// セルの内容を決める。
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let todo = todos[indexPath.row]
        
        cell.textLabel?.text = todo
        
        return cell
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {// returnキーを押した時の処理
        if let text = self.textField.text {
            todos.append(text)
            userDefaults.set(todos, forKey: "todos")
            userDefaults.synchronize()
            
            todos = userDefaults.object(forKey: "todos") as! Array<String>
        }
        
        self.textField.text = ""
        
        self.tableView.reloadData() //データをリロードする
        return true
    }
    
    
}
