//
//  CameraViewController.swift
//  scann-ios
//
//  Created by George Zhuang on 7/23/20.
//  Copyright © 2020 Scann. All rights reserved.
//

/* This is currently a placeholder for an actual scanning interface. */
import CameraManager
import UIKit

class CameraViewController: UIViewController {
    
    private let cameraManager = CameraManager()
    private let captureButton = UIButton()
    private let captureButtonSize = CGFloat(85)
    private let cameraContainer = UIView()
//    private let completedView = UIView()
    private let loadingView = LoadingView()
    
    private var myImage : UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(cameraContainer)
        
        cameraManager.cameraDevice = .back
        cameraManager.shouldEnableTapToFocus = true
        cameraManager.shouldEnablePinchToZoom = true
        cameraManager.shouldEnableExposure = false
        cameraManager.flashMode = .off
        cameraManager.cameraOutputMode = .stillImage
        cameraManager.cameraOutputQuality = .high
        cameraManager.focusMode = .continuousAutoFocus
        cameraManager.exposureMode = .continuousAutoExposure
        cameraManager.shouldUseLocationServices = false
        cameraManager.writeFilesToPhoneLibrary = false
        cameraManager.addPreviewLayerToView(cameraContainer)
                
        captureButton.layer.cornerRadius = captureButtonSize / 2.0
        captureButton.backgroundColor = UIColor(red: 0.839, green: 0.839, blue: 0.839, alpha: 1.0)
        captureButton.layer.borderColor = UIColor.white.cgColor
        captureButton.layer.borderWidth = 7
        captureButton.layer.shadowColor = UIColor.black.cgColor
        captureButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        captureButton.layer.shadowRadius = 5
        captureButton.layer.shadowOpacity = 0.5
        captureButton.addTarget(self, action: #selector(capturePhoto), for: .touchUpInside)
        captureButton.translatesAutoresizingMaskIntoConstraints = false
        captureButton.layer.zPosition = 10
        cameraContainer.addSubview(captureButton)
        
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        
        view.addSubview(loadingView)
        
//        setupCompletedView()
        
        setupConstraints()
    }
    
//    func setupCompletedView() {
//        completedView.backgroundColor = .white
//        self.view.addSubview(completedView)
//        self.view.sendSubviewToBack(completedView)
//        completedView.isHidden = true
//
//        let completedLabel = UILabel()
//        completedLabel.text = "Yay! Your new items are added."
//        completedLabel.numberOfLines = 0
//        completedLabel.font = ._18MontserratRegular
//        completedView.addSubview(completedLabel)
//
//        completedLabel.snp.makeConstraints { make in
//            make.centerX.centerY.equalToSuperview()
//        }
//    }
    
    @objc func capturePhoto() {
        self.cameraManager.capturePictureWithCompletion({ result in
            switch result {
                case .failure:
                    print("FAIL")
                case .success(let content):
                    self.myImage = content.asImage;
            }
        })
        CATransaction.begin()
        CATransaction.setCompletionBlock({
            
        })
        loadingView.startAnimation()
        CATransaction.commit()
    }
    
    func setupConstraints() {
        let captureButttonBottomOffset = -110
        
        captureButton.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().offset(captureButttonBottomOffset)
            make.size.equalTo(captureButtonSize)
            make.centerX.equalToSuperview()
        }
        
        cameraContainer.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
//        completedView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }

        loadingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
