-- First add the timezones column
ALTER TABLE "public"."countries"
ADD COLUMN "timezones" JSONB;

-- Complete timezone mappings for all countries
UPDATE "public"."countries"
SET timezones = timezone_data.tz_json
FROM (VALUES
    -- A
    ('AF', '{"+04:30": "Asia/Kabul"}'::json),
    ('AL', '{"+01:00": "Europe/Tirane"}'::json),
    ('DZ', '{"+01:00": "Africa/Algiers"}'::json),
    ('AD', '{"+01:00": "Europe/Andorra"}'::json),
    ('AO', '{"+01:00": "Africa/Luanda"}'::json),
    ('AG', '{"-04:00": "America/Antigua"}'::json),
    ('AR', '{"-03:00": "America/Argentina/Buenos_Aires"}'::json),
    ('AM', '{"+04:00": "Asia/Yerevan"}'::json),
    ('AU', '{"+08:00": "Australia/Perth","+09:30": "Australia/Darwin","+10:00": "Australia/Brisbane","+10:30": "Australia/Adelaide","+11:00": "Australia/Sydney"}'::json),
    ('AT', '{"+01:00": "Europe/Vienna"}'::json),
    ('AZ', '{"+04:00": "Asia/Baku"}'::json),
    -- B
    ('BS', '{"-05:00": "America/Nassau"}'::json),
    ('BH', '{"+03:00": "Asia/Bahrain"}'::json),
    ('BD', '{"+06:00": "Asia/Dhaka"}'::json),
    ('BB', '{"-04:00": "America/Barbados"}'::json),
    ('BY', '{"+03:00": "Europe/Minsk"}'::json),
    ('BE', '{"+01:00": "Europe/Brussels"}'::json),
    ('BZ', '{"-06:00": "America/Belize"}'::json),
    ('BJ', '{"+01:00": "Africa/Porto-Novo"}'::json),
    ('BT', '{"+06:00": "Asia/Thimphu"}'::json),
    ('BO', '{"-04:00": "America/La_Paz"}'::json),
    ('BA', '{"+01:00": "Europe/Sarajevo"}'::json),
    ('BW', '{"+02:00": "Africa/Gaborone"}'::json),
    ('BR', '{"-05:00": "America/Rio_Branco","-04:00": "America/Manaus","-03:00": "America/Sao_Paulo","-02:00": "America/Noronha"}'::json),
    ('BN', '{"+08:00": "Asia/Brunei"}'::json),
    ('BG', '{"+02:00": "Europe/Sofia"}'::json),
    ('BF', '{"+00:00": "Africa/Ouagadougou"}'::json),
    ('BI', '{"+02:00": "Africa/Bujumbura"}'::json),

    -- C
    ('KH', '{"+07:00": "Asia/Phnom_Penh"}'::json),
    ('CM', '{"+01:00": "Africa/Douala"}'::json),
    ('CA', '{"-08:00": "America/Vancouver","-07:00": "America/Edmonton","-06:00": "America/Winnipeg","-05:00": "America/Toronto","-04:00": "America/Halifax","-03:30": "America/St_Johns"}'::json),
    ('CV', '{"-01:00": "Atlantic/Cape_Verde"}'::json),
    ('CF', '{"+01:00": "Africa/Bangui"}'::json),
    ('TD', '{"+01:00": "Africa/Ndjamena"}'::json),
    ('CL', '{"-04:00": "America/Santiago","-06:00": "Pacific/Easter"}'::json),
    ('CN', '{"+08:00": "Asia/Shanghai"}'::json),
    ('CO', '{"-05:00": "America/Bogota"}'::json),
    ('KM', '{"+03:00": "Indian/Comoro"}'::json),
    ('CG', '{"+01:00": "Africa/Brazzaville"}'::json),
    ('CD', '{"+01:00": "Africa/Kinshasa","+02:00": "Africa/Lubumbashi"}'::json),
    ('CR', '{"-06:00": "America/Costa_Rica"}'::json),
    ('HR', '{"+01:00": "Europe/Zagreb"}'::json),
    ('CU', '{"-05:00": "America/Havana"}'::json),
    ('CY', '{"+02:00": "Asia/Nicosia"}'::json),
    ('CZ', '{"+01:00": "Europe/Prague"}'::json),

    -- D
    ('DK', '{"+01:00": "Europe/Copenhagen"}'::json),
    ('DJ', '{"+03:00": "Africa/Djibouti"}'::json),
    ('DM', '{"-04:00": "America/Dominica"}'::json),
    ('DO', '{"-04:00": "America/Santo_Domingo"}'::json),

    -- E
    ('EC', '{"-05:00": "America/Guayaquil","-06:00": "Pacific/Galapagos"}'::json),
    ('EG', '{"+02:00": "Africa/Cairo"}'::json),
    ('SV', '{"-06:00": "America/El_Salvador"}'::json),
    ('GQ', '{"+01:00": "Africa/Malabo"}'::json),
    ('ER', '{"+03:00": "Africa/Asmara"}'::json),
    ('EE', '{"+02:00": "Europe/Tallinn"}'::json),
    ('ET', '{"+03:00": "Africa/Addis_Ababa"}'::json),

    -- F
    ('FJ', '{"+12:00": "Pacific/Fiji"}'::json),
    ('FI', '{"+02:00": "Europe/Helsinki"}'::json),
    ('FR', '{"+01:00": "Europe/Paris"}'::json),

    -- G
    ('GA', '{"+01:00": "Africa/Libreville"}'::json),
    ('GM', '{"+00:00": "Africa/Banjul"}'::json),
    ('GE', '{"+04:00": "Asia/Tbilisi"}'::json),
    ('DE', '{"+01:00": "Europe/Berlin"}'::json),
    ('GH', '{"+00:00": "Africa/Accra"}'::json),
    ('GR', '{"+02:00": "Europe/Athens"}'::json),
    ('GD', '{"-04:00": "America/Grenada"}'::json),
    ('GT', '{"-06:00": "America/Guatemala"}'::json),
    ('GN', '{"+00:00": "Africa/Conakry"}'::json),
    ('GW', '{"+00:00": "Africa/Bissau"}'::json),
    ('GY', '{"-04:00": "America/Guyana"}'::json),

    -- H
    ('HT', '{"-05:00": "America/Port-au-Prince"}'::json),
    ('HN', '{"-06:00": "America/Tegucigalpa"}'::json),
    ('HU', '{"+01:00": "Europe/Budapest"}'::json),

    -- I
    ('IS', '{"+00:00": "Atlantic/Reykjavik"}'::json),
    ('IN', '{"+05:30": "Asia/Kolkata"}'::json),
    ('ID', '{"+07:00": "Asia/Jakarta","+08:00": "Asia/Makassar","+09:00": "Asia/Jayapura"}'::json),
    ('IR', '{"+03:30": "Asia/Tehran"}'::json),
    ('IQ', '{"+03:00": "Asia/Baghdad"}'::json),
    ('IE', '{"+00:00": "Europe/Dublin"}'::json),
    ('IL', '{"+02:00": "Asia/Jerusalem"}'::json),
    ('IT', '{"+01:00": "Europe/Rome"}'::json),

    -- J
    ('JM', '{"-05:00": "America/Jamaica"}'::json),
    ('JP', '{"+09:00": "Asia/Tokyo"}'::json),
    ('JO', '{"+02:00": "Asia/Amman"}'::json),

    -- K
    ('KZ', '{"+05:00": "Asia/Aqtau","+06:00": "Asia/Almaty"}'::json),
    ('KE', '{"+03:00": "Africa/Nairobi"}'::json),
    ('KI', '{"+12:00": "Pacific/Tarawa","+13:00": "Pacific/Enderbury","+14:00": "Pacific/Kiritimati"}'::json),
    ('KP', '{"+09:00": "Asia/Pyongyang"}'::json),
    ('KR', '{"+09:00": "Asia/Seoul"}'::json),
    ('KW', '{"+03:00": "Asia/Kuwait"}'::json),
    ('KG', '{"+06:00": "Asia/Bishkek"}'::json),

    -- L
    ('LA', '{"+07:00": "Asia/Vientiane"}'::json),
    ('LV', '{"+02:00": "Europe/Riga"}'::json),
    ('LB', '{"+02:00": "Asia/Beirut"}'::json),
    ('LS', '{"+02:00": "Africa/Maseru"}'::json),
    ('LR', '{"+00:00": "Africa/Monrovia"}'::json),
    ('LY', '{"+02:00": "Africa/Tripoli"}'::json),
    ('LI', '{"+01:00": "Europe/Vaduz"}'::json),
    ('LT', '{"+02:00": "Europe/Vilnius"}'::json),
    ('LU', '{"+01:00": "Europe/Luxembourg"}'::json),

    -- M
    ('MK', '{"+01:00": "Europe/Skopje"}'::json),
    ('MG', '{"+03:00": "Indian/Antananarivo"}'::json),
    ('MW', '{"+02:00": "Africa/Blantyre"}'::json),
    ('MY', '{"+08:00": "Asia/Kuala_Lumpur"}'::json),
    ('MV', '{"+05:00": "Indian/Maldives"}'::json),
    ('ML', '{"+00:00": "Africa/Bamako"}'::json),
    ('MT', '{"+01:00": "Europe/Malta"}'::json),
    ('MH', '{"+12:00": "Pacific/Majuro"}'::json),
    ('MR', '{"+00:00": "Africa/Nouakchott"}'::json),
    ('MU', '{"+04:00": "Indian/Mauritius"}'::json),
    ('MX', '{"-08:00": "America/Tijuana","-07:00": "America/Hermosillo","-06:00": "America/Mexico_City"}'::json),
    ('FM', '{"+10:00": "Pacific/Chuuk","+11:00": "Pacific/Kosrae"}'::json),
    ('MD', '{"+02:00": "Europe/Chisinau"}'::json),
    ('MC', '{"+01:00": "Europe/Monaco"}'::json),
    ('MN', '{"+08:00": "Asia/Ulaanbaatar"}'::json),
    ('ME', '{"+01:00": "Europe/Podgorica"}'::json),
    ('MA', '{"+01:00": "Africa/Casablanca"}'::json),
    ('MZ', '{"+02:00": "Africa/Maputo"}'::json),
    ('MM', '{"+06:30": "Asia/Yangon"}'::json),

    -- N
    ('NA', '{"+02:00": "Africa/Windhoek"}'::json),
    ('NR', '{"+12:00": "Pacific/Nauru"}'::json),
    ('NP', '{"+05:45": "Asia/Kathmandu"}'::json),
    ('NL', '{"+01:00": "Europe/Amsterdam"}'::json),
    ('NZ', '{"+12:00": "Pacific/Auckland","+12:45": "Pacific/Chatham"}'::json),
    ('NI', '{"-06:00": "America/Managua"}'::json),
    ('NE', '{"+01:00": "Africa/Niamey"}'::json),
    ('NG', '{"+01:00": "Africa/Lagos"}'::json),
    ('NO', '{"+01:00": "Europe/Oslo"}'::json),

    -- O
    ('OM', '{"+04:00": "Asia/Muscat"}'::json),

    -- P
    ('PK', '{"+05:00": "Asia/Karachi"}'::json),
    ('PW', '{"+09:00": "Pacific/Palau"}'::json),
    ('PS', '{"+02:00": "Asia/Gaza"}'::json),
    ('PA', '{"-05:00": "America/Panama"}'::json),
    ('PG', '{"+10:00": "Pacific/Port_Moresby"}'::json),
    ('PY', '{"-04:00": "America/Asuncion"}'::json),
    ('PE', '{"-05:00": "America/Lima"}'::json),
    ('PH', '{"+08:00": "Asia/Manila"}'::json),
    ('PL', '{"+01:00": "Europe/Warsaw"}'::json),
    ('PT', '{"+00:00": "Europe/Lisbon","-01:00": "Atlantic/Azores"}'::json),

    -- Q
    ('QA', '{"+03:00": "Asia/Qatar"}'::json),

    -- R
    ('RO', '{"+02:00": "Europe/Bucharest"}'::json),
    ('RU', '{"+02:00": "Europe/Kaliningrad","+03:00": "Europe/Moscow","+04:00": "Europe/Samara","+05:00": "Asia/Yekaterinburg","+06:00": "Asia/Omsk","+07:00": "Asia/Krasnoyarsk","+08:00": "Asia/Irkutsk","+09:00": "Asia/Yakutsk","+10:00": "Asia/Vladivostok","+11:00": "Asia/Sakhalin","+12:00": "Asia/Kamchatka"}'::json),
    ('RW', '{"+02:00": "Africa/Kigali"}'::json),

    -- S
    ('KN', '{"-04:00": "America/St_Kitts"}'::json),
    ('LC', '{"-04:00": "America/St_Lucia"}'::json),
    ('VC', '{"-04:00": "America/St_Vincent"}'::json),
    ('WS', '{"+13:00": "Pacific/Apia"}'::json),
    ('SM', '{"+01:00": "Europe/San_Marino"}'::json),
    ('ST', '{"+00:00": "Africa/Sao_Tome"}'::json),
    ('SA', '{"+03:00": "Asia/Riyadh"}'::json),
    ('SN', '{"+00:00": "Africa/Dakar"}'::json),
    ('RS', '{"+01:00": "Europe/Belgrade"}'::json),
    ('SC', '{"+04:00": "Indian/Mahe"}'::json),
    ('SL', '{"+00:00": "Africa/Freetown"}'::json),
    ('SG', '{"+08:00": "Asia/Singapore"}'::json),
    ('SK', '{"+01:00": "Europe/Bratislava"}'::json),
    ('SI', '{"+01:00": "Europe/Ljubljana"}'::json),
    ('SB', '{"+11:00": "Pacific/Guadalcanal"}'::json),
    ('SO', '{"+03:00": "Africa/Mogadishu"}'::json),
    ('ZA', '{"+02:00": "Africa/Johannesburg"}'::json),
    ('SS', '{"+03:00": "Africa/Juba"}'::json),
    ('ES', '{"+01:00": "Europe/Madrid","+00:00": "Atlantic/Canary"}'::json),
    ('LK', '{"+05:30": "Asia/Colombo"}'::json),
    ('SD', '{"+02:00": "Africa/Khartoum"}'::json),
    ('SR', '{"-03:00": "America/Paramaribo"}'::json),
    ('SE', '{"+01:00": "Europe/Stockholm"}'::json),
    ('CH', '{"+01:00": "Europe/Zurich"}'::json),
    ('SY', '{"+02:00": "Asia/Damascus"}'::json),

    -- T
    ('TW', '{"+08:00": "Asia/Taipei"}'::json),
    ('TJ', '{"+05:00": "Asia/Dushanbe"}'::json),
    ('TZ', '{"+03:00": "Africa/Dar_es_Salaam"}'::json),
    ('TH', '{"+07:00": "Asia/Bangkok"}'::json),
    ('TL', '{"+09:00": "Asia/Dili"}'::json),
    ('TG', '{"+00:00": "Africa/Lome"}'::json),
    ('TO', '{"+13:00": "Pacific/Tongatapu"}'::json),
    ('TT', '{"-04:00": "America/Port_of_Spain"}'::json),
    ('TN', '{"+01:00": "Africa/Tunis"}'::json),
    ('TR', '{"+03:00": "Europe/Istanbul"}'::json),
    ('TM', '{"+05:00": "Asia/Ashgabat"}'::json),
    ('TV', '{"+12:00": "Pacific/Funafuti"}'::json),

    -- U
    ('UG', '{"+03:00": "Africa/Kampala"}'::json),
    ('UA', '{"+02:00": "Europe/Kiev"}'::json),
    ('AE', '{"+04:00": "Asia/Dubai"}'::json),
    ('GB', '{"+00:00": "Europe/London"}'::json),
    ('US', '{"-10:00": "Pacific/Honolulu","-09:00": "America/Anchorage","-08:00": "America/Los_Angeles","-07:00": "America/Denver","-06:00": "America/Chicago","-05:00": "America/New_York","-04:00": "America/Puerto_Rico"}'::json),
    ('UY', '{"-03:00": "America/Montevideo"}'::json),
    ('UZ', '{"+05:00": "Asia/Tashkent"}'::json),

    -- V
    ('VU', '{"+11:00": "Pacific/Efate"}'::json),
    ('VA', '{"+01:00": "Europe/Vatican"}'::json),
    ('VE', '{"-04:00": "America/Caracas"}'::json),
    ('VN', '{"+07:00": "Asia/Ho_Chi_Minh"}'::json),

    -- Y
    ('YE', '{"+03:00": "Asia/Aden"}'::json),

    -- Z
    ('ZM', '{"+02:00": "Africa/Lusaka"}'::json),
    ('ZW', '{"+02:00": "Africa/Harare"}'::json),
    
    -- Disputed Territories
    ('XK', '{"+01:00": "Europe/Belgrade"}'::json),  -- Kosovo uses Serbia's timezone
    ('TS', '{"+02:00": "Europe/Chisinau"}'::json),  -- Transnistria uses Moldova's timezone
    ('XS', '{"+03:00": "Africa/Mogadishu"}'::json),  -- Somaliland uses Somalia's timezone
    ('OS', '{"+03:00": "Europe/Moscow"}'::json),  -- South Ossetia uses Moscow time
    ('AB', '{"+03:00": "Europe/Moscow"}'::json),  -- Abkhazia uses Moscow time
    ('CT', '{"+02:00": "Asia/Nicosia"}'::json),  -- Northern Cyprus uses Cyprus time
    ('NK', '{"+04:00": "Asia/Yerevan"}'::json),  -- Nagorno-Karabakh uses Armenia's timezone

    -- Territories
    ('AS', '{"-11:00": "Pacific/Pago_Pago"}'::json),  -- American Samoa
    ('AI', '{"-04:00": "America/Anguilla"}'::json),  -- Anguilla
    ('AW', '{"-04:00": "America/Aruba"}'::json),  -- Aruba
    ('BM', '{"-04:00": "Atlantic/Bermuda"}'::json),  -- Bermuda
    ('BV', '{"+01:00": "Europe/Oslo"}'::json),  -- Bouvet Island (Norway)
    ('IO', '{"+06:00": "Indian/Chagos"}'::json),  -- British Indian Ocean Territory
    ('VG', '{"-04:00": "America/Tortola"}'::json),  -- British Virgin Islands
    ('KY', '{"-05:00": "America/Cayman"}'::json),  -- Cayman Islands
    ('CX', '{"+07:00": "Indian/Christmas"}'::json),  -- Christmas Island
    ('CC', '{"+06:30": "Indian/Cocos"}'::json),  -- Cocos Islands
    ('CK', '{"-10:00": "Pacific/Rarotonga"}'::json),  -- Cook Islands
    ('CW', '{"-04:00": "America/Curacao"}'::json),  -- Curacao
    ('FK', '{"-03:00": "Atlantic/Stanley"}'::json),  -- Falkland Islands
    ('FO', '{"+00:00": "Atlantic/Faroe"}'::json),  -- Faroe Islands
    ('GF', '{"-03:00": "America/Cayenne"}'::json),  -- French Guiana
    ('PF', '{"-10:00": "Pacific/Tahiti","-09:30": "Pacific/Marquesas","-09:00": "Pacific/Gambier"}'::json),  -- French Polynesia
    ('TF', '{"+05:00": "Indian/Kerguelen"}'::json),  -- French Southern Territories
    ('GI', '{"+01:00": "Europe/Gibraltar"}'::json),  -- Gibraltar
    ('GL', '{"-04:00": "America/Thule","-03:00": "America/Godthab","-01:00": "America/Scoresbysund"}'::json),  -- Greenland
    ('GP', '{"-04:00": "America/Guadeloupe"}'::json),  -- Guadeloupe
    ('GU', '{"+10:00": "Pacific/Guam"}'::json),  -- Guam
    ('HK', '{"+08:00": "Asia/Hong_Kong"}'::json),  -- Hong Kong
    ('MO', '{"+08:00": "Asia/Macau"}'::json),  -- Macao
    ('MQ', '{"-04:00": "America/Martinique"}'::json),  -- Martinique
    ('YT', '{"+03:00": "Indian/Mayotte"}'::json),  -- Mayotte
    ('MS', '{"-04:00": "America/Montserrat"}'::json),  -- Montserrat
    ('NC', '{"+11:00": "Pacific/Noumea"}'::json),  -- New Caledonia
    ('NU', '{"-11:00": "Pacific/Niue"}'::json),  -- Niue
    ('NF', '{"+11:00": "Pacific/Norfolk"}'::json),  -- Norfolk Island
    ('MP', '{"+10:00": "Pacific/Saipan"}'::json),  -- Northern Mariana Islands
    ('PN', '{"-08:00": "Pacific/Pitcairn"}'::json),  -- Pitcairn
    ('PR', '{"-04:00": "America/Puerto_Rico"}'::json),  -- Puerto Rico
    ('RE', '{"+04:00": "Indian/Reunion"}'::json),  -- Reunion
    ('BL', '{"-04:00": "America/St_Barthelemy"}'::json),  -- Saint Barthelemy
    ('SH', '{"+00:00": "Atlantic/St_Helena"}'::json),  -- Saint Helena
    ('MF', '{"-04:00": "America/Marigot"}'::json),  -- Saint Martin
    ('PM', '{"-03:00": "America/Miquelon"}'::json),  -- Saint Pierre and Miquelon
    ('SX', '{"-04:00": "America/Lower_Princes"}'::json),  -- Sint Maarten
    ('TK', '{"+13:00": "Pacific/Fakaofo"}'::json),  -- Tokelau
    ('VI', '{"-04:00": "America/St_Thomas"}'::json)  -- U.S. Virgin Islands
) AS timezone_data(country_code, tz_json)
WHERE countries.iso2 = timezone_data.country_code;
