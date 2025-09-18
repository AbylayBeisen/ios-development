//
//  lab2.swift
//  
//
//  Created by Abylai  on 23.09.2025.
//

var arrayints: [Int] = [1, 2, 3]
var arraystring = Array(repeating: 10, count: 3)
var twoarrays = arrayints + arraystring
print (twoarrays)
var ShoppingList: [String] = ["Milk", "Bread", "Cheese"]
ShoppingList += ["Kfc", "pizza", "sugar"]
ShoppingList[0...3] = ["Juice"]
ShoppingList.insert("pizza", at: 1)
print ("the cart has \(ShoppingList.count) items in it and they are \(ShoppingList) and the first item is \(ShoppingList[0])")
ShoppingList.removeLast()
print(ShoppingList)
var set: Set<Int> = [1,2,3,4,5,6]
print(set)
var a = Set<Character>()
print("letters in a are \(a)")
var secret: Set<Int> = [1,2,3,4,5,6]
print(secret)
secret.insert(7)
var secret1: Set = [1,2,3,4,5,6]
print(secret1)
print("I have \(secret.count) secrets and he has \(secret1.count)")
if let s = secret.remove(1){
    print(s)
}
else{
    print("null")
}
print(secret)
secret.removeAll()
print(secret)
var Im: Dictionary<Int, String> = [1:"Audi", 2:"BMW", 3:"Mercedes"]
print(Im)
var Me: Dictionary<String, String> = ["Car":"Toyota", "Airplane":"Boeing"]
print(Me)
var Example: [Int:String] = [:]
print(Example)
var Example1 = [1:"Ice cream", 2:"Soda"]
print(Example1)
print("i have \(Example.count) and \(Example1.count) elements in dictionary")
Example[1] = "London"
Example[2] = "Berlin"
Example[2] = "Dublin"
print(Example)
