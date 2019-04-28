import UIKit


func prefixToPostfix(prefixes: [String]) -> [String] {
  // Write your code here
  let s = Stack<String>()
  for value in prefixes.reversed(){
    if isOperator(value) {
      var temp = ""
      if let op1 = s.top() {
        s.pop()
        if let op2 = s.top() {
          s.pop()
          temp = op1 + op2
        }
      }
      s.push(element: temp)
    } else {
      s.push(element: value)
    }
  }
  return  s.stackArray
}


func isOperator(_ char : String ) -> Bool{
  var isOp = false
  switch char {
  case "+","-","*","/":
    isOp = true
  default:
    isOp = false
  }
  return isOp
}

class Stack<T> {
  
  var stackArray = [T]()
  
  func push(element : T) {
    self.stackArray.append(element)
  }
  
  func pop() {
    stackArray.removeLast()
  }
  
  func top() -> T? {
    return stackArray.last
  }
  
  func isEmpty() -> Bool {
    if stackArray.isEmpty {
      return true
    }
    return false
  }
  
  func printStack(){
    print("inside")
    for item in stackArray {
      print("item\(item)")
    }
    
  }
}
