//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
str = "Hello, Swift"
let constStr = str
//constStr = "Hello, world"

var nextYear: Int
var bodyTemp: Float
var hasPest: Bool
//var arrayOfInts: Array<Int>
var arrayOfInts: [Int]
//var dictionaryOfCapitalsByCountry: Dictionary<String, String>
var dictionaryOfCapitalsByCountry: [String:String]
var winningLotteryNumbers: Set<Int>.ArrayLiteralElement

let number = 42
let fmStation = 91.1
//let countingUp = ["one", "two"]
var countingUp = ["one", "two"]
let secondElement = countingUp[1]
countingUp.count
countingUp.append("three")

let emptyString = String()
let emptyArrayOfInts = [Int]()
let emptySetOfFloats = Set<Float>()

let defaultNumber = Int()
let defaultBool = Bool()

let meaningOfLife = String(number)

let availableRooms = Set([205, 411, 412])

let defaultFloat = Float()
let floatFromLiteral = Float(3.14)

let easyPi = 3.14
let floatFromDouble = Float(easyPi)
let floatingPi: Float = 3.14

emptyString.isEmpty


var anOptionalFloat: Float?
var anOptionalArrayOfStrings: [String]?
var anOptionalArrayOfOptionalStrings: [String?]?

//var reading1: Float
//var reading2: Float
//var reading3: Float

var reading1: Float?
var reading2: Float?
var reading3: Float?

reading1 = 9.8
reading2 = 9.2
//reading3 = 9.7

//let avgreading = (reading1 + reading2 + reading3)
//let avgreading = (reading1! + reading2! + reading3!)
if let r1 = reading1, let r2 = reading2, let r3 = reading3 {
    let avgreading = (r1 + r2 + r3) / 3
}
else {
    let errorString = "Instrument reported a reading that was nil"
}

let nameByParkingSpace = [13: "Alice", 27: "Bob"]
//let space13Assignee: String? = nameByParkingSpace[13]
let space42Assignee: String? = nameByParkingSpace[42]
if let space13Assignee: String? = nameByParkingSpace[13] {
    print("Key 13 is assigned in the dictionary!")
}

let range = 0..<countingUp.count
for i in range {
    let string = countingUp[i]
    print(string)
}

for string in countingUp {
    print(string)
}

for (i, string) in countingUp.enumerated() {
    // (0, "one"), (1, "two")
}

for (space, name) in nameByParkingSpace {
    let permit = "Space \(space): \(name)"
}

//enum PieType {
//    case apple
//    case cherry
//    case pecan
//}
enum PieType: Int {
    case apple = 0
    case cherry
    case pecan
}

let favoritePie = PieType.apple

let name: String
switch favoritePie {
case .apple:
    name = "Apple"
case .cherry:
    name = "Cherry"
case .pecan:
    name = "Pecan"
}

let macOSVersion: Int = 12
switch macOSVersion {
case 0...8:
    print ("A big cat")
case 9:
    print ("Mavericks")
case 10:
    print ("Yosemite")
case 11:
    print ("El Capitan")
case 12:
    print ("Sierra")
default:
    print ("Greetings, people of the future! What's new in 10.\(macOSVersion)?")
}


let pieRawValue = PieType.pecan.rawValue

if let pieType = PieType(rawValue: pieRawValue) {
    
}

