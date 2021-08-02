//
//  SliderObserveModel.swift
//  chyamadaKadai8
//
//  Created by toaster on 2021/08/01.
//

import Foundation

extension Notification.Name {
    static let myNotification = Notification.Name("currentValueNotification")
}

extension CurrentValuePoster {
    static let currentValueKey = "currentValueKey"
}

final class CurrentValuePoster {
    static let shared = CurrentValuePoster()
    var sharedValue: Float = 0

    func post(currentValue: Float) {
        NotificationCenter.default.post(name: .myNotification,
                                        object: nil,
                                        userInfo: [Self.currentValueKey: currentValue])
        sharedValue = currentValue
    }
}
