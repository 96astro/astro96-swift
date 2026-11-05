# 96Astro API client for Swift

Compiled and run in our tests on the oldest version named below: `tools/sdk/thin_conformance/run.py` checks its requests, retries and errors, and makes one real call to the API.

## Install

Add this folder as a Swift package. It has no dependencies.

## Use

```swift
let astro = Astro96Client(apiKey: key)
let json = try await astro.planetPositions(#"{"datetime":"1990-10-18T14:30:00","timezone":"Asia/Kolkata","latitude":28.6139,"longitude":77.209}"#)
```

There is one method for each capability in the [API reference](https://96astroapi.com/docs/reference). Each takes the request as a JSON string and returns the response as a JSON string, so you can parse it with whatever your app already uses.

Keep your secret key on your server, and never ship it in an app. The API's error `code` is on the error this client raises. Calls that fail with a retryable error are retried with the same idempotency key, so they are never charged twice.
