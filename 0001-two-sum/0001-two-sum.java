class Solution {
  public int[] twoSum(int[] nums, int target) {
		int index_1 = 0;
		int index_2 = 0;
		for (int i = 0; i < nums.length; i++) {
			for (int j = i + 1; j < nums.length; j++) {
				if (nums[i] + nums[j] == target) {
					index_1 = i;
					index_2 = j;
					return new int[] {index_1, index_2};
				}
			}
		}
		return new int[] {};
    }
}