extension VAT.Identification {
    /// The VAT prefix of a member state, or of Northern Ireland.
    ///
    /// These are VAT prefixes, not ISO 3166 alpha-2 codes: Greece is `EL` where ISO 3166 has `GR`,
    /// and Northern Ireland is `XI`, which ISO 3166 doesn't assign. So the type doesn't map onto ISO 3166.
    public enum Prefix: String, Sendable, Hashable, CaseIterable {
        case at = "AT"
        case be = "BE"
        case bg = "BG"
        case cy = "CY"
        case cz = "CZ"
        case de = "DE"
        case dk = "DK"
        case ee = "EE"
        case el = "EL"
        case es = "ES"
        case fi = "FI"
        case fr = "FR"
        case hr = "HR"
        case hu = "HU"
        case ie = "IE"
        case it = "IT"
        case lt = "LT"
        case lu = "LU"
        case lv = "LV"
        case mt = "MT"
        case nl = "NL"
        case pl = "PL"
        case pt = "PT"
        case ro = "RO"
        case se = "SE"
        case si = "SI"
        case sk = "SK"
        case xi = "XI"
    }
}

extension VAT.Identification.Prefix: CustomStringConvertible {
    public var description: String { rawValue }
}
