//
//  ViewController.swift
//  Concentration
//
//  Created by Luiza Rodrigues de Almeida Avelino on 12/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count) / 2)
    
    var flipCount: Int = 0 {
        didSet {
            flipLabel.text = "Flips: \(flipCount)"
        }
        
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9803921569, blue: 0.9450980392, alpha: 1)
                button.setTitle(emoji(for :card), for: UIControl.State.normal);
            }else{
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                button.setTitle("", for: UIControl.State.normal);
            }
        }
    }
    
    var emojiChoices: Array<String> = ["👻","🎃","🍎", "🍭","😱", "🙀", "🦇", "😈", "🍬"]
    var emoji = [Int : String]()

    func emoji(for card: Card) -> String{
        if emoji[card.identifier] == nil,emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        
        return emoji[card.identifier] ?? "????"
    }
}

