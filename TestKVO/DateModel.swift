//
//  DateModel.swift
//  TestKVO
//
//  Created by Yoshizumi Ashikawa on 2016/02/05.
//  Copyright © 2016年 Yoshizumi Ashikawa. All rights reserved.
//

import UIKit


class DateModel: NSObject {
	static let sharedInstance = DateModel()
  var observerFlag:Bool = false
  var notifiColor:UIColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

  override init(){
    super.init()

    print("DateModel::init")

    //DateObserver.sharedInstanceのnowを監視対象に
    DateObserver.sharedInstance.addObserver(self, forKeyPath: "now", options: .New, context: nil)
    DateObserver.sharedInstance.startTimer()

  }

  // DateObserver.sharedInstanceのnowに変更があった場合
  override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
    if keyPath == "now" {
      let observer = DateObserver.sharedInstance
      let delta:NSTimeInterval = (observer.now?.timeIntervalSinceDate(observer.startTime!))!
      let value: Int = Int(floor(delta))%5

      if observerFlag {
      	notifyColor(value)
      }

    }
  }

  func startObserve(){
    observerFlag = true
  }

  func endObserve(){
		observerFlag = false
  }

  // 色を通知
  func notifyColor(value: Int){
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    
    switch value {
      case 0:
        red = 0.7
      case 1:
        red = 0.7
        green = 0.7
      case 2:
        green = 0.7
      case 3:
        green = 0.7
        blue = 0.7
      case 4:
        blue = 0.7
      case 5:
        blue = 0.7
        red = 0.7
      default:
        break
    }

    notifiColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    let n : NSNotification = NSNotification(name: "timeColor", object: self, userInfo: ["timeColor_info": notifiColor])
    NSNotificationCenter.defaultCenter().postNotification(n)
  }



}