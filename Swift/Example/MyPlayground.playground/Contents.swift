import Cocoa
//
//Input: nums = [2,7,11,15], target = 9
//Output: [0,1]
//Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

class Solution {
  // MARK: - Ý tưởng
  /*
   - duyệt phần từ theo dang dictionary sẽ trả về vị trí và giá trị
   - Tạo biến cờ bằng taget - giá trị

   */
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
      var numToIndex: [Int: Int] = [:]
      for (i, num) in nums.enumerated() {
        let complement = target - num
        if let index = numToIndex[target - num] {

          print(complement)
        }
        }
      return []
    }
}
