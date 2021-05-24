//
//  PHUDTextView.swift
//  Partner
//
//  Created by 唐仕米 on 2018/9/28.
//  Copyright © 2018 UOKO. All rights reserved.
//

import UIKit
import SwifterSwift

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
        
        titleLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
        
        let width = titleLabel.systemLayoutSizeFitting(UIScreen.main.bounds.size).width
        titleLabel.frame = CGRect(x: 0, y: 0, width: width, height: 0)
        let height = requiredHeight()
        self.frame = CGRect(origin: .zero, size: CGSize(width: width + 20, height: height + 20))
    }
    
    func requiredHeight() -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: titleLabel.frame.width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        label.textColor = UIColor.white
        label.preferredMaxLayoutWidth = UIScreen.width - 80
        label.numberOfLines = 0
        return label
    }()
    
}
