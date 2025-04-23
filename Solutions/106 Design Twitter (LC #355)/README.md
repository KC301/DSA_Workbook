
---

# ➕ Problem: Design Twitter

## 📘 Problem Statement

> Design a simple version of Twitter where users can post tweets, follow/unfollow other users, and get the 10 most recent tweets in the user's news feed.
> 
> Implement the `Twitter` class:
> - `Twitter()`: Initializes your twitter object.
> - `postTweet(userId, tweetId)`: Compose a new tweet.
> - `getNewsFeed(userId)`: Retrieve the 10 most recent tweet IDs in the user’s news feed. Each item in the news feed must be posted by users who the user followed or by the user themselves. Tweets must be ordered from most recent to least recent.
> - `follow(followerId, followeeId)`: Follower follows the followee.
> - `unfollow(followerId, followeeId)`: Follower unfollows the followee.

**LeetCode Link:** [355. Design Twitter](https://leetcode.com/problems/design-twitter/)

---

```
Example 1:
Input:
["Twitter","postTweet","postTweet","getNewsFeed","follow","getNewsFeed","unfollow","getNewsFeed"]
[[],[1,5],[1,3],[1],[1,2],[2],[1,2],[1]]
Output:
[null,null,null,[5,3],[3,5],[3,5],[5]]
Explanation:
Twitter twitter = new Twitter();
twitter.postTweet(1, 5);
twitter.postTweet(1, 3);
twitter.getNewsFeed(1); // return [5, 3]
twitter.follow(1, 2);
twitter.getNewsFeed(1); // return [3, 5]
twitter.unfollow(1, 2);
twitter.getNewsFeed(1); // return [5]
```

---

## ✅ Constraints

- `1 <= userId, followerId, followeeId <= 500`
- `0 <= tweetId <= 10⁴`
- `Twitter` will have at most `10⁴` function calls.
- It’s guaranteed that each tweet in a call to `getNewsFeed` will be tweeted by a user who has been followed by the user in that call.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Simple Approach with List and Dictionary

**Approach:**  
Use a dictionary to store tweets and sets for followers of each user. This approach is simple but inefficient for large datasets, as the news feed generation involves iterating over all tweets.

```python
# Time Complexity: O(1) for postTweet, O(f + t) for getNewsFeed, O(1) for follow/unfollow
# Space Complexity: O(t + u), where t is the number of tweets, u is the number of users
class Twitter:
    def __init__(self):
        self.tweets = []
        self.followers = {}

    def postTweet(self, userId, tweetId):
        self.tweets.append((userId, tweetId))

    def getNewsFeed(self, userId):
        news_feed = []
        for user, tweet in reversed(self.tweets):
            if user == userId or userId in self.followers.get(user, set()):
                news_feed.append(tweet)
                if len(news_feed) == 10:
                    break
        return news_feed

    def follow(self, followerId, followeeId):
        if followerId not in self.followers:
            self.followers[followerId] = set()
        self.followers[followerId].add(followeeId)

    def unfollow(self, followerId, followeeId):
        if followerId in self.followers and followeeId in self.followers[followerId]:
            self.followers[followerId].remove(followeeId)
```

---

### ⚙️ Level 2: Optimized with Linked List and HashMap

**Approach:**  
This solution uses a hash map for users' followings and a doubly linked list to maintain the tweet history, making it more efficient for retrieving the latest tweets.

```python
# Time Complexity: O(1) for postTweet, O(f + t) for getNewsFeed, O(1) for follow/unfollow
# Space Complexity: O(t + u), where t is the number of tweets, u is the number of users
class Twitter:
    def __init__(self):
        self.tweets = []
        self.following = defaultdict(set)

    def postTweet(self, userId, tweetId):
        self.tweets.append((userId, tweetId))

    def getNewsFeed(self, userId):
        news_feed = []
        followees = self.following[userId] | {userId}
        tweet_count = 0
        for user, tweet in reversed(self.tweets):
            if user in followees:
                news_feed.append(tweet)
                tweet_count += 1
                if tweet_count == 10:
                    break
        return news_feed

    def follow(self, followerId, followeeId):
        self.following[followerId].add(followeeId)

    def unfollow(self, followerId, followeeId):
        if followeeId in self.following[followerId]:
            self.following[followerId].remove(followeeId)
```

---

### 🚀 Level 3: Using a Min-Heap for Efficient News Feed Retrieval

**Approach:**  
Min-heap to track the most recent tweets from each followed user, optimizing the time complexity of retrieving the latest tweets for large datasets.

```python
import heapq

# Time Complexity: O(1) for postTweet, O(log n) for getNewsFeed, O(1) for follow/unfollow
# Space Complexity: O(t + u), where t is the number of tweets, u is the number of users
class Twitter:
    def __init__(self):
        self.tweets = []
        self.following = defaultdict(set)

    def postTweet(self, userId, tweetId):
        self.tweets.append((len(self.tweets), userId, tweetId))

    def getNewsFeed(self, userId):
        news_feed = []
        followees = self.following[userId] | {userId}
        min_heap = []
        
        for idx, (user, tweet) in enumerate(reversed(self.tweets)):
            if user in followees:
                heapq.heappush(min_heap, (idx, tweet))
                if len(min_heap) > 10:
                    heapq.heappop(min_heap)
        
        return [tweet for _, tweet in sorted(min_heap)]

    def follow(self, followerId, followeeId):
        self.following[followerId].add(followeeId)

    def unfollow(self, followerId, followeeId):
        if followeeId in self.following[followerId]:
            self.following[followerId].remove(followeeId)
```

---

## 🔗 Similar Problems

1. [426. Convert Binary Search Tree to Sorted Doubly Linked List](https://leetcode.com/problems/convert-binary-search-tree-to-sorted-doubly-linked-list/)
2. [387. First Unique Character in a String](https://leetcode.com/problems/first-unique-character-in-a-string/)
3. [380. Insert Delete GetRandom O(1)](https://leetcode.com/problems/insert-delete-getrandom-o1/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                       | Time Complexity (postTweet / getNewsFeed / follow/unfollow) | Space Complexity |
|-------|--------------------------------|------------------------------------------------------------|------------------|
| 1     | Simple List and Dictionary     | O(1) / O(f + t) / O(1)                                     | O(t + u)         |
| 2     | Optimized with Linked List     | O(1) / O(f + t) / O(1)                                     | O(t + u)         |
| 3     | Using Min-Heap                 | O(1) / O(log n) / O(1)                                     | O(t + u)         |

---

## 📌 Takeaway Points

- A simple dictionary-based solution works well for small inputs but becomes inefficient as the data grows.
- The min-heap approach optimizes retrieval of the latest tweets while maintaining O(log n) complexity.
- A follow/unfollow operation can be efficiently handled with a set.

---
