extension VAT.Identification {

    public enum Error: Swift.Error, Sendable, Equatable {

        /// The first two characters are not a member-state prefix.
        case invalidPrefix(String)

        /// The number after the prefix is not two to twelve characters long.
        case invalidLength(Int)

        /// The number after the prefix contains a character other than a
        /// letter, a digit, `+`, `*`, or `.`.
        case invalidCharacter(Unicode.Scalar)
    }
}
