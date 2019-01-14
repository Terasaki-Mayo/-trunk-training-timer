//
//  TrainingViewController.swift
//  trainingTimer
//
//  Created by 寺崎麻代 on 2019/01/14.
//  Copyright © 2019年 寺崎麻代. All rights reserved.
//

import UIKit

class TrainingViewController: UIViewController {

    @IBOutlet weak var setCountLabel: UILabel!
    @IBOutlet weak var restTimeLabel: UILabel!
    @IBOutlet weak var trainingTimeLabel: UILabel!
    
    var defaultTrainingTime: String?
    var defaultRestTime: String?
    var defaultCountNum: String?
    
    var setCount: Int = 0
    var restTime: Int = 0
    var trainingTime: Int = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCountLabel.text = defaultCountNum
        restTimeLabel.text = defaultRestTime
        trainingTimeLabel.text = defaultTrainingTime
        
        setCount = Int(defaultCountNum!)!
        restTime = Int(defaultRestTime!)!
        trainingTime = Int(defaultTrainingTime!)!
        // Do any additional setup after loading the view.
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            if(self.trainingTime == 1) {
                self.trainingTime = Int(self.defaultTrainingTime!)!
                self.setCount -= 1
                self.setCountLabel.text = String(self.setCount)
            } else {
                self.trainingTime -= 1
            }
            self.trainingTimeLabel.text = String(self.trainingTime)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
