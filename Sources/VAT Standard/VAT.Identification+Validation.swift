extension VAT.Identification {

    /// Validates `text`, such as `NL000099998B57`, as a prefix followed by a
    /// number of the shape VIES accepts.
    public init(_ text: some StringProtocol) throws(Error) {
        let scalars = text.unicodeScalars
        let prefix = String(String.UnicodeScalarView(scalars.prefix(2)))
        guard let member = Prefix(rawValue: prefix) else {
            throw .invalidPrefix(prefix)
        }
        let number = scalars.dropFirst(2)
        for scalar in number {
            switch scalar {
            case "0"..."9", "A"..."Z", "a"..."z", "+", "*", ".":
                continue
            default:
                throw .invalidCharacter(scalar)
            }
        }
        guard (2...12).contains(number.count) else {
            throw .invalidLength(number.count)
        }
        self.prefix = member
        self.number = String(String.UnicodeScalarView(number))
    }
}

extension VAT.Identification: CustomStringConvertible {

    public var description: String { prefix.rawValue + number }
}
