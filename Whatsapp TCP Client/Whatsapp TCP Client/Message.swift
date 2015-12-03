//
//  Message.swift
//  Whatsapp TCP Client
//
//  Created by גיל אושר on 30.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

class Message {
    var sender: String;
    var content: String;
    init(sender: String, content: String){
        self.content = content;
        self.sender = sender;
    }
}