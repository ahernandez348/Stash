//
//  ViewController.swift
//  HelloWorld
//
//  Created by Project Exploration on 4/15/19.
//  Copyright © 2019 Project Exploration. All rights reserved.
//

import UIKit

import AVFoundation

class ViewController: UIViewController {
    
    var songPlayer = AVAudioPlayer()
    
    func prepareSongAndSession() {
        do {
            songPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path (forResource: "Trevor Daniel - Empty my-free", ofType: "mp3")!))
            songPlayer.prepareToPlay()
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            } catch let sessionError {
                print(sessionError)
            }
        } catch let songPlayerError {
            print(songPlayerError)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        prepareSongAndSession()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var hasBeenPaused = false

    @IBAction func play(_ sender: Any) {
        songPlayer.play()
    }
    
    @IBAction func pause(_ sender: Any) {
        if songPlayer.isPlaying {
            songPlayer.pause()
            hasBeenPaused = true
        } else {
            hasBeenPaused = false 
        }
    }
    
    @IBAction func restart(_ sender: Any) {
        if songPlayer.isPlaying || hasBeenPaused {
            songPlayer.stop()
            songPlayer.currentTime = 0
            
            songPlayer.play()
        } else {
            songPlayer.play()
        }
    }
}

