#define TABLE_SIZE 10007  // A prime number for hash distribution

typedef struct {
    int key;
    int val;
    int used;
} HashItem;

int hash(int key) {
    if (key < 0) key = -key;
    return key % TABLE_SIZE;
}

int* twoSum(int* nums, int numsSize, int target, int* returnSize){
    HashItem* table = (HashItem*)calloc(TABLE_SIZE, sizeof(HashItem));

    for (int i = 0; i < numsSize; i++) {
        int complement = target - nums[i];
        int h = hash(complement);
        while (table[h].used) {
            if (table[h].key == complement) {
                int* result = (int*)malloc(2 * sizeof(int));
                result[0] = table[h].val;
                result[1] = i;
                *returnSize = 2;
                free(table);
                return result;
            }
            h = (h + 1) % TABLE_SIZE;
        }

        h = hash(nums[i]);
        while (table[h].used) {
            h = (h + 1) % TABLE_SIZE;
        }
        table[h].key = nums[i];
        table[h].val = i;
        table[h].used = 1;
    }

    *returnSize = 0;
    free(table);
    return NULL;
}