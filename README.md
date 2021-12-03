# Publicist

Publicist is a tool for changing swift internal access level into public.

```swift
// Shop.swift（before）
struct Shop {
    enum Food {}

    private let id: Int

    let name: String

    func serve() {}
}
```

```sh
$ publicist Shop.swift
📝 Rewriting Shop.swift
✅ Complete
```

```swift
// Shop.swift (after)
public struct Shop {
    public enum Food {}

    private let id: Int

    public let name: String

    public func serve() {}
}
```

## Installing
### Homebrew
```sh
$ brew tap komaji/Publicist https://github.com/komaji/Publicist.git
$ brew install publicist
```

### Manually
```sh
$ git clone https://github.com/komaji/Publicist.git
$ cd Publicist
$ make install
```
