//
//  ViewController.swift
//  SliderPrac
//
//  Created by Erkhaan  on 24.09.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    let redLabel = UILabel()
    let redSlider = UISlider()
    let blueLabel = UILabel()
    let blueSlider = UISlider()
    let greenLabel = UILabel()
    let greenSlider = UISlider()
    let colorFrame = UIView()
    
    lazy var redStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 30
        stack.alignment = .fill
        stack.distribution = .fill
        [redLabel,
         redSlider].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    lazy var blueStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 30
        stack.alignment = .fill
        stack.distribution = .fill
        [blueLabel,
         blueSlider].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    lazy var greenStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 30
        stack.alignment = .fill
        stack.distribution = .fill
        [greenLabel,
         greenSlider].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    lazy var sliderStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 60
        stack.alignment = .fill
        stack.distribution = .fill
        [colorFrame,
         redStackView,
         blueStackView,
         greenStackView].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
    }
    
    private func setupViews() {
        view.addSubview(sliderStackView)
        view.backgroundColor = .black
        colorFrame.backgroundColor = .black
        colorFrame.layer.cornerRadius = 10
        setupLabel(redLabel, with: redSlider.value)
        setupLabel(greenLabel, with: greenSlider.value)
        setupLabel(blueLabel, with: blueSlider.value)
        setupSlider(redSlider, with: .red)
        setupSlider(greenSlider, with: .green)
        setupSlider(blueSlider, with: .blue)
    }
    
    private func setupLayout() {
        sliderStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sliderStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            sliderStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            sliderStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            sliderStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        ])
    }
    
    private func colorToString(value: Float) -> String {
        String(format: "%.0f", value * 255)
    }
    
    private func setupLabel(_ label: UILabel, with value: Float) {
        label.text = colorToString(value: value)
        label.textAlignment = .center
        label.textColor = .white
    }
    
    private func setupSlider(_ slider: UISlider, with color: UIColor) {
        slider.tintColor = color
        slider.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)
    }
    
    @objc private func sliderChanged(_ sender: UISlider) {
        let value = colorToString(value: sender.value)
        switch sender {
        case redSlider:
            redLabel.text = value
        case blueSlider:
            blueLabel.text = value
        case greenSlider:
            greenLabel.text = value
        default:
            break
        }
        updateBackground()
    }
    
    private func updateBackground() {
        colorFrame.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
}
