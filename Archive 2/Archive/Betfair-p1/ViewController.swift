//
//  ViewController.swift
//  Betfair-p1
//
//  Created by Orlando Neacsu on 31.10.2023.
//

import UIKit

/*
 String => pentru texte, "betfair"
 Int = -1 , 0 , 1, 31232131231
 Double, Float => pentru numere reale , 1.999
 Bool => true sau false
 
 enum // mai tarziu
 struct // mai tarziu
 class // mai tarziu
 closure (lamba function) // mai tarziu
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
        
        structUsage()
        classUsage()
        doCatch()
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
    }
    
    func structUsage() {
        let person = Person(firstName: "", lastName: "")
        let person2 = Person(firstName: "sadsa", lastName: "sdasd", age: 20)
    }
    
    func classUsage() {
        let animal = Animal(color: "red", name: "asdasd", weight: 2.0)
        let dog = Dog(color: "adsada", name: "dassda", weight: 3.0, owner: Person(firstName: "adsad", lastName: "adasd"))
        
        animal.run()
        print(animal.nameLowercased)
        animal.nameLowercased = "ceva"
        dog.run()
        
        
        // clasele se transmit referinta, struct urile prin valoare(copiere)
        
        var struct1 = ExStruct(int: 0)
        var struct2 = struct1
        struct2.int = 1
        
        print(struct1.int) // 0
        print(struct2.int) // 1
        
        var class1 = ExClass(int: 0)
        var class2 = class1
        var class100 = class2
        
        class1.int = 10
        
        print(class1.int) // 10
        print(class2.int) // 10
        
    }
    
//    func getDoubleFromString(string: String) -> Double? {
//        return Double(string)
//    }
    
    func getDoubleFromString(string: String) throws -> Double {
        if let double = Double(string) {
            return double
        }
        throw(CustomError(message: "String-ul contine si alte elemente in afara de cifre!"))
    }
    
 
    func doCatch() {
        let string = "3.12a"
        do {
            let double: Double = try getDoubleFromString(string: string)
            print(double)
        } catch {
            
            if let customError = error as? CustomError {
                print(customError.message)
            } else {
                print("Unforunately, an error has occured bla bla")
            }
        }
        
        let double2 = try? getDoubleFromString(string: "3.12")
//        let double3 = try! getDoubleFromString(string: "3.12a")
        print(double3)
        
    }
}

struct CustomError: Error {
    let message: String
}

struct ExStruct {
    var int: Int
}

final class ExClass {
    var int: Int
    
    init(int: Int) {
        self.int = int
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
    var age: Int = 10
    
//    init(
//        prenume: String,
//        nume: String,
//        age: Int
//    ) {
//        firstName = prenume
//        lastName = nume
//        self.age = age
//    }
//
//    init() {
//        self.firstName = ""
//        lastName = ""
//        age = 0
//    }
}

/*
 INHERITANCE - mostenire
 deinit
 */

class PersonViewModel {
    
    let person: Person
    
    init(person: Person) {
        self.person = person
    }
    
    init(
        firstName: String,
        lastName: String,
        age: Int
    ) {
        self.person = Person(
            firstName: firstName,
            lastName: lastName,
            age: age
        )
    }
    
    deinit {
        print("consola")
    }
}

class Animal {
    
    let color: String
    var name: String
    let weight: Double
    
    init(color: String, name: String, weight: Double) {
        self.color = color
        self.name = name
        self.weight = weight
    }
    
    convenience init(fullName: String, color: String) {
        self.init(color: color, name: fullName, weight: 0.0)
    }
    
    func run() {
        print("run")
    }
    
}

class Dog: Animal {
    let owner: Person
    
    override init(color: String, name: String, weight: Double) {
        self.owner = Person(firstName: "", lastName: "")
        super.init(color: color, name: name, weight: weight)
    }
    
    init(
        color: String,
        name: String,
        weight: Double,
        owner: Person
    ) {
        self.owner = owner
        super.init(color: color, name: name, weight: weight)
    }
    
    override func run() {
        super.run()
        print("alaturi de stapan")
    }
}

extension Animal {
    var nameLowercased: String {
        get {
            return name.lowercased()
        }
        set {
            self.name = newValue.lowercased().capitalized
        }
    }
    
    func firstFunc() {
        
    }
    
    static var int = 0
    static func func1() {
        let double = 3.0
        print(double.asInt)
        print(double.asIntFunc())
    }
}

extension Double {
    var asInt: Int {
        return Int(self)
    }
    
    func asIntFunc() -> Int {
        self.asInt
    }
}

protocol FoodProtocol {
    
    var ingredients: [String] {get}
    func cook()
    
}

extension FoodProtocol {
    func cook() { // functia devine optionala
        print("definire default")
    }
}

struct FoodStruct: FoodProtocol {
    var ingredients: [String]
    
    func cook() {
        print("definire proprie")
    }
}

class FoodClass: FoodProtocol {
    var ingredients: [String]
    
    init() {
        ingredients = []
    }
    
    func cook() {
        
    }
}

enum FoodEnum  {
    case launch
    case dinner
}

extension FoodEnum: FoodProtocol {
    var ingredients: [String] {
        switch self {
        case .launch:
            return []
        case .dinner:
            return ["tomato", "onion"]
        }
    }
    
    func cook() {
        let instance = Ceva()
    }
}

open class Ceva {
    private(set) var a = 10
    
    var b = 20 // INTERNAL
    internal var c = 30
    
    func doSth() {
        
    }
    
    open func doSth2() {
        
    }
    
    public func doSth3() {
        
    }
    
    private func doSth4() {
        
    }
}

/*
 public // vizibil la nivel de workspace, spre deosebure de open NU se poate face override
 private (private(set)) - vizibil la nivel de clase (context)
 
 open // vizibil la nivel de workspace (si din alte package uri)
 fileprivate // vizibil la nivel de fisier
 internal // vizibil oriunde in package
 
 
 */

/*
 ARTHIECTURA:
 Model <-> ViewModel <-Binding-> View
 
 Model: (tot business logic ul datelor din aplicatie)
 - modele de date
 - componenta care comunica cu serverul (API Layer-ul)
 - componenta care are rol de management al datelor (Data Layer)
 - alte componente care cuprind logica de date
 
 View: (partea de UI)
 - modul prin care user-ul comunica cu aplicatia (interfata aplicatiei)
 - transmite view model-ului actiunile user-ului si reactioneaza la evenimentele tranmise de view model
 
 ViewModel:
 - cuprinde tot business logic-ul la nivel de ecran (mai rar la nivel de view sau la nivel de flow)
 - este componenta intermediara dintre model si view
 */



