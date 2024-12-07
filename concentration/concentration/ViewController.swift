//
//  ViewController.swift
//  concentration
//
//  Created by Anurag Tyagi on 06/12/24.
//

import UIKit

class ViewController: UIViewController {

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
            flipCard(withEmoji: cardsEmoji[cardIndex], on: sender)
        }
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

