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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
    }
    
    private func setupViews() {
        view.addSubview(colorFrame)
        view.addSubview(redLabel)
        view.addSubview(redSlider)
        view.addSubview(greenLabel)
        view.addSubview(greenSlider)
        view.addSubview(blueLabel)
        view.addSubview(blueSlider)
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
        colorFrame.translatesAutoresizingMaskIntoConstraints = false
        redLabel.translatesAutoresizingMaskIntoConstraints = false
        redSlider.translatesAutoresizingMaskIntoConstraints = false
        greenLabel.translatesAutoresizingMaskIntoConstraints = false
        greenSlider.translatesAutoresizingMaskIntoConstraints = false
        blueLabel.translatesAutoresizingMaskIntoConstraints = false
        blueSlider.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorFrame.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorFrame.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            colorFrame.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            colorFrame.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            colorFrame.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            redLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            redLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            redLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            redSlider.topAnchor.constraint(equalTo: redLabel.bottomAnchor, constant: 50),
            redSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            redSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)])
        
        NSLayoutConstraint.activate([
            greenLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greenLabel.topAnchor.constraint(equalTo: redSlider.bottomAnchor, constant: 50),
            greenLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            greenLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        NSLayoutConstraint.activate([
            greenSlider.topAnchor.constraint(equalTo: greenLabel.bottomAnchor, constant: 50),
            greenSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            greenSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)])
        
        NSLayoutConstraint.activate([
            blueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blueLabel.topAnchor.constraint(equalTo: greenSlider.bottomAnchor, constant: 50),
            blueLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            blueLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        NSLayoutConstraint.activate([
            blueSlider.topAnchor.constraint(equalTo: blueLabel.bottomAnchor, constant: 50),
            blueSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            blueSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)])
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


