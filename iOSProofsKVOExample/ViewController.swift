//
//  ViewController.swift
//  iOSProofsKVOExample
//
//  Created by Nikhil Balne on 26/04/20.
//  Copyright © 2020 Nikhil Balne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var mainBalance : BankAccount!
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var balanceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAccount()
    }
    
    func createAccount(){
        mainBalance = BankAccount()
        mainBalance.accountUserName = "Nikhil"
        mainBalance.balance = 1000
        mainBalance.address = "Narsampet"
        balanceLabel.text = "1000"
        mainBalance.addObserver(self, forKeyPath: "balance", options: .new, context: nil)
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("Balance got changed")
        if let newValue = change?[NSKeyValueChangeKey(rawValue: "new")] as? Int {
            balanceLabel.text = "\(newValue)"
        }
    }
    
    @IBAction func creditButtonTapped(_ sender: Any) {
        mainBalance.creditBalance(newAmount: Int(balanceTextField.text!)!)
    }
    
    @IBAction func debitButtonTapped(_ sender: Any) {
        mainBalance.debitBalance(newAmount: Int(balanceTextField.text!)!)
    }
}

