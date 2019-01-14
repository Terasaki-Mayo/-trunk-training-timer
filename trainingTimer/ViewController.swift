//
//  ViewController.swift
//  trainingTimer
//
//  Created by 寺崎麻代 on 2019/01/14.
//  Copyright © 2019年 寺崎麻代. All rights reserved.
//

import UIKit
let trainingConfig = ["トレーニング時間", "休憩時間", "セット数"]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainingConfig.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // セルに表示する値を設定する
        cell.textLabel!.text = trainingConfig[indexPath.row]
        return cell
    }
    



}

