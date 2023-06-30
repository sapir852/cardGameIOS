//
//  WinnerPage.swift
//  CardGame
//
//  Created by student3 on 19/06/2023.
//

import UIKit

class WinnerPage: UIViewController {
    var viewCon1: gameController?
    
    @IBOutlet weak var winnerName: UILabel!
    
    @IBOutlet weak var BTN_backToMenu: UIButton!
    @IBOutlet weak var winnerScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let winnersName = viewCon1?.winnerPlayer {
            winnerName.text = winnersName
            
            }
        if let winnersScore = viewCon1?.winnerScore {
            winnerScore.text = winnersScore
            
            }
        
        
    }
    


}
