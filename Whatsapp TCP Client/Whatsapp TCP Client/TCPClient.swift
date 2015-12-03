//
//  TCPClient.swift
//  Whatsapp TCP Client
//
//  Created by גיל אושר on 30.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

class TCPclient: NSObject, NSStreamDelegate {
    
    let SIGN_UP:Int8 = 10;
    let LOGIN:Int8 = 20;
    let SEND_MESSAGE:Int8 = 30;
    let CHECK_FOR_MESSAGES:Int8 = 40;
    let SUCCESS:Int8 = 127;
    let FAILURE:Int8 = 126;
    
    var inputStream: NSInputStream?;
    var outputStream: NSOutputStream?;
    let host: CFString = "10.0.0.195";
    let port: UInt32 = 3000;
    var whatToDo:Int8 = 0;
    var data = NSMutableData();
    var dataUserNameAndPassword: NSMutableData!;
    
    func setUser(name: String, andPassword: String){
        dataUserNameAndPassword = NSMutableData();
        let userNameBytes = (name as NSString).dataUsingEncoding(NSUTF8StringEncoding);
        var userNameLength = Int8(userNameBytes!.length);
        dataUserNameAndPassword.appendBytes(&userNameLength, length: 1);
        dataUserNameAndPassword.appendData(userNameBytes!);
        let passwordBytes = (andPassword as NSString).dataUsingEncoding(NSUTF8StringEncoding);
        var passwordLength = Int8(passwordBytes!.length);
        dataUserNameAndPassword.appendBytes(&passwordLength, length: 1);
        dataUserNameAndPassword.appendData(passwordBytes!);
    }
    func connect(){
        var readStream: Unmanaged<CFReadStream>?;
        var writeStream: Unmanaged<CFWriteStream>?;
        
        CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, host, port, &readStream, &writeStream);
        
