//
//  QuotesListViewController.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 10/22/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit

final class QuotesListViewController: UIViewController {
  
  // MARK: - IBOutlets
  @IBOutlet weak var currentTimeLabel: UILabel!
  @IBOutlet weak var currentDayLabel: UILabel!
  @IBOutlet var backgroundView: UIView!
  @IBOutlet weak var quotesCollectionView: UICollectionView!
  @IBOutlet weak var backButton: UIButton!
  @IBOutlet weak var saveButton: UIButton!
  @IBOutlet weak var changeThemeButton: UIButton!
  
  // MARK: - Properties
  private let calendar = Calendar.current
  private let dateFormatter = DateFormatter()
  private var timer: Timer?
  
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
    let imageToSave = #imageLiteral(resourceName: "Oval")
    UIImageWriteToSavedPhotosAlbum(imageToSave, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
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
  @objc private func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
    if let error = error {
      let ac = UIAlertController(title: "Save error",
                                 message: error.localizedDescription,
                                 preferredStyle: .alert)
      ac.addAction(UIAlertAction(title: "OK", style: .default))
      present(ac, animated: true)
    } else {
      let ac = UIAlertController(title: "Saved!",
                                 message: "Your altered image has been saved to your photos.",
                                 preferredStyle: .alert)
      ac.addAction(UIAlertAction(title: "OK", style: .default))
      present(ac, animated: true)
    }
  }
  
  private func setCurrentTime() {
    let hour = calendar.component(.hour, from: Date())
    let minutes = calendar.component(.minute, from: Date())
    currentTimeLabel.text = String(format: "%0d:%02d", arguments: [hour, minutes])
  }
  
  private func setCurrentDayOfTheWeek() {
    dateFormatter.dateFormat = "EEEE, MMMM d"
    currentDayLabel.text  =  dateFormatter.string(from: Date())
  }
  
  private func applyThemeToViewController() {
    backgroundView.backgroundColor = Theme.current.mainColor
    quotesCollectionView.backgroundColor = Theme.current.mainColor
    changeThemeButton.imageView?.tintColor = Theme.current.globalTintColor
    
    backButton.setTitleColor(Theme.current.globalTintColor, for: .normal)
    saveButton.setTitleColor(Theme.current.globalTintColor, for: .normal)
  }
}
