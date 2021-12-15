String genreToString(genreIds) {
  List<String> genreStrings = [];

  for (var i = 0; i < genreIds.length; i++) {
    if (genreIds[i] == 28) {
      genreStrings.add("Action");
    } else if (genreIds[i] == 12) {
      genreStrings.add("Adventure");
    } else if (genreIds[i] == 16) {
      genreStrings.add("Animation");
    } else if (genreIds[i] == 35) {
      genreStrings.add("Comedy");
    } else if (genreIds[i] == 80) {
      genreStrings.add("Crime");
    } else if (genreIds[i] == 99) {
      genreStrings.add("Documentary");
    } else if (genreIds[i] == 18) {
      genreStrings.add("Drama");
    } else if (genreIds[i] == 10751) {
      genreStrings.add("Family");
    } else if (genreIds[i] == 14) {
      genreStrings.add("Fantasy");
    } else if (genreIds[i] == 36) {
      genreStrings.add("History");
    } else if (genreIds[i] == 27) {
      genreStrings.add("Horror");
    } else if (genreIds[i] == 10402) {
      genreStrings.add("Music");
    } else if (genreIds[i] == 9648) {
      genreStrings.add("Mystery");
    } else if (genreIds[i] == 10749) {
      genreStrings.add("Romance");
    } else if (genreIds[i] == 878) {
      genreStrings.add("Science Fiction");
    } else if (genreIds[i] == 10402) {
      genreStrings.add("Music");
    } else if (genreIds[i] == 10770) {
      genreStrings.add("TV Movie");
    } else if (genreIds[i] == 53) {
      genreStrings.add("Thriller");
    } else if (genreIds[i] == 10752) {
      genreStrings.add("War");
    } else if (genreIds[i] == 37) {
      genreStrings.add("Western");
    } else if (genreIds[i] == 10759) {
      genreStrings.add("Action & Adventure");
    } else if (genreIds[i] == 10762) {
      genreStrings.add("Kids");
    } else if (genreIds[i] == 10763) {
      genreStrings.add("News");
    } else if (genreIds[i] == 10764) {
      genreStrings.add("Reality");
    } else if (genreIds[i] == 10765) {
      genreStrings.add("Sci-Fi & Fantasy");
    } else if (genreIds[i] == 10766) {
      genreStrings.add("Soap");
    } else if (genreIds[i] == 10767) {
      genreStrings.add("Talk");
    } else if (genreIds[i] == 10768) {
      genreStrings.add("War & Politics");
    }
  }
  return genreStrings.join(",");
}
