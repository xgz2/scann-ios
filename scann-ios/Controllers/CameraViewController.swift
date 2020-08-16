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
        
        view.backgroundColor = .white
        
        cameraContainer.layer.cornerRadius = 20
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
        
        view.addSubview(loadingView)
        
        setupNavigationItems()
        setupConstraints()
    }
    
    func setupNavigationItems() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let titleImageView = UIImageView(image: UIImage(named: "scannerLogo"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 150, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImageView
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
            let alert = UIAlertController(title: "Success!", message: "New items have been added to your pantry.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        })
        loadingView.startAnimation()
        CATransaction.commit()
    }
    
    func setupConstraints() {
        let cameraBottomOffset = -120
        let cameraTopOffset = 20
        let captureButttonBottomOffset = -30
        
        captureButton.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().offset(captureButttonBottomOffset)
            make.size.equalTo(captureButtonSize)
            make.centerX.equalToSuperview()
        }
        
        cameraContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(cameraTopOffset)
            make.bottom.equalToSuperview().offset(cameraBottomOffset)
            make.left.right.equalToSuperview()
        }
        
//        completedView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }

        loadingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
