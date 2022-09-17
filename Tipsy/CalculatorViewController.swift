

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPtcButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var stepper: UIStepper!
    var tip = 0.0
    var split = 0.0
    var result = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPtcButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
       
        sender.isSelected = true
        let title = sender.currentTitle
        tip = Double((title?.dropLast())!)!
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        split = Double(stepper.value)
        splitNumberLabel.text = String(stepper.value)
    }
    @IBAction func calculatePressed(_ sender: Any) {
        
        let amount = Double(billTextField.text ?? "0.0")!
        
        let totalAmountWithTip = amount + ((tip * amount) / 100)
        let finalAmount = totalAmountWithTip / split
        result = finalAmount
        print(finalAmount)
        self.performSegue(withIdentifier: "getResult", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.split = split
            destinationVC.tip = tip
            destinationVC.result = result
        }
    }
}

