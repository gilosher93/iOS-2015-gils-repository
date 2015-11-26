//
//  Message.swift
//  MiniWhatsapp
//
//  Created by גיל אושר on 23.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

class Message {
    var sender: String;
    var content: String;
    
    init(sender: String, content: String){
        self.sender = sender;
        self.content = content;
    }
}
