//
//  ViewController.swift
//  TestKVO
//
//  Created by Yoshizumi Ashikawa on 2016/02/05.
//  Copyright © 2016年 Yoshizumi Ashikawa. All rights reserved.
//

import UIKit

class ViewController: SecColorChangeViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    label.text = "FirstView"
    transBtn.setTitle("View2", forState: UIControlState.Normal)
  }

  override func transBtnClickHandler(){
    let nextView = SecondViewController()
    self.presentViewController(nextView, animated: true, completion: nil)
  }
}

