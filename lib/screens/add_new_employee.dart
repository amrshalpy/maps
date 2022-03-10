// import 'package:flutter/material.dart';
// import 'package:cool_stepper/cool_stepper.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:hms/components/backgroundbottom.dart';
// import 'package:hms/constants/constants.dart';
// import 'package:hms/models/employees.dart';
//
//
// class AddNewEmployee extends StatefulWidget {
//   const AddNewEmployee({Key? key}) : super(key: key);
//
//   @override
//   _AddNewEmployee createState() => _AddNewEmployeeState();
// }
//
// class _AddNewEmployeeState extends State<Employees> {
//
//   final _formKey = GlobalKey<FormState>();
//   String? selectedRole = 'Writer';
//   final TextEditingController _nameCtrl = TextEditingController();
//   final TextEditingController _emailCtrl = TextEditingController();
//   final TextEditingController _mobilectr1 = TextEditingController();
//   final TextEditingController _levelctr1 = TextEditingController();
//   final TextEditingController _kindctr1 = TextEditingController();
//   final TextEditingController _mangerctr1 = TextEditingController();
//   final TextEditingController _numberctr1 = TextEditingController();
//   final TextEditingController _descctr1 = TextEditingController();
//   final TextEditingController _doorctr1 = TextEditingController();
//   final TextEditingController _taxctr1 = TextEditingController();
//
//   final TextEditingController _address1 = TextEditingController();
//   final TextEditingController _address2 = TextEditingController();
//   final TextEditingController _address3 = TextEditingController();
//   final TextEditingController _address4 = TextEditingController();
//   final TextEditingController _address5 = TextEditingController();
//   final TextEditingController _address6 = TextEditingController();
//
//   String start_date = "تاريخ الانشاء";
//   String end_date = "تاريخ التشغيل";
//
//   datePicker(int i) async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(DateTime.now().year - 15),
//       lastDate: DateTime(DateTime.now().year + 5),
//     );
//     if (i == 1) {
//       start_date = picked.toString().substring(0, 10);
//     } else {
//       end_date = picked.toString().substring(0, 10);
//     }
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final steps = [
//       CoolStep(
//         title: 'البيانات الرئيسية',
//         subtitle: ' نرجو التاكد من البيانات جيداً',
//         content: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               SizedBox(height: 10),
//               _buildTextField(
//                 labelText: 'اسم الفرع',
//                 controller: _nameCtrl,
//               ),
//               _buildTextField(
//                 labelText: 'الجوال',
//                 controller: _mobilectr1,
//               ),
//               _buildTextField(
//                 labelText: 'مستوي المستشفي',
//                 controller: _levelctr1,
//               ),
//               _buildTextField(
//                 labelText: 'نوع المستشفي',
//                 controller: _kindctr1,
//               ),
//               _buildTextField(
//                 labelText: 'مدير المستشفي',
//                 controller: _mangerctr1,
//               ),
//               _buildTextField(
//                 labelText: 'السجل التجاري',
//                 controller: _numberctr1,
//               ),
//               _buildTextField(
//                 labelText: 'البطاقة الضريبية',
//                 controller: _taxctr1,
//               ),
//               _buildTextField(
//                 labelText: ' عدد الادوار',
//                 controller: _doorctr1,
//               ),
//               _buildTextField(
//                 labelText: 'وصف المستشفي',
//                 controller: _descctr1,
//               ),Row(children: [
//                 Expanded(child: Column(children: [
//                   Padding(
//                       padding: EdgeInsets.only(right: 10, left: 10),
//                       child: Text(
//                         ' تاريخ التشغيل',
//                         style: TextStyle(
//                             fontSize: 10,
//                             fontWeight: FontWeight.normal,
//                             color: Colors.black87),
//                       )),
//                   MaterialButton(
//                       minWidth: MediaQuery.of(context).size.width - 40,
//                       color: Colors.black26,
//                       onPressed: () async {
//                         datePicker(2);
//                       },
//                       child: new Text(
//                         end_date,
//                         style: TextStyle(color: Colors.white),
//                       )),
//                 ],)),
//                 SizedBox(width: 15,),
//                 Expanded(child: Column(children: [
//                   Padding(
//                       padding: EdgeInsets.only(right: 10, left: 10),
//                       child: Text(
//                         'تاريخ الانشاء',
//                         style: TextStyle(
//                             fontSize: 10,
//                             fontWeight: FontWeight.normal,
//                             color: Colors.black87),
//                       )),
//                   MaterialButton(
//                       minWidth: MediaQuery.of(context).size.width - 40,
//                       color: Colors.black26,
//                       onPressed: () async {
//                         datePicker(1);
//                       },
//                       child: new Text(
//                         start_date,
//                         style: TextStyle(color: Colors.white),
//                       )),
//                 ],)),
//
//
//               ],)
//
//
//             ],
//           ),
//         ),
//         validation: () {
//           if (!_formKey.currentState!.validate()) {
//             return 'Fill form correctly';
//           }
//           return null;
//         },
//       ),
//       CoolStep(
//         title: 'بيانات العنوان ',
//         subtitle: ' نرجو التاكد من البيانات جيدا',
//         content: Container(
//           child: Column(children: [
//             _buildTextField(
//               labelText: 'العنوان',
//               controller: _address1,
//             ),  _buildTextField(
//               labelText: 'رقم المبني',
//               controller: _address2,
//             ),  _buildTextField(
//               labelText: 'الشارع',
//               controller: _address3,
//             ),  _buildTextField(
//               labelText: 'المنطقة',
//               controller: _address4,
//             ),  _buildTextField(
//               labelText: 'المحافظة',
//               controller: _address5,
//             ),  _buildTextField(
//               labelText: 'الموقع',
//               controller: _address6,
//             ),
//
//           ],),
//           /* child: Row(
//             children: <Widget>[
//               _buildSelector(
//                 context: context,
//                 name: 'Writer',
//               ),
//               SizedBox(width: 5.0),
//               _buildSelector(
//                 context: context,
//                 name: 'Editor',
//               ),
//             ],
//           ),*/
//         ),
//         validation: () {
//           return null;
//         },
//       ),
//     ];
//
//     final stepper = CoolStepper(
//       showErrorSnackbar: false,
//       onCompleted: () {
//         Fluttertoast.showToast(
//             msg: "تم اضافة الفرع بنجاح ",
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.BOTTOM,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.green,
//             textColor: Colors.white,
//             fontSize: 16.0);
//
//         Navigator.of(context).pop();
//
//       },
//       steps: steps,
//       config: CoolStepperConfig(
//           nextText: "التالي", backText: 'السابق', headerColor: Colors.white),
//     );
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: kMainColor,
//           centerTitle: true,
//           title: Text('فرع جديد'),
//         ),
//         body: Backgroundbottom(
//             child: Container(
//               height: MediaQuery.of(context).size.height,
//               child: stepper,
//             )));
//   }
//
//   Widget _buildTextField({
//     String? labelText,
//     FormFieldValidator<String>? validator,
//     TextEditingController? controller,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 15.0),
//       child: TextFormField(
//         textAlign: TextAlign.center,
//         textDirection: TextDirection.rtl,
//         decoration: InputDecoration(
//           labelText: labelText,
//           fillColor: Colors.white10,
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: BorderSide(
//               color: Colors.black38,
//             ),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: BorderSide(
//               color: Colors.black38,
//               width: 1.0,
//             ),
//           ),
//         ),
//         validator: validator,
//         controller: controller,
//       ),
//     );
//   }
//
//   Widget _buildSelector({
//     BuildContext? context,
//     required String name,
//   }) {
//     final isActive = name == selectedRole;
//
//     return Expanded(
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 200),
//         curve: Curves.easeInOut,
//         decoration: BoxDecoration(
//           color: isActive ? Theme.of(context!).primaryColor : null,
//           border: Border.all(
//             width: 0,
//           ),
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         child: RadioListTile(
//           value: name,
//           activeColor: Colors.white,
//           groupValue: selectedRole,
//           onChanged: (String? v) {
//             setState(() {
//               selectedRole = v;
//             });
//           },
//           title: Text(
//             name,
//             style: TextStyle(
//               fontSize: 14,
//               color: isActive ? Colors.white : null,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
