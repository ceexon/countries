-- First add the timezones column
ALTER TABLE "public"."countries"
ADD COLUMN "timezones" JSONB;

-- Complete timezone mappings for all countries
UPDATE "public"."countries"
SET timezones = timezone_data.tz_json
FROM (VALUES
    -- A
    ('AF', '{"\\+04:30": "Asia/Kabul"}'::jsonb),
    ('AL', '{"\\+01:00": "Europe/Tirane"}'::jsonb),
    ('DZ', '{"\\+01:00": "Africa/Algiers"}'::jsonb),
    ('AD', '{"\\+01:00": "Europe/Andorra"}'::jsonb),
    ('AO', '{"\\+01:00": "Africa/Luanda"}'::jsonb),
    ('AG', '{"\\-04:00": "America/Antigua"}'::jsonb),
    ('AR', '{"\\-03:00": "America/Argentina/Buenos_Aires"}'::jsonb),
    ('AM', '{"\\+04:00": "Asia/Yerevan"}'::jsonb),
    ('AU', '{
        "\\+08:00": "Australia/Perth",
        "\\+09:30": "Australia/Darwin",
        "\\+10:00": "Australia/Brisbane",
        "\\+10:30": "Australia/Adelaide",
        "\\+11:00": "Australia/Sydney"
    }'::jsonb),
    ('AT', '{"\\+01:00": "Europe/Vienna"}'::jsonb),
    ('AZ', '{"\\+04:00": "Asia/Baku"}'::jsonb),

    -- B
    ('BS', '{"\\-05:00": "America/Nassau"}'::jsonb),
    ('BH', '{"\\+03:00": "Asia/Bahrain"}'::jsonb),
    ('BD', '{"\\+06:00": "Asia/Dhaka"}'::jsonb),
    ('BB', '{"\\-04:00": "America/Barbados"}'::jsonb),
    ('BY', '{"\\+03:00": "Europe/Minsk"}'::jsonb),
    ('BE', '{"\\+01:00": "Europe/Brussels"}'::jsonb),
    ('BZ', '{"\\-06:00": "America/Belize"}'::jsonb),
    ('BJ', '{"\\+01:00": "Africa/Porto-Novo"}'::jsonb),
    ('BT', '{"\\+06:00": "Asia/Thimphu"}'::jsonb),
    ('BO', '{"\\-04:00": "America/La_Paz"}'::jsonb),
    ('BA', '{"\\+01:00": "Europe/Sarajevo"}'::jsonb),
    ('BW', '{"\\+02:00": "Africa/Gaborone"}'::jsonb),
    ('BR', '{
        "\\-05:00": "America/Rio_Branco",
        "\\-04:00": "America/Manaus",
        "\\-03:00": "America/Sao_Paulo",
        "\\-02:00": "America/Noronha"
    }'::jsonb),
    ('BN', '{"\\+08:00": "Asia/Brunei"}'::jsonb),
    ('BG', '{"\\+02:00": "Europe/Sofia"}'::jsonb),
    ('BF', '{"\\+00:00": "Africa/Ouagadougou"}'::jsonb),
    ('BI', '{"\\+02:00": "Africa/Bujumbura"}'::jsonb),

    -- C
    ('KH', '{"\\+07:00": "Asia/Phnom_Penh"}'::jsonb),
    ('CM', '{"\\+01:00": "Africa/Douala"}'::jsonb),
    ('CA', '{
        "\\-08:00": "America/Vancouver",
        "\\-07:00": "America/Edmonton",
        "\\-06:00": "America/Winnipeg",
        "\\-05:00": "America/Toronto",
        "\\-04:00": "America/Halifax",
        "\\-03:30": "America/St_Johns"
    }'::jsonb),
    ('CV', '{"\\-01:00": "Atlantic/Cape_Verde"}'::jsonb),
    ('CF', '{"\\+01:00": "Africa/Bangui"}'::jsonb),
    ('TD', '{"\\+01:00": "Africa/Ndjamena"}'::jsonb),
    ('CL', '{
        "\\-04:00": "America/Santiago",
        "\\-06:00": "Pacific/Easter"
    }'::jsonb),
    ('CN', '{"\\+08:00": "Asia/Shanghai"}'::jsonb),
    ('CO', '{"\\-05:00": "America/Bogota"}'::jsonb),
    ('KM', '{"\\+03:00": "Indian/Comoro"}'::jsonb),
    ('CG', '{"\\+01:00": "Africa/Brazzaville"}'::jsonb),
    ('CD', '{
        "\\+01:00": "Africa/Kinshasa",
        "\\+02:00": "Africa/Lubumbashi"
    }'::jsonb),
    ('CR', '{"\\-06:00": "America/Costa_Rica"}'::jsonb),
    ('HR', '{"\\+01:00": "Europe/Zagreb"}'::jsonb),
    ('CU', '{"\\-05:00": "America/Havana"}'::jsonb),
    ('CY', '{"\\+02:00": "Asia/Nicosia"}'::jsonb),
    ('CZ', '{"\\+01:00": "Europe/Prague"}'::jsonb),

    -- D
    ('DK', '{"\\+01:00": "Europe/Copenhagen"}'::jsonb),
    ('DJ', '{"\\+03:00": "Africa/Djibouti"}'::jsonb),
    ('DM', '{"\\-04:00": "America/Dominica"}'::jsonb),
    ('DO', '{"\\-04:00": "America/Santo_Domingo"}'::jsonb),

    -- E
    ('EC', '{
        "\\-05:00": "America/Guayaquil",
        "\\-06:00": "Pacific/Galapagos"
    }'::jsonb),
    ('EG', '{"\\+02:00": "Africa/Cairo"}'::jsonb),
    ('SV', '{"\\-06:00": "America/El_Salvador"}'::jsonb),
    ('GQ', '{"\\+01:00": "Africa/Malabo"}'::jsonb),
    ('ER', '{"\\+03:00": "Africa/Asmara"}'::jsonb),
    ('EE', '{"\\+02:00": "Europe/Tallinn"}'::jsonb),
    ('ET', '{"\\+03:00": "Africa/Addis_Ababa"}'::jsonb),

    -- F
    ('FJ', '{"\\+12:00": "Pacific/Fiji"}'::jsonb),
    ('FI', '{"\\+02:00": "Europe/Helsinki"}'::jsonb),
    ('FR', '{"\\+01:00": "Europe/Paris"}'::jsonb),

    -- G
    ('GA', '{"\\+01:00": "Africa/Libreville"}'::jsonb),
    ('GM', '{"\\+00:00": "Africa/Banjul"}'::jsonb),
    ('GE', '{"\\+04:00": "Asia/Tbilisi"}'::jsonb),
    ('DE', '{"\\+01:00": "Europe/Berlin"}'::jsonb),
    ('GH', '{"\\+00:00": "Africa/Accra"}'::jsonb),
    ('GR', '{"\\+02:00": "Europe/Athens"}'::jsonb),
    ('GD', '{"\\-04:00": "America/Grenada"}'::jsonb),
    ('GT', '{"\\-06:00": "America/Guatemala"}'::jsonb),
    ('GN', '{"\\+00:00": "Africa/Conakry"}'::jsonb),
    ('GW', '{"\\+00:00": "Africa/Bissau"}'::jsonb),
    ('GY', '{"\\-04:00": "America/Guyana"}'::jsonb),

    -- H
    ('HT', '{"\\-05:00": "America/Port-au-Prince"}'::jsonb),
    ('HN', '{"\\-06:00": "America/Tegucigalpa"}'::jsonb),
    ('HU', '{"\\+01:00": "Europe/Budapest"}'::jsonb),

    -- I
    ('IS', '{"\\+00:00": "Atlantic/Reykjavik"}'::jsonb),
    ('IN', '{"\\+05:30": "Asia/Kolkata"}'::jsonb),
    ('ID', '{
        "\\+07:00": "Asia/Jakarta",
        "\\+08:00": "Asia/Makassar",
        "\\+09:00": "Asia/Jayapura"
    }'::jsonb),
    ('IR', '{"\\+03:30": "Asia/Tehran"}'::jsonb),
    ('IQ', '{"\\+03:00": "Asia/Baghdad"}'::jsonb),
    ('IE', '{"\\+00:00": "Europe/Dublin"}'::jsonb),
    ('IL', '{"\\+02:00": "Asia/Jerusalem"}'::jsonb),
    ('IT', '{"\\+01:00": "Europe/Rome"}'::jsonb),

    -- J
    ('JM', '{"\\-05:00": "America/Jamaica"}'::jsonb),
    ('JP', '{"\\+09:00": "Asia/Tokyo"}'::jsonb),
    ('JO', '{"\\+02:00": "Asia/Amman"}'::jsonb),

    -- K
    ('KZ', '{
        "\\+05:00": "Asia/Aqtau",
        "\\+06:00": "Asia/Almaty"
    }'::jsonb),
    ('KE', '{"\\+03:00": "Africa/Nairobi"}'::jsonb),
    ('KI', '{
        "\\+12:00": "Pacific/Tarawa",
        "\\+13:00": "Pacific/Enderbury",
        "\\+14:00": "Pacific/Kiritimati"
    }'::jsonb),
    ('KP', '{"\\+09:00": "Asia/Pyongyang"}'::jsonb),
    ('KR', '{"\\+09:00": "Asia/Seoul"}'::jsonb),
    ('KW', '{"\\+03:00": "Asia/Kuwait"}'::jsonb),
    ('KG', '{"\\+06:00": "Asia/Bishkek"}'::jsonb),

    -- L
    ('LA', '{"\\+07:00": "Asia/Vientiane"}'::jsonb),
    ('LV', '{"\\+02:00": "Europe/Riga"}'::jsonb),
    ('LB', '{"\\+02:00": "Asia/Beirut"}'::jsonb),
    ('LS', '{"\\+02:00": "Africa/Maseru"}'::jsonb),
    ('LR', '{"\\+00:00": "Africa/Monrovia"}'::jsonb),
    ('LY', '{"\\+02:00": "Africa/Tripoli"}'::jsonb),
    ('LI', '{"\\+01:00": "Europe/Vaduz"}'::jsonb),
    ('LT', '{"\\+02:00": "Europe/Vilnius"}'::jsonb),
    ('LU', '{"\\+01:00": "Europe/Luxembourg"}'::jsonb),

    -- M
    ('MK', '{"\\+01:00": "Europe/Skopje"}'::jsonb),
    ('MG', '{"\\+03:00": "Indian/Antananarivo"}'::jsonb),
    ('MW', '{"\\+02:00": "Africa/Blantyre"}'::jsonb),
    ('MY', '{"\\+08:00": "Asia/Kuala_Lumpur"}'::jsonb),
    ('MV', '{"\\+05:00": "Indian/Maldives"}'::jsonb),
    ('ML', '{"\\+00:00": "Africa/Bamako"}'::jsonb),
    ('MT', '{"\\+01:00": "Europe/Malta"}'::jsonb),
    ('MH', '{"\\+12:00": "Pacific/Majuro"}'::jsonb),
    ('MR', '{"\\+00:00": "Africa/Nouakchott"}'::jsonb),
    ('MU', '{"\\+04:00": "Indian/Mauritius"}'::jsonb),
    ('MX', '{
        "\\-08:00": "America/Tijuana",
        "\\-07:00": "America/Hermosillo",
        "\\-06:00": "America/Mexico_City"
    }'::jsonb),
    ('FM', '{
        "\\+10:00": "Pacific/Chuuk",
        "\\+11:00": "Pacific/Kosrae"
    }'::jsonb),
    ('MD', '{"\\+02:00": "Europe/Chisinau"}'::jsonb),
    ('MC', '{"\\+01:00": "Europe/Monaco"}'::jsonb),
    ('MN', '{"\\+08:00": "Asia/Ulaanbaatar"}'::jsonb),
    ('ME', '{"\\+01:00": "Europe/Podgorica"}'::jsonb),
    ('MA', '{"\\+01:00": "Africa/Casablanca"}'::jsonb),
    ('MZ', '{"\\+02:00": "Africa/Maputo"}'::jsonb),
    ('MM', '{"\\+06:30": "Asia/Yangon"}'::jsonb),

    -- N
    ('NA', '{"\\+02:00": "Africa/Windhoek"}'::jsonb),
    ('NR', '{"\\+12:00": "Pacific/Nauru"}'::jsonb),
    ('NP', '{"\\+05:45": "Asia/Kathmandu"}'::jsonb),
    ('NL', '{"\\+01:00": "Europe/Amsterdam"}'::jsonb),
    ('NZ', '{
        "\\+12:00": "Pacific/Auckland",
        "\\+12:45": "Pacific/Chatham"
    }'::jsonb),
    ('NI', '{"\\-06:00": "America/Managua"}'::jsonb),
    ('NE', '{"\\+01:00": "Africa/Niamey"}'::jsonb),
    ('NG', '{"\\+01:00": "Africa/Lagos"}'::jsonb),
    ('NO', '{"\\+01:00": "Europe/Oslo"}'::jsonb),

    -- O
    ('OM', '{"\\+04:00": "Asia/Muscat"}'::jsonb),

    -- P
    ('PK', '{"\\+05:00": "Asia/Karachi"}'::jsonb),
    ('PW', '{"\\+09:00": "Pacific/Palau"}'::jsonb),
    ('PS', '{"\\+02:00": "Asia/Gaza"}'::jsonb),
    ('PA', '{"\\-05:00": "America/Panama"}'::jsonb),
    ('PG', '{"\\+10:00": "Pacific/Port_Moresby"}'::jsonb),
    ('PY', '{"\\-04:00": "America/Asuncion"}'::jsonb),
    ('PE', '{"\\-05:00": "America/Lima"}'::jsonb),
    ('PH', '{"\\+08:00": "Asia/Manila"}'::jsonb),
    ('PL', '{"\\+01:00": "Europe/Warsaw"}'::jsonb),
    ('PT', '{
        "\\+00:00": "Europe/Lisbon",
        "\\-01:00": "Atlantic/Azores"
    }'::jsonb),

    -- Q
    ('QA', '{"\\+03:00": "Asia/Qatar"}'::jsonb),

    -- R
    ('RO', '{"\\+02:00": "Europe/Bucharest"}'::jsonb),
    ('RU', '{
        "\\+02:00": "Europe/Kaliningrad",
        "\\+03:00": "Europe/Moscow",
        "\\+04:00": "Europe/Samara",
        "\\+05:00": "Asia/Yekaterinburg",
        "\\+06:00": "Asia/Omsk",
        "\\+07:00": "Asia/Krasnoyarsk",
        "\\+08:00": "Asia/Irkutsk",
        "\\+09:00": "Asia/Yakutsk",
        "\\+10:00": "Asia/Vladivostok",
        "\\+11:00": "Asia/Sakhalin",
        "\\+12:00": "Asia/Kamchatka"
    }'::jsonb),
    ('RW', '{"\\+02:00": "Africa/Kigali"}'::jsonb),

    -- S
    ('KN', '{"\\-04:00": "America/St_Kitts"}'::jsonb),
    ('LC', '{"\\-04:00": "America/St_Lucia"}'::jsonb),
    ('VC', '{"\\-04:00": "America/St_Vincent"}'::jsonb),
    ('WS', '{"\\+13:00": "Pacific/Apia"}'::jsonb),
    ('SM', '{"\\+01:00": "Europe/San_Marino"}'::jsonb),
    ('ST', '{"\\+00:00": "Africa/Sao_Tome"}'::jsonb),
    ('SA', '{"\\+03:00": "Asia/Riyadh"}'::jsonb),
    ('SN', '{"\\+00:00": "Africa/Dakar"}'::jsonb),
    ('RS', '{"\\+01:00": "Europe/Belgrade"}'::jsonb),
    ('SC', '{"\\+04:00": "Indian/Mahe"}'::jsonb),
    ('SL', '{"\\+00:00": "Africa/Freetown"}'::jsonb),
    ('SG', '{"\\+08:00": "Asia/Singapore"}'::jsonb),
    ('SK', '{"\\+01:00": "Europe/Bratislava"}'::jsonb),
    ('SI', '{"\\+01:00": "Europe/Ljubljana"}'::jsonb),
    ('SB', '{"\\+11:00": "Pacific/Guadalcanal"}'::jsonb),
    ('SO', '{"\\+03:00": "Africa/Mogadishu"}'::jsonb),
    ('ZA', '{"\\+02:00": "Africa/Johannesburg"}'::jsonb),
    ('SS', '{"\\+03:00": "Africa/Juba"}'::jsonb),
    ('ES', '{
        "\\+01:00": "Europe/Madrid",
        "\\+00:00": "Atlantic/Canary"
    }'::jsonb),
    ('LK', '{"\\+05:30": "Asia/Colombo"}'::jsonb),
    ('SD', '{"\\+02:00": "Africa/Khartoum"}'::jsonb),
    ('SR', '{"\\-03:00": "America/Paramaribo"}'::jsonb),
    ('SE', '{"\\+01:00": "Europe/Stockholm"}'::jsonb),
    ('CH', '{"\\+01:00": "Europe/Zurich"}'::jsonb),
    ('SY', '{"\\+02:00": "Asia/Damascus"}'::jsonb),

    -- T
    ('TW', '{"\\+08:00": "Asia/Taipei"}'::jsonb),
    ('TJ', '{"\\+05:00": "Asia/Dushanbe"}'::jsonb),
    ('TZ', '{"\\+03:00": "Africa/Dar_es_Salaam"}'::jsonb),
    ('TH', '{"\\+07:00": "Asia/Bangkok"}'::jsonb),
    ('TL', '{"\\+09:00": "Asia/Dili"}'::jsonb),
    ('TG', '{"\\+00:00": "Africa/Lome"}'::jsonb),
    ('TO', '{"\\+13:00": "Pacific/Tongatapu"}'::jsonb),
    ('TT', '{"\\-04:00": "America/Port_of_Spain"}'::jsonb),
    ('TN', '{"\\+01:00": "Africa/Tunis"}'::jsonb),
    ('TR', '{"\\+03:00": "Europe/Istanbul"}'::jsonb),
    ('TM', '{"\\+05:00": "Asia/Ashgabat"}'::jsonb),
    ('TV', '{"\\+12:00": "Pacific/Funafuti"}'::jsonb),

    -- U
    ('UG', '{"\\+03:00": "Africa/Kampala"}'::jsonb),
    ('UA', '{"\\+02:00": "Europe/Kiev"}'::jsonb),
    ('AE', '{"\\+04:00": "Asia/Dubai"}'::jsonb),
    ('GB', '{"\\+00:00": "Europe/London"}'::jsonb),
    ('US', '{
        "\\-10:00": "Pacific/Honolulu",
        "\\-09:00": "America/Anchorage",
        "\\-08:00": "America/Los_Angeles",
        "\\-07:00": "America/Denver",
        "\\-06:00": "America/Chicago",
        "\\-05:00": "America/New_York",
        "\\-04:00": "America/Puerto_Rico"
    }'::jsonb),
    ('UY', '{"\\-03:00": "America/Montevideo"}'::jsonb),
    ('UZ', '{"\\+05:00": "Asia/Tashkent"}'::jsonb),

    -- V
    ('VU', '{"\\+11:00": "Pacific/Efate"}'::jsonb),
    ('VA', '{"\\+01:00": "Europe/Vatican"}'::jsonb),
    ('VE', '{"\\-04:00": "America/Caracas"}'::jsonb),
    ('VN', '{"\\+07:00": "Asia/Ho_Chi_Minh"}'::jsonb),

    -- Y
    ('YE', '{"\\+03:00": "Asia/Aden"}'::jsonb),

    -- Z
    ('ZM', '{"\\+02:00": "Africa/Lusaka"}'::jsonb),
    ('ZW', '{"\\+02:00": "Africa/Harare"}'::jsonb),
    
    -- Disputed Territories
    ('XK', '{"\\+01:00": "Europe/Belgrade"}'::jsonb),  -- Kosovo uses Serbia's timezone
    ('TS', '{"\\+02:00": "Europe/Chisinau"}'::jsonb),  -- Transnistria uses Moldova's timezone
    ('XS', '{"\\+03:00": "Africa/Mogadishu"}'::jsonb),  -- Somaliland uses Somalia's timezone
    ('OS', '{"\\+03:00": "Europe/Moscow"}'::jsonb),  -- South Ossetia uses Moscow time
    ('AB', '{"\\+03:00": "Europe/Moscow"}'::jsonb),  -- Abkhazia uses Moscow time
    ('CT', '{"\\+02:00": "Asia/Nicosia"}'::jsonb),  -- Northern Cyprus uses Cyprus time
    ('NK', '{"\\+04:00": "Asia/Yerevan"}'::jsonb),  -- Nagorno-Karabakh uses Armenia's timezone

    -- Territories
    ('AS', '{"\\-11:00": "Pacific/Pago_Pago"}'::jsonb),  -- American Samoa
    ('AI', '{"\\-04:00": "America/Anguilla"}'::jsonb),  -- Anguilla
    ('AW', '{"\\-04:00": "America/Aruba"}'::jsonb),  -- Aruba
    ('BM', '{"\\-04:00": "Atlantic/Bermuda"}'::jsonb),  -- Bermuda
    ('BV', '{"\\+01:00": "Europe/Oslo"}'::jsonb),  -- Bouvet Island (Norway)
    ('IO', '{"\\+06:00": "Indian/Chagos"}'::jsonb),  -- British Indian Ocean Territory
    ('VG', '{"\\-04:00": "America/Tortola"}'::jsonb),  -- British Virgin Islands
    ('KY', '{"\\-05:00": "America/Cayman"}'::jsonb),  -- Cayman Islands
    ('CX', '{"\\+07:00": "Indian/Christmas"}'::jsonb),  -- Christmas Island
    ('CC', '{"\\+06:30": "Indian/Cocos"}'::jsonb),  -- Cocos Islands
    ('CK', '{"\\-10:00": "Pacific/Rarotonga"}'::jsonb),  -- Cook Islands
    ('CW', '{"\\-04:00": "America/Curacao"}'::jsonb),  -- Curacao
    ('FK', '{"\\-03:00": "Atlantic/Stanley"}'::jsonb),  -- Falkland Islands
    ('FO', '{"\\+00:00": "Atlantic/Faroe"}'::jsonb),  -- Faroe Islands
    ('GF', '{"\\-03:00": "America/Cayenne"}'::jsonb),  -- French Guiana
    ('PF', '{
        "\\-10:00": "Pacific/Tahiti",
        "\\-09:30": "Pacific/Marquesas",
        "\\-09:00": "Pacific/Gambier"
    }'::jsonb),  -- French Polynesia
    ('TF', '{"\\+05:00": "Indian/Kerguelen"}'::jsonb),  -- French Southern Territories
    ('GI', '{"\\+01:00": "Europe/Gibraltar"}'::jsonb),  -- Gibraltar
    ('GL', '{
        "\\-04:00": "America/Thule",
        "\\-03:00": "America/Godthab",
        "\\-01:00": "America/Scoresbysund"
    }'::jsonb),  -- Greenland
    ('GP', '{"\\-04:00": "America/Guadeloupe"}'::jsonb),  -- Guadeloupe
    ('GU', '{"\\+10:00": "Pacific/Guam"}'::jsonb),  -- Guam
    ('HK', '{"\\+08:00": "Asia/Hong_Kong"}'::jsonb),  -- Hong Kong
    ('MO', '{"\\+08:00": "Asia/Macau"}'::jsonb),  -- Macao
    ('MQ', '{"\\-04:00": "America/Martinique"}'::jsonb),  -- Martinique
    ('YT', '{"\\+03:00": "Indian/Mayotte"}'::jsonb),  -- Mayotte
    ('MS', '{"\\-04:00": "America/Montserrat"}'::jsonb),  -- Montserrat
    ('NC', '{"\\+11:00": "Pacific/Noumea"}'::jsonb),  -- New Caledonia
    ('NU', '{"\\-11:00": "Pacific/Niue"}'::jsonb),  -- Niue
    ('NF', '{"\\+11:00": "Pacific/Norfolk"}'::jsonb),  -- Norfolk Island
    ('MP', '{"\\+10:00": "Pacific/Saipan"}'::jsonb),  -- Northern Mariana Islands
    ('PN', '{"\\-08:00": "Pacific/Pitcairn"}'::jsonb),  -- Pitcairn
    ('PR', '{"\\-04:00": "America/Puerto_Rico"}'::jsonb),  -- Puerto Rico
    ('RE', '{"\\+04:00": "Indian/Reunion"}'::jsonb),  -- Reunion
    ('BL', '{"\\-04:00": "America/St_Barthelemy"}'::jsonb),  -- Saint Barthelemy
    ('SH', '{"\\+00:00": "Atlantic/St_Helena"}'::jsonb),  -- Saint Helena
    ('MF', '{"\\-04:00": "America/Marigot"}'::jsonb),  -- Saint Martin
    ('PM', '{"\\-03:00": "America/Miquelon"}'::jsonb),  -- Saint Pierre and Miquelon
    ('SX', '{"\\-04:00": "America/Lower_Princes"}'::jsonb),  -- Sint Maarten
    ('TK', '{"\\+13:00": "Pacific/Fakaofo"}'::jsonb),  -- Tokelau
    ('VI', '{"\\-04:00": "America/St_Thomas"}'::jsonb)  -- U.S. Virgin Islands
) AS timezone_data(country_code, tz_json)
WHERE countries.iso2 = timezone_data.country_code;
