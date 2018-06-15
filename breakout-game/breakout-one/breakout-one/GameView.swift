//
//  GameView.swift
//  breakout-one
//
//  Created by Sera Yang on 6/13/18.
//  Copyright © 2018 com.calhacks. All rights reserved.
//

import Foundation
import UIKit

class GameView: UIViewController{
    
    @IBOutlet weak var ball: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.ball.center.y -= 10
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.ball.center.y += 10
        viewDidAppear(false)
    }
}
