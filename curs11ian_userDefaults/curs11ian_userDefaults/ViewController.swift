//
//  ViewController.swift
//  curs11ian_userDefaults
//
//  Created by Vlad Groza on 11.01.2024.
//

import UIKit

struct Person {
    let index: Int
}

struct Car: Codable {
    let make: String
    let model: String
    let color: String
    let vin: String
    let kw: Int?
}

class ViewModel {
    private let userDefaultManager = UserDefaultsManager.shared
    
    init() {
        userDefaultManager.set(key: .auxKey, value: nil)
        
        let firstPerson = Person(index: 0)
        let secondPerson = Person(index: 1)
        
        let array = [firstPerson, secondPerson]
        
        let car = Car(
            make: "Mercedes-Benz",
            model: "CLS",
            color: "black",
            vin: "000000000000",
            kw: nil
        )
        
        do {
            let encodedCar = try JSONEncoder().encode(car)
            userDefaultManager.set(key: .auxKey, value: encodedCar)
        }
        catch (let myError) {
            print(myError)
        }
        
        if let carData = userDefaultManager.getData(key: .auxKey) {
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
        userDefaultManager.set(key: .auxKey, value: array)
        print(userDefaultManager.getArray(key: .auxKey))
        array[5] = 10
        userDefaultManager.set(key: .auxKey, value: array)
        print(userDefaultManager.getArray(key: .auxKey))
        userDefaultManager.set(key: .auxKey, value: nil)
    }
    
    func getLastPressedButtonText() -> String? {
        return userDefaultManager.getString(key: .lastButtonPressedText)
    }
    
    func getLastPressedButtonIndex() -> Int? {
        return userDefaultManager.getInteger(key: .lastButtonPressedIndex)
    }
    
    func setLastPressedButtonText(text: String?) {
        if let text {
            userDefaultManager.set(key: .lastButtonPressedText, value: text)
        }
        else {
            userDefaultManager.delete(key: .lastButtonPressedText)
        }
    }
    
    func setLastPressedButtonIndex(index: Int?) {
        if let index {
            userDefaultManager.set(key: .lastButtonPressedIndex, value: index)
        }
        else {
            userDefaultManager.delete(key: .lastButtonPressedIndex)
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!
    
    private let viewModel =  ViewModel()
    private let firstButtonPressedText = "Button1 was the last button pressed"
    private let secondButtonPressedText = "Button2 was the last button pressed"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getButtonIndexAndUpdateText()
        
    }
    
    private func getButtonIndexAndUpdateText() {
        if let index = viewModel.getLastPressedButtonIndex() {
            if index == 1 {
                label.text = firstButtonPressedText
            }
            else if index == 2 {
                label.text = secondButtonPressedText
            }
            else {
                label.text = "Label"
            }
        }
    }


    @IBAction func onButtonPressed(_ sender: Any) {
        viewModel.setLastPressedButtonIndex(index: 1)
        getButtonIndexAndUpdateText()
    }
    
    @IBAction func onButton2Pressed(_ sender: Any) {
        viewModel.setLastPressedButtonIndex(index: 2)
        getButtonIndexAndUpdateText()
    }
    
    @IBAction func onClearPressed(_ sender: Any) {
        viewModel.setLastPressedButtonIndex(index: nil)
        getButtonIndexAndUpdateText()
    }
}

