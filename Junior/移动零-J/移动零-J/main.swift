//
//  main.swift
//  移动零-J
//
//  Created by LongMa on 2021/7/29.
/*给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
 
 示例:

 输入: [0,1,0,3,12]
 输出: [1,3,12,0,0]
 说明:

 必须在原数组上操作，不能拷贝额外的数组。
 尽量减少操作次数。

 作者：力扣 (LeetCode)
 链接：https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/x2ba4i/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

import Foundation

/*
 执行用时：
 32 ms
 , 在所有 Swift 提交中击败了
 99.20%
 的用户
 内存消耗：
 14.1 MB
 , 在所有 Swift 提交中击败了
 65.42%
 的用户
 */
class Solution {
    
    /*双指针法：left，right。left从左往右找0，找到后，right从left+1位找非0，找到后，交换左右指针指向的值(交换后，如果右指针已经指向最后一个元素，return)。left继续往右找0，找到后，right从上次位置右移找非0。直到left到达倒数第2个元素，或right指针到达最后一个元素（非0交换，0结束）。
     */
    func moveZeroes(_ nums: inout [Int]) {
        var left = 0,right = 0
        while left < nums.count - 1 {
            if nums[left] == 0 {
                right = max(right + 1, left + 1)
                
                while right < nums.count {
                    if nums[right] != 0 {
                        nums[left] = nums[left] ^ nums[right]
                        nums[right] = nums[left] ^ nums[right]
                        nums[left] = nums[left] ^ nums[right]
                        
                        //😓，交换后，要移动左指针了，不能忘记 break！
                        if right == nums.count - 1 {
                            return
                        }else{
                            break
                        }
                    }else{
                    }
                    
                    if right + 1 == nums.count {
                        return
                    }else{
                        right += 1
                    }
                }
            }else{
            }
            
            //自增是必须的，不能放在上面else里！否则可能死循环（eg:[1,0,2,4,0,0,5,6]）！
            left += 1
        }
    }
}

let so = Solution.init()

var arr0 = [0]
so.moveZeroes(&arr0)
print(arr0)


var arr1 = [1]
so.moveZeroes(&arr1)
print(arr1)

var arr2 = [1,2]
so.moveZeroes(&arr2)
print(arr2)

var arr3 = [1,0]
so.moveZeroes(&arr3)
print(arr3)

var arr4 = [1,0,2]
so.moveZeroes(&arr4)
print(arr4)

var arr5 = [1,0,2,4,0,0,5,6]
so.moveZeroes(&arr5)
print(arr5)
