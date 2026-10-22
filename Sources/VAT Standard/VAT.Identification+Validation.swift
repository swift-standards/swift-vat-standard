extension VAT.Identification {
    public init(_ text: some StringProtocol) throws(VAT.Identification.Error) {
        let prefix = String(text.prefix(2))
        guard prefix.utf8.count == 2, let member = VAT.Identification.Prefix(rawValue: prefix) else {
            throw .invalidPrefix(prefix)
        }
        let number = text.utf8.dropFirst(2)
        for byte in number {
            switch byte {
            case UInt8(ascii: "0")...UInt8(ascii: "9"),
                UInt8(ascii: "A")...UInt8(ascii: "Z"),
                UInt8(ascii: "a")...UInt8(ascii: "z"),
                UInt8(ascii: "+"), UInt8(ascii: "*"), UInt8(ascii: "."):
                continue

            default:
                throw .invalidCharacter
            }
        }
        guard (2...12).contains(number.count) else {
            throw .invalidLength(number.count)
        }
        self.prefix = member
        self.number = String(text.dropFirst(2))
    }
}
