import Foundation

class MinHeap {
    private var arr: [Int] = []
    private var capacity: Int

    init(capacity: Int = .max) {
        self.capacity = capacity
    }

    func add(_ x: Int) {
        arr.append(x)
        heapify()

        if arr.count > capacity {
            poll()
        }

        print(arr)
    }

    private func heapify() {
        var last_index = arr.count - 1
        while (last_index - 1) / 2 >= 0 && arr[last_index] < arr[(last_index - 1) / 2] {
            arr.swapAt(last_index, (last_index - 1) / 2)
            last_index = (last_index - 1) / 2
        }
    }

    func poll() {
        arr[0] = arr.removeLast()

        var index = 0
        while 2 * index + 1 < arr.count || 2 * index + 2 < arr.count {
            let left = 2 * index + 1 < arr.count ? arr[2 * index + 1] : .max
            let right = 2 * index + 2 < arr.count ? arr[2 * index + 2] : .max

            if left < right {
                if arr[2 * index + 1] < arr[index] {
                    arr.swapAt(index, 2 * index + 1)
                    index = 2 * index + 1
                } else {
                    break
                }
            } else {
                if arr[2 * index + 2] < arr[index] {
                    arr.swapAt(index, 2 * index + 2)
                    index = 2 * index + 2
                } else {
                    break
                }
            }
        }
    }

    var min: Int? {
        return arr.first
    }
}

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        if nums.count < k {
            return 0
        }

        let minHeap = MinHeap(capacity: k)

        for n in nums {
            minHeap.add(n)
        }

        return minHeap.min ?? -1
    }
}

let s = Solution()
s.findKthLargest([3,2,1,5,6,4], 2)
