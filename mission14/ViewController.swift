//
//  ViewController.swift
//  TestIOS
//
//  Created by 김소희 on 2023/03/25.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    private func playVideo(url:NSURL){
        let playerController = AVPlayerViewController()
        let player = AVPlayer(url:url as URL)
        playerController.player = player
        self.present(playerController,animated: true){
            player.play()
        }
    }
    
    @IBAction func btnPlayExtenalMov(_ sender: UIButton) {
        let url = NSURL(string:"https://dl.dropboxusercontent.com/s/ijybpprsmx0bgre/Seascape.mov")!
        playVideo(url: url)
    }
    @IBAction func btnPlayMov(_ sender: UIButton) {
        let filePath:String? = Bundle.main.path(forResource: "Mountaineering", ofType: "mov")
        let url = NSURL(fileURLWithPath: filePath!)
        playVideo(url: url)
    }
    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        let filePath:String? = Bundle.main.path(forResource: "FastTyping", ofType: "mp4")
        let url = NSURL(fileURLWithPath: filePath!)
        playVideo(url: url)
    }
    @IBAction func btnPlayExternalMovie(_ sender: UIButton) {
        let url = NSURL(string:"https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4")!
        playVideo(url: url)
    }
}
