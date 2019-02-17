import UIKit

class TrainingViewController: UIViewController {

    @IBOutlet weak var setCountLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var defaultTrainingTime: String?
    var defaultRestTime: String?
    var defaultCountNum: String?
    
    var setCount: Int = 0
    var reminingTime: Int = 0
    
    var isTraining = true
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        setCount = Int(defaultCountNum!)!
        reminingTime = Int(defaultTrainingTime!)!
        // Do any additional setup after loading the view.
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            
            
            if (self.reminingTime >= 1) {
                self.reminingTime -= 1
            } else {
                if(self.isTraining) {
                    self.reminingTime = Int(self.defaultRestTime!)!
                    
                    self.isTraining = false
                    self.statusLabel.text = "休憩中"
                } else {
                    self.reminingTime = Int(self.defaultTrainingTime!)!
                    self.isTraining = true
                    self.statusLabel.text = "トレーニング中"
                    self.setCount -= 1
                    
                }
            }
            self.timeLabel.text = "残り" + String(self.reminingTime) + "秒"
            self.setCountLabel.text = "残り" + String(self.setCount) + "セット"
            
            if(self.setCount == 0) {
                self.statusLabel.text = "終わり！！"
                timer.invalidate()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
