//
//  BlueViewController.swift
//  chyamadaKadai8
//
//  Created by toaster on 2021/08/01.
//

import UIKit

final class BlueViewController: UIViewController {
    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var valueSlider: UISlider! {
        didSet {
            valueSlider.addTarget(self,
                                  action: #selector(didChangeSliderValue),
                                  for: .valueChanged)
        }
    }

    private let model = CurrentValueModel.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(observeValueChanged),
                                               name: .didChangeCurrentValue,
                                               object: nil)
        updateUI(value: model.sharedValue)
    }

    private func updateUI(value: Float) {
        valueSlider.value = value
        valueLabel.text = String(describing: value)
    }
}

private extension BlueViewController {
    @objc func observeValueChanged(_ notification: Notification) {
        updateUI(value: model.sharedValue)
    }

    @objc func didChangeSliderValue() {
        model.set(currentValue: valueSlider.value)
    }
}
