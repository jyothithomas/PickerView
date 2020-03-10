//
//  ViewController.swift
//  PickerView
//
//  Created by MacStudent on 2020-03-09.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var txtField: UITextField!
    var txtDate: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //text field delegate
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        self.pickUpDate(self.txtField)
    }
    
    
    func pickUpDate(_ textField: UITextField)
    {
        //Date Picker
        
        self.txtDate = UIDatePicker(frame: CGRect(x:0, y:0, width: self.view.frame.size.width, height: 216))
        self.txtDate.backgroundColor = UIColor.white
        self.txtDate.datePickerMode = UIDatePicker.Mode.date
        textField.inputView = self.txtDate
        
        
        // Tool Bar
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = .red
        toolBar.sizeToFit()
        
        
        //Adding Button Toolbar
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ViewController.doneClick))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(ViewController.cancelClick))
        
        toolBar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
  
    }
    
    // Button done and cancel
    
    @objc func doneClick()
    {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        txtField.text = dateFormatter1.string(from: txtDate.date)
        txtField.resignFirstResponder()
    }
    
    @objc func cancelClick()
    {
        txtField.resignFirstResponder()
    }

}

