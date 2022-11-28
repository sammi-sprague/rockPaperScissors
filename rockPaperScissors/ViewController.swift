//
//  ViewController.swift
//  rockPaperScissors
//
//  Created by SAMANTHA SPRAGUE on 11/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard

    
    @IBOutlet weak var playOutlet: UIButton!
    @IBOutlet weak var rockOutlet: UIImageView!
    @IBOutlet weak var scissorOutlet: UIImageView!
    @IBOutlet weak var paperOutlet: UIImageView!
    @IBOutlet weak var computerImageOutlet: UIImageView!
    
    
    @IBOutlet weak var compWLT: UILabel!
    @IBOutlet weak var playerWLT: UILabel!
    @IBOutlet weak var winOutlet: UILabel!
    
    
    enum Move{
        case rock, paper, scissors
    }
    var player: Move!
    var computer: Move!
    var pWin = 0
    var pTie = 0
    var pLoss = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playOutlet.isHidden = true
        
        if let ok = defaults.object(forKey: "wins"){
            pWin = ok as! Int
        }
        if let ok = defaults.object(forKey: "loss"){
            pLoss = ok as! Int
        }
        if let ok = defaults.object(forKey: "ties"){
            pTie = ok as! Int
        }
        playerWLT.text = "W: \(pWin)   L: \(pLoss)   T: \(pTie)"
    }

    
    
    @IBAction func playAgain(_ sender: UIButton) {
        
        rockOutlet.isHidden = false
        paperOutlet.isHidden = false
        scissorOutlet.isHidden = false
        computerImageOutlet.isHidden = true
        winOutlet.text = ""
        sender.isHidden = true
    }
    
   
    
    @IBAction func rockAction(_ sender: Any) {
        paperOutlet.isHidden = true
        scissorOutlet.isHidden = true
        play(p: .rock)
    }
    
    
    @IBAction func paperAction(_ sender: UITapGestureRecognizer) {
        rockOutlet.isHidden = true
        scissorOutlet.isHidden = true
        play(p: .paper)
    }
    
    @IBAction func scissorsAction(_ sender: UITapGestureRecognizer) {
        rockOutlet.isHidden = true
        paperOutlet.isHidden = true
        play(p: .scissors)
    }
    
    
    func play(p: Move){
        computerImageOutlet.isHidden = false
        winOutlet.text = ""
        let rando = Int.random(in: 1..<4)
        switch rando {
        case 1:
            self.computer = .rock
            computerImageOutlet.image = UIImage(named: "rock")
        case 2:
            self.computer = .paper
            computerImageOutlet.image = UIImage(named: "paper-removebg-preview")
        default:
            self.computer = .scissors
            computerImageOutlet.image = UIImage(named: "scissors")
        }
        
        
        if (p == .paper && computer == .rock) || (p == .rock && computer == .scissors) || (p == .scissors && computer == .paper){
            winOutlet.text = "You win!"
            pWin += 1
        }else if (p == .paper && computer == .paper) || (p == .rock && computer == .rock) || (p == .scissors && computer == .scissors){
            winOutlet.text = "It's a tie"
            pTie += 1
        }else{
            winOutlet.text = "The computer wins :("
            pLoss += 1
        }
        
        playerWLT.text = "W: \(pWin)   L: \(pLoss)   T: \(pTie)"
        //compWLT.text = "W: \(pLoss)   L: \(pWin)   T: \(pTie)"
        playOutlet.isHidden = false
        
    }
    
    
    
    @IBAction func saveAction(_ sender: Any) {
        defaults.set(pWin, forKey: "wins")
        defaults.set(pTie, forKey: "loss")
        defaults.set(pLoss, forKey: "ties")
    }
    
    
    @IBAction func deleteAction(_ sender: Any) {
        pTie = 0
        pWin = 0
        pLoss = 0
        playerWLT.text = "W: \(pWin)   L: \(pLoss)   T: \(pTie)"
    }
    
}

