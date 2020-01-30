import Foundation

let arr = [3, 5, 1, 0, 4, 2, 7, 6]

func mergeSort(arr: [Int]) -> [Int] {
    if arr.isEmpty { return [] }
    return mergeSort(arr: arr, l: 0, h: arr.count - 1)
}

func mergeSort(arr: [Int], l: Int, h: Int) -> [Int] {
    if l == h { return [arr[l]] }
    let m = (l + h) / 2

    let left = mergeSort(arr: arr, l: l, h: m)
    let right = mergeSort(arr: arr, l: m+1, h: h)

    return merge(a: left, b: right)
}


func merge(a: [Int], b: [Int]) -> [Int] {
    var ret: [Int] = []

    var i = 0, j = 0
    while i < a.count && j < b.count {
        if a[i] <= b[j] {
            ret.append(a[i])
            i += 1
        } else {
            ret.append(b[j])
            j += 1
        }
    }

    while i < a.count { ret.append(a[i]); i += 1 }
    while j < b.count { ret.append(b[j]); j += 1 }

    return ret
}

merge(a: [2, 5, 8], b: [3, 4, 6, 7, 9])
mergeSort(arr: arr)
