//
//  Country+List.swift
//  MobileNumberField
//
//  Created by Денис Либит on 04.08.2024.
//
//  Sources:
//
//  Michael Munsie:                     https://github.com/NikKovIos/NKVPhonePicker/blob/master/Sources/Bundle/Countries.bundle/Data/countryCodes.json
//  World Telephone Numbering Guide:    http://www.wtng.info
//  Wikipedia:                          https://en.wikipedia.org/wiki/List_of_mobile_telephone_prefixes_by_country
//  Wikipedia:                          https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes
//  HowToPhoneTo.com:                   https://howtophoneto.com
//  WorldPopulation Review:             https://worldpopulationreview.com/country-rankings/phone-number-length-by-country

import Foundation


extension Country {
    public static func countries(with locale: Locale) -> [Self] {
        return [
            .init(
                id: "AD",
                code: "376",
                masks: ["###-###"],
                locale: locale
            ),
            .init(
                id: "AE",
                code: "971",
                masks: ["##-###-####"],
                locale: locale
            ),
            .init(
                id: "AF",
                code: "93",
                masks: ["##-###-####"],
                locale: locale
            ),
            .init(
                id: "AG",
                code: "1(268)",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "AI",
                code: "1(264)",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "AL",
                code: "355",
                masks: ["(###)###-###"],
                locale: locale
            ),
            .init(
                id: "AM",
                code: "374",
                masks: ["##-###-###"],
                locale: locale
            ),
            .init(
                id: "AO",
                code: "244",
                masks: ["(###)###-###"],
                locale: locale
            ),
            .init(
                id: "AQ",
                code: "672-1",
                masks: ["##-###"],
                locale: locale
            ),
            .init(
                id: "AR",
                code: "54",
                masks: ["(###)###-####"],
                locale: locale
            ),
            .init(
                id: "AS",
                code: "1(684)",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "AT",
                code: "43",
                masks: ["(###)###-###", "(###)###-####"],
                locale: locale
            ),
            .init(
                id: "AU",
                code: "61",
                masks: ["#-####-####"],
                locale: locale
            ),
            .init(
                id: "AW",
                code: "297",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "AZ",
                code: "994",
                masks: ["##-###-##-##"],
                locale: locale
            ),
            .init(
                id: "BA",
                code: "387",
                masks: ["(##)###-###"],
                locale: locale
            ),
            .init(
                id: "BB",
                code: "1(246)",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "BD",
                code: "880",
                masks: ["##-####-####"],
                locale: locale
            ),
            .init(
                id: "BE",
                code: "32",
                masks: ["(###)###-###"],
                locale: locale
            ),
            .init(
                id: "BF",
                code: "226",
                masks: ["##-##-####"],
                locale: locale
            ),
            .init(
                id: "BG",
                code: "359",
                masks: ["(###)###-###"],
                locale: locale
            ),
            .init(
                id: "BH",
                code: "973",
                masks: ["####-####"],
                locale: locale
            ),
            .init(
                id: "BI",
                code: "257",
                masks: ["##-##-####"],
                locale: locale
            ),
            .init(
                id: "BJ",
                code: "229",
                masks: ["##-##-####"],
                locale: locale
            ),
            .init(
                id: "BL",
                code: "590",
                masks: ["###-###-###"],
                locale: locale
            ),
            .init(
                id: "BM",
                code: "1(441)",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "BN",
                code: "673",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "BO",
                code: "591",
                masks: ["#-###-####"],
                locale: locale
            ),
            .init(
                id: "BQ",
                code: "599",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "BR",
                code: "55",
                masks: ["(##)####-####"],
                locale: locale
            ),
            .init(
                id: "BS",
                code: "1(242)",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "BT",
                code: "975",
                masks: ["##-######"],
                locale: locale
            ),
            .init(
                id: "BW",
                code: "267",
                masks: ["##-###-###"],
                locale: locale
            ),
            .init(
                id: "BY",
                code: "375",
                masks: ["(##)###-##-##"],
                locale: locale
            ),
            .init(
                id: "BZ",
                code: "501",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "CA",
                code: "1",
                masks: ["(###)###-####"],
                locale: locale
            ),
            .init(
                id: "CD",
                code: "243",
                masks: ["(###)###-###"],
                locale: locale
            ),
            .init(
                id: "CF",
                code: "236",
                masks: ["##-##-####"],
                locale: locale
            ),
            .init(
                id: "CG",
                code: "242",
                masks: ["##-###-####"],
                locale: locale
            ),
            .init(
                id: "CH",
                code: "41",
                masks: ["##-###-####"],
                locale: locale
            ),
            .init(
                id: "CI",
                code: "225",
                masks: ["##-###-###"],
                locale: locale
            ),
            .init(
                id: "CK",
                code: "682",
                masks: ["##-###"],
                locale: locale
            ),
            .init(
                id: "CL",
                code: "56",
                masks: ["#-####-####"],
                locale: locale
            ),
            .init(
                id: "CM",
                code: "237",
                masks: ["####-####"],
                locale: locale
            ),
            .init(
                id: "CN",
                code: "86",
                masks: ["(###)####-####"],
                locale: locale
            ),
            .init(
                id: "CO",
                code: "57",
                masks: ["(###)###-####"],
                locale: locale
            ),
            .init(
                id: "CR",
                code: "506",
                masks: ["####-####"],
                locale: locale
            ),
            .init(
                id: "CU",
                code: "53",
                masks: ["#-###-####"],
                locale: locale
            ),
            .init(
                id: "CV",
                code: "238",
                masks: ["(###)##-##"],
                locale: locale
            ),
            .init(
                id: "CY",
                code: "357",
                masks: ["##-###-###"],
                locale: locale
            ),
            .init(
                id: "CZ",
                code: "420",
                masks: ["(###)###-###"],
                locale: locale
            ),
            .init(
                id: "DE",
                code: "49",
                masks: ["(###)###-####", "(####)###-####"],
                locale: locale
            ),
            .init(
                id: "DJ",
                code: "253",
                masks: ["##-##-####"],
                locale: locale
            ),
            .init(
                id: "DK",
                code: "45",
                masks: ["##-##-##-##"],
                locale: locale
            ),
            .init(
                id: "DM",
                code: "1(767)",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "DO",
                code: "1(809)",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "DZ",
                code: "213",
                masks: ["##-###-####"],
                locale: locale
            ),
            .init(
                id: "EC",
                code: "593",
                masks: ["##-###-####"],
                locale: locale
            ),
            .init(
                id: "EE",
                code: "372",
                masks: ["###-####", "####-####"],
                locale: locale
            ),
            .init(
                id: "EG",
                code: "20",
                masks: ["(###)###-####"],
                locale: locale
            ),
            .init(
                id: "ER",
                code: "291",
                masks: ["#-###-###"],
                locale: locale
            ),
            .init(
                id: "ES",
                code: "34",
                masks: ["(###)###-###"],
                locale: locale
            ),
            .init(
                id: "ET",
                code: "251",
                masks: ["##-###-####"],
                locale: locale
            ),
            .init(
                id: "FI",
                code: "358",
                masks: ["(##)###-####", "(###)###-####", "(###)####-####"],
                locale: locale
            ),
            .init(
                id: "FJ",
                code: "679",
                masks: ["##-#####"],
                locale: locale
            ),
            .init(
                id: "FK",
                code: "500",
                masks: ["#####"],
                locale: locale
            ),
            .init(
                id: "FM",
                code: "691",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "FO",
                code: "298",
                masks: ["###-###"],
                locale: locale
            ),
            .init(
                id: "FR",
                code: "33",
                masks: ["(###)###-###"],
                locale: locale
            ),
            .init(
                id: "GA",
                code: "241",
                masks: ["#-##-##-##"],
                locale: locale
            ),
            .init(
                id: "GB",
                code: "44",
                masks: ["##-####-####"],
                locale: locale
            ),
            .init(
                id: "GD",
                code: "1(473)",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "GE",
                code: "995",
                masks: ["(###)###-###"],
                locale: locale
            ),
            .init(
                id: "GF",
                code: "594",
                masks: ["#####-####"],
                locale: locale
            ),
            .init(
                id: "GH",
                code: "233",
                masks: ["(###)###-###"],
                locale: locale
            ),
            .init(
                id: "GI",
                code: "350",
                masks: ["###-#####"],
                locale: locale
            ),
            .init(
                id: "GL",
                code: "299",
                masks: ["##-##-##"],
                locale: locale
            ),
            .init(
                id: "GM",
                code: "220",
                masks: ["(###)##-##"],
                locale: locale
            ),
            .init(
                id: "GN",
                code: "224",
                masks: ["##-###-###"],
                locale: locale
            ),
            .init(
                id: "GP",
                code: "590",
                masks: ["###-###-###"],
                locale: locale
            ),
            .init(
                id: "GQ",
                code: "240",
                masks: ["##-###-####"],
                locale: locale
            ),
            .init(
                id: "GR",
                code: "30",
                masks: ["(###)###-####"],
                locale: locale
            ),
            .init(
                id: "GT",
                code: "502",
                masks: ["#-###-####"],
                locale: locale
            ),
            .init(
                id: "GU",
                code: "1(671)",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "GW",
                code: "245",
                masks: ["#-######"],
                locale: locale
            ),
            .init(
                id: "GY",
                code: "592",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "HK",
                code: "852",
                masks: ["####-####"],
                locale: locale
            ),
            .init(
                id: "HN",
                code: "504",
                masks: ["####-####"],
                locale: locale
            ),
            .init(
                id: "HR",
                code: "385",
                masks: ["##-###-###"],
                locale: locale
            ),
            .init(
                id: "HT",
                code: "509",
                masks: ["##-##-####"],
                locale: locale
            ),
            .init(
                id: "HU",
                code: "36",
                masks: ["(###)###-###"],
                locale: locale
            ),
            .init(
                id: "ID",
                code: "62",
                masks: ["##-###-####", "##-####-####", "###-####-####", "####-####-####", "##-###-####-####"],
                locale: locale
            ),
            .init(
                id: "IE",
                code: "353",
                masks: ["(###)###-###"],
                locale: locale
            ),
            .init(
                id: "IL",
                code: "972",
                masks: ["##-###-####"],
                locale: locale
            ),
            .init(
                id: "IN",
                code: "91",
                masks: ["(####)###-###"],
                locale: locale
            ),
            .init(
                id: "IO",
                code: "246",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "IQ",
                code: "964",
                masks: ["(###)###-####"],
                locale: locale
            ),
            .init(
                id: "IR",
                code: "98",
                masks: ["(###)###-####"],
                locale: locale
            ),
            .init(
                id: "IS",
                code: "354",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "IT",
                code: "39",
                masks: ["(##)####-###", "(###)####-###"],
                locale: locale
            ),
            .init(
                id: "JM",
                code: "1(876)",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "JO",
                code: "962",
                masks: ["#-####-####"],
                locale: locale
            ),
            .init(
                id: "JP",
                code: "81",
                masks: ["(##)####-####"],
                locale: locale
            ),
            .init(
                id: "KE",
                code: "254",
                masks: ["###-######"],
                locale: locale
            ),
            .init(
                id: "KG",
                code: "996",
                masks: ["(###)###-###"],
                locale: locale
            ),
            .init(
                id: "KH",
                code: "855",
                masks: ["##-###-###"],
                locale: locale
            ),
            .init(
                id: "KI",
                code: "686",
                masks: ["##-###"],
                locale: locale
            ),
            .init(
                id: "KM",
                code: "269",
                masks: ["##-#####"],
                locale: locale
            ),
            .init(
                id: "KN",
                code: "1(869)",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "KP",
                code: "850",
                masks: ["(###)###-####"],
                locale: locale
            ),
            .init(
                id: "KR",
                code: "82",
                masks: ["##-###-####", "##-####-####"],
                locale: locale
            ),
            .init(
                id: "KW",
                code: "965",
                masks: ["####-####"],
                locale: locale
            ),
            .init(
                id: "KY",
                code: "1(345)",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "KZ",
                code: "7",
                masks: ["(7##)###-##-##"],
                locale: locale
            ),
            .init(
                id: "LA",
                code: "856",
                masks: ["(##)###-###", "(###)###-###"],
                locale: locale
            ),
            .init(
                id: "LB",
                code: "961",
                masks: ["##-###-###"],
                locale: locale
            ),
            .init(
                id: "LC",
                code: "1(758)",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "LI",
                code: "423",
                masks: ["###-##-##"],
                locale: locale
            ),
            .init(
                id: "LK",
                code: "94",
                masks: ["###-######"],
                locale: locale
            ),
            .init(
                id: "LR",
                code: "231",
                masks: ["#-###-###", "##-###-###"],
                locale: locale
            ),
            .init(
                id: "LS",
                code: "266",
                masks: ["#-###-####"],
                locale: locale
            ),
            .init(
                id: "LT",
                code: "370",
                masks: ["(###)##-###"],
                locale: locale
            ),
            .init(
                id: "LU",
                code: "352",
                masks: ["(###)###-###"],
                locale: locale
            ),
            .init(
                id: "LV",
                code: "371",
                masks: ["##-###-###"],
                locale: locale
            ),
            .init(
                id: "LY",
                code: "218",
                masks: ["##-######"],
                locale: locale
            ),
            .init(
                id: "MA",
                code: "212",
                masks: ["###-##-##-##"],
                locale: locale
            ),
            .init(
                id: "MC",
                code: "377",
                masks: ["##-##-##-##"],
                locale: locale
            ),
            .init(
                id: "MD",
                code: "373",
                masks: ["####-####"],
                locale: locale
            ),
            .init(
                id: "ME",
                code: "382",
                masks: ["##-###-###"],
                locale: locale
            ),
            .init(
                id: "MG",
                code: "261",
                masks: ["##-##-#####"],
                locale: locale
            ),
            .init(
                id: "MH",
                code: "692",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "MK",
                code: "389",
                masks: ["##-###-###"],
                locale: locale
            ),
            .init(
                id: "ML",
                code: "223",
                masks: ["##-##-####"],
                locale: locale
            ),
            .init(
                id: "MM",
                code: "95",
                masks: ["##-###-###", "###-###-###", "###-###-####"],
                locale: locale
            ),
            .init(
                id: "MN",
                code: "976",
                masks: ["##-##-####"],
                locale: locale
            ),
            .init(
                id: "MO",
                code: "853",
                masks: ["####-####"],
                locale: locale
            ),
            .init(
                id: "MP",
                code: "1(670)",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "MQ",
                code: "596",
                masks: ["(###)##-##-##"],
                locale: locale
            ),
            .init(
                id: "MR",
                code: "222",
                masks: ["##-##-####"],
                locale: locale
            ),
            .init(
                id: "MS",
                code: "1(664)",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "MT",
                code: "356",
                masks: ["####-####"],
                locale: locale
            ),
            .init(
                id: "MU",
                code: "230",
                masks: ["###-#####"],
                locale: locale
            ),
            .init(
                id: "MV",
                code: "960",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "MW",
                code: "265",
                masks: ["##-#####", "##-###-####"],
                locale: locale
            ),
            .init(
                id: "MX",
                code: "52",
                masks: ["(###)###-####"],
                locale: locale
            ),
            .init(
                id: "MY",
                code: "60",
                masks: ["#-###-###", "##-###-###"],
                locale: locale
            ),
            .init(
                id: "MZ",
                code: "258",
                masks: ["##-###-####"],
                locale: locale
            ),
            .init(
                id: "NA",
                code: "264",
                masks: ["##-###-####"],
                locale: locale
            ),
            .init(
                id: "NC",
                code: "687",
                masks: ["##-####"],
                locale: locale
            ),
            .init(
                id: "NE",
                code: "227",
                masks: ["##-##-####"],
                locale: locale
            ),
            .init(
                id: "NF",
                code: "672",
                masks: ["###-###"],
                locale: locale
            ),
            .init(
                id: "NG",
                code: "234",
                masks: ["#-###-####"],
                locale: locale
            ),
            .init(
                id: "NI",
                code: "505",
                masks: ["####-####"],
                locale: locale
            ),
            .init(
                id: "NL",
                code: "31",
                masks: ["##-###-####"],
                locale: locale
            ),
            .init(
                id: "NO",
                code: "47",
                masks: ["(###)##-###"],
                locale: locale
            ),
            .init(
                id: "NP",
                code: "977",
                masks: ["###-###-####"],
                locale: locale
            ),
            .init(
                id: "NR",
                code: "674",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "NU",
                code: "683",
                masks: ["####"],
                locale: locale
            ),
            .init(
                id: "NZ",
                code: "64",
                masks: ["##-###-###", "(###)###-###", "(###)###-####", "(###)####-####"],
                locale: locale
            ),
            .init(
                id: "OM",
                code: "968",
                masks: ["##-###-###"],
                locale: locale
            ),
            .init(
                id: "PA",
                code: "507",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "PE",
                code: "51",
                masks: ["(###)###-###"],
                locale: locale
            ),
            .init(
                id: "PF",
                code: "689",
                masks: ["##-##-##"],
                locale: locale
            ),
            .init(
                id: "PG",
                code: "675",
                masks: ["(###)##-###"],
                locale: locale
            ),
            .init(
                id: "PH",
                code: "63",
                masks: ["(###)###-####"],
                locale: locale
            ),
            .init(
                id: "PK",
                code: "92",
                masks: ["(###)###-####"],
                locale: locale
            ),
            .init(
                id: "PL",
                code: "48",
                masks: ["(###)###-###"],
                locale: locale
            ),
            .init(
                id: "PM",
                code: "508",
                masks: ["###-###"],
                locale: locale
            ),
            .init(
                id: "PS",
                code: "970",
                masks: ["###-###-####"],
                locale: locale
            ),
            .init(
                id: "PT",
                code: "351",
                masks: ["##-###-####"],
                locale: locale
            ),
            .init(
                id: "PW",
                code: "680",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "PY",
                code: "595",
                masks: ["(###)###-###"],
                locale: locale
            ),
            .init(
                id: "QA",
                code: "974",
                masks: ["####-####"],
                locale: locale
            ),
            .init(
                id: "RE",
                code: "262",
                masks: ["#####-####"],
                locale: locale
            ),
            .init(
                id: "RO",
                code: "40",
                masks: ["###-###-###"],
                locale: locale
            ),
            .init(
                id: "RS",
                code: "381",
                masks: ["#-###-####", "##-###-####"],
                locale: locale
            ),
            .init(
                id: "RU",
                code: "7",
                masks: ["(###)###-##-##"],
                locale: locale
            ),
            .init(
                id: "RW",
                code: "250",
                masks: ["(###)###-###"],
                locale: locale
            ),
            .init(
                id: "SA",
                code: "966",
                masks: ["##-###-####"],
                locale: locale
            ),
            .init(
                id: "SB",
                code: "677",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "SC",
                code: "248",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "SD",
                code: "249",
                masks: ["##-###-####"],
                locale: locale
            ),
            .init(
                id: "SE",
                code: "46",
                masks: ["##-###-####"],
                locale: locale
            ),
            .init(
                id: "SG",
                code: "65",
                masks: ["####-####"],
                locale: locale
            ),
            .init(
                id: "SH",
                code: "290",
                masks: ["####"],
                locale: locale
            ),
            .init(
                id: "SI",
                code: "386",
                masks: ["##-###-###"],
                locale: locale
            ),
            .init(
                id: "SK",
                code: "421",
                masks: ["(###)###-###"],
                locale: locale
            ),
            .init(
                id: "SL",
                code: "232",
                masks: ["##-######"],
                locale: locale
            ),
            .init(
                id: "SM",
                code: "378",
                masks: ["####-######"],
                locale: locale
            ),
            .init(
                id: "SN",
                code: "221",
                masks: ["##-###-####"],
                locale: locale
            ),
            .init(
                id: "SO",
                code: "252",
                masks: ["#-###-###", "##-###-###"],
                locale: locale
            ),
            .init(
                id: "SR",
                code: "597",
                masks: ["###-###", "###-####"],
                locale: locale
            ),
            .init(
                id: "SS",
                code: "211",
                masks: ["##-###-####"],
                locale: locale
            ),
            .init(
                id: "ST",
                code: "239",
                masks: ["##-#####"],
                locale: locale
            ),
            .init(
                id: "SV",
                code: "503",
                masks: ["##-##-####"],
                locale: locale
            ),
            .init(
                id: "SX",
                code: "1(721)",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "SY",
                code: "963",
                masks: ["##-####-###"],
                locale: locale
            ),
            .init(
                id: "SZ",
                code: "268",
                masks: ["##-##-####"],
                locale: locale
            ),
            .init(
                id: "TC",
                code: "1(649)",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "TD",
                code: "235",
                masks: ["##-##-##-##"],
                locale: locale
            ),
            .init(
                id: "TG",
                code: "228",
                masks: ["##-###-###"],
                locale: locale
            ),
            .init(
                id: "TH",
                code: "66",
                masks: ["##-###-####"],
                locale: locale
            ),
            .init(
                id: "TJ",
                code: "992",
                masks: ["##-###-####"],
                locale: locale
            ),
            .init(
                id: "TK",
                code: "690",
                masks: ["####"],
                locale: locale
            ),
            .init(
                id: "TL",
                code: "670",
                masks: ["####-####"],
                locale: locale
            ),
            .init(
                id: "TM",
                code: "993",
                masks: ["#-###-####"],
                locale: locale
            ),
            .init(
                id: "TN",
                code: "216",
                masks: ["##-###-###"],
                locale: locale
            ),
            .init(
                id: "TO",
                code: "676",
                masks: ["#####"],
                locale: locale
            ),
            .init(
                id: "TR",
                code: "90",
                masks: ["(###)###-####"],
                locale: locale
            ),
            .init(
                id: "TT",
                code: "1(868)",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "TV",
                code: "688",
                masks: ["#####"],
                locale: locale
            ),
            .init(
                id: "TW",
                code: "886",
                masks: ["#-####-####"],
                locale: locale
            ),
            .init(
                id: "TZ",
                code: "255",
                masks: ["###-###-###"],
                locale: locale
            ),
            .init(
                id: "UA",
                code: "380",
                masks: ["(##)###-##-##"],
                locale: locale
            ),
            .init(
                id: "UG",
                code: "256",
                masks: ["(###)###-###"],
                locale: locale
            ),
            .init(
                id: "US",
                code: "1",
                masks: ["(###)###-####"],
                locale: locale
            ),
            .init(
                id: "UY",
                code: "598",
                masks: ["#-###-##-##"],
                locale: locale
            ),
            .init(
                id: "UZ",
                code: "998",
                masks: ["##-###-####"],
                locale: locale
            ),
            .init(
                id: "VC",
                code: "1(784)",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "VE",
                code: "58",
                masks: ["(###)###-####"],
                locale: locale
            ),
            .init(
                id: "VG",
                code: "1(284)",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "VI",
                code: "1(340)",
                masks: ["###-####"],
                locale: locale
            ),
            .init(
                id: "VN",
                code: "84",
                masks: ["(##)###-##-###"],
                locale: locale
            ),
            .init(
                id: "VU",
                code: "678",
                masks: ["##-#####"],
                locale: locale
            ),
            .init(
                id: "WF",
                code: "681",
                masks: ["##-####"],
                locale: locale
            ),
            .init(
                id: "WS",
                code: "685",
                masks: ["#####"],
                locale: locale
            ),
            .init(
                id: "YE",
                code: "967",
                masks: ["###-###-###"],
                locale: locale
            ),
            .init(
                id: "ZA",
                code: "27",
                masks: ["##-###-####"],
                locale: locale
            ),
            .init(
                id: "ZM",
                code: "260",
                masks: ["##-###-####"],
                locale: locale
            ),
        ]
    }
}
