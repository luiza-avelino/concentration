//
//  ViewController.swift
//  Concentration
//
//  Created by Luiza Rodrigues de Almeida Avelino on 12/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount: Int = 0 {
        didSet {
            flipLabel.text = "Flips: \(flipCount)"
        }
        
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipLabel: UILabel!
    
    var emojiChoices: Array<String> = ["👻","👻","🎃","👻"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
           flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
    }
    
    func flipCard(withEmoji emoji:String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            button.setTitle("", for: UIControl.State.normal);
        }else{
            button.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9803921569, blue: 0.9450980392, alpha: 1)
            button.setTitle(emoji, for: UIControl.State.normal);
        }
    }
    

}

