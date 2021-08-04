//
//  SliderObserveModel.swift
//  chyamadaKadai8
//
//  Created by toaster on 2021/08/01.
//

import Foundation

extension Notification.Name {
    static let didChangeCurrentValue = Notification.Name("currentValueNotification")
}

final class CurrentValueModel {
    static let shared = CurrentValueModel()

    private init() {}

    private(set) var sharedValue: Float = 0

    func set(currentValue: Float) {
        sharedValue = currentValue

        NotificationCenter.default.post(name: .didChangeCurrentValue,
                                        object: nil,
                                        userInfo: nil)
    }
}
