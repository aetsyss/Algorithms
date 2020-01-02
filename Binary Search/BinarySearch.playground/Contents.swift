import UIKit

// index of, recursive
func indexRecursive(arr: [Int], target: Int) -> Int? {
    return indexRecursive(arr: arr, l: 0, h: arr.count, target: target)
}

func indexRecursive(arr: [Int], l: Int, h: Int, target: Int) -> Int? {
    if l >= h { return nil}

    let mid = l + (h - l) / 2

    if target < arr[mid] {
        return indexRecursive(arr: arr, l: l, h: mid, target: target)
    } else if target > arr[mid] {
        return indexRecursive(arr: arr, l: mid + 1, h: h, target: target)
    } else {
        return mid
    }
}

//test
indexRecursive(arr: [2, 3, 5, 6, 9], target: 6)

// index of, iterative
// TODO
