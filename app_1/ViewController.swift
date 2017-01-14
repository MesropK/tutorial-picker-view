//
//  ViewController.swift
//  app_1
//
//  Created by Mesrop Kareyan on 1/10/17.
//  Copyright © 2017 Mesrop Kareyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var showPickerButton: UIButton!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var countryField: UITextField!
    
    @IBOutlet weak var zipLabel: UILabel!
    
    @IBOutlet weak var zipField: UITextField!
    
    var viewsToHide: [UIView] {
        return [countryField, countryLabel, zipLabel, zipField];
    }
    
    

    @IBOutlet weak var stateLabel: UILabel!
    let states = ["California", "Oregon", "Washington", "Idaho", "Nevada", "Arizona", "Utah", "Montana", "Wyoming", "Colorado", "New Mexico", "Texas", "Oklahoma", "Kansas", "North Dokota", "Sout dokota", "Minnesota", "Iowa", "Wisconsin", "Illionais", "Missouri" , "Missisipi", "Arkansas", "Louisiana", "Alabam" ,"Georgia" ,"Florida", "Tennessee", "Kentuki" ,"Indianna", "Pennsylvania" , "Ohayo", "Virgina", "West Virgina", "South Corolina", "North Corolina", "Maryland" ,"Deleware", "New Jersey","Maine", "New York", "New Hampshir", "Massachusets", "Rhode Island", "Vermont", "Connecticut", "Alaska", "Hawaii"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.delegate = self
        statePicker.dataSource = self
        statePicker.isHidden = true
    }
    
    @IBAction func  showPickerButtonPresed(_ sender: UIButton) {
        pikerAnimation()
    }
    
    func pikerAnimation(show: Bool = true) {
        if show {
            statePicker.isHidden = !show
            showPickerButton.isHidden = show
            UIView.animate(withDuration: 0.2, delay: 0.0, usingSpringWithDamping: 2.0, initialSpringVelocity: 10.0, options: .curveEaseInOut, animations: {
                self.statePicker.transform =
                    CGAffineTransform(scaleX: 1.2, y: 1.2)
                self.viewsToHide.forEach { $0.alpha = 0.0}
            }) { (finished) in
                UIView.animate(withDuration: 0.2) {
                    self.statePicker.transform =
                        .identity
                }
            }
        } else {
            UIView.animate(withDuration: 0.2, delay: 0.0, usingSpringWithDamping: 2.0, initialSpringVelocity: 10.0, options: .curveEaseInOut, animations: {
                self.statePicker.transform =  .identity
            }) { (finished) in
                UIView.animate(withDuration: 0.2,
                               animations: {
                                self.statePicker.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                                self.statePicker.center = self.showPickerButton.center
                }, completion: { _ in
                    self.statePicker.isHidden = true
                    self.showPickerButton.isHidden = false
                    self.viewsToHide.forEach { $0.alpha = 1.0}
                })
            }
        }
    }
}
//MARK: Picker View Delegate

extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        showPickerButton.setTitle(states[row], for: .normal)
        pikerAnimation(show: false)
    }
    
}
