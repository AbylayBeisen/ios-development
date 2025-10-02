//
//  lab2.swift
//  
//
//  Created by Abylai  on 25.09.2025.
//
import Cocoa

//problem 1
/*
for x in 1...100{
    if x%3 == 0 && x%5 == 0{
        print("FizzBuzz")
    }
    else if x%3==0 {
        print("Fizz")
    }
    else if x%5==0{
        print ("Buzz")
    }
    else{
        print(x)
    }
}
*/


//problem 2

/*func isPrime(_ number: Int) -> Bool {
    if number < 2 {
       return false
   }
   if number == 2 || number == 3 {
       return true
   }
   if number % 2 == 0 {
       return false
}

   var i = 3
   while i * i <= number {
       if number % i == 0 {
          return false
        }
        i += 2
    }
    
    return true
}

print("Prime numbers between 1 and 100:")
for number in 1...100 {
    if isPrime(number) {
        print(number, terminator: " ")
   }
}
print()

*/

//problem 3


/*
func celsiusToFahrenheit(_ celsius: Double) -> Double {
    return (celsius * 9/5) + 32
}

func celsiusToKelvin(_ celsius: Double) -> Double {
    return celsius + 273.15
}

func fahrenheitToCelsius(_ fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5/9
}

func fahrenheitToKelvin(_ fahrenheit: Double) -> Double {
    return (fahrenheit - 32) * 5/9 + 273.15
}

func kelvinToCelsius(_ kelvin: Double) -> Double {
    return kelvin - 273.15
}

func kelvinToFahrenheit(_ kelvin: Double) -> Double {
    return (kelvin - 273.15) * 9/5 + 32
}


print("Temperature Converter")
print("Enter temperature value:")
if let input = readLine(), let temperature = Double(input) {
    print("Enter unit (C for Celsius, F for Fahrenheit, K for Kelvin):")
    if let unit = readLine()?.uppercased() {
        switch unit {
        case "C":
            let fahrenheit = celsiusToFahrenheit(temperature)
            let kelvin = celsiusToKelvin(temperature)
            print("\(temperature)°C = \(String(format: "%.2f", fahrenheit))°F = \(String(format: "%.2f", kelvin))K")
        case "F":
            let celsius = fahrenheitToCelsius(temperature)
            let kelvin = fahrenheitToKelvin(temperature)
            print("\(temperature)°F = \(String(format: "%.2f", celsius))°C = \(String(format: "%.2f", kelvin))K")
        case "K":
            let celsius = kelvinToCelsius(temperature)
            let fahrenheit = kelvinToFahrenheit(temperature)
            print("\(temperature)K = \(String(format: "%.2f", celsius))°C = \(String(format: "%.2f", fahrenheit))°F")
        default:
            print("Invalid unit. Please enter C, F, or K.")
        }
    }
} else {
    print("Invalid temperature input.")
}
*/


// Problem 4

/*
 var shoppingList: [String] = []
var shouldContinue = true

print("Welcome to Shopping List Manager!")

while shouldContinue {
    
    print("\n=== SHOPPING LIST MANAGER ===")
    print("1. Add item to list")
    print("2. Remove item from list")
    print("3. Display current list")
    print("4. Exit")
    print("Choose an option (1-4):")
    
    if let choice = readLine() {
        switch choice {
        case "1":
            print("Enter item to add:")
            if let item = readLine(), !item.isEmpty {
                shoppingList.append(item)
                print("'\(item)' added to shopping list.")
            } else {
                print("Invalid item.")
            }
            
        case "2":
            if shoppingList.isEmpty {
                print("Shopping list is empty.")
            } else {
                print("Current list:")
                for (index, item) in shoppingList.enumerated() {
                    print("\(index + 1). \(item)")
                }
                print("Enter the number of item to remove:")
                if let input = readLine(), let index = Int(input), index > 0 && index <= shoppingList.count {
                    let removedItem = shoppingList.remove(at: index - 1)
                    print("'\(removedItem)' removed from shopping list.")
                } else {
                    print("Invalid selection.")
                }
            }
            
        case "3":
            if shoppingList.isEmpty {
                print("Shopping list is empty.")
            } else {
                print("\n=== CURRENT SHOPPING LIST ===")
                for (index, item) in shoppingList.enumerated() {
                    print("\(index + 1). \(item)")
                }
            }
            
        case "4":
            shouldContinue = false
            print("Thank you for using Shopping List Manager!")
            
        default:
            print("Invalid option. Please choose 1-4.")
        }
    }
}
*/
// Problem 5

