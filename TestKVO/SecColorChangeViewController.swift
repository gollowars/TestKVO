//
//  SecColorChangeViewController.swift
//  TestKVO
//
//  Created by Yoshizumi Ashikawa on 2016/02/05.
//  Copyright © 2016年 Yoshizumi Ashikawa. All rights reserved.
//

import UIKit

class SecColorChangeViewController: UIViewController {
  var label:UILabel!
  var transBtn: UIButton!
  let dateModelInstance = DateModel.sharedInstance


  override func viewDidLoad() {
    super.viewDidLoad()


    label = UILabel(frame: CGRectMake(0,0,300,50))
    label.center = view.center
    label.text = "FirstView"
    label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 55)
    label.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    label.textAlignment = NSTextAlignment.Center
    view.addSubview(label)



    // button
    transBtn = UIButton()
    transBtn.frame = CGRectMake(0,0,100,50)
    transBtn.setTitle("View", forState: UIControlState.Normal)
    transBtn.center = CGPointMake(view.center.x, view.center.y + 100)
    transBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    transBtn.backgroundColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 1.0)
    transBtn.addTarget(self, action: "transBtnClickHandler", forControlEvents: .TouchUpInside)
    view.addSubview(transBtn)



    dateModelInstance.startObserve()
    view.backgroundColor = dateModelInstance.notifiColor
    //NSNotification登録
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "colorUpdate:", name: "timeColor", object: nil)

  }

  func transBtnClickHandler(){
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    dateModelInstance.endObserve()

  }

  func colorUpdate(notification: NSNotification)  {
    if let userInfo = notification.userInfo {
    		let backgroundColor:UIColor = userInfo["timeColor_info"]! as! UIColor
      view.backgroundColor = backgroundColor
    }
  }
  
  
}