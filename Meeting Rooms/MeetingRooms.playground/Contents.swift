import Foundation

func canAttendMeetings(_ intervals: [[Int]]) -> Bool {

    if intervals.isEmpty {
        return true
    }

    let sorted = intervals.sorted(by: { $0[0] < $1[0] })

    for j in 0..<intervals.count - 1 {
        if sorted[j][1] > sorted[j+1][0] {
            return false
        }
    }

    return true
}

canAttendMeetings([[19,20],[1,10],[5,14]])
