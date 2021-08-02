//
//  BlueViewController.swift
//  chyamadaKadai8
//
//  Created by toaster on 2021/08/01.
//

import UIKit

final class BlueViewController: UIViewController {
    @IBOutlet private weak var sliderValueLabel: UILabel!
    @IBOutlet private weak var blueViewSlider: UISlider! {
        didSet {
            blueViewSlider.addTarget(self,
                                     action: #selector(postValueChanged),
                                     for: .valueChanged)
        }
    }

    private var poster: CurrentValuePoster!

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(observeValueChanged),
                                               name: .myNotification,
                                               object: nil)
        poster = CurrentValuePoster.shared
        blueViewSlider.value = poster.sharedValue
        sliderValueLabel.text = String(describing: blueViewSlider.value)
    }
}

private extension BlueViewController {
    @objc func observeValueChanged(_ notification: Notification) {
        guard let currentValue = notification.userInfo?[CurrentValuePoster.currentValueKey] as? Float else { return }
        sliderValueLabel.text = String(describing: currentValue)
        blueViewSlider.value = currentValue
    }

    @objc func postValueChanged() {
        let blueViewValue = blueViewSlider.value
        sliderValueLabel.text = String(describing: blueViewValue)
        poster?.post(currentValue: blueViewValue)
    }
}
