//
//  Result.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 11/12/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import Foundation

enum Result<A> {
  case success(A)
  case error(Error)
}

extension Result {
  public init(_ value: A?, or error: Error) {
    if let value = value {
      self = .success(value)
    } else {
      self = .error(error)
    }
  }
  public var value: A? {
    guard case .success(let v) = self else { return nil }
    return v
  }
}

func logError<A>(_ result: Result<A>) {
  guard case let .error(e) = result else { return }
  assert(false, "\(e)")
}
