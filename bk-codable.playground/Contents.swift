/*:
 #### Codable
 
 A Codable is a type that can convert itself into and out of an external represresentation. The best example of `external representation` is JSON. Converting a type to JSON and vice versa, is one of the most prominent problems in computer science today, thanks to the deep percolation of JSON. Programming languages play a big role in this context. Languages like JavaScript have semantics very closely coupled with JSON, making JSON processing a pleasurable experience. Other languages like Java make it not as pleasurable! Swift wants to make JSON processing type-safe and easy to use! The Codable interface along with JSONEncoder and JSONDecoder API are a joy to work with!
 
 `typealias Codable = Encodable & Decodable`
*/
import Foundation
import XCTest

/*:
 ##### Encoding to JSON
 
Consider a simple struct type called `GitCommit` which represents a commit in git. We shall now convert values of this struct type to JSON, the key names in the output matching the property names of the type!
*/
struct GitCommit : Codable {
    let author: String
    let message: String
    let date: Date
}

/*:
If `GitCommit` conforms to Encodable (you need not write any conformance code!), you can very easily encode this type to JSON
*/
func encode(commit: GitCommit) throws -> String {
    //YOUR CODE GOES HERE
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .iso8601
    encoder.outputFormatting = .prettyPrinted
    let data = try encoder.encode(commit)
    return String(data: data, encoding: .utf8)!
}

/*:
##### Decoding JSON to type
 
If `GitCommit` conforms to Decodable (again, no extra conformance code needed!), you may decode JSON to the `GitCommit` type.
*/
func decode(json: String) throws -> GitCommit {
    //YOUR CODE GOES HERE
    let stringData = json.data(using: .utf8)!
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    return try decoder.decode(GitCommit.self, from: stringData)
}

let commit = GitCommit(author: "clattner", message: "First Commit", date: Date())

/*:
##### Customizing key names
 
 Sometimes a key name in the incoming JSON may not match the property name in the struct type. We use the CodingKeys enum to provide the mapping between key names and property names. Sample JSON:
 
 {
    "author": "clattner",
    "message": "first commit",
    "date": "2017-07-14T20:51:42Z",
    "commit_hash": "ce1a76c081f4b0bb98a33d98e595db95c7a4c871"
 }
 
*/
struct _GitCommit : Decodable {
    let author: String
    let message: String
    let date: Date
    let commitHash: String
    
    //YOUR CODE GOES HERE
    enum CodingKeys: String, CodingKey {
        case author
        case message
        case date
        case commitHash = "commit_hash"
    }
}



func decode(commitString: String) throws -> _GitCommit {
    //YOUR CODE GOES HERE
    let data = commitString.data(using: .utf8)!
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    return try decoder.decode(_GitCommit.self, from: data)
}

/*:
##### Wrapper Keys
We may have an array of commits as the value of a root level key.
 
{
    "commits": [
    {
        "author": "apollo",
        "message": "Initial commit",
        "date": "2017-06-21T15:29:32Z"
    },
    {
        "author": "thecoolguy",
        "message": "Update README",
        "date": "2017-06-21T19:29:32Z"
    }
    ]
}
*/
func decodeCommits(json: String) throws -> [GitCommit] {
    //YOUR CODE GOES HERE
    struct GitCommits : Decodable {
        let commits: [GitCommit]
    }
    
    let data = json.data(using: .utf8)!
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    let commits = try! decoder.decode(GitCommits.self, from: data)
    return commits.commits
}

/*:

 ##### Root level array
Or we may have an array of commits at the root level.

[
    {
        "author": "apollo",
        "message": "Initial commit",
        "date": "2017-06-21T15:29:32Z"
    },
    {
        "author": "thecoolguy",
        "message": "Update README",
        "date": "2017-06-21T19:29:32Z"
    }
]
*/

func decodeRootLevelArray(json: String) throws -> [GitCommit] {
    //YOUR CODE GOES HERE
    let data = json.data(using: .utf8)!
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    let commits = try! decoder.decode([GitCommit].self, from: data)
    return commits
}

/*:
 ##### Object Wrapping Keys
In another case, we may have multiple commits as listed as values of different keys in a root level array.

[
    {
        "initial": {
            "author": "apollo",
            "message": "Initial commit",
            "date": "2017-06-21T15:29:32Z"
        }
    },
    {
        "readme_update": {
            "author": "thecoolguy",
            "message": "Update README",
            "date": "2017-06-21T19:29:32Z"
        }
    }
]
*/

func decodeObjectWrappingKeys(json: String) throws -> [GitCommit] {
    //YOUR CODE GOES HERE
    let data = json.data(using: .utf8)!
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    let commitsMap = try decoder.decode([[String:GitCommit]].self, from: data)
    var commits: [GitCommit] = []
    for _commits in commitsMap {
        for (_, _commit) in _commits {
            commits.append(_commit)
        }
    }
    return commits
}

