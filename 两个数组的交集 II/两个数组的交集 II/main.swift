//
//  main.swift
//  两个数组的交集 II
//
//  Created by LongMa on 2021/7/22.
/*两个数组的交集 II
 给定两个数组，编写一个函数来计算它们的交集。

  

 示例 1：

 输入：nums1 = [1,2,2,1], nums2 = [2,2]
 输出：[2,2]
 示例 2:

 输入：nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 输出：[4,9]
  

 说明：

 输出结果中每个元素出现的次数，应与元素在两个数组中出现次数的最小值一致。
 我们可以不考虑输出结果的顺序。
 进阶：

 如果给定的数组已经排好序呢？你将如何优化你的算法？
 如果 nums1 的大小比 nums2 小很多，哪种方法更优？
 如果 nums2 的元素存储在磁盘上，内存是有限的，并且你不能一次加载所有的元素到内存中，你该怎么办？

 作者：力扣 (LeetCode)
 链接：https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/x2y0c2/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。*/

import Foundation

/*综合性对比：两层for循环法（intersect） < 借助字典法（intersect1） < 双指针法（intersect2）
 */
func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    let nums1 = nums1.sorted()
    let nums2 = nums2.sorted()
    if nums1.count >= nums2.count {
//       return subInterseect(longArr: nums1, shortArr: nums2)
//        return subInterseect1(longArr: nums1, shortArr: nums2)
        return subInterseect2(longArr: nums1, shortArr: nums2)
    }else{
//       return subInterseect(longArr: nums2, shortArr: nums1)
//        return subInterseect1(longArr: nums2, shortArr: nums1)
        return subInterseect2(longArr: nums2, shortArr: nums1)
    }
}

/*执行用时：
 36 ms
 , 在所有 Swift 提交中击败了
 49.38%
 的用户
 内存消耗：
 13.9 MB
 , 在所有 Swift 提交中击败了
 21.88%
 的用户
 */
func subInterseect(longArr:[Int], shortArr:[Int])-> [Int]{
    var arr = [Int]()
    var index = 0
    
    //跟双指针相比，不够高效，可能多很多次没必要的对比。eg：[1,5,6,10],[1,7,10],7-》10时，10跟5、6的对比就是没必要的。
    for i in 0..<shortArr.count {
        for j in index..<longArr.count{
            if shortArr[i] == longArr[j] {
                index = j+1
                arr.insert(shortArr[i], at: 0)
                
                //莫忘记！！！结束里层循环！
                break;
            }
        }
    }
    return arr
}


/*执行用时：
 32 ms
 , 在所有 Swift 提交中击败了
 54.38%
 的用户
 内存消耗：
 14.1 MB
 , 在所有 Swift 提交中击败了
 5.00%
 的用户
 */
func subInterseect1(longArr:[Int], shortArr:[Int]) -> [Int]{
    var arr = [Int]()
    var dic = [Int:Int]()
    for i in 0..<longArr.count{
        let item = longArr[i]
        if dic.keys.contains(item) {
            dic[item]! += 1
        }else{
            dic[item] = 1
        }
    }
    
    for i in 0..<shortArr.count{
        let item = shortArr[i]
        if dic.keys.contains(item) {
            if dic[item]! > 0 {
                dic[item]! -= 1
                arr.insert(item, at: 0)
            }
        }
    }
    
    return arr
}

/*双指针法
 执行用时：
 28 ms
 , 在所有 Swift 提交中击败了
 75.63%
 的用户
 内存消耗：
 13.8 MB
 , 在所有 Swift 提交中击败了
 50.00%
 的用户
 */
func subInterseect2(longArr:[Int], shortArr:[Int])-> [Int]{
    var iShort = 0, jLong = 0
    var arr = [Int]()
    while iShort < shortArr.count && jLong < longArr.count {
        let itemS = shortArr[iShort]
        let itemL = longArr[jLong]
        
        if itemS == itemL {
            arr.insert(itemS, at: 0)
            iShort += 1
            jLong += 1
        }else if itemS < itemL{
            iShort += 1
        }else{//itemS > itemL
            jLong += 1
        }
    }
    
    return arr
}

let arr0 = intersect([2,2], [1,2,2,1])
print(arr0)

let arr1 = intersect([2,2,2], [1,2,2,1])
print(arr1)

let arr02 = intersect([4,9,5], [9,4,9,8,4])
print(arr02)
