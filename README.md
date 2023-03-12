# Networking

A description of this package.

```swift
let networkService = NetworkService()

guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") else {
    return
}

networkService.request(url: url, method: .get) { (result: Result<Todo, Error>) in
    switch result {
    case .success(let todo):
        print(todo.title)
    case .failure(let error):
        print(error.localizedDescription)
    }
}
```