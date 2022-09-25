import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> with TickerProviderStateMixin{
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this,initialIndex: 0);

    tabController.animateTo(_currentTabIndex);
    return Scaffold(
      body: Column(

        children: [
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Reset",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffEC0B8D
                  )
                ),),
                Text("History",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff00A2FF
                        )
                    )
                ),
                Container(
                  width: 59,
                    height: 39,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xffEC0B8D
                        ).withOpacity(0.1)
                      )
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_downward,size: 12,color: Color(0xffEC0B8D
                        )),
                        Icon(Icons.menu_sharp,size: 10,color: Color(0xffEC0B8D
                        )),
                        SizedBox( width: 2,),
                        Center(child: Text('Monthly',
                            style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffEC0B8D
                                )
                            )
                        )),
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(

              child: DecoratedBox(
                decoration: BoxDecoration(


                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 3)),


                ),
                child: TabBar(
                  labelColor: Color(0xffdb1695),
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Color(0xffdb1695),
                  indicatorWeight: 3,

                  controller:  tabController,
                  isScrollable: true,

                  tabs: [
                    Tab(child: SizedBox(
                        width: 100,
                        child: Center(
                          child: Text(
                             "Successful",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xff706F6F),
                              fontWeight: FontWeight.w500,
                            ),

                          ),
                        )
                    ),),
                    Tab(child: SizedBox(
                        width: 100,
                        child: Center(
                          child: Text(
                              "Unsuccessful",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff706F6F)
                            ),

                          ),
                        )
                    ),),
                    Tab(child: SizedBox(
                        width: 100,
                        child: Center(
                          child: Text(
                              'Pending',
                            style: TextStyle(
                                fontSize: 10,
                                color: Color(0xff706F6F),
                              fontWeight: FontWeight.w500,
                            ),

                          ),
                        )
                    ),),


                  ],

                ),
              ),
            ),

          ),

          Expanded(

            child: TabBarView(
              controller:  tabController,
              children: [

                Container(
                  height: MediaQuery.of(context).size.height - 250,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Container(

                                          child: Icon(Icons.library_books_sharp,color: Colors.blue,)),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text('Sheikh Fahad',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff030319),
                                                fontWeight: FontWeight.w500,
                                              ),),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(Icons.check_circle,color: Color(0xff2FB461),size: 20,)
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text('BDT 20,000',style: TextStyle(fontSize: 12,color: Colors.blue,fontWeight: FontWeight.w500),),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text('March 22, 2022',style: TextStyle(color: Colors.grey,fontSize: 10),)

                                      ],
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: 2,
                                      ),
                                    ),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.blue,))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(),
                            ],
                          ),
                        );
                      }),
                ),
               Container(
                 height: MediaQuery.of(context).size.height - 250,
                 child:  ListView.builder(
                     shrinkWrap: true,
                     itemCount: 5,
                     itemBuilder: (BuildContext context, int index) {
                       return Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           children: [
                             Container(

                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(top: 15.0),
                                     child: Container(

                                         child: Icon(Icons.library_books_sharp,color: Colors.blue,)),
                                   ),
                                   SizedBox(
                                     width: 8,
                                   ),
                                   Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Row(
                                         children: [
                                           Text('Sheikh Fahad', style: TextStyle(
                                             fontSize: 12,
                                             color: Color(0xff030319),
                                             fontWeight: FontWeight.w500,
                                           ),),
                                           SizedBox(
                                             width: 10,
                                           ),
                                           Icon(Icons.cancel,color: Colors.redAccent,size: 20,)

                                         ],
                                       ),
                                       SizedBox(
                                         height: 4,
                                       ),
                                       Text('BDT 20,000',style: TextStyle(fontSize: 12,color: Colors.blue,fontWeight: FontWeight.w500),),
                                       SizedBox(
                                         height: 4,
                                       ),
                                       Text('March 22, 2022',style: TextStyle(color: Colors.grey,fontSize: 10),)

                                     ],
                                   ),
                                   Expanded(
                                     child: SizedBox(
                                       width: 2,
                                     ),
                                   ),
                                   IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.blue,))
                                 ],
                               ),
                             ),
                             SizedBox(
                               height: 5,
                             ),
                             Divider(),
                           ],
                         ),
                       );
                     }),
               ),
                Container(
                  height: MediaQuery.of(context).size.height - 250,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Container(

                                          child: Icon(Icons.library_books_sharp,color: Colors.blue,)),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text('Sheikh Fahad', style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff030319),
                                              fontWeight: FontWeight.w500,
                                            ),),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(Icons.access_time_filled,color: Colors.orange,size: 20,)
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text('BDT 20,000',style: TextStyle(fontSize: 12,color: Colors.blue,fontWeight: FontWeight.w500),),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text('March 22, 2022',style: TextStyle(color: Colors.grey,fontSize: 10),)

                                      ],
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: 2,
                                      ),
                                    ),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.blue,))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(),
                            ],
                          ),
                        );
                      }),
                )

            ],

            ),
          )
        ],

      ),
    );
  }
}