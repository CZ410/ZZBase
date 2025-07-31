//
//  NotificationCenter+ZZ.swift
//  Pods
//
//  Created by 陈钟 on 2025/7/30.
//

import Foundation

@propertyWrapper
public class ZZNotificationPost<T> {
    public let notificationName: Notification.Name
    public var getUserInfo: ((Notification.Name, T) -> ([AnyHashable: Any]?))?

    public var wrappedValue: T {
        didSet {
            notifyNewValue()
        }
    }
    
    public init(wrappedValue: T, name: String) {
        self.wrappedValue = wrappedValue
        self.notificationName = Notification.Name(name)
    }

    public init(wrappedValue: T, notificationName: Notification.Name) {
        self.wrappedValue = wrappedValue
        self.notificationName = notificationName
    }

    public func notifyNewValue() {
        NotificationCenter.default.post(name: notificationName, object: wrappedValue, userInfo: getUserInfo?(notificationName, wrappedValue) ?? nil)
    }

    public var projectedValue: ZZNotificationPost<T> {
        return self
    }
}

// EX:

//extension Notification.Name {
//    // can also be read as: Notification.Name.init("scoreDidChange")
//    static let scoreDidChange = Self("scoreDidChange")
//}
//
//let vm = DemoViewModel()
//
//func test(){
//    // Prints: Received new score 25, UserInfo: [AnyHashable("userID"): "123"]
//    vm.score = 25
//}
//
//class DemoViewModel {
//    @ZZNotificationPost(name: "")
//    var score: Int = 13
//
//    init() {
//        NotificationCenter.default.addObserver(forName: $score.notificationName, object: self, queue: nil) { _ in
//            
//        }
//        
//        _score.getUserInfo = { _, _ in
//            return ["1" : "2"]
//        }
//        
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(handleNewScore),
//            name: .scoreDidChange,
//            object: nil
//        )
//
//        $score.getUserInfo = { _, _ in
//            ["userID": vm.getUserID()]
//        }
//    }
//
//    @objc func handleNewScore(notification: Notification) {
//        if let score = notification.object as? Int, let userInfo = notification.userInfo {
//            print("Received new score \(score), UserInfo: \(userInfo)")
//        }
//    }
//
//    func getUserID() -> String {
//        return "123"
//    }
//
//}
