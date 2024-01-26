//
//  ViewController.swift
//  Curs1-p2
//
//  Created by Vlad Groza on 31.10.2023.
//

import UIKit

class ViewController: UIViewController {

   private let apiManager = APIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        apiManager.loadProducts()
            
        let variable: String = "Betfair"
        var variable2 = "Betfair" // TYPE INFERENCE
        var int: Int = 10
        var int2 = 10
        var double: Double = 2.2
        
        
        var double2 = 2.9999999
        var myInt: Int = Int(double2) // 2
        
        var mySecondInt = 10
        var mySecondDouble = Double(mySecondInt) // 10.0
        
        let sum: Int = mySecondInt + Int(mySecondDouble)
        
        
        
        var myFirstString: String = "un strIng"
        var myFirstStringCapitalized = myFirstString.lowercased().capitalized // "Un string"
        var myFirstStringUppercased = myFirstString.uppercased() // "UN STRING"
        var myFirstStringLowercased = myFirstString.lowercased() // "un string"
        
        let string1 = "curs"
        let string2 = "iOS"
        let string3 = string1 + " " + string2 // "curs iOS"
        
        let numberOfApples = 6 // "6"
        let myString = "Ana are " + String(numberOfApples) + " mere"
        
        let interpolatedString = "Ana are \(numberOfApples) mere"
        
        let emptyString = ""
        let emptyString2 = String()
        
        let singleLineString = """
        Acesta este un string
        multiline
        """
        
        var fullName = "Alex Orlando"
        var tuple: (String, String) = ("Alex", "Orlando")
        
        let firstName = tuple.0
        let lastName = tuple.1
        
        var tuple2: (firstName: String, lastName: String, age: Int) = ("Alex", "Orlando", 27)
        
        let (var1, var2, var3) = tuple2 // destructuring
        
        
        
        var myFirstOptional: Int? = 10
        var mySecondOptional: Int? = nil
        var myThirdOptional: Int?
        
        var myOptionalString: String?
        var myOptionalDouble: Double?
        var myOptionalBool: Bool?
        
        myOptionalBool = true
        myOptionalBool = false
        myOptionalBool = nil
        
        myOptionalDouble = nil
        myOptionalDouble = 10.0
        myOptionalDouble = nil
        
        if myOptionalDouble != nil {
            print(myOptionalDouble!) // force unwrapping
        } else {
            print("Nu exista nicio valoare in acest optional!")
        }
        
        if let myDouble = myOptionalDouble {
            print(myDouble)
        } else {
            print("Nu exista nicio valoare in acest optional!")
        }
        
        if let myOptionalDouble = myOptionalDouble {
            print(myOptionalDouble)
        } else {
            print("Nu exista nicio valoare in acest optional!")
        }
        
        if let myOptionalDouble {
            print(myOptionalDouble)
        } else {
            print("Nu exista nicio valoare in acest optional!")
        }
        
        //        guard let myOptionalDouble else {
        //            print("Nu exista nicio valoare in acest optional!")
        //            return
        //        }
        //        print(myOptionalDouble)
        
        var testOptional: Int? = nil
        
        if let testOptional {
            print(testOptional)
        } else {
            print(0)
        }
        
        print(testOptional ?? 0)
        
        var string: String? = nil
        
        if let string {
            print(string.uppercased())
        }
        
        print(string?.uppercased())
        
        /*
         String?
         
         Unwrap:
         1. verificare normale != nil
         2. if let
         3. guard let
         4. ?? // nil colansecing
         
         Accesare safe: ?
         
         */
        
        var myEmptyArray: [Int] = []
        var mySecondEmptyArray = [Int]()
        var myArray: [Int] = [0,1,2,3]
        var mySecondArray = [0,1,2,3]
        
        var empoyeesNames = ["Alex", "Marian", "Bogdan"]
        
        // este sau nu array ul empty
        
        if myEmptyArray.isEmpty { // O(1)
            print("Array ul este gol")
        } else {
            print("Array ul NU este gol")
        }
        
        // cate elemente sunt in array
        
        if myArray.count <= 10 { // O(n)
            print("ceva")
        } else {
            print("altceva")
        }
        
        // concatenarea array urilor
        var firstColors = ["red", "green"]
        var secondColors = ["black", "white"]
        var allColors = firstColors + secondColors
        
        // accesarea unui element de la un anumit index
        
        let secondColor = firstColors[1]
        print(secondColor)
        
        if firstColors.count >= 101 {
            let anotherColor = firstColors[100]
            print(secondColor)
        }
        
