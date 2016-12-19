//
//  ViewController.swift
//  NewNotifications
//
//  Created by Marc Cruz on 12/19/16.
//  Copyright © 2016 MarcBits. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1. Request Permission
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { (granted, error) in
            
            if granted {
                
                print("Notifications access granted")
            } else {
                
                print(error?.localizedDescription as Any)
            }
        })

    }

    @IBAction func notifyButtonTapped(_ sender: UIButton) {
        
    }
    
    func scheduleNotification(inSeconds: TimeInterval, completion: @escaping (_ Success: Bool) -> ()) {
        
        let notif = UNMutableNotificationContent()
        
        notif.title = "New Notification"
        notif.subtitle = "These are great!"
        notif.body = "The new notification options in iOS 10 are what I've always dreamed of!"
        
        let notifTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        
        let request = UNNotificationRequest(identifier: "myNotification", content: notif, trigger: notifTrigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            
            if error != nil {
                
                print(error as Any)
                completion(false)
            } else {
                
                completion(true)
            }
        })
        
    }
    
}

