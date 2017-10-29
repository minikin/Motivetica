//
//  FilesHelper.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 10/22/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import Foundation

/// Helper function to read sevrer ksys from .plist file.
func readKeysFrom(_ plistWithName: String) -> [ String: String] {
  var motiveticaServerKeys = [ "": ""]
  if let url = Bundle.main.url(forResource: plistWithName, withExtension: "plist") {
    do {
      let data = try Data(contentsOf: url)
      motiveticaServerKeys = try PropertyListSerialization.propertyList(from: data,
                                                                        options: [],
                                                                        format: nil) as! [ String: String]
    } catch {
      assertionFailure("Check that your .plist file exist and has a correct format!")
    }
  }
  return motiveticaServerKeys
}
