//
//  QuotesListViewController.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 10/22/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit

class QuotesListViewController: UIViewController {
  
  // MARK: - IBOutlets
  @IBOutlet weak var currentTimeLabel: UILabel!
  @IBOutlet weak var currentDayLabel: UILabel!
  @IBOutlet var backgroundView: UIView!
  @IBOutlet weak var quotesCollectionView: UICollectionView!
  @IBOutlet weak var backButton: UIButton!
  @IBOutlet weak var saveButton: UIButton!
  @IBOutlet weak var changeThemeButton: UIButton!
  
  // MARK: - Properties
  let calendar = Calendar.current
  let dateFormatter = DateFormatter()
  var timer: Timer?
  
  // MARK: - ViewController LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setCurrentTime()
    setCurrentDayOfTheWeek()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    applyThemeToViewController()
    timer =  Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] _ in
      self?.setCurrentTime()
      self?.setCurrentDayOfTheWeek()
    })
  }
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    timer?.invalidate()
    timer = nil
  }
  
  // MARK: - Actions
  
  @IBAction func saveQuoteToPhotos(_ sender: UIButton) {
    
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
  func setCurrentTime() {
    let hour = calendar.component(.hour, from: Date())
    let minutes = calendar.component(.minute, from: Date())
    currentTimeLabel.text = String(format: "%0d:%02d", arguments: [hour, minutes])
  }
  
  func setCurrentDayOfTheWeek() {
    dateFormatter.dateFormat = "EEEE, MMMM d"
    currentDayLabel.text  =  dateFormatter.string(from: Date())
  }
  
  func applyThemeToViewController() {
    backgroundView.backgroundColor = Theme.current.mainColor
    quotesCollectionView.backgroundColor = Theme.current.mainColor
    changeThemeButton.imageView?.tintColor = Theme.current.globalTintColor
    
    backButton.setTitleColor(Theme.current.globalTintColor, for: .normal)
    saveButton.setTitleColor(Theme.current.globalTintColor, for: .normal)
  }
}
