//
//  H_Index_Counting.swift
//  Algo_2_week
//
//  Created by 김용주 on 2023/07/02.
//

import Foundation

func solution(_ citations:[Int]) -> Int {
    var result = 0
    let max = citations.max() ?? 0

    var arr = [Int](repeating: 0, count: max+1)

    for i in citations {
        arr[i] += 1
    }

    //내림차순
    for j in stride(from: arr.count-2, to: -1, by: -1) {
        arr[j] += arr[j+1]
    }

    var sortedArr = [Int](repeating: 0, count: citations.count)

    for k in citations {
        let cnt = arr[k]
        sortedArr[cnt-1] = k
        arr[k] -= 1
    }

    for n in 0..<sortedArr.count {
        if n >= sortedArr[n] {
            return n
        }
    }

    return sortedArr.count
}
