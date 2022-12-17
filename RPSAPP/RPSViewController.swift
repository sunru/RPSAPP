//
//  RPSViewController.swift
//  RPSAPP
//
//  Created by 廖晨如 on 2022/12/13.
//

import UIKit
import AVFAudio
class RPSViewController: UIViewController {

    @IBOutlet weak var cpuImageView: UIImageView!
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var cpuScore: UILabel!
    @IBOutlet weak var playerScore: UILabel!
    
    @IBOutlet weak var stickButton: UIButton!
    @IBOutlet weak var wormButton: UIButton!
    @IBOutlet weak var chickenButton: UIButton!
    @IBOutlet weak var tigerButton: UIButton!
    
    var playerResult: RPSElement = .worm
    var cpuResult: RPSElement = .worm
    var totalWins: Int = 0 {//property observer
        didSet{
            resultLabel.text = RPSStatus.win.result
            playerScore.text = String(totalWins)
        }
    }
    var totalLoses: Int = 0 {//property observer
        didSet{
            resultLabel.text = RPSStatus.lose.result
            cpuScore.text = String(totalLoses)
        }
    }
    let synthesizer = AVSpeechSynthesizer()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        // Do any additional setup after loading the view.
    }
    
    // segue UIButton: stickButton wormButton chickenButton tigerButton
    @IBAction func playerChoice(_ sender: UIButton) {
        //CPU 說話
        let utterance = AVSpeechUtterance(string: "棒打老虎雞吃蟲")
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        utterance.rate = 0.6
        synthesizer.speak(utterance)
        //給 CPU 說話時間
        DispatchQueue.main.asyncAfter(deadline: .now()+0.8) {
            //依據點擊 Button 變更我方圖片
            switch sender{
            case self.stickButton:
                if let stick = RPSElement.stick.displayImage{// UIImage is Optional
                    self.playerResult = RPSElement.stick
                    self.playerImageView.image = stick
                }
            case self.wormButton:
                if let worm = RPSElement.worm.displayImage{
                    self.playerResult = RPSElement.worm
                    self.playerImageView.image = worm
                }
            case self.chickenButton:
                if let chicken = RPSElement.chicken.displayImage{
                    self.playerResult = RPSElement.chicken
                    self.playerImageView.image = chicken
                }
            case self.tigerButton:
                if let tiger = RPSElement.tiger.displayImage{
                    self.playerResult = RPSElement.tiger
                    self.playerImageView.image = tiger
                }
            default:
                self.playerImageView.image = UIImage(named: "rule")
            }
            //電腦隨機出圖 RPSElement CaseIterable to array
            let cpu = RPSElement.allCases.randomElement()!
            if let cpuImage = cpu.displayImage{
                self.cpuResult = cpu
                self.cpuImageView.image = cpuImage
            }
            //結果 & 更新計分表
            self.checkResult()
        }
        
        
        
    }
    //檢查雙方結果
    func checkResult(){
        if(playerResult == RPSElement.stick && cpuResult == RPSElement.tiger){
            totalWins += 1
        }else if(playerResult == RPSElement.tiger && cpuResult == RPSElement.chicken){
            totalWins += 1
        }else if(playerResult == RPSElement.chicken && cpuResult == RPSElement.worm){
            totalWins += 1
        }else if(playerResult == RPSElement.worm && cpuResult == RPSElement.stick){
            totalWins += 1
        }else if(cpuResult == RPSElement.stick && playerResult == RPSElement.tiger){
            totalLoses += 1
        }else if(cpuResult == RPSElement.tiger && playerResult == RPSElement.chicken){
            totalLoses += 1
        }else if(cpuResult == RPSElement.chicken && playerResult == RPSElement.worm){
            totalLoses += 1
        }else if(cpuResult == RPSElement.worm && playerResult == RPSElement.stick){
            totalLoses += 1
        }else{
            resultLabel.text = RPSStatus.draw.result
        }
            
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
