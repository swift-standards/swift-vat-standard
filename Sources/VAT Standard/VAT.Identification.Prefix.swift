extension VAT.Identification {
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
