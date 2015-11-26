//
//  ViewController.swift
//  Bulid TCP Client
//
//  Created by גיל אושר on 26.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSStreamDelegate {
    
    var inputStream: NSInputStream?;
    var outputStream: NSOutputStream?;
    let host: CFString = "10.0.0.82";
    let port: UInt32 = 3000;
    var f = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        connect();
        
        
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
            print("has bytes available");
            //read the response
            if(aStream === inputStream){
                var buffer:[UInt8] = [UInt8](count: 1024, repeatedValue: 0);
                var actuallyRead: Int;
                actuallyRead = inputStream!.read(&buffer, maxLength: 1024);
                if(actuallyRead > 0){
                    /*
                    let x = bytesToInt64(buffer, offset: 0, length: 8);
                    print("x = \(x)");
                    let y = bytesToInt32(buffer, offset: 8, length: 4);
                    print("y = \(y)");
                    */
                    let d = NSData(bytes: buffer, length: actuallyRead);
                    let range = NSRange(location: 5, length: actuallyRead - 5);
                    
                    let response = NSString(bytes: &buffer, length: actuallyRead, encoding: NSUTF8StringEncoding);
                    print(response);
                }
                //
            }
        case NSStreamEvent.HasSpaceAvailable:
            print("has space available");
            if(aStream === outputStream){
                if(f){
                    let data = NSMutableData();
                    
                    let x:Int64 = 1234567891234567899;
                    let bytesOfInt = toByteArray(x.byteSwapped);
                    data.appendBytes(bytesOfInt, length: bytesOfInt.count);
                    
                    //example how to write a string
                    //let message = "hello!" as NSString;
                    //data.appendData(message.dataUsingEncoding(NSUTF8StringEncoding)!);
                    
                    //example how to write a byte
                    //var b:Int8 = 10;
                    //data.appendBytes(&b, length: 1);
                    outputStream!.write(UnsafePointer<UInt8>(data.bytes), maxLength: data.length);
                    f = false;
                    
                }
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
    
    func bytesToInt64(bytes: [UInt8], offset: Int, length: Int) ->Int64{
        var result:Int64 = 0;
        for var i = 0 ; i < length ; i++ {
            result += Int64(bytes[offset + i]) << Int64((length-1-i)*8);
        }
        
        return result;
    }
    
    func bytesToInt32(bytes: [UInt8], offset: Int, length: Int) ->Int32{
        var result:Int32 = 0;
        for var i = 0 ; i < length ; i++ {
            result += Int32(bytes[offset + i]) << Int32((length-1-i)*8);
        }
        
        return result;
    }
    
    func bytesToString(bytes: [UInt8], offset: Int, length: Int) ->NSString{
        var temp:[UInt8] = [UInt8]();
        for var i = 0 ; i < length ; i++ {
            temp.append(bytes[offset + i])
        }
        return NSString(bytes: temp, length: temp.count, encoding: NSUTF8StringEncoding)!;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit{
        disconnect();
    }
    
    
}
