import Foundation

public class Robot {
    // Returns true if the cell in front is open and robot moves into the cell.
    // Returns false if the cell in front is blocked and robot stays in the current cell.
    public func move() -> Bool { return true }

    // Robot will stay in the same cell after calling turnLeft/turnRight.
    // Each turn will be 90 degrees.
    public func turnLeft() {}
    public func turnRight() {}

    // Clean the current cell.
    public func clean() {}
}

class Solution {
    private var visited: Set<[Int: Int]> = Set()

    //                 up       right    down    left
    let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]

    func cleanRoom(_ robot: Robot) {
        cleanRoom(robot, 0, 0, 0)
    }

    private func cleanRoom(_ robot: Robot, _ i: Int, _ j: Int, _ d: Int) {
        visited.insert([i: j])
        robot.clean()

        for k in 0..<4 {

            let kk = (k + d) % 4

            let ii = i + directions[kk].0
            let jj = j + directions[kk].1

            if !visited.contains([ii: jj]) && robot.move() == true {
                cleanRoom(robot, ii, jj, kk)

                robot.turnRight()
                robot.turnRight()
                robot.move()
                robot.turnRight()
                robot.turnRight()
            }

            robot.turnRight()
        }
    }
}
