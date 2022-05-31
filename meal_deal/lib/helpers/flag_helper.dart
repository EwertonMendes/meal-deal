final nationalities = [
  {'Egyptian': 'eg'},
  {'American': 'us'},
  {'Brazilian': 'br'},
  {'Chinese': 'cn'},
  {'Mexican': 'mx'},
  {'French': 'fr'},
  {'Italian': 'it'},
  {'Portuguese': 'pt'},
  {'Japanese': 'jp'},
  {'British': 'gb'},
  {'Indian': 'in'},
  {'Thai': 'th'},
  {'Tunisian': 'tn'},
  {'Greek': 'gr'},
  {'Malaysian': 'my'},
  {'Polish': 'pl'},
  {'Kenyan': 'ke'},
  {'Jamaican': 'jm'},
  {'Croatian': 'hr'},
  {'Spanish': 'es'},
  {'Irish': 'ie'},
  {'Turkish': 'tr'},
  {'Vietnamese': 'vn'},
  {'Canadian': 'ca'},
];

String getFlagForNationality(String nationality) {
  try {
    return nationalities
        .firstWhere((element) => element.containsKey(nationality))
        .entries
        .first
        .value;
  } catch (e) {
    return 'aa';
  }
}
