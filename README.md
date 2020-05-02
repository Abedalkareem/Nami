<p align="center">
    <img src="logo.png" alt="Nami.. a SwiftUI Navigator" width="200" /><br>
    <b>Nami... A SwiftUI navigator.</b>
</p>


## How to use

### Root
To set the root view controller in `AppDelegate`.

``` Swift
let rootView = initRoot(with: AnyView(MainScreenView()))
let window = UIWindow(frame: UIScreen.main.bounds)
window.rootViewController = UIHostingController(rootView: rootView)
self.window = window
window.makeKeyAndVisible()
```

To replace the root view with animation.

``` Swift 
replaceRoot(with: MainScreenView()) { view in
  view.transform = CGAffineTransform(scaleX: 2, y: 2)
  view.alpha = 0
}
```

### Present and dismiss
To present a new view.
``` Swift
present(with: MainScreenView()) { view in
  view.transform = CGAffineTransform(scaleX: 2, y: 2)
  view.alpha = 0
}
```

To dismiss the top stack with animation.
``` Swift
dismiss() { view in
  view.transform = CGAffineTransform(scaleX: 2, y: 2)
  view.alpha = 0
}
```

### Push and pop
To push a new view to the top stack.
``` Swift
push(with: MainScreenView())
```

To pop the top view from the top stack.
``` Swift
pop()
```

## Example 

``` Swift
struct MainScreenView: View {
  var body: some View {
    ZStack {
      Button(action: {
        push(with: MyNameScreenView())
      }) {
        Text("Say my name")
      }
    }
  }
}

struct MyNameScreenView: View {
  var body: some View {
    VStack {
      Text("Abedalkareem")
      Button(action: {
        pop()
      }) {
        Text("Back")
      }
    }
  }
}
```

## License

```
The MIT License (MIT)

Copyright (c) 2020 Abedalkareem

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
