//
//  PuzzleViewController.swift
//  Picture Puzzle
//
//  Created by Filza Mazahir on 1/15/16.
//  Copyright © 2016 Filza Mazahir. All rights reserved.
//

import UIKit

class PuzzleViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    var count = 0
    var timer = NSTimer()
    
    @IBOutlet weak var testButtonLabel: UIButton!
    @IBAction func testButton(sender: UIButton) {
        count++
        
        testLabel.text = String(count)
        
        checkPuzzleCompleted()
        
    }
    
    @IBOutlet weak var checkGameStatusLabel: UILabel!
       
    @IBOutlet var levelButtonCollection: [UIButton]!
    
    
    // DIFFICULTY LEVEL BUTTONS
    @IBAction func EasyButton(sender: UIButton) {
        resetGame()
        
        let sound = Sound(audioTitle: "jeopardy")
        
        sound.startGame()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: Selector("gameTimer"), userInfo: nil, repeats: true)
        
    }
    @IBAction func NormalButton(sender: UIButton) {
        resetGame()
        
        let sound = Sound(audioTitle: "jaws")
        
        sound.startGame()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: Selector("gameTimer"), userInfo: nil, repeats: true)
        
    }
    @IBAction func DifficultButton(sender: UIButton) {
        resetGame()
        
        let sound = Sound(audioTitle: "gladiator")
        
        sound.startGame()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: Selector("gameTimer"), userInfo: nil, repeats: true)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testButtonLabel.enabled = false
        checkGameStatusLabel.hidden = true
        checkGameStatusLabel.font = UIFont(name: "Avenir", size: 30)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Reset the test game labels and buttons
    func resetGame() {
        testLabel.text = String(0)
        checkGameStatusLabel.hidden = true
        testButtonLabel.enabled = true
        
        for each in levelButtonCollection {
            each.enabled = false
        }
    }
    
    // Timer used to count down the game based on the current difficulty level
    func gameTimer() {
        print("Printing current time from gameTimer", Sound.ButtonAudioPlayer.currentTime)
        // check to when the current time is greater than the time right before the song ends, hence the subtraction of 0.5 from the total time duration of the current audio track
        if (Sound.ButtonAudioPlayer.currentTime > Sound.ButtonAudioPlayer.duration - 0.3) {
            testButtonLabel.enabled = false
            Sound.ButtonAudioPlayer.stop()
            checkGameStatusLabel.text = "Game Over!  Please Try Again!"
            checkGameStatusLabel.hidden = false
            for each in levelButtonCollection {
                each.enabled = true
            }
        }
    }
    
    // Function to check whether or not the user has solved the puzzle
    // TEST: Created a test button and check to see if the user has counted to 10 before the timer is up
    func checkPuzzleCompleted () {
        print("sound playing?", Sound.ButtonAudioPlayer.playing)
        
        print("Current Track Time:", Sound.ButtonAudioPlayer.currentTime)
        print("Duration of Current Track:", Sound.ButtonAudioPlayer.duration)
        print("COUNT:", count)
        
        if count > 9 {
            testButtonLabel.enabled = false
            Sound.ButtonAudioPlayer.stop()
            checkGameStatusLabel.text = "You win!"
            checkGameStatusLabel.hidden = false
            for each in levelButtonCollection {
                each.enabled = true
            }
            count = 0
        }
    }
    
    
}
