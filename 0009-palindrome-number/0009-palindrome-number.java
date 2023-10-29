class Solution {
    public boolean isPalindrome(int x) {
       	if (x < 0) {
			return false;
		} 
		
		int temp = x;
		int y = 0;
		while (temp > 0) {
			int last_number = temp % 10;
			temp = temp / 10;
			y = y * 10 + last_number;
		}
		return y == x;
		}
}