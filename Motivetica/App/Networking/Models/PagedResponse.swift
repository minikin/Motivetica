//
//  PagedResponse.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 11/12/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import Foundation

struct PagedResponse<T: Codable>: Codable {
  let currentPage: Int
  let numberOfPages: Int
  let totalResults: Int
  let data: [T]
}
