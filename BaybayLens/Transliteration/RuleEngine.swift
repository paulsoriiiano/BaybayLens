import Foundation

final class RuleEngine {
    func transliterate(_ input: String) -> String {
        let lower = input.lowercased()
        var out = ""
        var i = lower.startIndex

        while i < lower.endIndex {
            let ch = lower[i]
            if ch == "n" {
                let j = lower.index(after: i)
                if j < lower.endIndex, lower[j] == "g" {
                    out.append("ᜅ")
                    i = lower.index(i, offsetBy: 2); continue
                }
            }
            if let v = BaybayinMapper.vowels[ch] {
                out.append(v)
            } else if let c = BaybayinMapper.consonants[ch] {
                out.append(c)
            } else if ch.isWhitespace {
                out.append(" ")
            } else if ch.isNumber {
                out.append(String(ch))
            } else {
                out.append(String(ch))
            }
            i = lower.index(after: i)
        }
        return out
    }
}
