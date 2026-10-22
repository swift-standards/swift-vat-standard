extension VAT.Identification {

    /// The prefix identifying the member state that issued a VAT
    /// identification number.
    public enum Prefix: String, Sendable, Hashable, CaseIterable {
        case at = "AT"
        case be = "BE"
        case bg = "BG"
        case cy = "CY"
        case cz = "CZ"
        case de = "DE"
        case dk = "DK"
        case ee = "EE"
        /// Greece, which uses `EL` rather than its ISO 3166-1 code `GR`.
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
        /// Northern Ireland, for trade in goods under the Windsor Framework.
        case xi = "XI"
    }
}
