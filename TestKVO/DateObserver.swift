//
//  DateObserver.swift
//  TestKVO
//
//  Created by Yoshizumi Ashikawa on 2016/02/05.
//  Copyright © 2016年 Yoshizumi Ashikawa. All rights reserved.
//

import Foundation

class DateObserver:NSObject {
	static let sharedInstance = DateObserver()

  var startTime:NSDate?
  dynamic var now:NSDate?


  override init(){
    super.init()

  }

  func startTimer(){
    startTime = NSDate()
    print("DateObserver::startTimer")
    now = NSDate()
		NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "updateTime", userInfo: nil, repeats: true)
  }

  func updateTime(){
		now = NSDate()

  }


}