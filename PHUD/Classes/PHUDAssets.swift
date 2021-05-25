//
//  PHUDAssets.swift
//  PHUD
//
//  Created by Vickey on 2021/5/24.
//

import Foundation

open class PHUDAssets {
    open class var successImage: UIImage { return PHUDAssets.bundledImage(named: "hud_success") }
    open class var failImage: UIImage { return PHUDAssets.bundledImage(named: "hud_fail") }

    internal class func bundledImage(named name: String) -> UIImage {
        let primaryBundle = Bundle(for: PHUDAssets.self)
        if let image = UIImage(named: name, in: primaryBundle, compatibleWith: nil) {
            // Load image in cases where PHUD is directly integrated
            return image
        } else if
            let subBundleUrl = primaryBundle.url(forResource: "PHUDAssets", withExtension: "bundle"),
            let subBundle = Bundle(url: subBundleUrl),
            let image = UIImage(named: name, in: subBundle, compatibleWith: nil)
        {
            // Load image in cases where PKHUD is integrated via cocoapods as a dynamic or static framework with a separate resource bundle
            return image
        }

        return UIImage()
    }

}
