import Foundation

// Non-Functional
var evenNumbers: [Int] = []
for i in 1...10 {
	if i % 2 == 0 {
		evenNumbers.append(i)
	}
}
evenNumbers

// Functional #1
func isEven(number: Int) -> Bool {
	return number % 2 == 0
}
evenNumbers = Array(1...10).filter(isEven)
evenNumbers

// Functional #2
evenNumbers = Array(1...10).filter { (number) in number % 2 == 0 }
evenNumbers

// Functional #3
evenNumbers = Array(1...10).filter { $0 % 2 == 0 }
evenNumbers

/* MAP */
var numbers = Array(1...10)
numbers = numbers.map { (i) -> Int in
	return i + 1
}
numbers

numbers = Array(1...10).map({ i -> Int in i + 1 })
numbers

numbers = Array(1...10).map({ i in i + 1 })
numbers

numbers = Array(1...10).map{ $0 + 1 }
numbers

/* FILTER */
let oddNumbers = Array(1...10).filter({ (i) -> Bool in
	return i % 2 != 0
})
oddNumbers

/* REDUCE */
let number = Array(1...10).reduce(0, { (result, i) -> Int in
	return result + i
})
number

/* PRACTICE */
let sampleWords = ["Cat", "Chicken", "fish", "Dog",
             "Mouse", "Guinea Pig", "monkey"]

typealias Entry = (String, [String])

func buildIndex(words: [String]) -> [Entry] {
	func firstLetter(word: String) -> String {
		let index = word.index(word.startIndex, offsetBy: 1)
		return word.substring(to: index).uppercased()
	}
	let letters = words.map { firstLetter(word: $0) }
	
	func distinct<T: Equatable>(source: [T]) -> [T] {
		let unique: [T] = source.reduce([]) { (result, element) -> [T] in
			if !result.contains(element) {
				return result + [element]
			}
			return result
		}
		return unique
	}
	let distinctLetters = distinct(source: letters)
	
	return distinctLetters.map { (letter) -> (String, [String]) in
		return (letter, words.filter({ firstLetter(word: $0) == letter }))
	}
}
print(buildIndex(words: sampleWords))
