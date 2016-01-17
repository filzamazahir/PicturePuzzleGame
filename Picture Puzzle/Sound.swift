//
//  Sound.swift
//  Picture Puzzle
//
//  Created by Jimmy Nguyen on 1/16/16.
//  Copyright © 2016 Filza Mazahir. All rights reserved.
//

import UIKit
import AVFoundation

// Create a Sound model
class Sound: NSObject {
    static var ButtonAudioPlayer = AVAudioPlayer()
    static var extention: String = "mp3"
    var audioTitle: String
    var gameOver: String = "false"
    
    init(audioTitle: String){
        self.audioTitle = audioTitle
    }
    
    func startGame() {
        let ButtonAudioURL: NSURL = NSBundle.mainBundle().URLForResource(self.audioTitle, withExtension: Sound.extention)!
        
        
        do {
            Sound.ButtonAudioPlayer = try AVAudioPlayer(contentsOfURL: ButtonAudioURL, fileTypeHint: nil)
        } catch _ {}
        
        Sound.ButtonAudioPlayer.play()
        
//        while Sound.ButtonAudioPlayer.playing {
//            if (Sound.ButtonAudioPlayer.currentTime > 31) {
//                Sound.ButtonAudioPlayer.stop()
//            }
//        }
        
    }
    
    func stopGame() {
        let ButtonAudioURL: NSURL = NSBundle.mainBundle().URLForResource(self.audioTitle, withExtension: Sound.extention)!
        
        
        do {
            Sound.ButtonAudioPlayer = try AVAudioPlayer(contentsOfURL: ButtonAudioURL, fileTypeHint: nil)
        } catch _ {}
        
        Sound.ButtonAudioPlayer.stop()
    }
    
    
    
    
    
    
    
}



