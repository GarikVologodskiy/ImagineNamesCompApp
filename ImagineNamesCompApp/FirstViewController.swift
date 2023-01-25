//
//  ViewController.swift
//  ImagineNamesCompApp
//
//  Created by Igor Vologodskiy on 22.01.2023.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var someLabel: UILabel!
    @IBOutlet weak var partnerNameTF: UITextField!
    @IBOutlet weak var yourNameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //cast segue to ResultViewController
        guard let destinationVC = segue.destination as? ResultViewController else { return }
        destinationVC.firstName = yourNameTF.text
        destinationVC.secondName = partnerNameTF.text
    }


    @IBAction func resultButtonTapped() {
        performSegue(withIdentifier: "goToResult", sender: nil)
    }
    
    @IBAction func unwindSegueToFirstVC(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSegue" else { return }
        
        yourNameTF.text = ""
        partnerNameTF.text = ""
        
        //testing reverse data transmission
//        guard let sourceVC = segue.source as? ResultViewController else { return }
//        someLabel.text = sourceVC.namesLabel.text
    }
    
    
}

extension FirstViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == yourNameTF {
            partnerNameTF.becomeFirstResponder()
        } else {
            resultButtonTapped()
        }
        return true
    }
}
