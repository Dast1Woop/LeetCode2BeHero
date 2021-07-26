//
//  main.swift
//  两数相加
//
//  Created by LongMa on 2021/7/24.
/*给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。
 
 请你将两个数相加，并以相同形式返回一个表示和的链表。
 
 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 输入：l1 = [2,4,3], l2 = [5,6,4]
 输出：[7,0,8]
 解释：342 + 465 = 807.
 示例 2：
 
 输入：l1 = [0], l2 = [0]
 输出：[0]
 示例 3：
 
 输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 输出：[8,9,9,9,0,0,0,1]
  
 
 提示：
 
 每个链表中的节点数在范围 [1, 100] 内
 0 <= Node.val <= 9
 题目数据保证列表表示的数字不含前导零
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-two-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
class Solution {
    
    ///传入链表头节点，返回结果的头节点
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var jinwei = 0
        var headNode:ListNode?
        var lastNode:ListNode?
        var l1 = l1
        var l2 = l2
        
        while true {
            
            //都结束时
//            if l1?.next == nil && l2?.next == nil {//⚠️易错点：此条件是需要加的最后一步，不能不加
              if l1 == nil && l2 == nil {
                if jinwei > 0 {
                    let node = ListNode.init(jinwei, nil)
                    lastNode?.next = node
                }
                break;
            }
            
            //1st
            var num1 = 0, num2 = 0//即使有一个到尾部了，也可以认为val为0，参与加法运算
            if let l1 = l1 {
                num1 = l1.val
            }
            if let l2 = l2 {
                num2 = l2.val
            }
            var sum = num1 + num2 + jinwei//1/2st
            
            jinwei = sum/10
            sum = sum%10
            
            let tempNode = ListNode.init(sum, nil)
            
            //1st
            if headNode == nil {
                headNode = tempNode
                lastNode = tempNode
            }else{//2st+
                lastNode?.next = tempNode
                lastNode = tempNode
            }
            
            //指针右移
            l1 = l1?.next
            l2 = l2?.next
        }
        
        return headNode
    }
}

let node12 = ListNode.init(3, nil)
let node11 = ListNode.init(4, node12)
let node10 = ListNode.init(2, node11)

let node22 = ListNode.init(4, nil)
let node21 = ListNode.init(6, node22)
let node20 = ListNode.init(5, node21)

let so = Solution()
var node = so.addTwoNumbers(node10, node20)
while node != nil{
    print(node?.val as Any)
    node = node?.next
}
