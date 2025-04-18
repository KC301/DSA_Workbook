fn two_sum(nums: Vec<i32>, target: i32) -> Vec<i32> {
    let mut indexed: Vec<(i32, usize)> = nums.iter().cloned().zip(0..).collect();
    indexed.sort_by_key(|&(num, _)| num);

    let (mut left, mut right) = (0, indexed.len() - 1);

    while left < right {
        let sum = indexed[left].0 + indexed[right].0;
        if sum == target {
            return vec![indexed[left].1 as i32, indexed[right].1 as i32];
        } else if sum < target {
            left += 1;
        } else {
            right -= 1;
        }
    }

    vec![]
}