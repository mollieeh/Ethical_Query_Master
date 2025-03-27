import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter_application_1/models/administrator.dart';

class Admin extends StatefulWidget 
{
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> 
{
  List<Administrator> adminList = Administrator.getAdminList();

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: appBar(context),
      body: Column
      (
        children: 
        [
          Center
          (
            child: ClipPath
            (
              clipper: DownTrapezoidClipper(),
              child: Container
              (
                width: 300,
                height: 30,
                color: const Color.fromARGB(255, 127, 255, 131),
                alignment: Alignment.center,

                child: const Text
                (
                  'Admin',
                  style: TextStyle
                  (
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center
          (
            child: SizedBox
            (
              height: 100,
              width: 500,
              child: Image.asset
              (
                'assets/images/account.png',
                height: 100,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center
          (
            child: Container
            (
              width: 450,
              height: 400,
              color: Colors.grey[300],
              padding: const EdgeInsets.all(10),
              child: Column
              (
                children: 
                [
                  TextField
                  (
                    decoration: const InputDecoration
                    (
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Find User',
                      border: OutlineInputBorder(),
                      constraints: BoxConstraints
                      (
                        maxWidth: 200,
                        maxHeight: 100,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded
                  (
                    child: SingleChildScrollView
                    (
                      child: ExpansionPanelList
                      (
                        expansionCallback: (int index, bool isExpanded) 
                        {
                          setState(() 
                          {
                            adminList[index].isExpanded = !isExpanded;
                          });
                        },
                        children: adminList.map<ExpansionPanel>((Administrator item)
                        {
                          return ExpansionPanel
                          (
                            canTapOnHeader: true,
                            headerBuilder: (BuildContext context, bool isExpanded) 
                            {
                              return ListTile
                              (
                                title: Text(item.headerText),
                              );
                            },
                            body: Container
                            (
                              padding: const EdgeInsets.all(15),
                              width: double.infinity,
                              child: Text
                              (
                                item.expandedText,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                            isExpanded: item.isExpanded,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DownTrapezoidClipper extends CustomClipper<Path> 
{
  @override
  Path getClip(Size size) 
  {
    Border.all
    (
      color: Colors.black,
      width: 5,
    );
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.15, size.height);
    path.lineTo(size.width * 0.85, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
