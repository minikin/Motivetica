//
//  HashFunctions.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 11/12/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import Foundation

// http://www.cse.yorku.ca/~oz/hash.html
extension String {
  
  // hash(0) = 5381
  // hash(i) = hash(i - 1) * 33 ^ str[i];
  var djb2hash: Int {
    let unicodeScalars = self.unicodeScalars.map { $0.value }
    return unicodeScalars.reduce(5381) {
      ($0 << 5) &+ $0 &+ Int($1)
    }
  }
  
  // hash(0) = 0
  // hash(i) = hash(i - 1) * 65599 + str[i];
  var sdbmhash: Int {
    let unicodeScalars = self.unicodeScalars.map { $0.value }
    return unicodeScalars.reduce(0) {
      Int($1) &+ ($0 << 6) &+ ($0 << 16) - $0
    }
  }
}
