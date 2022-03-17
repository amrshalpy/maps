import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms/components/background.dart';
import 'package:hms/constants/constants.dart';
import 'package:hms/models/Branch.dart';
import 'package:hms/models/doctors/get_doctor.dart';
import 'package:hms/screens/addbranche.dart';
import 'package:hms/screens/adddoctor.dart';
import 'package:hms/screens/patient/cubit/cubit.dart';
import 'package:hms/screens/patient/cubit/state.dart';
import 'package:lottie/lottie.dart';

class doctors extends StatefulWidget {
  const doctors({Key? key}) : super(key: key);

  @override
  _doctorsState createState() => _doctorsState();
}

class _doctorsState extends State<doctors> {
  bool initial = false;
  List<Branch> doctors_list = [];

  getdata() {
    doctors_list.clear();
    doctors_list.add(new Branch(
        name: "دكتور خالد محمود ",
        address: "القاهرة",
        phone: "0100000000000",
        create_date: "12-10-1996",
        start_date: "10-10-2022"));
    doctors_list.add(new Branch(
        name: "دكتور محمد علي",
        address: "الجيزة",
        phone: "0100000000001",
        create_date: "12-10-1996",
        start_date: "10-10-2022"));
    doctors_list.add(new Branch(
        name: "دكتورة الهام السيد",
        address: "الاسكندرية",
        phone: "0100000000002",
        create_date: "12-10-1996",
        start_date: "10-10-2022"));
  }

  @override
  Widget build(BuildContext context) {
    getdata();
    return BlocProvider(
      create: (context) => PatientCubit()..getDoctor(),
      child:
          BlocConsumer<PatientCubit, PatientState>(listener: (context, state) {
        if (state is DeleteDoctorSucsses) {
          Center(child: CircularProgressIndicator());
          Navigator.pop(context);
        }
      }, builder: (context, state) {
        PatientCubit cubit = PatientCubit.get(context);
        return Scaffold(
          body: cubit.getDector != null
              ? Background(
                  child: Container(
                  child: Stack(
                    children: [
                      Positioned(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: TextButton.icon(
                                style: TextButton.styleFrom(
                                  textStyle:
                                      const TextStyle(color: Colors.white),
                                  backgroundColor: kMainColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                onPressed: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const adddoctor(),
                                    ),
                                  )
                                },
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  'اضافه طبيب/ة جديد',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            cubit.getDector!.data!.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => getDector(
                                        cubit.getDector!.data![index]),
                                    itemCount: cubit.getDector!.data!.length,
                                  )
                                : Center(child: Text('اضف طبيب جديد'))
                          ],
                        ),
                        top: 110.0,
                        left: 0.0,
                        right: 0.0,
                      ),
                      new Positioned(
                        top: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: AppBar(
                          title: const Text(
                            'الاطباء',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          centerTitle: true,
                          actions: [
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                          leading: new IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 28,
                            ),
                            onPressed: () => {
                              Navigator.of(context).pop(),
                            },
                          ),
                          // You can add title here
                          backgroundColor: Colors.blue.withOpacity(0.0),
                          //You can make this transparent
                          elevation: 0.0, //No shadow
                        ),
                      ),
                    ],
                  ),
                ))
              : Center(
                  child: CircularProgressIndicator(
                  color: Colors.grey,
                  strokeWidth: 2,
                )),
          backgroundColor: Colors.white,
        );
      }),
    );
  }

  Widget getDector(Data data) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.only(top: 0),
          child: Stack(
            children: [
              Container(
                  margin: const EdgeInsets.only(right: 5, left: 5, top: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    color: Colors.white.withAlpha(220),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: const Radius.circular(10),
                        bottomRight: const Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            deleteDoctor();
                                          },
                                          child: SizedBox(
                                            height: 35.0,
                                            width: 35.0,
                                            child: CircleAvatar(
                                              backgroundColor: Colors.black26,
                                              child: Center(
                                                child: Lottie.asset(
                                                    'assets/images/delete.json'),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          height: 35.0,
                                          width: 35.0,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.black26,
                                            child: Center(
                                              child: Lottie.asset(
                                                  'assets/images/edit.json'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                        child: Text(
                                      '${data.nameAr}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                  initiallyExpanded: initial,
                                  onExpansionChanged: (bool) {
                                    setState(() {
                                      initial = bool;
                                    });
                                  },
                                  title: Center(
                                    child: Text(
                                      '${data.address}',
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black87),
                                    ),
                                  ),
                                  subtitle: Center(
                                    child: Text(
                                        ' جوال  :    ' + '${data.phoneNumber}',
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black87)),
                                  ),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  children: [
                                    ListTile(
                                        title:
                                            Text(' النوع :' + '${data.role}')),
                                    ListTile(
                                        title: Text(' مستوى المستشفي :' +
                                            '${data.nationalityTitel}')),
                                    ListTile(
                                        title: Text(' البطاقة الضريبية' +
                                            '${data.dateExp}')),
                                    Center(
                                        child: Text(
                                            ' المدير :' + '${data.nameAr}')),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              ' تاريخ التشغيل :' +
                                                  '${data.datePermanent}',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black38),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              ' تاريخ الانشاء :' +
                                                  '${data.dateAppointment}',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black38),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ]),
                            ]),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void deleteDoctor() {
    final alert = AlertDialog(
      content: Text('هل تريد حذف الطبيب'),
      actions: [
        MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('الغاء'),
        ),
        MaterialButton(
          onPressed: () {
            PatientCubit.get(context).deleteDoctorData(id: 5);
          },
          child: Text('حذف'),
        )
      ],
    );
    showDialog(
        barrierColor: Colors.grey[70],
        context: context,
        builder: (context) => Container(
              height: 120,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: alert),
            ));
  }
}
