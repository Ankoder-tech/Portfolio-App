import 'package:flutter/material.dart';

import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  Row mySkills(String text, String type) {
    return Row(
      children: [
        Text(
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            
          ),
          text,
        ),
        Container(margin: EdgeInsets.only(top: 10), child: Text(type)),
      ],
    );
  }
  
 /* SizedBox mySpecialization(FaIconData icon,String text)=> SizedBox(
      width: 105,
      height: 115,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Color.fromARGB(255, 30, 31, 30),
        shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(15)),
        child: Column(children: [
          Icon(icon as IconData?,color: Colors.white,),
          SizedBox(height: 10,),
          Text(text,style: TextStyle(foreground: Paint()..shader=highlightGradient,fontSize: 16), )
        ],),
      ),

    );*/
 /* mySpecialization(icon,tech){
    return Container(
      width: 105,
      height: 115,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Color(0xff252525),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(icon,color:Colors.white,
          ),
            SizedBox(height: 10),
            Text(tech,style: TextStyle(
                color: Colors.white,
                fontSize: 16
            ),)
          ],
        ),
      ),
    );
  }*/
  Widget mySpecialization(dynamic iconOrWidget, String label) {
    return Column(
      children: [
        
        iconOrWidget is IconData
            ? Icon(iconOrWidget, size: 40) 
            : iconOrWidget,                

        SizedBox(height: 10),
        Text(label),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: PopupMenuButton(
          color: Colors.black,
          icon: Icon(Icons.menu),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'project');
                },
                child: Text('Project', style: TextStyle(color: Colors.white)),
              ),
            ),
            PopupMenuItem(
              value: 2,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'about');
                },
                child: Text('About Me', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 19, 16, 16),
              Color.fromARGB(255, 0, 0, 0),
            ],
          ),
        ),
        child: SlidingSheet(
          elevation: 8,
          cornerRadius: 16,
          snapSpec: const SnapSpec(
           
            snap: true,
           
            snappings: [0.4, 0.7, 1.0],
           
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          
          body: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 35),
                child: ShaderMask(
                  shaderCallback: (rect){
                    return LinearGradient(
                      begin: Alignment.center,
                        end: Alignment.bottomCenter,

                        colors: [Colors.black,Colors.transparent]).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                    blendMode:  BlendMode.dstIn,
                    child: Image.asset('assets/image1.png',height: 600,fit: BoxFit.contain,)),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.49),
                alignment: Alignment.center,
                child: Column(
                  children: [Text("Ankit Shukla",style: TextStyle(
                    color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),
                  ), Text("App Developer",style: TextStyle(
                      color: Colors.white,fontSize: 20),
                  )
                  ],
                ),
              ),


            ],
          ),
          builder: (context, state) {
            
            return Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 30),
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      mySkills('1', 'Project'),
                      mySkills('100+', 'Problem Solve'),
                      mySkills('40+', 'Session'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Specialized In',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mySpecialization(Icons.android, 'Android'),
                          mySpecialization(Image.asset('assets/python.png', width: 55, height: 55), 'Python'),
                          mySpecialization(Image.asset('assets/java1.png', width: 55, height: 55), 'Java'),


                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mySpecialization(Image.asset('assets/C.png', width: 55, height: 55), 'C'),


                        ],
                      ),

                    ],
                  )


                ],
              ));},
        ),
        ),
      );
  }
}


