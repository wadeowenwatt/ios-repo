//
//  HomeViewController.swift
//  study-ios
//
//  Created by Linhtn1 on 9/4/24.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet var containerVIew: UIView!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var resetBtn: UIButton!
    let timeLeftShapeLayer = CAShapeLayer()
    let bgShapeLayer = CAShapeLayer()
    
    let totalTime: TimeInterval = 120
    var timeLeft: TimeInterval = 120
    
    var endTime: Date?
    var timer = Timer()
    
    var isPause = true
    
    var drawCurveStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
    let animationKey = "abc"
    
    
    func drawBgShape() {
        bgShapeLayer.path = UIBezierPath(arcCenter: CGPoint(x: view.frame.midX, y: view.frame.midY), radius: 100, startAngle: 270.degreesToRadians, endAngle: -90.degreesToRadians, clockwise: false).cgPath
        
        bgShapeLayer.strokeColor = UIColor.orange.cgColor
        bgShapeLayer.fillColor = UIColor.clear.cgColor
        bgShapeLayer.lineWidth = 8
        view.layer.addSublayer(bgShapeLayer)
    }
    
    func drawTimeLeftShape() {
        timeLeftShapeLayer.path = UIBezierPath(arcCenter: CGPoint(x: view.frame.midX, y: view.frame.midY), radius: 100, startAngle: 270.degreesToRadians, endAngle: -90.degreesToRadians, clockwise: false).cgPath
        timeLeftShapeLayer.strokeColor = UIColor.darkGray.cgColor
        timeLeftShapeLayer.fillColor = UIColor.clear.cgColor
        timeLeftShapeLayer.lineWidth = 8
        timeLeftShapeLayer.isHidden = false
        view.layer.addSublayer(timeLeftShapeLayer)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawBgShape()
        
        timeLabel.text = timeLeft.time
        resetBtn.layer.borderColor = UIColor.white.cgColor
        containerVIew.layer.borderWidth = 8
        containerVIew.layer.borderColor = UIColor.darkGray.cgColor
        

        drawCurveStrokeEnd.fromValue = 0
        drawCurveStrokeEnd.toValue = 1
        drawCurveStrokeEnd.duration = timeLeft
    }
    
    @objc func updateTime() {
        if timeLeft > 0 {
            timeLeft = endTime?.timeIntervalSinceNow ?? 0
            timeLabel.text = timeLeft.time
        } else {
            timeLabel.text = "00:00"
            stop()
            timer.invalidate()
        }
    }
    
    @IBAction func onClickStartBtn() {
        drawTimeLeftShape()
        if isPause {
            endTime = Date().addingTimeInterval(timeLeft)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            resume()
            isPause = false
        } else {
            pause()
            timer.invalidate()
            isPause = true
        }
    }
    
    private func pause() {
        guard let presentationLayer = timeLeftShapeLayer.presentation() else {
            return
        }
        timeLeftShapeLayer.strokeEnd = presentationLayer.strokeEnd
        timeLeftShapeLayer.removeAnimation(forKey: animationKey)
    }
    
    private func resume() {
        drawCurveStrokeEnd.fromValue = 1 - timeLeft / totalTime
        drawCurveStrokeEnd.toValue = 1
        drawCurveStrokeEnd.duration = timeLeft
        timeLeftShapeLayer.add(drawCurveStrokeEnd, forKey: animationKey)
    }
    
    private func stop() {
        timeLeftShapeLayer.strokeEnd = 1
    }
    
    @IBAction func reset() {
        isPause = true
        timer.invalidate()
        timeLeftShapeLayer.isHidden = true
        timeLeftShapeLayer.removeAnimation(forKey: animationKey)
        
        timeLeft = totalTime
        timeLabel.text = timeLeft.time
        
    }
    
}

extension TimeInterval {
    var time: String {
        return String(format:"%02d:%02d", Int(self/60),  Int(ceil(truncatingRemainder(dividingBy: 60))) )
    }
}

extension Int {
    var degreesToRadians : CGFloat {
        return CGFloat(self) * .pi / 180
    }
}
