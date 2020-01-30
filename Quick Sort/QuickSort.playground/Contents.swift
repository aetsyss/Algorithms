import Foundation

func quickSort(arr: [Int]) -> [Int] {
    if arr.isEmpty { return [] }
    var a = arr
    quickSort(arr: &a, l: 0, h: a.count - 1)
    return a
}

func quickSort(arr: inout [Int], l: Int, h: Int) {
    if l >= h { return }

    let pivot = reorder(arr: &arr, l: l, h: h)
    quickSort(arr: &arr, l: l, h: pivot - 1)
    quickSort(arr: &arr, l: pivot + 1, h: h)
}

func reorder(arr: inout [Int], l: Int, h: Int) -> Int {
    var pivot = h
    var i = l

    while i < pivot {
        if arr[i] > arr[pivot] {
            let tmp = arr[i]
            arr[i] = arr[pivot - 1]
            arr[pivot - 1] = arr[pivot]
            arr[pivot] = tmp
            pivot -= 1
        } else {
            i += 1
        }
    }

    return pivot
}

let arr = [4, 2, 8, 9, 0, 1, 3, 5]
quickSort(arr: arr)
