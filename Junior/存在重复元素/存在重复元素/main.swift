//
//  main.swift
//  存在重复元素
//
//  Created by LongMa on 2021/7/18.
/*给定一个整数数组，判断是否存在重复元素。
 
 如果存在一值在数组中出现至少两次，函数返回 true 。如果数组中每个元素都不相同，则返回 false 。
 
 示例 1:
 
 输入: [1,2,3,1]
 输出: true
 示例 2:
 
 输入: [1,2,3,4]
 输出: false
 示例 3:
 
 输入: [1,1,1,3,3,4,3,2,4,2]
 输出: true
 
 作者：力扣 (LeetCode)
 链接：https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/x248f5/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。*/

import Foundation

func containsDuplicate(_ nums: [Int]) -> Bool {
    var set = Set<Int>.init()
    for i in 0..<nums.count{
        let n = nums[i]
        
        //(true, newMember) if newMember was not contained in the set. If an element equal to newMember was already contained in the set, the method returns (false, oldMember), where oldMember is the element that was equal to newMember. In some cases, oldMember may be distinguishable from newMember by identity comparison or some other means.
        let res = set.insert(n)
        if res.inserted == false {
            return true
        }
    }

    return false
}

let res0 = containsDuplicate([1,2,3,1])
print(res0)
let res1 = containsDuplicate([1,2,3,4])
print(res1)
let res2 = containsDuplicate([1,1,1,3,3,4,3,2,4,2])
print(res2)





