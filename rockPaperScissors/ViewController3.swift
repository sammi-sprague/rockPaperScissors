//
//  ViewController3.swift
//  rockPaperScissors
//
//  Created by SAMANTHA SPRAGUE on 11/21/22.
//

import UIKit

class ViewController3: UIViewController {

    
    @IBOutlet weak var move1Outlet: UIImageView!
    @IBOutlet weak var move2Outlet: UIImageView!
    @IBOutlet weak var move3Outlet: UIImageView!
    
    @IBOutlet weak var compImageOutlet: UIImageView!
    
    @IBOutlet weak var name3Outlet: UILabel!
    
    @IBOutlet weak var name2Outlet: UILabel!
    @IBOutlet weak var name1Outlet: UILabel!
    
    @IBOutlet weak var winOutlet: UILabel!
    
    
    @IBOutlet weak var playerWLTOutlet: UILabel!
    @IBOutlet weak var compWLTOutlet: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        move1Outlet.image = AppData.pic1
        move2Outlet.image = AppData.pic2
        move3Outlet.image = AppData.pic3
        name1Outlet.text = AppData.move1
        name2Outlet.text = AppData.move2
        name3Outlet.text = AppData.move3
    }
    

   
    
    //
    //  ViewController3.swift
    //  rockPaperScissors
    //
    //  Created by SAMANTHA SPRAGUE on 11/21/22.
    //
     
   
        
        enum Move{
            case a, b, c
        }
        var player: Move!
        var computer: Move!
        var pWin = 0
        var pTie = 0
        var pLoss = 0
        
        
        
        
        
    @IBAction func move3Action(_ sender: Any) {
        
            move1Outlet.isHidden = true
            move2Outlet.isHidden = true
            play(p: .c)
    }
    
    
    @IBAction func playAgainAction(_ sender: Any) {
        compImageOutlet.isHidden = true
        move3Outlet.isHidden = false
        move2Outlet.isHidden = false
        move1Outlet.isHidden = false
        winOutlet.text = ""
    }
    
    
    @IBAction func move2Action(_ sender: Any) {
        
            move1Outlet.isHidden = true
            move3Outlet.isHidden = true
            play(p: .b)
    }
    
        @IBAction func move1Action(_ sender: Any) {
            
                move2Outlet.isHidden = true
                move3Outlet.isHidden = true
                play(p: .a)
            }
            
            
            
            
            
            
            
            
            
            
            func play(p: Move){
                compImageOutlet.isHidden = false
                winOutlet.text = ""
                var rando = Int.random(in: 1..<4)
                switch rando {
                case 1:
                    self.computer = .a
                    compImageOutlet.image = AppData.pic1
                case 2:
                    self.computer = .b
                    compImageOutlet.image = AppData.pic2
                default:
                    self.computer = .c
                    compImageOutlet.image = AppData.pic3
                }
                
                
                if (p == .a && computer == .b) || (p == .b && computer == .c) || (p == .c && computer == .a){
                    winOutlet.text = "You win!"
                    pWin += 1
                }else if (p == .a && computer == .a) || (p == .b && computer == .b) || (p == .c && computer == .c){
                    winOutlet.text = "It's a tie"
                    pTie += 1
                }else{
                    winOutlet.text = "The computer wins :("
                    pLoss += 1
                }
                
                playerWLTOutlet.text = "W: \(pWin)   L: \(pLoss)   T: \(pTie)"
                compWLTOutlet.text = "W: \(pLoss)   L: \(pWin)   T: \(pTie)"
                
                
            }
            
            
            
            
            
            
            
            
            
            
        

}
