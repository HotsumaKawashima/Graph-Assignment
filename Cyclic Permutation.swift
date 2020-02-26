import Foundation

var input = "2\n8\n3 2 7 8 1 4 5 6\n10\n2 1 3 4 5 6 7 9 10 8"

var array = [[Int]]()
var testCount = 0

func initialize(_ input: String) {
    var row = input.components(separatedBy: .newlines)
    testCount = Int(row[0])!
    for i in 0..<testCount {
        var rowIndex = i * 2 + 1
        var permutationSize = Int(row[rowIndex])!
        var permutationRow = row[rowIndex + 1].components(separatedBy: " ")
        var temp = [Int](repeating: -1, count: permutationSize)
        for n in 0..<permutationSize  {
            temp[n] = Int(permutationRow[n])! - 1
        }
        array.append(temp)
    }
}

var seen = [Bool]()
func search(_ permutation:[Int]) -> Int {
    seen = [Bool](repeating: false, count: permutation.count)
    var count = 0

    for i in 0..<permutation.count {
        if seen[i] {
            continue
        }
        count += 1
        walk(permutation, i)
    }
    
    return count
}

func walk(_ permutation:[Int], _ index: Int) {
    if seen[index] {
        return
    }
    seen[index] = true
    walk(permutation, permutation[index])
}

initialize(input)

for i in 0..<testCount {
    print(search(array[i]))
}