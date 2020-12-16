//
//  UIFont+Extension.swift
//  CloneWatchaPedia
//
//  Created by 요한 on 2020/12/16.
//

import UIKit

// MARK: - BoldFont
extension UIFont {
  func withTraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
    let descriptor = fontDescriptor.withSymbolicTraits(traits)
    return UIFont(descriptor: descriptor!, size: 0)
  }
  
  func bold() -> UIFont {
    return withTraits(traits: .traitBold)
  }
  
  func italic() -> UIFont {
    return withTraits(traits: .traitItalic)
  }
}
