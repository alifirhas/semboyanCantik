import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:startertemplate/perhitungan_stunting/perhitungan_stunting_page_logic.dart';
import 'package:startertemplate/utils/my_color.dart';

class PerhitunganStuntingPage extends StatefulWidget {
  const PerhitunganStuntingPage({super.key});

  @override
  State<PerhitunganStuntingPage> createState() =>
      _PerhitunganStuntingPageState();
}

class _PerhitunganStuntingPageState extends State<PerhitunganStuntingPage> {
  // text editing controllers
  final tahunTextController = TextEditingController();
  final bulanTextController = TextEditingController();
  final tinggiBadanTextController = TextEditingController();
  final genderSelectController = TextEditingController();

  // Form key
  final _periksaStuntingFormKey = GlobalKey<FormState>();

  // visibility
  bool badutaCerdasVisible = true;
  bool hasilVisible = false;
  bool periksaStuntingVisible = true;
  bool hasilAngkaVisible = false;
  bool hasilDeskripsiVisible = false;

  // perhitungan
  final perhitunganStuntingPageLogic = PerhitunganStuntingPageLogic();

  // hasil
  String hasilAngka = '0';
  String hasilDeskripsi = '';

  // Gender item
  final List<Map<String, dynamic>> _genderItems = [
    {
      'value': 'boy',
      'label': 'Laki-laki',
      'textStyle': GoogleFonts.inter(color: MyColors.customBlack),
    },
    {
      'value': 'girl',
      'label': 'Perempuan',
      'textStyle': GoogleFonts.inter(color: MyColors.customBlack),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.basePurple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tombol kembali
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Ink(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: MyColors.customWhite,
                      border: Border.all(color: MyColors.customGrey),
                    ),
                    padding: const EdgeInsets.all(13),
                    child: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                ),
              ),

              // Title dan hasil
              // Nanti berubah menjadi hasil
              const SizedBox(height: 120),
              Visibility(
                visible: badutaCerdasVisible,
                child: Text(
                  'Semboyan Cantik',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Visibility(
                visible: hasilVisible,
                child: Text(
                  'Hasil',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Label periksa stunting besar
              // Nantik berubah jadi z-score
              const SizedBox(height: 8),
              Visibility(
                visible: periksaStuntingVisible,
                child: Text(
                  'Periksa Stunting',
                  style: GoogleFonts.inter(
                    fontSize: 36,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Visibility(
                visible: hasilAngkaVisible,
                child: Text(
                  hasilAngka,
                  style: GoogleFonts.inter(
                    fontSize: 36,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Deskripsi kondisi stunting
              // Visible setelah perhitungan selesai
              const SizedBox(height: 32),
              Visibility(
                visible: hasilDeskripsiVisible,
                child: Text(
                  hasilDeskripsi,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                  ),
                ),
              ),

              // form periksa stunting
              const Spacer(),
              Form(
                key: _periksaStuntingFormKey,
                child: Column(
                  children: [
                    // Input tahun dan bulan
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Umur baduta pada tahun dan bulan',
                          style: GoogleFonts.inter(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Tahun textfield
                        Flexible(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: tahunTextController,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              fillColor: MyColors.customWhite,
                              filled: true,
                              hintText: 'Tahun',
                              hintStyle: TextStyle(
                                color: Colors.grey[500],
                              ),
                              suffix: Text(
                                '1',
                                style: GoogleFonts.inter(
                                  color: MyColors.customGrey,
                                ),
                              ),
                            ),
                            inputFormatters: <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(1),
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Tolong isi Umur Tahun';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 8),

                        // Bulan textfield
                        Flexible(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: bulanTextController,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                              ),
                              fillColor: MyColors.customWhite,
                              filled: true,
                              hintText: 'Bulan',
                              hintStyle: TextStyle(
                                color: Colors.grey[500],
                              ),
                              suffix: Text(
                                '12',
                                style: GoogleFonts.inter(
                                  color: MyColors.customGrey,
                                ),
                              ),
                            ),
                            inputFormatters: <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(2),
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Tolong isi Umur Bulan';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Tinggi badan textfield
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: tinggiBadanTextController,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: MyColors.customWhite,
                        filled: true,
                        hintText: 'Tinggi Badan',
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                        ),
                        suffix: Text(
                          'cm',
                          style: GoogleFonts.inter(
                            color: MyColors.customGrey,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Tolong isi Tinggi Badan';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),

                    // Gender textfield
                    SelectFormField(
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: MyColors.customWhite,
                        filled: true,
                        hintText: 'Jenis Kelamin',
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                      controller: genderSelectController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Tolong isi Jenis Kelamin';
                        }
                        return null;
                      },
                      type: SelectFormFieldType.dropdown,
                      items: _genderItems,
                      onChanged: (val) =>
                          debugPrint(genderSelectController.text),
                      onSaved: (val) => debugPrint(genderSelectController.text),
                    ),
                    const SizedBox(height: 8),

                    // Hitung button
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        InkWell(
                          onTap: () {
                            final form = _periksaStuntingFormKey.currentState;

                            if (form!.validate()) {
                              double zScore =
                                  perhitunganStuntingPageLogic.hitungZScore(
                                double.parse(tinggiBadanTextController.text),
                                int.parse(tahunTextController.text),
                                int.parse(bulanTextController.text),
                                genderSelectController.text,
                              );

                              setState(() {
                                // masukkan hasil
                                hasilDeskripsi = perhitunganStuntingPageLogic
                                    .transkripsiStatusZScore(zScore);
                                hasilAngka = zScore.toStringAsFixed(2);

                                // Perlihatkan hasil
                                badutaCerdasVisible = false;
                                hasilVisible = true;
                                periksaStuntingVisible = false;
                                hasilAngkaVisible = true;
                                hasilDeskripsiVisible = true;
                              });
                            }
                          },
                          child: Ink(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: MyColors.purple,
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                'PERIKSA STUNTING',
                                style: GoogleFonts.inter(
                                  color: MyColors.customWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Jarak kosong
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