        // parcurgerea unui array
        
        let intArray = [10,11,12,13,14,15,16,17,18,19,110]
        for element in intArray {
            if element % 2 == 0 {
                print(element)
            }
        }
        
        intArray.forEach { element in
            if element % 5 == 0 {
                print(element)
            }
        }
        
        for index in (0...3) {
            print(index)
        }
        
        for index in (0..<intArray.count) {
            if intArray[index] % 2 == 0 {
                print(intArray[index])
            }
        }
        
        for (offset, element) in intArray.enumerated() {
            print(offset, " ", element)
        }
        
        // stergerea unui element
        
        var arrray = [1,2,3]
        //        arrray.remove(at: 2)
        //        arrray.removeAll()
        //        arrray.removeFirst()
        //        arrray.removeLast()
        //        arrray.removeAll { element in
        //            element % 2 == 0
        //        }
        
        // inserarea unui element
        
        arrray.append(4)
        arrray.append(contentsOf: [5,6,7,8,9,10])
        arrray.insert(0, at: 0)
        arrray.insert(contentsOf: [-2, -1], at: 0)
        
        print(arrray)
        
        // modificarea unui element
        
        arrray[5] = 5000
        
        print(arrray)
        
        if arrray.contains(5000) {
            print("DA")
        } else {
            print("NU")
        }
        
        // dictionaries
        
        var dictionary: [Int: String] = [:]
        var dictionary2 = [Int: String]()
        
        var dictionary3: [Int: String] = [
            1: "A",
            2: "B",
            100: "C"
        ]
        
        var dictionary4: [String: Int] = [
            "ab": 1,
            "bc": 2
        ]
        
        dictionary4["cd"] = 100
        dictionary4["ab"] = nil // dictonary4.removeValue("ab")
        
        
        let optional = dictionary4["cd"]
        if let optional {
            print(optional)
        }
        
        // set
        
        var set = Set<Int>([1,2,3])
        var set1: Set<Int> = [1,2,3,3,4,4,5]
        set1.insert(10)
        set1.remove(10)
        
        let newset = set1.union(set)
        let anotherSet = set1.intersection(set)
        
        if newset.contains(4) {
            print("DA")
        }
        
        
        var i = 10
        while i >= 0 {
            print(i)
            i = i - 1
        }
        
        var y = 5
        repeat {
            print(y)
            y = y - 1
        } while y >= 0
        
        let a = 5
        
        if a > 10 {
            print("ceva")
        } else if a > 20 {
            print("altceva")
        } else if a > 30 {
            print("dsada")
        } else {
            print("dsada")
        }
        
        let aa = y > 10 ? true : false
        
        // return break continue
        
        if aa == true {
            return
        }
        
        
        for i in (0...10) {
            if aa == false {
                continue
            }
            print("ceva")
        }
        
        
        let aux = 10000
        
        switch aux {
        case 0:
            break
        case 1:
            break
        case 2:
            break
        case 3:
            break
        default:
            break
        }
        
        functieFaraParamterii()
        functieCuUnParametru(parametru: 0)
        functieCuDoiParametrii(param1: 0, param2: 1)
        
        let sumFromFuncton = functieCuTreiParametriiCareReturneazaUnInt(param1: 1, param2: 2, param3: 3)
        print(sumFromFuncton)
        
        let sum2 = functieCuTreiParametriiCareReturneazaUnInt2(firstInt: 0, secondInt: 1, thirdInt: 2)
        let sum3 = functieCuTreiParametriiCareReturneazaUnInt3(0, 1, 2)
        
        var stringggg = ""
        doSth(string: &stringggg)
        
