//
//  main.swift
//  Junior - the best time to buy or sell stocks
//
//  Created by LongMa on 2021/7/14.
//

import Foundation

let lf = 10000+1
let lr = -1

//低买高卖，为处理边界问题，定义了左值为最大，右值为最小，看了评论后，😭了。数学思维太厉害了，可以精简为 “计算连续两数之差，为正就加入收益” 即可。
func maxProfit(_ prices: [Int]) -> Int {
    var totalProfit = 0, buyPrice = 0, soldPrice = 0
    
    for i in 0..<prices.count{
        let crt = prices[i]
        var res:(isJiDian:Bool,type:Int)?
        
        if i == 0 {
            res = isJiDianPoint(crt: crt, lastDiff: lf, nextDiff: nextDiffFrom(crtIndex: i, arr: prices))
            
        }else if i == prices.count - 1{
            res = isJiDianPoint(crt: crt, lastDiff: lastDiffFrom(crtIndex: i, arr: prices), nextDiff: lr)
        }else{
            res = isJiDianPoint(crt: crt, lastDiff: lastDiffFrom(crtIndex: i, arr: prices), nextDiff: nextDiffFrom(crtIndex: i, arr: prices))
        }
        
        if let res = res{
            if res.isJiDian{
                
                //min
                if res.type == 0 {
                    buyPrice = crt
                }else{
                    //max
                    soldPrice = crt
                    totalProfit += (soldPrice - buyPrice)
                }
            }
        }
    }
    return totalProfit
}

///精简版
func maxProfit2(_ prices: [Int]) -> Int {
    var sum = 0
    for i in 0..<prices.count-1 {
        if prices[i + 1] > prices[i] {
            sum += (prices[i + 1] - prices[i])
        }
    }
    return sum
}

func lastDiffFrom(crtIndex:Int, arr:[Int])->Int{
//    for i in stride(from: crtIndex-1, through: 0, by: -1){
    for i in (0...(crtIndex-1)).reversed() {
        if arr[i] != arr[crtIndex] {
            return arr[i]
        }
    }
    return lf
}

func nextDiffFrom(crtIndex:Int, arr:[Int])->Int{
    for i in (crtIndex+1)...(arr.count-1){
        if arr[i] != arr[crtIndex] {
            return arr[i]
        }
    }
    return lr
}

func isJiDianPoint(crt:Int, lastDiff:Int, nextDiff:Int)->(isJiDian:Bool,type:Int){
    if(crt < lastDiff && crt < nextDiff)                         {
        return (true, 0)
    }
    if(crt > lastDiff && crt > nextDiff){
        return (true, 1)
    }
    
    return (false, 0)
}


let res = maxProfit2([1,2,3,4,5])
print("profit:",res)

let res1 = maxProfit2([5,4,3,2,1])
print("profit1:",res1)

let res2 = maxProfit2([5,5,1,2,1,1,2])
print("profit2:",res2)

let res3 = maxProfit2([7,1,5,3,4,6])
print("profit3:",res3)

let res4 = maxProfit2([7,6,4,3,1])
print("profit4:",res4)


