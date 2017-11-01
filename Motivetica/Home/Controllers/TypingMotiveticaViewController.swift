//
//  TypingMotiveticaViewController.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 10/22/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit
import Lottie

class TypingMotiveticaViewController: UIViewController {
  
  // MARK: - Properties
  var coreDataStack: CoreDataStack!

  // MARK: - ViewController LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(false)
    mottiveticaLodingAnimation()
  }
  
  // MARK: - Helpers
  func mottiveticaLodingAnimation() {
    let animationView = LOTAnimationView(name: "Intro")
    animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
    animationView.center = self.view.center
    animationView.contentMode = .scaleAspectFill
    view.addSubview(animationView)
    animationView.play { _ in
       self.navigateToHomeVC()
    }
  }

  // MARK: - Navigation
  func navigateToHomeVC() {
    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200)) {
      self.performSegue(withIdentifier: "toHomeFormStart", sender: self)
    }
  }
}
