//
//  PHUDTextView.swift
//  Partner
//
//  Created by 唐仕米 on 2018/9/28.
//  Copyright © 2018 UOKO. All rights reserved.
//

import UIKit

public class PHUDTextView: UIView {
    public init(text: String?) {
        super.init(frame: .zero)
        commonInit(text)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit("")
    }
    
    func commonInit(_ text: String?) {
        backgroundColor = UIColor.black.withAlphaComponent(0.8)
        titleLabel.text = text
        addSubview(titleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true

        let width = titleLabel.systemLayoutSizeFitting(UIScreen.main.bounds.size).width
        titleLabel.frame = CGRect(x: 0, y: 0, width: width, height: 0)
        let height = requiredHeight()
        self.frame = CGRect(origin: .zero, size: CGSize(width: width + 20, height: height + 20))
    }
    
    func requiredHeight() -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: titleLabel.frame.width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = titleLabel.font
        label.text = titleLabel.text
        label.sizeToFit()
        return label.frame.height
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        label.textColor = UIColor.white
        label.preferredMaxLayoutWidth = UIScreen.main.bounds.width - 80
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
}
