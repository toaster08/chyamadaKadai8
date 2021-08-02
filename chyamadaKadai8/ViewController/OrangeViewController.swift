//
//  ViewController.swift
//  chyamadaKadai8
//
//  Created by toaster on 2021/08/01.
//

import UIKit

final class OrangeViewController: UIViewController {
    @IBOutlet private weak var sliderValueLabel: UILabel!
    @IBOutlet private weak var orangeViewSlider: UISlider! {
        didSet {
            orangeViewSlider.addTarget(self,
                                       action: #selector(postValueChanged),
                                       for: .valueChanged)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(observeValueChanged),
                                               name: .myNotification,
                                               object: nil)
    }
}

private extension OrangeViewController {
    @objc func observeValueChanged(_ notification: Notification) {
        guard let currentValue = notification.userInfo?[CurrentValuePoster.currentValueKey] as? Float else { return }
        sliderValueLabel.text = String(describing: currentValue)
        orangeViewSlider.value = currentValue
    }

    @objc func postValueChanged() {
        let poster = CurrentValuePoster.shared

        let orangeViewValue = orangeViewSlider.value
        sliderValueLabel.text = String(describing: orangeViewValue)
        poster.post(currentValue: orangeViewValue)
    }
}
