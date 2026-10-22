extension VAT.Identification {
    public enum Error: Swift::Error, Sendable, Equatable {
        case invalidPrefix(String)
        case invalidLength(Int)
        case invalidCharacter
    }
}
