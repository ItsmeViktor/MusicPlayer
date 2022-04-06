//
//  PlayerViewController.swift
//  MusicPlayer
//
//  Created by viktor on 06.04.2022.
//

import UIKit

class PlayerViewController: UIViewController {

    public var position: Int = 0
    public var songs: [Song] = []
  
    @IBOutlet var holder: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if holder.subviews.count == 1 {
            configure()
        }
    }
    func configure () {
        //set up player
        
        
        // set up user elements
    }
}
