//
//  LoadingView.swift
//  scann-ios
//
//  Created by George Zhuang on 8/2/20.
//  Copyright © 2020 Scann. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    private let loadingLabel = UILabel()
    
    let ovalLayer = OvalLayer()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        loadingLabel.textColor = .white
        loadingLabel.text = "loading..."
        loadingLabel.font = ._20MontserratBold
        loadingLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(loadingLabel)
        
        isHidden = true
        
        setupConstraints()
    }
    
    func setupConstraints() {
        loadingLabel.snp.makeConstraints { make in
            make.centerX.equalTo(ovalLayer.frameCenter.x)
            make.centerY.equalTo(ovalLayer.frameCenter.y)
        }
    }
    
    func addOval() {
        layer.addSublayer(ovalLayer)
        ovalLayer.expand()
        self.bringSubviewToFront(loadingLabel)
    }
    
    @objc func wobbleOval() {
        ovalLayer.wobble()
    }
    
    func startAnimation() {
        CATransaction.begin()
        CATransaction.setCompletionBlock({
            UIView.transition(with: self, duration: 0.4,
                              options: .transitionCrossDissolve,
                              animations: {
                                self.isHidden = true
            })
        })
        
        addOval()
        UIView.transition(with: self, duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.isHidden = false
        })
        wobbleOval()
        
        CATransaction.commit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class OvalLayer: CAShapeLayer {
    
    let animationDuration: CFTimeInterval = 0.3
    let frameCenter: CGPoint = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY - 64)
    
    var expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
    var wobbleAnimation1: CABasicAnimation = CABasicAnimation(keyPath: "path")
    var wobbleAnimation2: CABasicAnimation = CABasicAnimation(keyPath: "path")
    var wobbleAnimation3: CABasicAnimation = CABasicAnimation(keyPath: "path")
    var wobbleAnimation4: CABasicAnimation = CABasicAnimation(keyPath: "path")
    var wobbleAnimationGroup: CAAnimationGroup = CAAnimationGroup()
    
    override init() {
        super.init()
        fillColor = UIColor(rgb: 0xFF5D37).cgColor
        path = ovalPathSmall.cgPath
    }
    
    var ovalPathSmall: UIBezierPath {
        var rect = CGRect(x: 50.0, y: 50.0, width: 0.0, height: 0.0)
        rect.center = frameCenter
        print(frameCenter)
        return UIBezierPath(ovalIn: rect)
    }
    
    var ovalPathLarge: UIBezierPath {
        var rect = CGRect(x: 2.5, y: 17.5, width: 200, height: 200)
        rect.center = frameCenter
        return UIBezierPath(ovalIn: rect)
    }
    
    var ovalPathSquishVertical: UIBezierPath {
        var rect = CGRect(x: 2.5, y: 20.0, width: 200, height: 195)
        rect.center = frameCenter
        return UIBezierPath(ovalIn: rect)
    }
    
    var ovalPathSquishHorizontal: UIBezierPath {
        var rect = CGRect(x: 5.0, y: 20.0, width: 195, height: 200)
        rect.center = frameCenter
        return UIBezierPath(ovalIn: rect)
    }
    
    func expand() {
        expandAnimation.fromValue = ovalPathSmall.cgPath
        expandAnimation.toValue = ovalPathLarge.cgPath
        expandAnimation.duration = animationDuration
        expandAnimation.fillMode = CAMediaTimingFillMode.forwards
        expandAnimation.isRemovedOnCompletion = false
        add(expandAnimation, forKey: nil)
    }
    
    func wobble() {
        // 1
        wobbleAnimation1.fromValue = ovalPathLarge.cgPath
        wobbleAnimation1.toValue = ovalPathSquishVertical.cgPath
        wobbleAnimation1.beginTime = 0.0
        wobbleAnimation1.duration = animationDuration
        
        // 2
        wobbleAnimation2.fromValue = ovalPathSquishVertical.cgPath
        wobbleAnimation2.toValue = ovalPathSquishHorizontal.cgPath
        wobbleAnimation2.beginTime = wobbleAnimation1.beginTime + wobbleAnimation1.duration
        wobbleAnimation2.duration = animationDuration
        
        // 3
        wobbleAnimation3.fromValue = ovalPathSquishHorizontal.cgPath
        wobbleAnimation3.toValue = ovalPathSquishVertical.cgPath
        wobbleAnimation3.beginTime = wobbleAnimation2.beginTime + wobbleAnimation2.duration
        wobbleAnimation3.duration = animationDuration
        
        // 4
        wobbleAnimation4.fromValue = ovalPathSquishVertical.cgPath
        wobbleAnimation4.toValue = ovalPathLarge.cgPath
        wobbleAnimation4.beginTime = wobbleAnimation3.beginTime + wobbleAnimation3.duration
        wobbleAnimation4.duration = animationDuration
        
        // 5
        wobbleAnimationGroup.animations = [wobbleAnimation1, wobbleAnimation2, wobbleAnimation3,
                                           wobbleAnimation4]
        wobbleAnimationGroup.duration = wobbleAnimation4.beginTime + wobbleAnimation4.duration
        wobbleAnimationGroup.repeatCount = 5
        wobbleAnimationGroup.isRemovedOnCompletion = true
        add(wobbleAnimationGroup, forKey: "load")
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
