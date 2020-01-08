import Foundation

struct Room {
    let start: Int
    let end: Int
}

func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    let arr = intervals.sorted {
        $0.first! < $1.first!
    }
    var meetingRooms: [Int] = [] // end times

    for i in 0..<arr.count {
        if !meetingRooms.isEmpty, meetingRooms[0] <= arr[i][0] {
            meetingRooms.remove(at: 0)
        }
        meetingRooms.append(arr[i][1])
        meetingRooms.sort(by: <)
    }

    return meetingRooms.count
}

minMeetingRooms([[1293,2986],[848,3846],[4284,5907],[4466,4781],[518,2918],[300,5870]]) //4
