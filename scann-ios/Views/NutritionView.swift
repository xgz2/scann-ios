//
//  NutritionView.swift
//  scann-ios
//
//  Created by George Zhuang on 8/3/20.
//  Copyright © 2020 Scann. All rights reserved.
//

import SnapKit
import UIKit

class NutritionView: UIView {
    
    private let titleLabel = UILabel()
    private let caloriesLabel = UILabel()
    private let caloriesNumber = UILabel()
    private let fatLabel = UILabel()
    private let fatNumber = UILabel()
    private let proteinLabel = UILabel()
    private let proteinNumber = UILabel()
    private let carbsLabel = UILabel()
    private let carbsNumber = UILabel()
    
    var calories: Int?
    var fat: Int?
    var protein: Int?
    var carbs: Int?

    init(calories: Int, fat: Int, protein: Int, carbs: Int) {
        super.init(frame: .zero)
        
        self.calories = calories
        self.fat = fat
        self.protein = protein
        self.carbs = carbs
        
        backgroundColor = .lightGray
        
        setupLabels()
        setupConstraints()
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(superview!.snp.leading)
            make.centerX.equalTo(superview!.snp.centerY)
        }
    }
    
    func setupLabels() {
        let smallColor = UIColor.darkGray
        let smallFont = UIFont._12MontserratRegular
        
        titleLabel.font = ._13MontserratBold
        titleLabel.textColor = UIColor(rgb: 0x11B3E6)
        titleLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        addSubview(titleLabel)
        
        caloriesLabel.font = smallFont
        caloriesLabel.textColor = smallColor
        addSubview(caloriesLabel)
        
        caloriesNumber.font = smallFont
        caloriesNumber.textColor = smallColor
        addSubview(caloriesNumber)
        
        fatLabel.font = smallFont
        fatLabel.textColor = smallColor
        addSubview(fatLabel)
        
        fatNumber.font = smallFont
        fatNumber.textColor = smallColor
        addSubview(fatNumber)
        
        proteinLabel.font = smallFont
        proteinLabel.textColor = smallColor
        addSubview(proteinLabel)
        
        proteinNumber.font = smallFont
        proteinNumber.textColor = smallColor
        addSubview(proteinNumber)
        
        carbsLabel.font = smallFont
        carbsLabel.textColor = smallColor
        addSubview(carbsLabel)
        
        carbsNumber.font = smallFont
        carbsNumber.textColor = smallColor
        addSubview(carbsNumber)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
