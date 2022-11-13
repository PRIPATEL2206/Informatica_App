import 'package:flutter/material.dart';

class SchemeFilter extends StatefulWidget {
  final Function? changeData;
  const SchemeFilter({super.key, this.changeData});

  @override
  State<SchemeFilter> createState() => _SchemeFilterState();
}

class _SchemeFilterState extends State<SchemeFilter> {
  final Map<String?, String?> gender = {
    "": "All",
    "male": "Male",
    "fe": "Female",
    "other": "Other"
  };
  final Map<String?, String?> cast = {
    "": "All",
    "gen": "General",
    "sebc": "OBC/SEBC",
    "sc/st": "SC/ST"
  };
  String? genderValue = "";
  String? castValue = "";
  double ageEnd = 0;
  double incomeEnd = 0;

  @override
  Widget build(BuildContext context) {
    widget.changeData!(
        genderValue, castValue, ageEnd.round(), incomeEnd.round());
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 20, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Gender :"),
              DropdownButton<String>(
                  hint: const Text("Gender"),
                  items: [
                    for (final gen in gender.keys)
                      DropdownMenuItem(
                        value: gen,
                        child: Text(gender[gen] ?? "not Found"),
                      )
                  ],
                  value: genderValue,
                  onChanged: (value) {
                    if (genderValue != value) {
                      genderValue = value;
                      setState(() {});
                    }
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Cast :"),
              DropdownButton<String>(
                  hint: const Text("Gender"),
                  items: [
                    for (final cas in cast.keys)
                      DropdownMenuItem(
                        value: cas,
                        child: Text(cast[cas] ?? "not Found"),
                      )
                  ],
                  value: castValue,
                  onChanged: (value) {
                    if (castValue != value) {
                      castValue = value;
                      setState(() {});
                    }
                  }),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Age :   ${ageEnd.round()}"),
              Slider(
                value: ageEnd,
                onChanged: (value) {
                  setState(() {
                    ageEnd = value;
                  });
                },
                autofocus: true,
                onChangeEnd: (value) {},
                max: 100,
                min: 0,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Income :   ${incomeEnd.round()}"),
              Slider(
                value: incomeEnd,
                onChanged: (value) {
                  setState(() {
                    incomeEnd = value;
                  });
                },
                autofocus: true,
                onChangeEnd: (value) {},
                max: 100000,
                min: 0,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                genderValue = "";
                castValue = "";
                ageEnd = 0;
                incomeEnd = 0;
              });
            },
            child: const Text("Clear"),
          ),
        ],
      ),
    );
  }
}