        sumF(first: 0, second: 1)
        sumF(first: 5)
        closurePlayground()
        enumUsage()
    }
    
    func functieFaraParamterii() {
        print(#function)
    }
    
    func functieCuUnParametru(parametru: Int) {
        print(#function)
    }
    
    func functieCuDoiParametrii(param1: Int, param2: Int) {
        print(param1 + param2)
    }
    
    func functieCuTreiParametriiCareReturneazaUnInt(param1: Int, param2: Int, param3: Int) -> Int {
        return param1 + param2 + param3
    }
    
    func functieCuTreiParametriiCareReturneazaUnInt2(
        firstInt param1: Int,
        secondInt param2: Int,
        thirdInt param3: Int
    ) -> Int {
        return param1 + param2 + param3
    }
    
    func functieCuTreiParametriiCareReturneazaUnInt3(
        _ param1: Int,
        _ param2: Int,
        _ param3: Int
    ) -> Int {
        
        return param1 + param2 + param3
    }
    
    func doSth(string: inout String) {
        string = ""
    }
    
    func sumF(first: Int, second: Int = 1) {
        print(first + second)
    }
    
    func doDifference(a: Int, b: Int) {
        print(a - b)
    }
    
    func doDifference(a: Int, b: Int, c: Int) {
        print(a - b - c)
    }
    
    // closures
    
    func closurePlayground() {
        
        var closureFaraParametrii: () -> Void = {
            print("stf")
        }
        
        closureFaraParametrii()
        
        var closureCuParametrii: (String) -> Void = { string in
            print(string)
        }
        
        closureCuParametrii("ceva")
        
        iterate(
            array: [0,1,2,3,4,5],
            closure: { element in
            return element % 10 == 0
        }
        )
        
        var closureCuParametriiCareReturneaza: (String) -> (String) = { string in
            return string.capitalized
        }
        
        closureCuParametriiCareReturneaza("param")
        
        
        
        var closureCuParametrii2: (String, Int) -> String = { $0 + String($1) }
        
        
        trailingClosure(closure: {
            print("sth")
        })
        
        trailingClosure {
            print("sth")
        }
        
        trailingClosure {
            print("sth")
        }
        
        trailingClosure2(int: 0) {
            print("sth")
        }
        
        trailingClosure2(int: 0, closure: {
            print("sth")
        })
        
        var array = [1,2,3]
        array.filter { $0 == 2 }
    }
    
    /*
     closures: folosite pentru a asigna un block de cod intr o variabila sau pentru a furniza unei functii un block de cod din exterior
     ele pot avea parametrii si pot returna
     ** trailing closure
     
     
     */
    
    func trailingClosure2(int: Int, closure: () -> ()) {
        print(int)
        closure()
    }
    
    func trailingClosure(closure: () -> Void) {
        closure()
    }
    
    func iterate(
        array: [Int],
        closure: (Int) -> Bool
    ) {
        array.forEach { int in
            if closure(int) == true {
                print(int)
            }
        }
    }
    
    func filterEx() {
        var array = [1,2,3,4,5,6,7,8,9,10]
        array = array.filter({ element in
            element % 2 == 0
        })
    }
    
    func enumUsage() {
        var carType = CarType.cabrio
        var carType2: CarType = CarType.offroad
        var carType3: CarType = .offroad
        
        print(carType.rawValue)
        
        var carType4 = CarType(rawValue: "sedan")
        if let carType4 {
            
            switch carType4 {
            case .break:
                print("break")
            case .cabrio:
                print("cabrio")
            case .offroad:
                print("offroad")
            case .sedan:
                print("sedan")
            default:
                print("nimic")
            }
            
            if carType4 == .break {
                
            } else if carType4 == .cabrio {
                
            }
            
            let carColor = CarColor.red(0)
            let carColor2 = CarColor.red(1)
            
            
            switch carColor2 {
            case .black(let int):
                print(int)
            default:
                print("altceva in afara de black")
            }
            
        } else {
            print("nimic")
        }
        
        structUsage()
        course3()
    }
    
    func structUsage() {
        let person = Person(firstName: "Vlad", lastName: "Groza", age: 21)
        let personDefault = Person()
        
        print("Person \(person.firstName) \(person.lastName) is \(person.age) years old")
    }
    
    func course3() {
        let animal = Animal(name: "Coco")
        print(animal.nameLowercase)
        animal.nameLowercase = "Max"
        print(animal.name)
        let animal2 = animal;
        animal2.nameLowercase = "Meidi"
        print(animal.name)
        print(animal2.name)
        
    }
}

enum CarType: String {
    case sedan
    case `break`
    case cabrio = "Alt string"
    case suv
    case offroad
}

enum CarColor {
    case red(Int)
    case black(Int)
    case green(Int)
}

struct Person {
    let firstName: String
    let lastName: String
    let age: Int
    
    init(
        firstName: String,
        lastName: String,
        age: Int
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    init() {
        self.firstName = ""
        self.lastName = ""
        self.age = 0
    }
}

class PersonViewModel {
    let person: Person
    
    init(
        person: Person
    ) {
        self.person = person
    }
    
    deinit {
        print("Person object destructed")
    }
}

class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}


extension Animal {
    var nameLowercase: String {
        get {
            return name.lowercased()
        }
        set {
            self.name = newValue.lowercased()
        }
    }
}
