//
//  CellDescriptor.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 10/29/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit

struct CellDescriptor {
  let cellClass: UICollectionViewCell.Type
  let reuseIdentifier: String
  let configure: (UICollectionViewCell) -> Void
  init<Cell: UICollectionViewCell>(reuseIdentifier: String, configure: @escaping (Cell) -> Void) {
    self.cellClass = Cell.self
    self.reuseIdentifier = reuseIdentifier
    self.configure = { cell in
      configure(cell as! Cell)
    }
  }
}
