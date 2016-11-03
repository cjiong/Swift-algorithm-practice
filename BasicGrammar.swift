
import UIKit

//基本语法

func swap(chars:[Character], p: Int, q: Int) {
	var temp = chars[p]
	chars[p] = chars[q]
	chars[q] = temp
}

// Assume array is a character array and it has enough elements
swap(array, p: 0, q: 1)


// 问题1: 第一个参数前应该加上 inout 关键字。
// 原因: 在Swift中，struct按值传递，class 按引用传递；array和dictionary都是struct，所以要在其前部加上inout关键字，表示是按引用传递。
// 问题2: p和q之前应该加入下划线。
// 原因: Swift默认函数的第一个参数是局部(local)变量,而后续的参数都是外部(external)变量，外部变量必须声明。如果在p和q之前加上下划线，则在调用函数时无需声明外部变量，调用起来更加简便。
// 问题3: temp前的var应该改为let。
// 原因: temp并未更改。

// 修改后的代码
func swap( chars: inout [Character], _ p: Int, _ q: Int) {
    let temp = chars[p]
    chars[p] = chars[q]
    chars[q] = temp
}

// 调用
swap(array, 0, 1)


//循环

// for loop
for name in names {}
for i in 0 ... names.count - 1 {}
for i in 0 ..< names.count {}
for _ in 0 ..< names.count {}
for name in names.reverse() {}
for i in 0.stride(through: names.count - 1, by: 2) {}
for i in 0.stride(to: names.count, by: 2) {}

// while loop
var i = 0
while i < names.count {}

repeat { } while i < names.count



// 排序

nums.sortedInPlace()

var sortedNums = nums.sorted()

timeIntervals.sortedInPlace({ $0.startTime < $1.startTime })

let key = Array(dict.keys)
var sortedKeys = key.sort() {
    let value0 = dict[$0]
    let value1 = dict[$1]
    return value0 < value1
}


// Guard

//使用for循环
// Returns the index of the first occurrence of needle in haystack
// or -1 if needle is not part of haystack
func strStr(haystack: String, _ needle: String) -> Int {
    var hChars = [Character](haystack.characters)
    var nChars = [Character](needle.characters)
    
    if hChars.count < nChars.count {
        return -1
    }
    
    if hChars.count == 0 {
        return -1
    }
    
    for i in 0 ... hChars.count - nChars.count {
        if hChars[i] == nChars[0] {
            for j in 0 ..< nChars.count {
                if hChars[i + j] != nChars[j] {
                    break
                } else {
                    if j == nChars.count - 1 {
                        return i
                    }
                }
            }
        }
    }
    return -1
}


//使用Guard
// Returns the index of the first occurrence of needle in haystack
// or -1 if needle is not part of haystack
func strStr(haystack: String, _ needle: String) -> Int {
    var hChars = [Character](haystack.characters)
    var nChars = [Character](needle.characters)
    
    guard hChars.count >= nChars.count else {
        return -1
    }
    
    if nChars.count == 0 {
        return 0
    }
    
    for i in 0 ... hChars.count - nChars.count {
        guard hChars[i] == nChars[0] else {
            continue
        }
        
        for j in 0 ..< nChars.count {
            guard hChars[i + j] == nChars[j] else {
                break
            }
            
            if j == nChars.count - 1 {
                return i
            }
        }
    }
    
    return -1
}























