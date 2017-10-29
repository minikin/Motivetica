//
//  ItemsDataSource.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 10/29/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit

final class ItemsDataSource<Item>: NSObject, UICollectionViewDataSource {
  // MARK: - Properties
  var items: [Item] = []
  let cellDescriptor: (Item) -> CellDescriptor
  var reuseIdentifiers: Set<String> = []
  // MARK: - Initialization
  init(items: [Item], cellDescriptor: @escaping (Item) -> CellDescriptor) {
    self.cellDescriptor = cellDescriptor
    self.items = items
  }
  // MARK: - UICollectionViewDataSource
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let item = items[indexPath.row]
    let descriptor = cellDescriptor(item)
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: descriptor.reuseIdentifier, for: indexPath)
    descriptor.configure(cell)
    return cell
  }
}
