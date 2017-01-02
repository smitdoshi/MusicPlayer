//
//  ViewController.swift
//  simplePlayer
//
//  Created by SMIT DOSHI on 1/2/17.
//  Copyright © 2017 SMIT DOSHI. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    var videoYTLink = "http://www.youtube.com/watch?v=PT2_F-1esPk";
    
    var converterLink = "www.youtubeinmp3.com/fetch/?format=text&video=";
    
    
    @IBAction func play(_ sender: AnyObject) {
        player.play()
    }
    
    @IBAction func pause(_ sender: AnyObject) {
        player.pause()
    }
    
    @IBAction func replay(_ sender: AnyObject) {
        //Replay Logic
        player.currentTime = 0;
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            // Offline Code:
            let audioPath = Bundle.main.path(forResource: "song", ofType: "mp3")
            
            try player = AVAudioPlayer(contentsOf: NSURL (fileURLWithPath: audioPath!)as URL);
        }
        catch {
            // Error
            print("Error getting the audio file")
        }
        
        let session = AVAudioSession.sharedInstance()
        do{
            try session.setCategory(AVAudioSessionCategoryPlayback)
        }
        catch{
            
        }
        
        // Online Streaming Code:
        /*
         let url = "\(converterLink)\(videoYTLink)";
         let playerItem = AVPlayerItem( url:NSURL( string:url ) as! URL )
         player = AVPlayer(playerItem:playerItem)
         //player.rate = 1.0;
         */
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

