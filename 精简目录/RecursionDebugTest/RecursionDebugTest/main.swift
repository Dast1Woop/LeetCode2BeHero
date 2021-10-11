//
//  main.swift
//  RecursionDebugTest
//
//  Created by LongMa on 2021/9/2.
//

import Foundation

print("Hello, World!")

func myPrint(count: Int, content:String){
    var str = ""
    for _ in 0..<count {
        str += "**"
    }
    print(str + content)
}

var count = 0
func myPrintCountPP(count: inout Int, content:String){
    print(count, content)
    count += 1
}

func myPrintCountMM(count: inout Int, content:String){
    print(count, content)
    count -= 1
}

func recursionFunc(n:Int)->Int{
    myPrint(count: count, content: "\(n)")
    count += 1
    
    if 0 == n {
        count -= 1
        myPrint(count: count, content: "\(n)")
        
        return 1
    }
    
    return recursionFunc(n: n-1) + 1
}

let res = recursionFunc(n: 5)
print(res)
