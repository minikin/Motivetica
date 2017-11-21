//
//  FontType.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 21.11.17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit

enum FontType {
  case xl, l, m, s
  
  func setFont() -> UIFont {
    switch self {
    case .xl:
      return UIFont(name: "HelveticaNeue-Thin", size: 72)!
    case .l:
      return UIFont(name: "HelveticaNeue-Light", size: 54)!
    case .m:
      return UIFont(name: "HelveticaNeue", size: 36)!
    case .s:
      return UIFont(name: "HelveticaNeue-Bold", size: 18)!
    }
  }
  
}
