//
//  UILabel+Extension.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 21.11.17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit

extension UILabel {
  
  func setLineHeight(_ lineHeight: CGFloat) {
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = 1.0
    paragraphStyle.lineHeightMultiple = lineHeight
    paragraphStyle.alignment = self.textAlignment
    
    let attrString = NSMutableAttributedString(string: self.text!)
    attrString.addAttribute(NSAttributedStringKey.font,
														value: self.font,
														range: NSMakeRange(0, attrString.length))
    attrString.addAttribute(NSAttributedStringKey.paragraphStyle,
														value: paragraphStyle,
														range: NSMakeRange(0, attrString.length))
    self.attributedText = attrString
  }
  
  func setCharacterSpacing(_ characterSpacing: CGFloat = 0.0) {
    
    guard let labelText = self.text else { return }
    
    let attributedString: NSMutableAttributedString
    if let labelattributedText = self.attributedText {
      attributedString = NSMutableAttributedString(attributedString: labelattributedText)
    } else {
      attributedString = NSMutableAttributedString(string: labelText)
    }
    
    // Character spacing attribute
    attributedString.addAttribute(NSAttributedStringKey.kern,
																	value: characterSpacing,
																	range: NSMakeRange(0, attributedString.length))
    
    self.attributedText = attributedString
  }
  
}