        if let theReadStream = readStream{
            inputStream = theReadStream.takeUnretainedValue();
            inputStream!.delegate = self;
            inputStream!.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode);
            inputStream!.open();
        }
        if let theWriteStream = writeStream{
            outputStream = theWriteStream.takeUnretainedValue();
            outputStream!.delegate = self;
            outputStream!.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode);
            outputStream!.open();
        }
    }
    
    
    func disconnect(){
        if let theInputStream = inputStream{
            theInputStream.close();
            theInputStream.removeFromRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode);
            inputStream = nil;
        }
        if let theOutputStream = outputStream{
            theOutputStream.close();
            theOutputStream.removeFromRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode);
            outputStream = nil;
        }
    }
    
    func stream(aStream: NSStream, handleEvent eventCode: NSStreamEvent) {
        switch(eventCode){
        case NSStreamEvent.ErrorOccurred:
            print("error occured");
        case NSStreamEvent.HasBytesAvailable:
            //read the response
            if(aStream === inputStream){
                switch(whatToDo){
                case SIGN_UP:
                    print("sign up");
                    var buffer:[UInt8] = [UInt8](count: 1024, repeatedValue: 0);
                    var actuallyRead: Int;
                    actuallyRead = inputStream!.read(&buffer, maxLength: 1024);
                    if(actuallyRead > 0){
                        print(Int8(buffer[0]) == SUCCESS ? "success" : "failed");
                        print("response from server: \(Int(buffer[0]))");
                        disconnect();
                        whatToDo = 0;
                    }
                case LOGIN:
                    print("login");
                    var buffer:[UInt8] = [UInt8](count: 1024, repeatedValue: 0);
                    var actuallyRead: Int;
                    actuallyRead = inputStream!.read(&buffer, maxLength: 1024);
                    if(actuallyRead > 0){
                        print(Int8(buffer[0]) == SUCCESS ? "success" : "failed");
                        print("response from server: \(Int(buffer[0]))");
                        disconnect();
                        whatToDo = 0;
                    }
                    whatToDo = 0;
                case SEND_MESSAGE:
                    print("send message");
                    var buffer:[UInt8] = [UInt8](count: 1024, repeatedValue: 0);
                    var actuallyRead: Int;
                    actuallyRead = inputStream!.read(&buffer, maxLength: 1024);
                    if(actuallyRead > 0){
                        print(Int8(buffer[0]) == SUCCESS ? "success" : "failed");
                        print("response from server: \(Int(buffer[0]))");
                        disconnect();
                        whatToDo = 0;
                    }
                    whatToDo = 0;
                case CHECK_FOR_MESSAGES:
                    print("check for messages");
                    
                    whatToDo = 0;
                default:
                    print("other");
                    whatToDo = 0;
                }
                
            }
            
        case NSStreamEvent.HasSpaceAvailable:
            if(aStream === outputStream){
                if data.length > 0 {
                    outputStream!.write(UnsafePointer<UInt8>(data.bytes), maxLength: data.length)
                    
                }
                data.resetBytesInRange(NSMakeRange(0, data.length));
            }
            
        case NSStreamEvent.OpenCompleted:
            print("open completed");
        default:
            print("other event code");
        }
    }
    
    func toByteArray<T>(var value: T) -> [UInt8]{
        return withUnsafePointer(&value, {
            Array(UnsafeBufferPointer(start: UnsafePointer<UInt8>($0), count: sizeof(T)));
        });
    }
    
    static func bytesToInt64(inout bytes: [UInt8], offset: Int, length: Int) ->Int64{
        var result:Int64 = 0;
        for var i = 0 ; i < length ; i++ {
            result += Int64(bytes[offset + i]) << Int64((length-1-i)*8);
        }
        
        return result;
    }
    
    static func bytesToInt32(inout bytes: [UInt8], offset: Int, length: Int) ->Int32{
        var result:Int32 = 0;
        for var i = 0 ; i < length ; i++ {
            result += Int32(bytes[offset + i]) << Int32((length-1-i)*8);
        }
        
        return result;
    }
    
    static func bytesToFloat32(inout bytes: [UInt8], offset: Int, length: Int) ->Float32{
        var b:[UInt8] = [UInt8]();
        for var i = length - 1; i >= 0; i-- {
            b.append(bytes[offset + i]);
        }
        var result:Float32 = 0;
        memccpy(&result, b, 0, 4);
        return result;
    }
    
    static func bytesToString(inout bytes: [UInt8], offset: Int, length: Int) ->NSString{
        var temp:[UInt8] = [UInt8]();
        for var i = 0 ; i < length ; i++ {
            temp.append(bytes[offset + i]);
        }
        return NSString(bytes: temp, length: temp.count, encoding: NSUTF8StringEncoding)!;
    }
    
    
    deinit{
        disconnect();
    }
    
    
    //business logic functions
    
    func sendMessage(content: String, recipient: String){
        
        whatToDo = SEND_MESSAGE;
        data.appendBytes(&whatToDo, length: 1);
        data.appendData(dataUserNameAndPassword);
        
        
        let contentBytes = (content as NSString).dataUsingEncoding(NSUTF8StringEncoding);
        var contentLength = Int8(contentBytes!.length);
        dataUserNameAndPassword.appendBytes(&contentLength, length: 1);
        dataUserNameAndPassword.appendData(contentBytes!);
        
        let recipientBytes = (content as NSString).dataUsingEncoding(NSUTF8StringEncoding);
        var recipientLength = Int8(recipientBytes!.length);
        dataUserNameAndPassword.appendBytes(&recipientLength, length: 1);
        dataUserNameAndPassword.appendData(recipientBytes!);
        
        connect();
    }
    
    func login(){
        whatToDo = LOGIN;
        data.appendBytes(&whatToDo, length: 1);
        data.appendData(dataUserNameAndPassword);
        connect();
    }
    
    func signup(){
        whatToDo = SIGN_UP;
        data.appendBytes(&whatToDo, length: 1);
        data.appendData(dataUserNameAndPassword);
        connect();
    }
    
    func checkForMessages(){
        
        whatToDo = CHECK_FOR_MESSAGES;
        data.appendBytes(&whatToDo, length: 1);
        data.appendData(dataUserNameAndPassword);
        
        connect();

    }
    
    
    
    
    
}