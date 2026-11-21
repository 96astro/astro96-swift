# 96Astro API client for Swift

Compiled and run in our tests on the oldest version named below: `tools/sdk/thin_conformance/run.py` checks its requests, retries and errors, and makes one real call to the API.

**Full guide** (install, first call, errors, retries, PDF and audio jobs, webhook verification): https://96astroapi.com/docs/sdk-swift

## Install

Add this folder as a Swift package. It has no dependencies.

## Use

```swift
let astro = Astro96Client(apiKey: key)
let json = try await astro.planetPositions(#"{"datetime":"1990-10-18T14:30:00","timezone":"Asia/Kolkata","latitude":28.6139,"longitude":77.209}"#)
```

There is one method for each capability in the [API reference](https://96astroapi.com/docs/reference). Each takes the request as a JSON string and returns the response as a JSON string, so you can parse it with whatever your app already uses.

## Name your app (optional)

Optional: tell the API which app is calling, so you can see where your keys are used (the dashboard's *Where your keys are used*) and spot a leaked key. 

```swift
let astro = Astro96Client(apiKey: key, appInfo: Astro96AppInfo(name: "Acme Shop", version: "2.1.0", url: "https://shop.acme.com"))
```

The name is required (printable ASCII, at most 60 characters, no `/` or parentheses); the version (at most 40) and the url (`http(s)`, at most 120) are optional. It is sent as the `X-Astro-App` header, never with your key; the API keeps the name, the version and only the **host** of the url. The User-Agent also carries the platform (`plt/node`, `plt/linux`...). An invalid value is refused when the client is created.

Keep your secret key on your server, and never ship it in an app. The API's error `code` is on the error this client raises. Calls that fail with a retryable error are retried with the same idempotency key, so they are never charged twice.
