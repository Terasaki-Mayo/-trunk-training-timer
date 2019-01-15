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
    
    var isTraining = true
    
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
            
            if (self.isTraining && self.trainingTime > 1) {
                self.trainingTime -= 1
            } else if (self.isTraining && self.trainingTime == 1) {
                self.trainingTime = Int(self.defaultTrainingTime!)!
                self.isTraining = false
            } else if (!self.isTraining && self.restTime > 1) {
                self.restTime -= 1
            } else {
                self.restTime = Int(self.defaultRestTime!)!
                self.isTraining = true
                
                if(self.setCount == 1) {
                    self.setCount = Int(self.defaultCountNum!)!
                } else {
                    self.setCount -= 1
                }
            }
            self.trainingTimeLabel.text = "残り" + String(self.trainingTime) + "秒"
            self.restTimeLabel.text = "残り" +  String(self.restTime) + "秒"
            self.setCountLabel.text = "残り" + String(self.setCount) + "セット"
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
