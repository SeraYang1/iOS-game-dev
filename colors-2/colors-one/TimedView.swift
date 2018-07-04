//
//  TimedView.swift
//  colors-one
//
//  Created by Sera Yang on 6/17/18.
//  Copyright © 2018 com.calhacks. All rights reserved.
//

import UIKit

class TimedView: UIViewController {
    
    @IBOutlet weak var resumeButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    let botLayer = CAShapeLayer()
    
    var timer = Timer()
    var timeDecrement = 0
    var yHigh = 0
    var yLow = 0
    var yDiff = 0
    
    //change every time
    var numSquares = 3
    var range = 0.2
    var width = 0.0
    var size = 0.0
    var wrongX = 0
    var wrongY = 0
    var wrongXPos = 0
    var wrongYPos = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Hide the pause screen stuff
        resumeButton.isHidden = true
        homeButton.isHidden = true
        restartButton.isHidden = true
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        
        // Draws a single rectangle
        drawRect(x: 100, y: 100, width: 50, height: 50, color: UIColor(red: CGFloat(50), green: CGFloat(30), blue: CGFloat(30), alpha: 0.5).cgColor)
        view.layer.addSublayer(botLayer)
        
        // If they can get to this stage
//        generateSquares(numSquares: numSquares, range: range)
    }
    
    @objc func update() {
        timeDecrement+=1
        if timeDecrement >= 20 {
            let secondViewController:GameOver = GameOver()

            self.present(secondViewController, animated: true, completion: nil)

            timerLabel.text = "YOURE OUT OF TIME"
        }else{
            timerLabel.text = String(20-timeDecrement)
        }
    }
    
    //draws the rectangle given coordinates and size
    func drawRect(x: Double, y: Double, width: Double, height: Double, color: CGColor){
        let rect = CGRect(x: x, y:y, width: width, height:height )
        let square = UIBezierPath(roundedRect: rect, cornerRadius: 5)
        //draws the path
        let layer = CAShapeLayer()
        layer.path = square.cgPath
        layer.fillColor = color
        layer.strokeColor = color
        botLayer.addSublayer(layer)
    }
    
    //calls drawRect multiple times to draw the squares
    func generateSquares(numSquares: Int, range: Double){
        //clears background
        drawRect(x: 0.0, y: 3.0+Double(yHigh), width: width+Double(numSquares)*2.0, height: Double(yDiff)-3.0, color: UIColor.white.cgColor)
        
        //size of board minus border width
        let r = drand48()*Double(1-range)
        let b = drand48()*Double(1-range)
        let g = drand48()*Double(1-range)
        let color = UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1.0).cgColor
        
        
        //edit every time
        width = Double(self.view.bounds.width)-2.0*Double(numSquares)
        size = width/Double(numSquares)
        wrongX = Int(arc4random_uniform(UInt32(numSquares-1)))+1
        wrongY = Int(arc4random_uniform(UInt32(numSquares-1)))+1
        wrongXPos = Int(Double(numSquares)+Double(wrongX)*size)
        wrongYPos = Int(3.0+Double(numSquares)+Double(yHigh)+Double(wrongY)*size)
        
        
        
        //Draws all squares same color
        for x in 0...(numSquares-1){
            for y in 0...(numSquares-1){
                drawRect(x: Double(numSquares)+Double(x)*size, y: 3.0+Double(numSquares)+Double(yHigh)+Double(y)*size, width: size-2, height: size-2, color: color)
            }
        }
        
        //finds color of incorrect tile
        var wrongColor = UIColor(red: CGFloat(r+range), green: CGFloat(g), blue: CGFloat(b), alpha: 1.0).cgColor
        let ranNum = Int(arc4random_uniform(UInt32(3)))
        if(ranNum == 0){
            wrongColor = UIColor(red: CGFloat(r), green: CGFloat(g+range), blue: CGFloat(b), alpha: 1.0).cgColor
        }else if(ranNum==1){
            wrongColor = UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b+range), alpha: 1.0).cgColor
        }
        
        //draws incorrect tile
        drawRect(x: Double(numSquares)+Double(wrongX)*size, y: 3.0+Double(numSquares)+Double(yHigh)+Double(wrongY)*size, width: size-2, height: size-2, color: wrongColor)
        view.layer.addSublayer(botLayer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
