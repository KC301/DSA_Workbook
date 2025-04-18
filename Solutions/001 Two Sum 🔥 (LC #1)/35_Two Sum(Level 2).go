import "sort"

func twoSum(nums []int, target int) []int {
	type Pair struct {
		Val int
		Idx int
	}
	pairs := make([]Pair, len(nums))
	for i, val := range nums {
		pairs[i] = Pair{val, i}
	}
	sort.Slice(pairs, func(i, j int) bool {
		return pairs[i].Val < pairs[j].Val
	})

	left, right := 0, len(pairs)-1
	for left < right {
		sum := pairs[left].Val + pairs[right].Val
		if sum == target {
			return []int{pairs[left].Idx, pairs[right].Idx}
		} else if sum < target {
			left++
		} else {
			right--
		}
	}
	return []int{}
}