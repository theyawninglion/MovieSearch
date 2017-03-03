//
//  TimerViewController.swift
//  NapTime
//
//  Created by Taylor Phillips on 2/7/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit
import UserNotifications

class TimerViewController: UIViewController, TimerDelegate {
    
    fileprivate let localNotificationTag = "timerNotification"
    
    @IBOutlet weak var timerButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    let timer  = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
        timer.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        resetTimer()
    }
    
    // timerDelegate
    
    func timerDidTick() {
        updateTimerLabel()
    }
    
    func timerDidComplete() {
        updateViews()
        presentTimerUpAlertController()
        timer.timeRemaining = nil
    }
    
    func timerDidStop() {
        updateViews()
        cancelLocalNotification()
    }
    @IBAction func startButtonTapped(_ sender: Any) {
        if timer.isOn {
            timer.stopTimer()
            cancelLocalNotification()
        }
        updateViews()
    }
    
    // Helper functions
    private func updateTimerLabel() {
        timerLabel.text = timer.timeAsString
    }
    
    private func updateViews() {
        updateTimerLabel()
        let title = timer.isOn ? "Cancel" : "Start Nap"
        timerButton.setTitle(title, for: .normal)
    }
    
    private func resetTimer() {
        UNUserNotificationCenter.current().getPendingNotificationRequests { (requests) in
            let timerLocalNotifications = requests.filter { $0.identifier == self.localNotificationTag }
            guard let timerNotificationRequest = timerLocalNotifications.last,
                let trigger = timerNotificationRequest.trigger as? UNCalendarNotificationTrigger,
                let fireDate = trigger.nextTriggerDate() else { return }
            self.timer.stopTimer()
            self.timer.startTimer(fireDate.timeIntervalSinceNow)
        }
    }
    // Mark: userNotifications
    
    func scheduleLocalNotification() {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Wake Up!"
        notificationContent.body = "Get up ya bum!"
        
        guard let timeRemaining = timer.timeRemaining else { return }
        let fireDate = Date(timeInterval: timeRemaining, since: Date())
        let dateComponents = Calendar.current.dateComponents ([.minute, .second], from: fireDate)
        let dateTrigger = UNNotificationRequest(identifier: localNotificationTag, content: notificationContent, trigger: dateTrigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Unable to add notification request.\n\(error.localizedDescription)")
            }
    }
    func cancelLocalNotification() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [localNotificationTag])
    }
        func presentTimerUpAlertCotroller() {
            let alertController = UIAlertController(title: "Wake up!", message: "Get out of Bed!", preferredStyle: .alert)
            alertController.addTextField { (textField) in
                textField.placeholder = "Snooze?"
                textField.keyboardType = .numberPad
                
            }
            
            let dismissAction = UIAlertAction(title: "Dismiss", style: .default) { (_) in
                self.updateViews()
            }
            let snoozeAction = UIAlertAction(title: "Snooze", style: .destructive) { (_) in
                guard let textFields = alertController.textFields,
                let snoozeTextFields = textFields.first,
                let snoozeTimeString = snoozeTextFields.text, !snoozeTimeString.isEmpty,
                    let snoozeTime = TimeInterval(snoozeTimeString) else { return }
                self.timer.startTimer(snoozeTime)
                self.scheduleLocalNotification()
                self.updateViews()
            }
            alertController.addAction(dismissAction)
            alertController.addAction(snoozeAction)
            
            present(alertController, animated: true, completion: nil)
        }
        
}






























