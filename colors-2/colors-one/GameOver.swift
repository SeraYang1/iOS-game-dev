//
//  GameOver.swift
//  colors-one
//
//  Created by Sera Yang on 6/13/18.
//  Copyright © 2018 com.calhacks. All rights reserved.
//

import Foundation
import UIKit

class GameOver: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "HELLO"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
