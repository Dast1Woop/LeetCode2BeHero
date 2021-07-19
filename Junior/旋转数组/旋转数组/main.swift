//
//  main.swift
//  旋转数组
//
/*给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。
 进阶：
 
 尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
 你可以使用空间复杂度为 O(1) 的 原地 算法解决这个问题吗？
 
 作者：力扣 (LeetCode)
 链接：https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/x2skh7/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */
//Created by LongMa on 2021/7/16.

import Foundation



func rotate(_ nums: inout [Int], _ k: Int) {
//    rotate1(&nums, k)
//    rotate2(&nums, k)
    
    //反转666
    rotate3(&nums, k)
}

//o(n^2)
func  rotate1(_ nums: inout [Int], _ k: Int){
    let lK = k%(nums.count)
    
    //o(n)
    for _ in 0..<lK {
        let last = nums.removeLast()
        
        //Complexity: O(n), where n is the length of the collection
        nums.insert(last, at: 0)
    }
    print(nums)
}

//leetcode运行结果居然是错的！可能是内存溢出了
func rotate2(_ nums: inout [Int], _ k: Int)  {
    let arrCount = nums.count
    let lK = k%(arrCount)
    
    let subArr1 = nums[0..<(arrCount-lK)]
    var subArr2 = nums[(arrCount-lK)..<arrCount]
    subArr2.append(contentsOf: subArr1)
    print(subArr2)
}


//o(n),没有嵌套，所以高效！
/*
 执行用时：
 308 ms
 , 在所有 Swift 提交中击败了
 89.44%
 的用户
 内存消耗：
 20.7 MB
 , 在所有 Swift 提交中击败了
 75.66%
 的用户
 */
func rotate3(_ nums: inout [Int], _ k: Int)  {
    let arrCount = nums.count
    let lK = k%(arrCount)
    
    //o(n)
    nums.reverse()
//    let arr1 = reverseArr1(arr: nums, leftIndex: 0, rightIndex: lK-1)
//    let arr2 = reverseArr1(arr: arr1, leftIndex: lK, rightIndex: arrCount-1)
//    print(arr2)
    
    //o(n)
    reverseArr2(arr: &nums, leftIndex: 0, rightIndex: lK-1)
    
    //o(n)
    reverseArr2(arr: &nums, leftIndex: lK, rightIndex: arrCount-1)
    print(nums)
}

func reverseArr1(arr:[Int], leftIndex:Int, rightIndex:Int)->[Int]{
    var left = leftIndex, right = rightIndex, arr = arr
    while left < right {
        let temp = arr[right]
        arr[right] = arr[left]
        arr[left] = temp
        
        left+=1
        right-=1
    }
    return arr
}

func reverseArr2(arr: inout [Int], leftIndex:Int, rightIndex:Int){
    var left = leftIndex, right = rightIndex
    while left < right {
        let temp = arr[right]
        arr[right] = arr[left]
        arr[left] = temp
        
        left+=1
        right-=1
    }
}

var arr0 = [1,2,3,4,5,6,7]
rotate(&arr0, 3)

var arr1 = [1,2,3,4,5,6,7]
rotate(&arr1, 9)

