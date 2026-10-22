import Testing
import VAT_Standard

extension VAT.Identification {
    @Suite struct Test {
        @Suite struct Unit {}
        @Suite struct `Edge Case` {}
    }
}

extension VAT.Identification.Test.Unit {

    @Test(arguments: [
        ("NL000099998B57", VAT.Identification.Prefix.nl, "000099998B57"),
        ("DE123456789", .de, "123456789"),
        ("EL123456789", .el, "123456789"),
        ("FRXX123456789", .fr, "XX123456789"),
        ("IE1234567FA", .ie, "1234567FA"),
        ("IE1+23456A", .ie, "1+23456A"),
        ("XI123456789", .xi, "123456789"),
    ])
    func `well-formed numbers split into prefix and number`(
        text: String,
        prefix: VAT.Identification.Prefix,
        number: String
    ) throws {
        let identification = try VAT.Identification(text)
        #expect(identification.prefix == prefix)
        #expect(identification.number == number)
        #expect(identification.description == text)
    }

    @Test
    func `Greece's ISO code is not its VAT prefix`() {
        #expect(throws: VAT.Identification.Error.invalidPrefix("GR")) {
            try VAT.Identification("GR123456789")
        }
    }

    @Test
    func `prefixes outside the Union are refused`() {
        #expect(throws: VAT.Identification.Error.invalidPrefix("GB")) {
            try VAT.Identification("GB123456789")
        }
        #expect(throws: VAT.Identification.Error.invalidPrefix("US")) {
            try VAT.Identification("US123456789")
        }
    }

    @Test
    func `there are 28 prefixes, the 27 member states and Northern Ireland`() {
        #expect(VAT.Identification.Prefix.allCases.count == 28)
    }
}

extension VAT.Identification.Test.`Edge Case` {

    @Test
    func `a lower-case prefix is refused`() {
        #expect(throws: VAT.Identification.Error.invalidPrefix("nl")) {
            try VAT.Identification("nl000099998B57")
        }
    }

    @Test
    func `numbers shorter than two or longer than twelve characters are refused`() {
        #expect(throws: VAT.Identification.Error.invalidLength(1)) {
            try VAT.Identification("NL1")
        }
        #expect(throws: VAT.Identification.Error.invalidLength(13)) {
            try VAT.Identification("NL1234567890123")
        }
        #expect(throws: VAT.Identification.Error.invalidPrefix("")) {
            try VAT.Identification("")
        }
    }

    @Test
    func `spaces and other separators are refused`() {
        #expect(throws: VAT.Identification.Error.invalidCharacter) {
            try VAT.Identification("NL 000099998B57")
        }
        #expect(throws: VAT.Identification.Error.invalidCharacter) {
            try VAT.Identification("NL000099998-B57")
        }
    }

    @Test
    func `non-ASCII characters are refused`() {
        #expect(throws: VAT.Identification.Error.invalidCharacter) {
            try VAT.Identification("NL0\u{301}00099998B57")
        }
    }
}
