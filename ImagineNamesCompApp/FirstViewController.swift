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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //cast segue to ResultViewController
        guard let destinationVC = segue.destination as? ResultViewController else { return }
        destinationVC.firstName = yourNameTF.text
        destinationVC.secondName = partnerNameTF.text
    }

    @IBAction func resultButtonTapped() {
        guard let firstName = yourNameTF.text, let secondName = partnerNameTF.text else { return }
        if firstName.isEmpty || secondName.isEmpty {
            showAlert (
                title: "Names are missing",
                message: "Please enter both names"
            )
            return
        }
        performSegue(withIdentifier: "goToResult", sender: nil)
    }
    
    @IBAction func unwindSegueToFirstVC(segue: UIStoryboardSegue) {
//        guard segue.identifier == "unwindSegue" else { return }
        
        yourNameTF.text = ""
        partnerNameTF.text = ""
        
        //testing reverse data transmission
//        guard let sourceVC = segue.source as? ResultViewController else { return }
//        someLabel.text = sourceVC.namesLabel.text
    }
    
    
}

extension FirstViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet) //action
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
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
