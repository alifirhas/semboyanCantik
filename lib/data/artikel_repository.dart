import 'package:startertemplate/models/artikel_model.dart';

List<ArtikelModel> artikelData = [
  ArtikelModel(
    title: 'Lorem ipsum',
    imgPath: 'lib/images/artikel/filip-mroz-oko_4WnoM98-unsplash.jpg',
    viewCount: '2',
    createdAt: DateTime(2023, 1, 1),
    content:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
    type: ArtikelType.informasi,
  ),
  ArtikelModel(
    title: 'Lorem ipsum 2',
    imgPath: 'lib/images/artikel/absolutvision-82TpEld0_e4-unsplash.jpg',
    viewCount: '3',
    createdAt: DateTime(2023, 2, 1),
    content:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
    type: ArtikelType.penyebab,
  ),
];
