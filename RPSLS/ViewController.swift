//
//  ViewController.swift
//  RPSLS
//
//  Created by Katie Macalintal on 11/12/19.
//  Copyright © 2019 Katie Macalintal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets for the main labels and buttons of signs
    @IBOutlet weak var computerSign: UILabel!
    
    @IBOutlet weak var gameStatus: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet weak var lizardButton: UIButton!
    
    @IBOutlet weak var spockButton: UIButton!
    
    @IBOutlet weak var rockButton: UIButton!
    
    @IBOutlet weak var paperButton: UIButton!
    
    @IBOutlet weak var scissorsButton: UIButton!
    
    
    //Outlets for the Score and Streak Labels
    @IBOutlet weak var yourScoreLabel: UILabel!

    @IBOutlet weak var computerScoreLabel: UILabel!
    
    @IBOutlet weak var winningStreakLabel: UILabel!
    
    @IBOutlet weak var computerWinningStreakLabel: UILabel!
    
    
    //Defining the variables
    
    //true: Screen waiting to select
    //false: Screen shows results
    var gameState: Bool = true
    
    var yourScore: Int = 0
    var computerScore: Int = 0
    var winningStreak: Int = 0
    var computerWinningStreak: Int = 0
    
    //------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func signSelected(_ sender: UIButton) {
        
        if gameState == true{
            
            //Checking to see if the color of the screen should change
            if winningStreak >= 3 {
                view.backgroundColor = .systemGreen
            } else if computerWinningStreak >= 3 {
                view.backgroundColor = .systemRed
            } else {
                view.backgroundColor = .systemBackground
            }
            
            //Determining which sign was selected by the user
            var selectedSign: Sign = .rock
            if sender == rockButton{
                selectedSign = Sign.rock
            }
            if sender == spockButton{
                selectedSign = Sign.spock
            }
            if sender == paperButton{
                selectedSign = Sign.paper
            }
            if sender == lizardButton{
                selectedSign = Sign.lizard
            }
            if sender == scissorsButton{
                selectedSign = Sign.scissors
            }
            
            //Assigning the selected (or random) signs to the players
            let player:Sign = selectedSign
            let computer:Sign = Sign(rawValue:Int.random(in: 1...5))!
            
            //print( "P: \(player.emoji), C:\(computer.emoji)")
            
            //Changing text on screen and variables based on the results of one game

            if player.beats(player, computer) == 1 || player.beats(player, computer) == 2 {
                gameStatus.text = "You LOST!"
                
                computerScore += 1
                computerScoreLabel.text = "Computer: \(computerScore)"
                
                winningStreak = 0
                winningStreakLabel.text = "Winning Streak: \(winningStreak)"
                
                computerWinningStreak += 1
                computerWinningStreakLabel.text = "Computer Streak: \(computerWinningStreak)"
                
                
            } else if player.beats(player, computer) == 3 || player.beats(player, computer) == 4 {
                gameStatus.text = "You WON!"
                
                yourScore += 1
                yourScoreLabel.text = "You: \(yourScore)"
                
                winningStreak += 1
                winningStreakLabel.text = "Winning Streak: \(winningStreak)"
                
                computerWinningStreak = 0
                computerWinningStreakLabel.text = "Computer Streak: \(computerWinningStreak)"

            } else {
                gameStatus.text = "It's a TIE!"
                
                winningStreak = 0
                winningStreakLabel.text = "Winning Streak: \(winningStreak)"
                
                computerWinningStreak = 0
                computerWinningStreakLabel.text = "Computer Streak: \(computerWinningStreak)"
                
                
            }
            
            //changing the screen to show the results
            gameState = false
            //should disable all buttons even the one they picked
            //not hiding the bottom button bc that will be the one that will display the image that the user picked
            lizardButton.isHidden = true
            spockButton.isHidden = true
            rockButton.isHidden = true
            scissorsButton.isHidden = true
            
            playAgainButton.isHidden = false
            paperButton.isEnabled = false
            computerSign.text = computer.emoji
            //dont asign to the title label
            //setTitle("text", for: .normal)
            //assigning the players picked button
            paperButton.setTitle("\(player.emoji)", for: .normal)
            //print( "\(paperButton.titleLabel!.text)")
            
        } else {
            
            gameStatus.text = "RPSLS?"
            computerSign.text = "🤖"
            playAgainButton.isHidden = true
            lizardButton.isHidden = false
            spockButton.isHidden = false
            rockButton.isHidden = false
            paperButton.isHidden = false
            scissorsButton.isHidden = false
            
        }
    }
    
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        
        if winningStreak >= 3 {
            view.backgroundColor = .systemGreen
        } else if computerWinningStreak >= 3 {
            view.backgroundColor = .systemRed
        } else {
            view.backgroundColor = .systemBackground
        }
        
        gameState = true
        computerSign.text = "🤖"
        gameStatus.text = "RPSLS?"
        playAgainButton.isHidden = true
        lizardButton.isHidden = false
        spockButton.isHidden = false
        rockButton.isHidden = false
        paperButton.setTitle("🤚🏽", for: .normal)
        paperButton.isHidden = false
        paperButton.isEnabled = true
        scissorsButton.isHidden = false
    }
    
    
    @IBAction func restartGameButtonPressed(_ sender: Any) {
        gameState = true
        computerSign.text = "🤖"
        gameStatus.text = "RPSLS?"
        playAgainButton.isHidden = true
        lizardButton.isHidden = false
        spockButton.isHidden = false
        rockButton.isHidden = false
        paperButton.setTitle("🤚🏽", for: .normal)
        paperButton.isHidden = false
        paperButton.isEnabled = true
        scissorsButton.isHidden = false
        
        yourScore = 0
        computerScore = 0
        winningStreak = 0
        computerWinningStreak = 0
        
        view.backgroundColor = .systemBackground
        
        yourScoreLabel.text = "You: "
        computerScoreLabel.text = "Computer: "
        winningStreakLabel.text = "Winning Streak: "
        computerWinningStreakLabel.text = "Computer Streak: "
        
    }
    
}

