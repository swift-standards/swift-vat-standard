# swift-vat-standard

Use this package when you need to check that a European Union VAT identification number has the right shape, and split it into its member-state prefix and the national number. Start from `VAT.Identification`. It checks the shape only. Member-state check digits are not checked.

## Laws

- The prefix is one of the 27 member states or `XI` for Northern Ireland. Greece is `EL`, not its ISO code `GR`. Any other prefix, including `GB` and a lower-case prefix, throws `VAT.Identification.Error.invalidPrefix(_:)`.
- The national number is 2 to 12 ASCII letters, digits, `+`, `*` or `.`. Spaces, hyphens and other separators are refused, and nothing is trimmed or stripped first.
- The number keeps the case it was given. It is not upper-cased.
- Checks run in order: the prefix, then each character of the number, then its length. A number that is too long and also has a bad character reports the bad character.
- The description joins prefix and number with nothing between them, so it gives back the text that was parsed.
