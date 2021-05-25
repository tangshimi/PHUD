//
//  PHUDSquareBaseView.swift
//  Partner
//
//  Created by 唐仕米 on 2018/9/28.
//  Copyright © 2018. All rights reserved.
//

import UIKit
import PKHUD

public class PHUDSquareBaseView: UIView {

    static let defaultSquareBaseViewFrame = CGRect(origin: CGPoint.zero, size: CGSize(width: 90.0, height: 90.0))
    static let imageHeight:CGFloat = 40.0
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public init(image: UIImage? = nil, title: String? = nil) {
        super.init(frame: PHUDSquareBaseView.defaultSquareBaseViewFrame)
                
        self.imageView.image = image
        titleLabel.text = title
        
        addSubview(imageView)
        addSubview(titleLabel)
        
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 55).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    public let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textColor = UIColor.white
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.25
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

}
