//
//  main.swift
//  只出现一次的数字
//
//  Created by LongMa on 2021/7/19.
/*
 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

 说明：

 你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？

 示例 1:

 输入: [2,2,1]
 输出: 1
 示例 2:

 输入: [4,1,2,1,2]
 输出: 4

 作者：力扣 (LeetCode)
 链接：https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/x21ib6/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。*/

import Foundation

func singleNumber(_ nums: [Int]) -> Int {
//   return singleNumber1(nums)
    return singleNumber2(nums)
}

func singleNumber1(_ nums: [Int]) -> Int {
    var set = Set<Int>()
    for i in 0..<nums.count{
        let res = set.insert(nums[i])
        if !res.inserted {
            set.remove(nums[i])
        }
    }
    return set.first ?? -1
}

//a^0 = a;c a^a = 0; a^b^c = a^c^b;
func singleNumber2(_ nums: [Int]) -> Int {
    var res = 0
    for i in 0..<nums.count{
        res = nums[i] ^ res
    }
    return res
}

let res = singleNumber([2,1,1])
print(res)

let res1 = singleNumber([4,1,2,1,2])
print(res1)
