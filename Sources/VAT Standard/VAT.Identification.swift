extension VAT {
    public struct Identification: Sendable, Hashable {
        public let prefix: VAT.Identification.Prefix

        /// The national number, upper-cased.
        public let number: String
    }
}
