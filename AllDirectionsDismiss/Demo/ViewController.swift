//
//  ViewController.swift
//  Demo
//
//  Created by kohei saito on 2020/06/14.
//  Copyright © 2020 kohei. All rights reserved.
//

import UIKit
import AllDirectionsDismiss

class ViewController: UIViewController {
    
    private enum Color: String, CaseIterable {
        case black
        case white
        case darkGray
        case lightGray
        case gray
        case red
        case green
        case blue
        case cyan
        case yellow
        case magenta
        case orange
        case purple
        case brown
        case clear
        
        var color: UIColor {
            switch self {
            case .black: return .black
            case .white: return .white
            case .darkGray: return .darkGray
            case .lightGray: return .lightGray
            case .gray: return .gray
            case .red: return .red
            case .green: return .green
            case .blue: return .blue
            case .cyan: return .cyan
            case .yellow: return .yellow
            case .magenta: return .magenta
            case .orange: return .orange
            case .purple: return .purple
            case .brown: return .brown
            case .clear: return .clear
            }
        }
    }

    @IBOutlet weak var dismissPercentLabel: UILabel!
    @IBOutlet weak var dismissVelocityLabel: UILabel!
    @IBOutlet weak var backgroundAlphaLabel: UILabel!
    @IBOutlet weak var backdroundColorPicker: UIPickerView!
    
    typealias DismissData = (percent: CGFloat, velocity: CGFloat, backgroundAlpha: CGFloat, backgroundColor: UIColor)
    
    private var dismissData: DismissData = DismissData(percent: AllDirectionsDismiss.Defaults.dismissPercent,
                                               velocity: AllDirectionsDismiss.Defaults.dismissVelocity,
                                               backgroundAlpha: AllDirectionsDismiss.Defaults.backgroundAlpha,
                                               backgroundColor: AllDirectionsDismiss.Defaults.backgroundColor)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func moveDismissPercentSlider(_ sender: UISlider) {
        let value = floor(sender.value * 100) / 100
        dismissData.percent = CGFloat(value)
        dismissPercentLabel.text = value.description
    }
    
    @IBAction func moveDismissVelocitySlider(_ sender: UISlider) {
        let value = floor(sender.value)
        dismissData.velocity = CGFloat(value)
        dismissVelocityLabel.text = String(format: "%.0f", value)
    }
    
    @IBAction func moveBackdroundAlpha(_ sender: UISlider) {
        let value = floor(sender.value * 100) / 100
        dismissData.backgroundAlpha = CGFloat(value)
        backgroundAlphaLabel.text = value.description
    }
    
    @IBAction func tappedPopButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "SingleViewController") as! SingleViewController
        vc.dismissData = dismissData
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func tappedNavPopButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "SingleViewController") as! SingleViewController
        vc.dismissData = dismissData
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
    }
    
    @IBAction func tappedPopWithScrollButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "ScrollViewController") as! ScrollViewController
        vc.dismissData = dismissData
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func taooedNavPopWithScrollButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "ScrollViewController") as! ScrollViewController
        vc.dismissData = dismissData
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
     
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return Color.allCases.count
    }
     
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return Color.allCases[row].rawValue
    }
     
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        dismissData.backgroundColor = Color.allCases[row].color
    }
}
