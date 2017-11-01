//
//  AboutViewController.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 10/22/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit

final class AboutViewController: UIViewController {
  
  // MARK: - IBOutlets
  @IBOutlet var backgroundView: UIView!
  @IBOutlet weak var motiveticaLogo: UIImageView!
  @IBOutlet weak var spiilkaButton: UIButton!
  @IBOutlet weak var minikinButton: UIButton!
  @IBOutlet weak var closeButton: UIButton!
  @IBOutlet weak var rightsLabel: UILabel!
  @IBOutlet weak var copyLabel: UILabel!
  @IBOutlet weak var yearLabel: UILabel!
  
  // MARK: - View LifecycleWebPages
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    applyThemeToViewController()
  }
  
  // MARK: - Actions
  @IBAction func spiilkaDitPressed(_ sender: UIButton) {
      guard let spiilkaURL = URL(string: WebPages.spiilka) else { return }
      UIApplication.shared.open(spiilkaURL, options: [:], completionHandler: nil)
  }
  
  @IBAction func minikinDidPressed(_ sender: UIButton) {
      guard let minikinURL = URL(string: WebPages.minikin) else { return }
      UIApplication.shared.open(minikinURL, options: [:], completionHandler: nil)
  }
  
  // MARK: - Helpers
  func applyThemeToViewController() {
    backgroundView.backgroundColor = Theme.current.mainColor
    motiveticaLogo.tintColor = Theme.current.globalTintColor
    rightsLabel.textColor = Theme.current.globalTintColor
    copyLabel.textColor = Theme.current.globalTintColor
    yearLabel.textColor = Theme.current.globalTintColor
    closeButton.imageView?.tintColor = Theme.current.globalTintColor
    
    spiilkaButton.setTitleColor(Theme.current.globalTintColor, for: .normal)
    minikinButton.setTitleColor(Theme.current.globalTintColor, for: .normal)
  }
}
