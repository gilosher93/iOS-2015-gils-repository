//
//  ViewController.swift
//  Recording Audio
//
//  Created by גיל אושר on 3.12.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    
    var audioRecorder: AVAudioRecorder?;
    var audioPlayer: AVAudioPlayer?;
    var btnToggleRecording: UIButton!;
    let startRecordingLabel = "Start Recording";
    let stopRecordingLabel = "Stop Recording";
    var recordingAllowed = false;
    var isRecording = false;

    func startRecordingAudio(){
        if !recordingAllowed{
            return;
        }
        let audioRecordingURL = audioRecordingPath();
        do{
            audioRecorder = try AVAudioRecorder(URL: audioRecordingURL!, settings: audioRecordingSettings());
            audioRecorder!.delegate = self;
            if audioRecorder!.prepareToRecord() && self.audioRecorder!.record(){
                //now recording!
            }
        }catch{
            print("failed creating recorder");
        }
        
        
    }
    
    func stopRecordingAudio(){
        if let theAudioRecorder = audioRecorder{
            theAudioRecorder.stop();
        }
    }
    
    func audioRecordingPath()->NSURL?{
        let fileManager = NSFileManager();
        do{
            let documentsFolderUrl = try fileManager.URLForDirectory(.DocumentDirectory, inDomain: NSSearchPathDomainMask.UserDomainMask, appropriateForURL: nil, create: false);
            print("documentsFolderUrl: \(documentsFolderUrl)");
            return documentsFolderUrl.URLByAppendingPathComponent("recording.m4a");
        }catch{
            
        }
        
        return nil;
    }
    
    func audioRecordingSettings() -> [String : AnyObject]{
        return [
            AVFormatIDKey : Int(kAudioFormatMPEG4AAC) as NSNumber,
            AVSampleRateKey : 16000 as NSNumber,
            AVNumberOfChannelsKey : 1 as NSNumber,
            AVEncoderAudioQualityKey : AVAudioQuality.Low.rawValue as NSNumber
            
        ];
    }
    
    func initializeButton(){
        btnToggleRecording = UIButton(type: UIButtonType.System);
        btnToggleRecording.frame = CGRect(x: 0, y: 0, width: 100, height: 30);
        btnToggleRecording.setTitle(startRecordingLabel, forState: UIControlState.Normal);
        btnToggleRecording.addTarget(self, action: "btnToggleRecording:", forControlEvents: UIControlEvents.TouchUpInside)
        btnToggleRecording.center = view.center;
        view.addSubview(btnToggleRecording);
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag{
            do{
                let fileData = try NSData(contentsOfURL: audioRecordingPath()!, options: NSDataReadingOptions.MappedRead);
                audioPlayer = try AVAudioPlayer(data: fileData);
                audioPlayer!.delegate = self;
                if audioPlayer!.prepareToPlay() && audioPlayer!.play(){
                    //now recording!
                }
                audioRecorder = nil;
                btnToggleRecording.enabled = false;
            }catch{
                
            }
        }
    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        btnToggleRecording.enabled = true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initialize the button
        initializeButton();
        
        //ask for permission to record
        let session = AVAudioSession.sharedInstance();
        do {
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord, withOptions: AVAudioSessionCategoryOptions.DuckOthers)
            try session.setActive(true);
            session.requestRecordPermission({ [weak self](allowed) -> Void in
                self!.recordingAllowed = allowed;
            })
            
        }catch{
            
        }
    }
    
    func btnToggleRecording(sender: UIButton){
        if isRecording{
            stopRecordingAudio();
            btnToggleRecording.setTitle(startRecordingLabel, forState: UIControlState.Normal);
        }else{
            startRecordingAudio();
            btnToggleRecording.setTitle(stopRecordingLabel, forState: UIControlState.Normal);

        }
        isRecording = !isRecording;

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

