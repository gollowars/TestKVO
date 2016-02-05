//
//  SecondViewController.swift
//  TestKVO
//
//  Created by Yoshizumi Ashikawa on 2016/02/05.
//  Copyright © 2016年 Yoshizumi Ashikawa. All rights reserved.
//

import UIKit

class SecondViewController: SecColorChangeViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    label.text = "SecondView"
    transBtn.setTitle("View1", forState: UIControlState.Normal)
  }

  override func transBtnClickHandler(){
    let nextView = ViewController()
    self.presentViewController(nextView, animated: true, completion: nil)
  }
}