/*
 print("Enter a sentence:")
if let sentence = readLine(), !sentence.isEmpty {
    
    let cleanedSentence = sentence.lowercased()
        .components(separatedBy: CharacterSet.punctuationCharacters)
        .joined()
    
   
    let words = cleanedSentence.components(separatedBy: .whitespacesAndNewlines)
        .filter { !$0.isEmpty }
    
    
    var wordFrequency: [String: Int] = [:]
    
    for word in words {
        wordFrequency[word, default: 0] += 1
    }
    
   
    print("\nWord Frequencies:")
    if wordFrequency.isEmpty {
        print("No words found.")
    } else {
        for (word, count) in wordFrequency {
            print("'\(word)': \(count) time(s)")
        }
    }
} else {
    print("No sentence entered.")
}
*/

// Problem 6
/*
func fibonacci(_ n: Int) -> [Int] {

    if n <= 0 {
        return []
    }
    
   
    if n == 1 {
        return [0]
    }
    if n == 2 {
        return [0, 1]
    }
    
    
    var sequence = [0, 1]
    for i in 2..<n {
        let nextNumber = sequence[i-1] + sequence[i-2]
        sequence.append(nextNumber)
    }
    
    return sequence
}


print("First 10 Fibonacci numbers: \(fibonacci(10))")
print("First 5 Fibonacci numbers: \(fibonacci(5))")
print("Fibonacci with n = 0: \(fibonacci(0))")
*/

//Problem 7

/*
struct Student {
    let name: String
    let score: Int
}

var students: [Student] = []


print("Enter student data (name and score). Type 'done' when finished:")

while true {
    print("Student name (or 'done' to finish):")
    guard let name = readLine(), !name.isEmpty, name.lowercased() != "done" else {
        break
    }
    
    print("Score for \(name):")
    guard let scoreInput = readLine(), let score = Int(scoreInput) else {
        print("Invalid score. Please try again.")
        continue
    }
    
    students.append(Student(name: name, score: score))
}


if students.isEmpty {
    print("No student data entered.")
} else {
    
    let totalScore = students.reduce(0) { $0 + $1.score }
    let averageScore = Double(totalScore) / Double(students.count)
    
    let highestScore = students.max(by: { $0.score < $1.score })!.score
    let lowestScore = students.min(by: { $0.score < $1.score })!.score
    
   
    print("\n=== GRADE REPORT ===")
    print("Average Score: \(String(format: "%.2f", averageScore))")
    print("Highest Score: \(highestScore)")
    print("Lowest Score: \(lowestScore)")
    print("\nStudent Performance:")
    
    for student in students {
        let status = student.score >= Int(averageScore) ? "ABOVE average" : "BELOW average"
        print("\(student.name): \(student.score) - \(status)")
    }
}
*/

//Problem 8

/*
func isPalindrome(_ text: String) -> Bool {
   
    let cleanedText = text.lowercased()
        .components(separatedBy: CharacterSet.alphanumerics.inverted)
        .joined()
    
    
    return cleanedText == String(cleanedText.reversed())
}

let testStrings = ["A man, a plan, a canal: Panama", "racecar", "hello", "Was it a car or a cat I saw?"]

for testString in testStrings {
    print("'\(testString)' is palindrome: \(isPalindrome(testString))")
}
*/

//Problem 9

/*
func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}

func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}

func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}

func divide(_ a: Double, _ b: Double) -> Double {
    return a / b
}

var shouldContinue = true

print("Welcome to Simple Calculator!")

while shouldContinue {
    print("\nEnter first number:")
    guard let num1Input = readLine(), let num1 = Double(num1Input) else {
        print("Invalid number. Please try again.")
        continue
    }
    
    print("Enter second number:")
    guard let num2Input = readLine(), let num2 = Double(num2Input) else {
        print("Invalid number. Please try again.")
        continue
    }
    
    print("Choose operation (+, -, *, /):")
    guard let operation = readLine() else {
        print("Invalid operation.")
        continue
    }
    
    var result: Double?
    

    switch operation {
    case "+":
        result = add(num1, num2)
    case "-":
        result = subtract(num1, num2)
    case "*":
        result = multiply(num1, num2)
    case "/":
        if num2 == 0 {
            print("Error: Division by zero is not allowed.")
        } else {
            result = divide(num1, num2)
        }
    default:
        print("Invalid operation. Please use +, -, *, or /.")
    }
    

    if let result = result {
        print("Result: \(num1) \(operation) \(num2) = \(result)")
    }
    
   
    print("\nPerform another calculation? (yes/no):")
    if let continueInput = readLine()?.lowercased() {
        shouldContinue = continueInput == "yes" || continueInput == "y"
    }
}

print("Thank you for using Simple Calculator!")
*/

//Problem 10

/*
func hasUniqueCharacters(_ text: String) -> Bool {
    var characterSet = Set<Character>()
    
    for char in text {
       
        if characterSet.contains(char) {
            return false
        }
        characterSet.insert(char)
    }
    
    return true
}


let testStrings = ["abcde", "hello", "AaBbCc", "unique", "swift"]

for testString in testStrings {
    print("'\(testString)' has all unique characters: \(hasUniqueCharacters(testString))")
}
*/
