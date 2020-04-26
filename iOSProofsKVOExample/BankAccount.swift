//
//  BankAccount.swift
//  iOSProofsKVOExample
//
//  Created by Nikhil Balne on 27/04/20.
//  Copyright © 2020 Nikhil Balne. All rights reserved.
//

import Foundation

@objc class BankAccount : NSObject {
    
    var accountUserName : String = ""
    @objc dynamic  var balance : Int = 0
    var address : String = ""
    
    func creditBalance(newAmount:Int){
        balance += newAmount
        print(balance)
    }
    
    func debitBalance(newAmount:Int){
        balance -= newAmount
        print(balance)
    }
    
}
