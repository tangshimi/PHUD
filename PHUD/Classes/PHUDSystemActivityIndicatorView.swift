//
//  PHUDSystemActivityIndicatorView.swift
//  Partner
//
//  Created by 唐仕米 on 2018/9/28.
//  Copyright © 2018. All rights reserved.
//

import UIKit
import PKHUD

public class PHUDSystemActivityIndicatorView: PHUDSquareBaseView, PKHUDAnimating {

    public init() {
        super.init(frame: PHUDSquareBaseView.defaultSquareBaseViewFrame)
        commonInit()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit () {
        backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        self.addSubview(activityIndicatorView)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        activityIndicatorView.center = self.center
    }
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .whiteLarge)
        activity.hidesWhenStopped = false
        return activity
    }()
    
    public func startAnimation() {
        activityIndicatorView.startAnimating()
    }
    
    public func stopAnimation() {
        activityIndicatorView.stopAnimating()
    }
}
