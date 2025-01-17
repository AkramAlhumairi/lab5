import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    builder: (context, child) =>
        Directionality(textDirection: TextDirection.rtl, child: child!),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> s = [
    "Amar",
    "Akram",
    "Yassen",
  ];

  TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lab5"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            child: TextField(
              // onChanged: (value){
              //   setState(() {

              //   });
              //   s.add(value) ;
              //   },
              onSubmitted: (value) {
                setState(() {});
                // if(value.isNotEmpty)
                s.add(value);

                _name.clear();
              },
              controller: _name,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: Colors.white),
                  suffixIcon: Icon(Icons.save, color: Colors.white),
                  fillColor: Colors.teal,
                  filled: true,
                  hintText: "User Name",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "Name",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {});
              if (_name.text.isNotEmpty && !s.contains(_name.text))
                s.add(_name.text);
              _name.clear();
            },
            child: Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue)),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: s.length,
                itemBuilder: (context, i) {
                  return Container(
                    // margin: const EdgeInsets.only(left: 50, right: 50),
                    padding: const EdgeInsets.only(top: 2),
                    height: 100,
                    width: 100,

                    child: ListTile(
                      onTap: () {
                        //حق التعديل
                        _name.text = s[i];
                      },
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {});
                          s.removeAt(i);
                        },
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                      leading: IconButton(
                          onPressed: () {
                            setState(() {});
                            s[i] = _name.text;
                            _name.clear();
                          },
                          icon: Icon(Icons.update, color: Colors.white)),
                      title: Text(
                        s[i],
                        textAlign: TextAlign.center,
                      ),
                      tileColor: Colors.teal,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
