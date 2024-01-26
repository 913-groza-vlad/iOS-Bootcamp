//
//  ViewController.swift
//  curs11ianuarie-userdefaults
//
//  Created by Orlando Neacsu on 11.01.2024.
//

import UIKit

struct Car: Codable {
    let make: String
    let model: String
    let color: String
    let vin: String
    let kw: Int?
    
}

class ViewModel {
    
    private let userDefaultsManager = UserDefaultsManager.shared
    
    
    init() {
        
        userDefaultsManager.set(key: .auxKey, value: nil)
        
        let car = Car(
            make: "Mercedes-Benz", 
            model: "CLS",
            color: "white",
            vin: "000000000000",
            kw: nil
        )
        
        do {
            let encodedCar = try JSONEncoder().encode(car)
            userDefaultsManager.set(key: .auxKey, value: encodedCar)
            
        } catch(let myError) {
            print(myError)
        }
        
        
        if let carData = userDefaultsManager.getData(key: .auxKey) {
            do {
                let decodedCar = try JSONDecoder().decode(Car.self, from: carData)
                print(decodedCar)
            } catch {
                print(error)
            }
        }
    }
    
    private func exampleOfArray() {
        var array = [0,1,2,3,4,5]
        userDefaultsManager.set(key: .auxKey, value: array)
        print(userDefaultsManager.getArray(key: .auxKey))
        array[5] = 10
        userDefaultsManager.set(key: .auxKey, value: array)
        print(userDefaultsManager.getArray(key: .auxKey))
        userDefaultsManager.set(key: .auxKey, value: nil)
    }
    
    func getLastPressedButtonIndex() -> Int? {
        userDefaultsManager.getInteger(key: .lastButtonPressedIndex)
    }
    
    func setLastPressedButtonIndex(index: Int?) {
        if let index {
            userDefaultsManager.set(key: .lastButtonPressedIndex, value: index)
        } else {
            userDefaultsManager.delete(key: .lastButtonPressedIndex)
        }
    }
    
    func getLastPressedButtonText() -> String? {
        return userDefaultsManager.getString(key: .lastButtonPressedText)
    }
    
    func setLastPressedButtonText(text: String?) {
        if let text {
            userDefaultsManager.set(key: .lastButtonPressedText, value: text)
        } else {
            userDefaultsManager.delete(key: .lastButtonPressedText)
        }
    }
    
}

class ViewController: UIViewController {
    
    @IBOutlet private weak var label: UILabel!
    
    private let viewModel = ViewModel()
    
    private let firstButtonPressedText = "Button 1 was last button pressed"
    private let secondButtonPressedText = "Button 2 was last button pressed"
    
    override func viewDidLoad() {
        super.viewDidLoad()
       getButtonIndexAndUpdateText()
    }
    
    private func getButtonIndexAndUpdateText() {
        if let index = viewModel.getLastPressedButtonIndex() {
            if index == 1 {
                label.text = firstButtonPressedText
            } else if index == 2 {
                label.text = secondButtonPressedText
            } else {
                label.text = "Label"
            }
        }
    }
    
    @IBAction private func onButton1Pressed(_ sender: Any) {
        viewModel.setLastPressedButtonIndex(index: 1)
        getButtonIndexAndUpdateText()
    }
    
    
    @IBAction private func onButton2Pressed(_ sender: Any) {
        viewModel.setLastPressedButtonIndex(index: 2)
        getButtonIndexAndUpdateText()
    }
    
    
    @IBAction private func onClearPressed(_ sender: Any) {
        viewModel.setLastPressedButtonIndex(index: nil)
        getButtonIndexAndUpdateText()
    }
}

