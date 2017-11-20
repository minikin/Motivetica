//
//  ShuffleArray.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 11/14/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import Foundation

public func random(_ n: Int) -> Int {
  return Int(arc4random_uniform(UInt32(n)))
}

//extension Array {
//  /*
//   Randomly shuffles the array in-place
//   This is the Fisher-Yates algorithm, also known as the Knuth shuffle.
//   Time complexity: O(n)
//   */
//  public mutating func shuffle() {
//    for i in (1...count-1).reversed() {
//      let j = random(i + 1)
//      if i != j {
//        let t = self[i]
//        self[i] = self[j]
//        self[j] = t
//      }
//    }
//  }
//}

extension MutableCollection {
  /// Shuffles the contents of this collection.
  mutating func shuffle() {
    let c = count
    guard c > 1 else { return }
    
    for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
      let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
      let i = index(firstUnshuffled, offsetBy: d)
      swapAt(firstUnshuffled, i)
    }
  }
}

extension Sequence {
  /// Returns an array with the contents of this sequence, shuffled.
  func shuffled() -> [Element] {
    var result = Array(self)
    result.shuffle()
    return result
  }
}
