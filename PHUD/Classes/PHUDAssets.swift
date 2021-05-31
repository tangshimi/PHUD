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
            return image
        } else if
            let subBundleUrl = primaryBundle.url(forResource: "PHUDResources", withExtension: "bundle"),
            let subBundle = Bundle(url: subBundleUrl),
            let image = UIImage(named: name, in: subBundle, compatibleWith: nil)
        {
            return image
        }

        return UIImage()
    }

}
