import Foundation

class MyCircularQueue {

    private var arr: [Int]
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
        return tail - head == size - 1 || tail - head == -1
    }
}

let q = MyCircularQueue(3)
q.enQueue(1)
q.enQueue(2)
q.enQueue(3)
q.enQueue(4)
q.Rear()
q.isFull()
q.deQueue()
q.enQueue(4)
q.Rear()
