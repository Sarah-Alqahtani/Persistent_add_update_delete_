//
//  SecondTableViewController.swift
//  Backet list
//
//  Created by admin on 16/12/2021.
//

import UIKit

class SecondTableViewController: UITableViewController {
  
    
    var edittext:String?
    @IBOutlet weak var textfield: UITextField!
    weak var delegate: cancelbtn?
    @IBAction func savebtn(_ sender: UIBarButtonItem) {
        let text=textfield.text!
        delegate?.savebtn(by: self,with:text)
    }
    @IBAction func cancelbtn(_ sender:  UIBarButtonItem) {
        delegate?.cancelbtn(by: self)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func didReceiveMemoryWarning() {
        
    }
}

