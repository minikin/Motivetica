//
//  QuotesListViewController.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 10/22/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit

final class QuotesListViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet private weak var currentTimeLabel: UILabel!
  @IBOutlet private weak var currentDayLabel: UILabel!
  @IBOutlet private weak var backgroundView: UIView!
  @IBOutlet private weak var quotesCollectionView: UICollectionView!
  @IBOutlet private weak var backButton: UIButton!
  @IBOutlet private weak var saveButton: UIButton!
  @IBOutlet private weak var changeThemeButton: UIButton!
  // MARK: - Properties
  private var timer: Timer?
  private let clock = Clock()
  var quotes = [QuoteResponse]()
  private var quotesDataSourse = ItemsDataSource(items: [QuoteResponse](),
                                                 cellDescriptor: { $0.cellDescriptor })
  
  // MARK: - ViewController LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    currentDayLabel.text = clock.currentDayOfTheWeek
    currentTimeLabel.text = clock.currentTime
    
    quotesCollectionView.dataSource = quotesDataSourse
    quotesCollectionView.delegate = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    applyThemeToViewController()
    timer =  Timer.scheduledTimer(withTimeInterval: 1.0,
                                  repeats: true,
                                  block: { [weak self] _ in

        self?.currentDayLabel.text = self?.clock.currentDayOfTheWeek
        self?.currentTimeLabel.text = self?.clock.currentTime
    })
    setupDataForCollectionView()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    timer?.invalidate()
    timer = nil
  }
  
  private func setupDataForCollectionView() {
    quotesDataSourse.items = quotes.shuffled()
    quotesCollectionView.dataSource = quotesDataSourse
    quotesCollectionView.reloadData()
  }
  
  // MARK: - Actions
  @IBAction func saveQuoteToPhotos(_ sender: UIButton) {
    guard let combinedView = combineViews(),
      let imageToSave = imageWithView(inView: combinedView) else {
      return
    }
    UIImageWriteToSavedPhotosAlbum(imageToSave,
                                   self,
                                   #selector(didSaveQuoteAsImageToPhotos(_:error:contextInfo:)),
                                   nil)
  }
  
  @IBAction func chnageAppTheme(_ sender: UIButton) {
    if Theme.current.rawValue == 0 {
      Theme.dark.apply()
      applyThemeToViewController()
    } else {
      Theme.light.apply()
      applyThemeToViewController()
    }
  }

  // MARK: - Helpers
  private func combineViews() -> UIView? {
    guard let mainView = backgroundView else {
        return nil
    }
    return mainView
  }
  
  private func getCurrentContext() -> CGContext {
    guard let context = UIGraphicsGetCurrentContext() else {
      fatalError("Can't get context")
    }
    return context
  }
  
  private func imageWithView(inView: UIView) -> UIImage? {
    UIGraphicsBeginImageContextWithOptions(inView.bounds.size, inView.isOpaque, 0.0)
    inView.layer.render(in: getCurrentContext())
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }
  
  @objc private func didSaveQuoteAsImageToPhotos(_ image: UIImage,
                                                 error: NSError?,
                                                 contextInfo: UnsafeRawPointer) {
    if error != nil {
      let alert = MotiveticaAlertViewController(title: "OOPS",
                                                message: "SOMETHING WENT WRONG",
                                                backgroundColor: Theme.current.mainColor,
                                                textColor: Theme.current.globalTintColor)
      present(alert, animated: true)
    } else {
      let alert = MotiveticaAlertViewController(title: "SUCCESS",
                                                message: "IMAGE SAVED TO PHOTOS",
                                                backgroundColor: Theme.current.mainColor,
                                                textColor: Theme.current.globalTintColor)
      present(alert, animated: true)
    }
  }

  private func applyThemeToViewController() {
    backgroundView.backgroundColor = Theme.current.mainColor
    quotesCollectionView.backgroundColor = Theme.current.mainColor
    changeThemeButton.imageView?.tintColor = Theme.current.globalTintColor
    backButton.setTitleColor(Theme.current.globalTintColor, for: .normal)
    saveButton.setTitleColor(Theme.current.globalTintColor, for: .normal)
  }
}

extension QuotesListViewController: UICollectionViewDelegate {
  
}
