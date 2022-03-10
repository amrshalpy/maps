import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms/components/background.dart';
import 'package:hms/constants/constants.dart';
import 'package:hms/models/Branch.dart';
import 'package:hms/models/branch/get_branch.dart';
import 'package:hms/screens/addbranche.dart';
import 'package:hms/screens/patient/cubit/cubit.dart';
import 'package:hms/screens/patient/cubit/state.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:lottie/lottie.dart';

class branches extends StatefulWidget {
  GetBranches? branchsData;
  branches({Key? key, this.branchsData}) : super(key: key);

  @override
  _branchesState createState() => _branchesState();
}

class _branchesState extends State<branches> {
  bool initial = false;
  List<Branch> bransh_list = [];
  int pages = 10;
  pagingController(int, CharacterSummary) {}
  getdata() {
    bransh_list.clear();
    bransh_list.add(Branch(
        name: "مستشفي ابو الريش",
        address: "القاهرة",
        phone: "0100000000000",
        create_date: "12-10-1996",
        start_date: "10-10-2022"));
    bransh_list.add(Branch(
        name: "مستشفي الهرم",
        address: "الجيزة",
        phone: "0100000000001",
        create_date: "12-10-1996",
        start_date: "10-10-2022"));
    bransh_list.add(Branch(
        name: "مستشفي سيدي جابر",
        address: "الاسكندرية",
        phone: "0100000000002",
        create_date: "12-10-1996",
        start_date: "10-10-2022"));
  }

  @override
  Widget build(BuildContext context) {
    getdata();
    return BlocProvider(
      create: (context) => PatientCubit()..getBranches(),
      child: BlocConsumer<PatientCubit, PatientState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: PatientCubit.get(context).getBranchModel != null
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
                                        builder: (_) => const addbranche(),
                                      ),
                                    )
                                  },
                                  icon: const Icon(
                                    Icons.add_circle,
                                    color: Colors.white,
                                  ),
                                  label: const Text(
                                    'اضافه فرع جديد',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              PatientCubit.get(context)
                                      .getBranchModel!
                                      .data!
                                      .isNotEmpty
                                  ?
                                  // PagedListView(
                                  //   pagingController: ,
                                  //    builderDelegate: builderDelegate,

                                  //    )
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) =>
                                          getBranchs(PatientCubit.get(context)
                                              .getBranchModel!
                                              .data![index]),
                                      itemCount: PatientCubit.get(context)
                                          .getBranchModel!
                                          .data!
                                          .length,
                                    )
                                  : const Center(
                                      child: Text('اضف تفاصيل الفروع'))
                            ],
                          ),
                          top: 110.0,
                          left: 0.0,
                          right: 0.0,
                        ),
                        Positioned(
                          top: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: AppBar(
                            title: const Text(
                              'الفروع',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            centerTitle: true,
                            actions: const [
                              SizedBox(
                                width: 10,
                              ),
                            ],
                            leading: IconButton(
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
                    child: LoadingBouncingGrid.square(
                    borderColor: kMainColor,
                    borderSize: 12,
                    size: 40,
                  )),
            backgroundColor: Colors.white,
          );
        },
      ),
    );
  }

  Widget getBranchs(BrancheData data) {
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
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
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
                                            print('delete');
                                            PatientCubit.get(context)
                                                .deleteBranch();
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
                                        InkWell(
                                          onTap: () {
                                            print('updata');
                                            PatientCubit.get(context)
                                                .updateBranch();
                                          },
                                          child: SizedBox(
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
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                        child: Text(
                                      '${data.mangerName}',
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
                                        ' جوال  :    ' + '${data.mangerMobile}',
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black87)),
                                  ),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  children: [
                                    ListTile(
                                        title: Text(
                                            ' النوع :' + '${data.nameAr}')),
                                    ListTile(
                                        title: Text(' مستوى المستشفي :' +
                                            '${data.nameEn}')),
                                    ListTile(
                                        title: Text(' البطاقة الضريبية' +
                                            '${data.note}')),
                                    Center(
                                        child: Text(' المدير :' +
                                            '${data.mangerName}')),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      children: const [
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              ' تاريخ التشغيل :' + '',
                                              style: TextStyle(
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
                                              ' تاريخ الانشاء :' + '',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black38),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
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

  Future<void> fetchPage(int pageKey) async {
    //   try {
    //     final newItems = PatientCubit.get(context).getBranches();
    //     final isLastPage = PatientCubit.get(context).getBranchModel!.data!.length < _pageSize;
    //     if (isLastPage) {
    //       pagingController.appendLastPage(newItems);
    //     } else {
    //       final nextPageKey = pageKey + PatientCubit.get(context).getBranchModel!.data!.length;
    //       pagingController.appendPage(newItems, nextPageKey);
    //     }
    //   } catch (error) {
    //     pagingController.error = error;
    //   }
  }
}
