import UIKit
let trainingConfig = ["トレーニング時間(秒)", "休憩時間(秒)", "セット数"]
let defaultParams = [60, 30, 3]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerView: UIPickerView = UIPickerView()
    let countTimeArray = ([Int])(30...120)
    let setNumArray = ([Int])(1...5)

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
        cell.detailTextLabel?.text = String(defaultParams[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        pickerView.tag = indexPath.row
        showPicker()
    }
    
    func showPicker() {
        pickerView.dataSource = self
        pickerView.delegate = self
        view.addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        pickerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag < 2 {
            return countTimeArray.count
        } else {
            return setNumArray.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag < 2 {
            return String(countTimeArray[row])
        } else {
            return String(setNumArray[row])
        }
    }
    func pickerView(pickerView: UIPickerView, didSelect numbers: [Int]) {
        print(numbers)
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let trainingViewController = segue.destination as! TrainingViewController
        trainingViewController.defaultTrainingTime = String(defaultParams[0])
        trainingViewController.defaultRestTime = String(defaultParams[1])
        trainingViewController.defaultCountNum = String(defaultParams[2])
    }
    


}

