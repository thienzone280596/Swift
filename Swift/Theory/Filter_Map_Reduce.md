## Filter, Map and Reduce in Swift
#### I. Introducing Map, Filter, and Reduce in Swift
Swift’s map, filter, and reduce functions are often referred to as higher-order functions. This is because they take a function as an input and return it as an output. Using map, filter, and reduce in Swift results in clean, concise code that is more readable and offers better results. 
#### II. The Mapping Process in Swift
Mapping is the process of converting an array from 1 type to another [A] to [B]. There are lots of reasons to do this, a simple example is extracting an array of user IDs from an array of users. In this example we're mapping from [User] to [Int]
```swift
struct User {
 let id: Int
 let name: String
}

let users = [User(id: 1, name: "Sulley"), User(id: 2, name: "Mike")]
let userIds = users.map { (user) in
 return user.id
}
```
This can be shortened to let userIds = users.map { $0.id } by making use of Swift's shorthand argument names.
##### Mapping with Key Paths
From Swift 5.2, we're now able to use key paths in place of the closures above, so we can change the map to let userIds = users.map(\.id)
Note Map là cách biến đổi một array [A] thành một array [B] sử dụng một số phép tính trong hàm biến đổi
#### Compact Map
 compactMap is a special type of map that filters out any nil elements. This is helpful when your mapping function could fail and you want to ignore those failures e.g. converting an array of strings to an array of URLs (not all strings are valid URLs). Where map would convert from [String] to [URL?], compactMap will convert from [String] to [URL]
 (Method này được sử dụng khi bạn muốn chuyển một array có chứa optinal values sang một array khác không chưa optional values nào (chỉ chứa các non-optional values).)
 ```Swift
let strings = ["https://www.brightec.co.uk", "not a url"]
let urls = strings.map { URL(string: $0) } // [URL?]
let urls = strings.compactMap { URL(string: $0) } // [URL]  
 ```
 #### Flat Map
 flatMap is another special type of map that is useful when:

your mapping closure returns an array rather than an element, and
you want your final array to be 1 single dimension rather than an array of arrays.
```Swift
struct Article {
 let title: String
 let tags: [String]
}

let articles = [
 Article(title: "First blog", tags: ["swift", "ios"]),
 Article(title: "Second blog", tags: ["kotlin", "android"])
]

let allTags = articles.map(\.tags) // [["swift", "ios"], ["kotlin", "android"]], type is [[String]]
let allTags = articles.flatMap(\.tags) // ["swift", "ios", "kotlin", "android"], type is [String]
```
