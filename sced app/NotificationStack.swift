//
//  NotificationStack.swift
//  sced app
//
//  Created by Gabbie on 7/18/18.
//  Copyright © 2018 Gabbie. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationStack: NotificationService {
    
    func scheduleNotificationFor(className: String, startOfClass time: Date, location: String) {
        
        /** 10 mintues from the time given in the function */
        let tenMinutesBeforeClassTime = time - 60*10
        
        let content = UNMutableNotificationContent()
        content.title = className
        let formattedTime = time.convertToString(dateStyle: DateFormatter.Style.none, timeStyle: DateFormatter.Style.short)
        content.body = "⏰: \(formattedTime)\n📍: \(location)"
        content.sound = UNNotificationSound.default()
        
        let identifier = ":/"
        let dateComponent = Calendar.current.dateComponents([.hour, .minute, .second], from: tenMinutesBeforeClassTime)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        self.scheduleNotification(content: content, trigger: trigger, notificationIdentifier: identifier)
    }
    
}
