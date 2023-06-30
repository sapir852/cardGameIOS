//
//  gameController.swift
//  CardGame
//
//  Created by student1 on 29/05/2023.
//

import UIKit
import Foundation


    
   
class gameController: UIViewController {
    
    var viewCon: ViewController?
    
    @IBOutlet weak var player2: UITextView!
    @IBOutlet weak var player1: UITextView!
    
    @IBOutlet weak var score2: UITextView!
    @IBOutlet weak var score1: UITextView!
    
    @IBOutlet weak var cardP2: UIImageView!
    @IBOutlet weak var cardP1: UIStackView! //don use
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var cardP22: UIImageView!//cardP1
    let images: [UIImage] = [#imageLiteral(resourceName: "PAPER"), #imageLiteral(resourceName: "Rock"), #imageLiteral(resourceName: "SCISSORS")]
    let cardback = UIImage(named: "cardback")
    var counter = 0
    var timer = Timer()
    var namePlayer1 : String?
    var side = 0
    var winnerPlayer : String?
    var winnerScore : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = viewCon?.saveGetName {
            namePlayer1 = name
           
            
        }
        if let side = viewCon?.size{
            if side == 1{
                player1.text = namePlayer1
                player2.text = "PC"
            }
            else{
                player2.text = namePlayer1
                player1.text = "PC"
            }
            
        }
        
        
        startTimer()
    }
    
    func startTimer() {
        self.timerLabel.text = String(5)
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(performTask), userInfo: nil, repeats: true)
        timer.fire()
        
        
        
    }
    
    @objc func performTask() {
       
        
        if counter >= 6 {
                timer.invalidate()
                // Go to the next page
                if score1.text! < score2.text! {
                    winnerScore = score2.text
                    winnerPlayer = player2.text
                } else {
                    winnerScore = score1.text
                    winnerPlayer = player1.text
                }
                performSegue(withIdentifier: "WinnerPage", sender: self)
                return
            }

            let randomIndex = Int(arc4random_uniform(UInt32(images.count)))
            let randomIndex2 = Int(arc4random_uniform(UInt32(images.count)))

            UIView.transition(with: cardP2, duration:1, options: .transitionFlipFromRight, animations: {
                if self.cardP2.image == self.cardback {
                    self.cardP2.image = self.images[randomIndex]
                } else {
                    self.cardP2.image = self.cardback
                }
            }, completion: nil)

            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                UIView.transition(with: self.cardP2, duration: 1, options: .transitionFlipFromLeft, animations: {
                    self.cardP2.image = self.cardback
                }, completion: nil)
            }

            UIView.transition(with: cardP22, duration: 1, options: .transitionFlipFromRight, animations: {
                if self.cardP22.image == self.cardback {
                    self.cardP22.image = self.images[randomIndex2]
                } else {
                    self.cardP22.image = self.cardback
                }
            }, completion: nil)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.transition(with: self.cardP22, duration: 1, options: .transitionFlipFromLeft, animations: {
                self.cardP22.image = self.cardback
            }, completion: { _ in
                // Perform your task here after the transition animation finishes
                // This closure is executed when the animation completes
                
                // Update the counter and timerLabel
                self.counter += 1
                self.timerLabel.text = String(6 - self.counter)
                
                if randomIndex == 0 {
                    if randomIndex2 == 1 {
                        if let currentScore = Int(self.score1.text ?? "0") {
                            let newScore = currentScore + 1
                            self.score1.text = String(newScore)
                        }
                    }
                    if randomIndex2 == 2 {
                        if let currentScore = Int(self.score2.text ?? "0") {
                            let newScore = currentScore + 1
                            self.score2.text = String(newScore)
                        }
                    }
                }
                
                if randomIndex == 1 {
                    if randomIndex2 == 2 {
                        if let currentScore = Int(self.score1.text ?? "0") {
                            let newScore = currentScore + 1
                            self.score1.text = String(newScore)
                        }
                    }
                    if randomIndex2 == 0 {
                        if let currentScore = Int(self.score2.text ?? "0") {
                            let newScore = currentScore + 1
                            self.score2.text = String(newScore)
                        }
                    }
                }
                
                if randomIndex == 2 {
                    if randomIndex2 == 0 {
                        if let currentScore = Int(self.score1.text ?? "0") {
                            let newScore = currentScore + 1
                            self.score1.text = String(newScore)
                        }
                    }
                    if randomIndex2 == 1 {
                        if let currentScore = Int(self.score2.text ?? "0") {
                            let newScore = currentScore + 1
                            self.score2.text = String(newScore)
                        }
                    }
                }
            })
        }
      //  self.timerLabel.text = String (5-self.counter)
       // self.counter += 1
        
        
        //  self.cardP2.image = randomImage
        //  self.cardP22.image = randomImage2
    
       
         
    }
    
     override func prepare(for segue1: UIStoryboardSegue, sender: Any?) {
             if segue1.identifier == "WinnerPage" {
                 if let WinnerPage = segue1.destination as? WinnerPage {
             
                     
                     WinnerPage.viewCon1 = self
                 }
             }
         }
     
 
}
