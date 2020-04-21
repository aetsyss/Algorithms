import Foundation

class MyCircularQueue {

    var arr: [Int]
    private var head: Int
    private var tail: Int
    private let size: Int

    /** Initialize your data structure here. Set the size of the queue to be k. */
    init(_ k: Int) {
        arr = Array<Int>(repeating: 0, count: k)
        head = -1
        tail = -1
        size = k
    }

    /** Insert an element into the circular queue. Return true if the operation is successful. */
    func enQueue(_ value: Int) -> Bool {
        if isFull() { return false }
        if isEmpty() { head = 0 }
        tail = (tail + 1) % size
        arr[tail] = value
        return true
    }

    /** Delete an element from the circular queue. Return true if the operation is successful. */
    func deQueue() -> Bool {
        if isEmpty() { return false }
        if head == tail {
            head = -1
            tail = -1
        } else {
            head = (head + 1) % size
        }
        return true
    }

    /** Get the front item from the queue. */
    func Front() -> Int {
        if isEmpty() { return -1 }
        return arr[head]
    }

    /** Get the last item from the queue. */
    func Rear() -> Int {
        if isEmpty() { return -1 }
        return arr[tail]
    }

    /** Checks whether the circular queue is empty or not. */
    func isEmpty() -> Bool {
        return head == -1 && tail == -1
    }

    /** Checks whether the circular queue is full or not. */
    func isFull() -> Bool {
        //return tail - head == size - 1 || tail - head == -1
        return count == size
    }

    var count: Int {
        return isEmpty()
            ? 0
            : head <= tail
                ? tail - head + 1
                : tail + 1 + size - head
    }
}

class MovingAverage {
    private let q: MyCircularQueue
    private var summ: Int

    /** Initialize your data structure here. */
    init(_ size: Int) {
        q = MyCircularQueue(size)
        summ = 0
    }

    func next(_ val: Int) -> Double {
        if q.isFull() {
            summ -= q.Front()
            q.deQueue()
        }

        q.enQueue(val)
        summ += val
        return Double(summ) / Double(q.count)
    }
}

let ma = MovingAverage(1)
ma.next(-1)
