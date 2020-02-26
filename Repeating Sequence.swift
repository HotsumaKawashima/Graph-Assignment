import Foundation

var input = "57 2"

var A = -1
var P = -1
var map = [Int: Int]()

func initialize(_ input: String) {
    var row = input.components(separatedBy: " ")
    A = Int(row[0])!
    P = Int(row[1])!
    map = [Int: Int]()
}

initialize(input)
//print(A)
//print(P)

var i = 0
while true {
    var result = 0
    while true {
        if A == 0 {
            break
        }
        var num = A % 10
        A = A / 10
        var temp = 1
        for i in 0..<P {
            temp = temp * num
        }
        result += temp
    }

    var index = map[result]
    //print(map)

    if index != nil {
        print(index! + 1)
        break
    }

    A = result
    map[result] = i
    i += 1
}

