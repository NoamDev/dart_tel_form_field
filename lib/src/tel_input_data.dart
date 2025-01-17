class TelInputData {
  static TelInputData _instance;
  factory TelInputData() => _instance ??= new TelInputData._();

  TelInputData._();

  getTelInputData() {
    List<TelInputCountry> countriesList = [];
    var countries = _getCountries();
    countries.asMap().forEach((i, country) {
      countriesList.add(new TelInputCountry(
          country[0],
          country[1],
          country[2],
          country[3],
          country[4],
          country.length == 6 ? country[5] : 0,
          country.length == 7 ? country[6] : null));
    });
    countriesList.sort((a, b)=>( b.priority-a.priority != 0  ?  b.priority-a.priority  :  a.name.compareTo(b.name) ));
    return countriesList;
  }

  getDialCodeHintTextMapping() {
    var map = new Map<String, String>();
    var countries = _getCountries();
    countries.asMap().forEach((i, country) {
      map[country[4]] = country[3];
    });
    return map;
  }

  getDialCodeCountryNameMapping() {
    var map = new Map<String, String>();
    var countries = _getCountries();
    countries.asMap().forEach((i, country) {
      map[country[4]] = country[1];
    });
    return map;
  }

  getValidDialCode() {
    List<String> dailCodeList = [];
    var countries = _getCountries();
    countries.asMap().forEach((i, country) {
      dailCodeList.add(country[4]);
    });
    return dailCodeList;
  }

  _getCountries() {
    return [
      ["Afghanistan (‫افغانستان‬‎)","Afghanistan","af","070 123 4567","93"],
      ["Albania (Shqipëri)","Albania","al","066 212 3456","355"],
      ["Algeria (‫الجزائر‬‎)","Algeria","dz","0551 23 45 67","213"],
      ["American Samoa","American Samoa","as","(684) 733-1234","1"],
      ["Andorra","Andorra","ad","312 345","376"],
      ["Angola","Angola","ao","923 123 456","244"],
      ["Anguilla","Anguilla","ai","(264) 235-1234","1"],
      ["Antigua and Barbuda","Antigua and Barbuda","ag","(268) 464-1234","1"],
      ["Argentina","Argentina","ar","011 15-2345-6789","54"],
      ["Armenia (Հայաստան)","Armenia","am","077 123456","374"],
      ["Aruba","Aruba","aw","560 1234","297"],
      ["Australia","Australia","au","0412 345 678","61"],
      ["Austria (Österreich)","Austria","at","0664 123456","43"],
      ["Azerbaijan (Azərbaycan)","Azerbaijan","az","040 123 45 67","994"],
      ["Bahamas","Bahamas","bs","(242) 359-1234","1"],
      ["Bahrain (‫البحرين‬‎)","Bahrain","bh","3600 1234","973"],
      ["Bangladesh (বাংলাদেশ)","Bangladesh","bd","01812-345678","880"],
      ["Barbados","Barbados","bb","(246) 250-1234","1"],
      ["Belarus (Беларусь)","Belarus","by","8 029 491-19-11","375"],
      ["Belgium (België)","Belgium","be","0470 12 34 56","32"],
      ["Belize","Belize","bz","622-1234","501"],
      ["Benin (Bénin)","Benin","bj","90 01 12 34","229"],
      ["Bermuda","Bermuda","bm","(441) 370-1234","1"],
      ["Bhutan (འབྲུག)","Bhutan","bt","17 12 34 56","975"],
      ["Bolivia","Bolivia","bo","71234567","591"],
      ["Bosnia and Herzegovina (Босна и Херцеговина)","Bosnia and Herzegovina","ba","061 123 456","387"],
      ["Botswana","Botswana","bw","71 123 456","267"],
      ["Brazil (Brasil)","Brazil","br","(11) 96123-4567","55"],
      ["British Indian Ocean Territory","British Indian Ocean Territory","io","380 1234","246"],
      ["British Virgin Islands","British Virgin Islands","vg","(284) 300-1234","1"],
      ["Brunei","Brunei","bn","712 3456","673"],
      ["Bulgaria (България)","Bulgaria","bg","048 123 456","359"],
      ["Burkina Faso","Burkina Faso","bf","70 12 34 56","226"],
      ["Burundi (Uburundi)","Burundi","bi","79 56 12 34","257"],
      ["Cambodia (កម្ពុជា)","Cambodia","kh","091 234 567","855"],
      ["Cameroon (Cameroun)","Cameroon","cm","6 71 23 45 67","237"],
      ["Canada","Canada","ca","(204) 234-5678","1",1,["204","226","236","249","250","289","306","343","365","387","403","416","418","431","437","438","450","506","514","519","548","579","581","587","604","613","639","647","672","705","709","742","778","780","782","807","819","825","867","873","902","905"]],
      ["Cape Verde (Kabu Verdi)","Cape Verde","cv","991 12 34","238"],
      ["Caribbean Netherlands","Caribbean Netherlands","bq","318 1234","599"],
      ["Cayman Islands","Cayman Islands","ky","(345) 323-1234","1"],
      ["Central African Republic (République centrafricaine)","Central African Republic","cf","70 01 23 45","236"],
      ["Chad (Tchad)","Chad","td","63 01 23 45","235"],
      ["Chile","Chile","cl","9 6123 4567","56"],
      ["China (中国)","China","cn","131 2345 6789","86"],
      ["Christmas Island","Christmas Island","cx","0412 345 678","61"],
      ["Cocos (Keeling) Islands","Cocos (Keeling) Islands","cc","0412 345 678","61"],
      ["Colombia","Colombia","co","321 1234567","57"],
      ["Comoros (‫جزر القمر‬‎)","Comoros","km","321 23 45","269"],
      ["Congo (DRC) (Jamhuri ya Kidemokrasia ya Kongo)","DR Congo","cd","0991 234 567","243"],
      ["Congo (Republic) (Congo-Brazzaville)","Republic of the Congo","cg","06 123 4567","242"],
      ["Cook Islands","Cook Islands","ck","71 234","682"],
      ["Costa Rica","Costa Rica","cr","8312 3456","506"],
      ["Côte d’Ivoire","Ivory Coast","ci","01 23 45 67","225"],
      ["Croatia (Hrvatska)","Croatia","hr","092 123 4567","385"],
      ["Cuba","Cuba","cu","05 1234567","53"],
      ["Curaçao","Curaçao","cw","9 518 1234","599"],
      ["Cyprus (Κύπρος)","Cyprus","cy","96 123456","357"],
      ["Czech Republic (Česká republika)","Czechia","cz","601 123 456","420"],
      ["Denmark (Danmark)","Denmark","dk","32 12 34 56","45"],
      ["Djibouti","Djibouti","dj","77 83 10 01","253"],
      ["Dominica","Dominica","dm","(767) 225-1234","1"],
      ["Dominican Republic (República Dominicana)","Dominican Republic","do","(809) 234-5678","1",2,["809","829","849"]],
      ["Ecuador","Ecuador","ec","099 123 4567","593"],
      ["Egypt (‫مصر‬‎)","Egypt","eg","0100 123 4567","20"],
      ["El Salvador","El Salvador","sv","7012 3456","503"],
      ["Equatorial Guinea (Guinea Ecuatorial)","Equatorial Guinea","gq","222 123 456","240"],
      ["Eritrea","Eritrea","er","07 123 456","291"],
      ["Estonia (Eesti)","Estonia","ee","5123 4567","372"],
      ["Ethiopia","Ethiopia","et","091 123 4567","251"],
      ["Falkland Islands (Islas Malvinas)","Falkland Islands","fk","51234","500"],
      ["Faroe Islands (Føroyar)","Faroe Islands","fo","211234","298"],
      ["Fiji","Fiji","fj","701 2345","679"],
      ["Finland (Suomi)","Finland","fi","041 2345678","358"],
      ["France","France","fr","06 12 34 56 78","33"],
      ["French Guiana (Guyane française)","French Guiana","gf","0694 20 12 34","594"],
      ["French Polynesia (Polynésie française)","French Polynesia","pf","87 12 34 56","689"],
      ["Gabon","Gabon","ga","06 03 12 34","241"],
      ["Gambia","Gambia","gm","301 2345","220"],
      ["Georgia (საქართველო)","Georgia","ge","555 12 34 56","995"],
      ["Germany (Deutschland)","Germany","de","01512 3456789","49"],
      ["Ghana (Gaana)","Ghana","gh","023 123 4567","233"],
      ["Gibraltar","Gibraltar","gi","57123456","350"],
      ["Greece (Ελλάδα)","Greece","gr","691 234 5678","30"],
      ["Greenland (Kalaallit Nunaat)","Greenland","gl","22 12 34","299"],
      ["Grenada","Grenada","gd","(473) 403-1234","1"],
      ["Guadeloupe","Guadeloupe","gp","0690 00 12 34","590"],
      ["Guam","Guam","gu","(671) 300-1234","1"],
      ["Guatemala","Guatemala","gt","5123 4567","502"],
      ["Guernsey","Guernsey","gg","07781 123456","44"],
      ["Guinea (Guinée)","Guinea","gn","601 12 34 56","224"],
      ["Guinea-Bissau (Guiné Bissau)","Guinea-Bissau","gw","955 012 345","245"],
      ["Guyana","Guyana","gy","609 1234","592"],
      ["Haiti","Haiti","ht","34 10 1234","509"],
      ["Honduras","Honduras","hn","9123-4567","504"],
      ["Hong Kong (香港)","Hong Kong","hk","5123 4567","852"],
      ["Hungary (Magyarország)","Hungary","hu","(20) 123 4567","36"],
      ["Iceland (Ísland)","Iceland","is","611 1234","354"],
      ["India (भारत)","India","in","081234 56789","91"],
      ["Indonesia","Indonesia","id","0812-345-678","62"],
      ["Iran (‫ایران‬‎)","Iran","ir","0912 345 6789","98"],
      ["Iraq (‫العراق‬‎)","Iraq","iq","0791 234 5678","964"],
      ["Ireland","Ireland","ie","085 012 3456","353"],
      ["Isle of Man","Isle of Man","im","07924 123456","44"],
      ["Israel (‫ישראל‬‎)","Israel","il","050-234-5678","972",2],
      ["Italy (Italia)","Italy","it","312 345 6789","39"],
      ["Jamaica","Jamaica","jm","(876) 210-1234","1",4,["876","658"]],
      ["Japan (日本)","Japan","jp","090-1234-5678","81"],
      ["Jersey","Jersey","je","07797 712345","44"],
      ["Jordan (‫الأردن‬‎)","Jordan","jo","07 9012 3456","962"],
      ["Kazakhstan (Казахстан)","Kazakhstan","kz","8 (771) 000 9998","7"],
      ["Kenya","Kenya","ke","0712 123456","254"],
      ["Kiribati","Kiribati","ki","72001234","686"],
      ["Kosovo","Kosovo","xk","043 201 234","383"],
      ["Kuwait (‫الكويت‬‎)","Kuwait","kw","500 12345","965"],
      ["Kyrgyzstan (Кыргызстан)","Kyrgyzstan","kg","0700 123 456","996"],
      ["Laos (ລາວ)","Laos","la","020 23 123 456","856"],
      ["Latvia (Latvija)","Latvia","lv","21 234 567","371"],
      ["Lebanon (‫لبنان‬‎)","Lebanon","lb","71 123 456","961"],
      ["Lesotho","Lesotho","ls","5012 3456","266"],
      ["Liberia","Liberia","lr","077 012 3456","231"],
      ["Libya (‫ليبيا‬‎)","Libya","ly","091-2345678","218"],
      ["Liechtenstein","Liechtenstein","li","660 234 567","423"],
      ["Lithuania (Lietuva)","Lithuania","lt","(8-612) 34567","370"],
      ["Luxembourg","Luxembourg","lu","628 123 456","352"],
      ["Macau (澳門)","Macau","mo","6612 3456","853"],
      ["Macedonia (FYROM) (Македонија)","North Macedonia","mk","072 345 678","389"],
      ["Madagascar (Madagasikara)","Madagascar","mg","032 12 345 67","261"],
      ["Malawi","Malawi","mw","0991 23 45 67","265"],
      ["Malaysia","Malaysia","my","012-345 6789","60"],
      ["Maldives","Maldives","mv","771-2345","960"],
      ["Mali","Mali","ml","65 01 23 45","223"],
      ["Malta","Malta","mt","9696 1234","356"],
      ["Marshall Islands","Marshall Islands","mh","235-1234","692"],
      ["Martinique","Martinique","mq","0696 20 12 34","596"],
      ["Mauritania (‫موريتانيا‬‎)","Mauritania","mr","22 12 34 56","222"],
      ["Mauritius (Moris)","Mauritius","mu","5251 2345","230"],
      ["Mayotte","Mayotte","yt","0639 01 23 45","262"],
      ["Mexico (México)","Mexico","mx","044 222 123 4567","52"],
      ["Micronesia","Micronesia","fm","350 1234","691"],
      ["Moldova (Republica Moldova)","Moldova","md","0621 12 345","373"],
      ["Monaco","Monaco","mc","06 12 34 56 78","377"],
      ["Mongolia (Монгол)","Mongolia","mn","8812 3456","976"],
      ["Montenegro (Crna Gora)","Montenegro","me","067 622 901","382"],
      ["Montserrat","Montserrat","ms","(664) 492-3456","1"],
      ["Morocco (‫المغرب‬‎)","Morocco","ma","0650-123456","212"],
      ["Mozambique (Moçambique)","Mozambique","mz","82 123 4567","258"],
      ["Myanmar (Burma) (မြန်မာ)","Myanmar","mm","09 212 3456","95"],
      ["Namibia (Namibië)","Namibia","na","081 123 4567","264"],
      ["Nauru","Nauru","nr","555 1234","674"],
      ["Nepal (नेपाल)","Nepal","np","984-1234567","977"],
      ["Netherlands (Nederland)","Netherlands","nl","06 12345678","31"],
      ["New Caledonia (Nouvelle-Calédonie)","New Caledonia","nc","75.12.34","687"],
      ["New Zealand","New Zealand","nz","021 123 4567","64"],
      ["Nicaragua","Nicaragua","ni","8123 4567","505"],
      ["Niger (Nijar)","Niger","ne","93 12 34 56","227"],
      ["Nigeria","Nigeria","ng","0802 123 4567","234"],
      ["Niue","Niue","nu","888 4012","683"],
      ["Norfolk Island","Norfolk Island","nf","3 81234","672"],
      ["North Korea (조선 민주주의 인민 공화국)","North Korea","kp","0192 123 4567","850"],
      ["Northern Mariana Islands","Northern Mariana Islands","mp","(670) 234-5678","1"],
      ["Norway (Norge)","Norway","no","406 12 345","47"],
      ["Oman (‫عُمان‬‎)","Oman","om","9212 3456","968"],
      ["Pakistan (‫پاکستان‬‎)","Pakistan","pk","0301 2345678","92"],
      ["Palau","Palau","pw","620 1234","680"],
      ["Palestine (‫فلسطين‬‎)","Palestine","ps","0599 123 456","970"],
      ["Panama (Panamá)","Panama","pa","6123-4567","507"],
      ["Papua New Guinea","Papua New Guinea","pg","7012 3456","675"],
      ["Paraguay","Paraguay","py","0961 456789","595"],
      ["Peru (Perú)","Peru","pe","912 345 678","51"],
      ["Philippines","Philippines","ph","0905 123 4567","63"],
      ["Poland (Polska)","Poland","pl","512 345 678","48"],
      ["Portugal","Portugal","pt","912 345 678","351"],
      ["Puerto Rico","Puerto Rico","pr","(787) 234-5678","1",3,["787","939"]],
      ["Qatar (‫قطر‬‎)","Qatar","qa","3312 3456","974"],
      ["Réunion (La Réunion)","Réunion","re","0692 12 34 56","262"],
      ["Romania (România)","Romania","ro","0712 034 567","40"],
      ["Russia (Россия)","Russia","ru","8 (912) 345-67-89","7"],
      ["Rwanda","Rwanda","rw","0720 123 456","250"],
      ["Saint Barthélemy","Saint Barthélemy","bl","0690 00 12 34","590"],
      ["Saint Helena","Saint Helena, Ascension and Tristan da Cunha","sh","51234","290"],
      ["Saint Kitts and Nevis","Saint Kitts and Nevis","kn","(869) 765-2917","1"],
      ["Saint Lucia","Saint Lucia","lc","(758) 284-5678","1"],
      ["Saint Martin (Saint-Martin (partie française))","Saint Martin","mf","0690 00 12 34","590"],
      ["Saint Pierre and Miquelon (Saint-Pierre-et-Miquelon)","Saint Pierre and Miquelon","pm","055 12 34","508"],
      ["Saint Vincent and the Grenadines","Saint Vincent and the Grenadines","vc","(784) 430-1234","1"],
      ["Samoa","Samoa","ws","72 12345","685"],
      ["San Marino","San Marino","sm","66 66 12 12","378"],
      ["São Tomé and Príncipe (São Tomé e Príncipe)","São Tomé and Príncipe","st","981 2345","239"],
      ["Saudi Arabia (‫المملكة العربية السعودية‬‎)","Saudi Arabia","sa","051 234 5678","966"],
      ["Senegal (Sénégal)","Senegal","sn","70 123 45 67","221"],
      ["Serbia (Србија)","Serbia","rs","060 1234567","381"],
      ["Seychelles","Seychelles","sc","2 510 123","248"],
      ["Sierra Leone","Sierra Leone","sl","(025) 123456","232"],
      ["Singapore","Singapore","sg","8123 4567","65"],
      ["Sint Maarten","Sint Maarten","sx","(721) 520-5678","1"],
      ["Slovakia (Slovensko)","Slovakia","sk","0912 123 456","421"],
      ["Slovenia (Slovenija)","Slovenia","si","031 234 567","386"],
      ["Solomon Islands","Solomon Islands","sb","74 21234","677"],
      ["Somalia (Soomaaliya)","Somalia","so","7 1123456","252"],
      ["South Africa","South Africa","za","071 123 4567","27"],
      ["South Korea (대한민국)","South Korea","kr","010-0000-0000","82"],
      ["South Sudan (‫جنوب السودان‬‎)","South Sudan","ss","0977 123 456","211"],
      ["Spain (España)","Spain","es","612 34 56 78","34"],
      ["Sri Lanka (ශ්‍රී ලංකාව)","Sri Lanka","lk","071 234 5678","94"],
      ["Sudan (‫السودان‬‎)","Sudan","sd","091 123 1234","249"],
      ["Suriname","Suriname","sr","741-2345","597"],
      ["Svalbard and Jan Mayen","Svalbard and Jan Mayen","sj","412 34 567","47"],
      ["Swaziland","Eswatini","sz","7612 3456","268"],
      ["Sweden (Sverige)","Sweden","se","070-123 45 67","46"],
      ["Switzerland (Schweiz)","Switzerland","ch","078 123 45 67","41"],
      ["Syria (‫سوريا‬‎)","Syria","sy","0944 567 890","963"],
      ["Taiwan (台灣)","Taiwan","tw","0912 345 678","886"],
      ["Tajikistan","Tajikistan","tj","917 12 3456","992"],
      ["Tanzania","Tanzania","tz","0621 234 567","255"],
      ["Thailand (ไทย)","Thailand","th","081 234 5678","66"],
      ["Timor-Leste","Timor-Leste","tl","7721 2345","670"],
      ["Togo","Togo","tg","90 11 23 45","228"],
      ["Tokelau","Tokelau","tk","7290","690"],
      ["Tonga","Tonga","to","771 5123","676"],
      ["Trinidad and Tobago","Trinidad and Tobago","tt","(868) 291-1234","1"],
      ["Tunisia (‫تونس‬‎)","Tunisia","tn","20 123 456","216"],
      ["Turkey (Türkiye)","Turkey","tr","0501 234 56 78","90"],
      ["Turkmenistan","Turkmenistan","tm","8 66 123456","993"],
      ["Turks and Caicos Islands","Turks and Caicos Islands","tc","(649) 231-1234","1"],
      ["Tuvalu","Tuvalu","tv","901234","688"],
      ["U.S. Virgin Islands","United States Virgin Islands","vi","(340) 642-1234","1"],
      ["Uganda","Uganda","ug","0712 345678","256"],
      ["Ukraine (Україна)","Ukraine","ua","039 123 4567","380"],
      ["United Arab Emirates (‫الإمارات العربية المتحدة‬‎)","United Arab Emirates","ae","050 123 4567","971"],
      ["United Kingdom","United Kingdom","gb","07400 123456","44",1],
      ["United States","United States","us","(201) 555-0123","1",1],
      ["Uruguay","Uruguay","uy","094 231 234","598"],
      ["Uzbekistan (Oʻzbekiston)","Uzbekistan","uz","8 91 234 56 78","998"],
      ["Vanuatu","Vanuatu","vu","591 2345","678"],
      ["Vatican City (Città del Vaticano)","Vatican City","va","312 345 6789","39"],
      ["Venezuela","Venezuela","ve","0412-1234567","58"],
      ["Vietnam (Việt Nam)","Vietnam","vn","091 234 56 78","84"],
      ["Wallis and Futuna (Wallis-et-Futuna)","Wallis and Futuna","wf","50 12 34","681"],
      ["Western Sahara (‫الصحراء الغربية‬‎)","Western Sahara","eh","0650-123456","212"],
      ["Yemen (‫اليمن‬‎)","Yemen","ye","0712 345 678","967"],
      ["Zambia","Zambia","zm","095 5123456","260"],
      ["Zimbabwe","Zimbabwe","zw","071 234 5678","263"],
      ["Åland Islands","Åland Islands","ax","041 2345678","358"]
      ];
  }
}

class TelInputCountry {
  String name;
  String shortName;
  String iso;
  String placeholder;
  String dialCode;
  int priority;
  List<String> areaCodes;

  TelInputCountry(name, shortName, iso, placeholder, dialCode, priority, areaCode) {
    this.name = name;
    this.shortName = shortName;
    this.iso = iso;
    this.placeholder = placeholder;
    this.dialCode = dialCode;
    this.priority = priority;
    this.areaCodes = areaCodes;
  }
}
