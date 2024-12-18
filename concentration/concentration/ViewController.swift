//
//  ViewController.swift
//  concentration
//
//  Created by Anurag Tyagi on 06/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game: Concentration = Concentration(numberOfPairsOfCards: cardsCollection.count / 2)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var flips: Int = 0{
        didSet{
            flipCountLabel.text = "Total Flips: \(flips)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!

    @IBOutlet var cardsCollection: [UIButton]!
    
    let cardsEmoji : Array<String>  = ["👻", "🙉", "🙉", "👻"]
    

    @IBAction func onCardTap(_ sender: UIButton) {
        flips += 1
        if let cardIndex = cardsCollection.firstIndex(of: sender){
            game.chooseCard(at: cardIndex)
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel(){
        for index in cardsCollection.indices{
            let button = cardsCollection[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = .white
            }else{
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : .systemOrange
            }
        }
    }
    
    var emojiChoices = ["👻","😂","🙉","😵‍💫","👍","😊","😡","😢","🤯","🤓"]
    
    var emoji: [Int:String] = [:]
    
    func emoji(for card: Card) -> String{
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex: Int = Int(
                arc4random_uniform(UInt32(cardsEmoji.count))
            )
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card.identifier] ?? "?"
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if emoji == button.currentTitle {
            button.setTitle("", for: .normal)
            button.backgroundColor = .orange
        }else{
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .white
        }
    }
}

