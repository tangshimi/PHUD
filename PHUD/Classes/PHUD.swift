//
//  PHUD.swift
//  Partner
//
//  Created by 唐仕米 on 2018/9/28.
//  Copyright © 2018 UOKO. All rights reserved.
//

import Foundation
import PKHUD
import UIKit

public enum PHUDContentType {
    case labeledSuccess(title: String?)
    case labeledError(title: String?)
    case label(String?)
    case systemActivity
    case customLoading
}

public final class PHUD {
    
    // MARK: Properties
    public static var dimsBackground: Bool {
        get { return PKHUD.sharedHUD.dimsBackground }
        set { PKHUD.sharedHUD.dimsBackground = newValue }
    }
    
    public static var allowsInteraction: Bool {
        get { return PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled  }
        set { PKHUD.sharedHUD.userInteractionOnUnderlyingViewsEnabled = newValue }
    }
    
    public static var isVisible: Bool { return PKHUD.sharedHUD.isVisible }
    
    // MARK: Public methods, PKHUD based
    public static func show(_ content: PHUDContentType, onView view: UIView? = nil) {
        PKHUD.sharedHUD.contentView = contentView(content)
        PKHUD.sharedHUD.show(onView: view)
    }
    
    public static func hide(_ completion: ((Bool) -> Void)? = nil) {
        PKHUD.sharedHUD.hide(animated: false, completion: completion)
    }
    
    public static func hide(animated: Bool, completion: ((Bool) -> Void)? = nil) {
        PKHUD.sharedHUD.hide(animated: animated, completion: completion)
    }
    
    public static func hide(afterDelay delay: TimeInterval, completion: ((Bool) -> Void)? = nil) {
        PKHUD.sharedHUD.hide(afterDelay: delay, completion: completion)
    }
    
    // MARK: Public methods, HUD based
    public static func flash(_ content: PHUDContentType, onView view: UIView? = nil) {
        PHUD.show(content, onView: view)
        PHUD.hide(animated: true, completion: nil)
    }
    
    public static func flash(_ content: PHUDContentType, onView view: UIView? = nil, delay: TimeInterval, completion: ((Bool) -> Void)? = nil) {
        PHUD.show(content, onView: view)
        PHUD.hide(afterDelay: delay, completion: completion)
    }
    
    // MARK: Private methods
    fileprivate static func contentView(_ content: PHUDContentType) -> UIView {
        switch content {
        case let .labeledSuccess(title):
            return PHUDSquareBaseView(image: UIImage(named: "hud_success"), title: title)
        case let .labeledError(title):
            return PHUDSquareBaseView(image: UIImage(named: "hud_fail"), title: title)
        case let .label(text):
            return PHUDTextView(text: text)
        case .systemActivity:
            return PHUDSystemActivityIndicatorView()
        case .customLoading:
            return PHUDSystemActivityIndicatorView()
        }
    }
}


extension PKHUD {

    public convenience init(viewToPresentOn view: UIView? = nil, content: PHUDContentType) {
        self.init()
        viewToPresentOn = view
        self.contentView = PHUD.contentView(content)
        self.effect = UIBlurEffect(style: .dark)
        self.dimsBackground = false
        self.userInteractionOnUnderlyingViewsEnabled = true
    }

}
