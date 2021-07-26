//
//  main.swift
//  加一
//
//  Created by LongMa on 2021/7/26.
/*
 给定一个由 整数 组成的 非空 数组所表示的非负整数，在该数的基础上加一。

 最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。

 你可以假设除了整数 0 之外，这个整数不会以零开头。

  

 示例 1：

 输入：digits = [1,2,3]
 输出：[1,2,4]
 解释：输入数组表示数字 123。
 示例 2：

 输入：digits = [4,3,2,1]
 输出：[4,3,2,2]
 解释：输入数组表示数字 4321。
 示例 3：

 输入：digits = [0]
 输出：[1]
  

 提示：

 1 <= digits.length <= 100
 0 <= digits[i] <= 9


 作者：力扣 (LeetCode)
 链接：https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/x2cv1c/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

import Foundation


class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
//        return plusOne1(digits)
        return plusOne2(digits)
    }
    
    /*执行用时：
     4 ms
     , 在所有 Swift 提交中击败了
     97.85%
     的用户
     内存消耗：
     13.6 MB
     , 在所有 Swift 提交中击败了
     78.50%
     的用户
     */
    func plusOne1(_ digits: [Int]) -> [Int] {
        var arr = [Int]()
        var jinWei = 0
        
        for i in (0..<digits.count).reversed() {
            var sum = 0
            let num = digits[i]
            if i != digits.count - 1 {
                sum = num + jinWei
            }else{
                sum = num + 1
            }
            
            if sum > 9 {
                jinWei = sum/10
                sum = sum%10
            }else{
                jinWei = 0
            }
            
            arr.insert(sum, at: 0)
        }
        
        if jinWei != 0 {
            arr.insert(jinWei, at: 0)
        }
        
        return arr
    }
    
    /*执行用时：
     0 ms
     , 在所有 Swift 提交中击败了
     100.00%
     的用户
     内存消耗：
     13.9 MB
     , 在所有 Swift 提交中击败了
     7.89%
     的用户
     */
    func plusOne2(_ digits: [Int]) -> [Int] {
        var arr = digits
       
        for i in (0..<arr.count).reversed() {
            
            //某一位不是 9 时，此位 +1，结束计算
            if arr[i] != 9 {
                arr[i] += 1
                return arr
            }else{
                arr[i] = 0
            }
        }
        
        //全是9，所有位都被换为0了。前面加1位，值为1
        arr.insert(1, at: 0)
        return arr
    }
}

let so = Solution()
let arr = so.plusOne([1,3,2])
print(arr)

let arr1 = so.plusOne([9,9,9])
print(arr1)

let arr2 = so.plusOne([4,5,6])
print(arr2)
