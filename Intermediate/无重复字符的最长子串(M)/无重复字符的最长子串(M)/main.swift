//
//  main.swift
//  无重复字符的最长子串(M)
//
//  Created by LongMa on 2021/7/27.
/*
 给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。
 
  
 
 示例 1:
 
 输入: s = "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:
 
 输入: s = "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:
 
 输入: s = "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 示例 4:
 
 输入: s = ""
 输出: 0
  
 
 提示：
 
 0 <= s.length <= 5 * 10^4
 s 由英文字母、数字、符号和空格组成
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
//        return lengthOfLongestSubstring1(s)
//        return lengthOfLongestSubstring2(s)
        return lengthOfLongestSubstring3(s)
    }
    
    //暴力解法，会提示超时
    func lengthOfLongestSubstring1(_ s: String) -> Int {
        if 1 == s.count {
            return 1
        }
        
        var tempLength = 0
        //优化点：tempLength >= 剩余未遍历字符数时，return
        for i in 0..<s.count{
            let leftCount = s.count - i
            if leftCount <= tempLength {
                return tempLength
            }
            
            //注意 set 创建的位置，😓
            var set = Set<Character>()
            for j in i..<s.count {
                let index = s.index(s.startIndex, offsetBy: j)
                let cha = s[index]
                //                print(cha)
                let re = set.insert(cha)
                if false == re.inserted {
                    break;
                }
                
                //不能放在上面 if 里面，😓
                if set.count > tempLength {
                    tempLength = set.count
                }
                
                //                print("set:",set)
            }
        }
        
        return tempLength
    }
    
    //窗口法：双指针（start、end）+dic缓存被遍历字符（key：字符，value：下标+1）。当end右移后的字符，与 [start, end] 窗口内字符有重复时，start指针移到窗口内重复字符的下一位（dic内key对应value值）。直到遍历一遍结束,return所有历史窗口的最大长度。因只需遍历一遍，故复杂度为O(n)。
    func lengthOfLongestSubstring2(_ s: String) -> Int {
        var dic = [Character:Int]()
        var start = 0,end = 0,longestLen = 0
        
        if s.count <= 1 {
            return s.count
        }
        
        while end < s.count {
            
            //swift的字符串是双向链表，访问某个元素复杂度不是o(1)，所以遍历不适合频繁使用index方法。这个性能影响要牢记于心（by唐巍swfit进阶）
            let index = s.index(s.startIndex, offsetBy: end)
            let char = s[index]
            
            //检测是否与窗口内字符重复
            if dic.keys.contains(char) && dic[char]! > start{
                //if  dic[char]! > start {//不能 ==
                    start = dic[char]!
                //}else{//不能忘记这种情况，否则“tmmzuxt”结果是错的。倒不如if放在最外层加 && 判断
                //longestLen = max(end - start + 1,longestLen)
                //}
            }else{
                // + 1，因为end处此时是 非重复字符;end为0时，longestLen会被赋值1
                longestLen = max(end - start + 1,longestLen)
            }
            
            //缓存字符
            dic[char] = end + 1
            
            //右移
            end += 1
        }
        
        return longestLen
    }
    
    /*执行用时：
     32 ms
     , 在所有 Swift 提交中击败了
     88.03%
     的用户
     内存消耗：
     14.2 MB
     , 在所有 Swift 提交中击败了
     36.42%
     的用户
     */
    func lengthOfLongestSubstring3(_ s: String) -> Int {
        var dic = [Character:Int]()
        var start = 0,end = 0,longestLen = 0
        
        if s.count <= 1 {
            return s.count
        }
        
        //字符串序列转为数组
        let arr = Array.init(s)
        while end < arr.count {
            let char = arr[end]
            
            //检测是否与窗口内字符重复
            if dic.keys.contains(char) && dic[char]! > start{
                //if  dic[char]! > start {//不能 ==
                    start = dic[char]!
                //}else{//不能忘记这种情况，否则“tmmzuxt”结果是错的。倒不如if放在最外层加 && 判断
                //longestLen = max(end - start + 1,longestLen)
                //}
            }else{
                // + 1，因为end处此时是 非重复字符;end为0时，longestLen会被赋值1
                longestLen = max(end - start + 1,longestLen)
            }
            
            //缓存字符
            dic[char] = end + 1
            
            //右移
            end += 1
        }
        
        return longestLen
    }
    
}

let so = Solution()
let len1 = so.lengthOfLongestSubstring("abcabcbb")
print(len1)

let len2 = so.lengthOfLongestSubstring("bbbb")
print(len2)

let len3 = so.lengthOfLongestSubstring("pwwkew")
print(len3)

let len4 = so.lengthOfLongestSubstring("")
print(len4)

let len5 = so.lengthOfLongestSubstring(" ")
print(len5)

let len6 = so.lengthOfLongestSubstring("au")
print(len6)

let len7 = so.lengthOfLongestSubstring("tmmzuxt")
print(len7)
