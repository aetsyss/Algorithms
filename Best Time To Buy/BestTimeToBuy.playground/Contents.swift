import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    var min_price = Int.max
    var max_proffit = 0

    for n in prices {
        if n < min_price {
            min_price = n
        } else if n - min_price > max_proffit {
            max_proffit = n - min_price
        }
    }

    return max_proffit
}

maxProfit([7,6,4,3,1])
