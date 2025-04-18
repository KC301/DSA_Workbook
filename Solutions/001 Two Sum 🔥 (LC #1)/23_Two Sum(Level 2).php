function twoSum($nums, $target) {
    $indexed = [];
    foreach ($nums as $i => $val) {
        $indexed[] = ['val' => $val, 'idx' => $i];
    }

    usort($indexed, function ($a, $b) {
        return $a['val'] - $b['val'];
    });

    $left = 0;
    $right = count($indexed) - 1;

    while ($left < $right) {
        $sum = $indexed[$left]['val'] + $indexed[$right]['val'];
        if ($sum == $target) {
            return [$indexed[$left]['idx'], $indexed[$right]['idx']];
        } elseif ($sum < $target) {
            $left++;
        } else {
            $right--;
        }
    }

    return [];
}