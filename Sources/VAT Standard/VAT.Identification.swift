extension VAT {

    /// A VAT identification number in the shape the European Union defines.
    ///
    /// Council Directive 2006/112/EC, article 215, requires each identification
    /// number to carry a prefix identifying the issuing member state: its
    /// ISO 3166-1 alpha-2 code, with `EL` for Greece. The Protocol on
    /// Ireland/Northern Ireland to the Withdrawal Agreement (the Windsor
    /// Framework) adds `XI` for Northern Ireland. The number after the prefix
    /// has the shape VIES accepts: two to twelve letters, digits, `+`, `*`, or
    /// `.`, in the case given.
    ///
    /// This type checks that shape only. Each member state defines its own
    /// format and check digits within it, and a well-formed number is not
    /// necessarily issued.
    public struct Identification: Sendable, Hashable {

        /// The prefix identifying the issuing member state.
        public let prefix: Prefix

        /// The number the member state issued, after the prefix.
        public let number: String
    }
}
