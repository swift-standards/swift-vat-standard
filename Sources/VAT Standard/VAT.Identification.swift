extension VAT {
    public struct Identification: Sendable, Hashable {
        public let prefix: VAT.Identification.Prefix

        public let number: String
    }
}
