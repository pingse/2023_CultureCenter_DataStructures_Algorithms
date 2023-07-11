//
//  K_lv1_Selection.swift
//  Algo_Pin
//
//  Selection Sort
//
//  Created by 김용주 on 2023/07/02.
//
import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    var result: [Int] = []

    for c in 0..<commands.count{
        let i = commands[c][0] - 1
        let j = commands[c][1] - 1
        let k = commands[c][2] - 1

        var arr: [Int] = []
        for b in i...j {
            arr.append(array[b])
        }
        
        if !((j-i)==0 && k==0){
            let max = arr.max() ?? 0
            
            var counts = [Int](repeating: 0, count: max + 1)
            
            for number in arr {
                counts[number] += 1
            }
            
            for a in 1...(counts.count-1) {
                counts[a] += counts[a - 1]
            }

            var sortedAraay = [Int](repeating: 0, count: arr.count)
            
            for number in arr {
                let cnt = counts[number]
                sortedAraay[cnt-1] = number
                counts[number] -= 1
            }
            
            result.append(sortedAraay[k])
        }
        else {
            result.append(arr[k])
        }
    }
    return result
}

