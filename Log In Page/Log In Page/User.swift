//
//  User.swift
//  Log In Page
//
//  Created by גיל אושר on 22/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

class User {
    var userName: String;
    var password: String;
    
    init(userName: String, password: String){
        self.userName = userName;
        self.password = password;
    }
    
    var _password: String{
        get{
            return password;
        }set{
            password = newValue;
        }
    }
    var _userName: String{
        get{
            return userName;
        }set{
            userName = newValue;
        }
    }
    
}