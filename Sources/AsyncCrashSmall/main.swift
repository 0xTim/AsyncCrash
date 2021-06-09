import _NIOConcurrency
import NIO

func makeString() -> EventLoopFuture<String> {
    let eventLoop = EmbeddedEventLoop()
    let promise = eventLoop.makePromise(of: String.self)
    promise.completeWithAsync {
      await someString()
    }
    return promise.futureResult
}

func someString() async -> String {
    "Hello"
}

let stringFuture = makeString()
let string = try stringFuture.wait()

print(string)
