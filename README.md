# swift-vat-standard

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Swift implementation of the European Union's VAT identification number shape.

## Overview

`VAT.Identification` validates the shape Council Directive 2006/112/EC, article 215, and VIES define: a member-state prefix (ISO 3166-1 alpha-2, with `EL` for Greece; the Windsor Framework adds `XI` for Northern Ireland) followed by two to twelve letters, digits, `+`, `*` or `.`, in the case given. Member-state check digits are out of scope here; see swift-netherlands-standard for the Dutch number.

```swift
import VAT_Standard

let id = try VAT.Identification("NL000099998B57")
id.prefix  // .nl
id.number  // "000099998B57"
```

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
