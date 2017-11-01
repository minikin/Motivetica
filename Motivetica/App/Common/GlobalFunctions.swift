//
//  GlobalFunctions.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 10/31/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import Foundation

@discardableResult
func getLanguageISO() -> String {
  let locale = Locale.current
  guard let languageCode = locale.languageCode,
    let regionCode = locale.regionCode else {
      return "de_DE"
  }
  return languageCode + "_" + regionCode
}
