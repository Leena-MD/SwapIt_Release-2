import 'package:google_maps_flutter/google_maps_flutter.dart';

class center {
  String shopName;
  String address;
  String description;
  LatLng locationCoords;

  center(
      {required this.shopName,
      required this.address,
      required this.description,
      required this.locationCoords});
}

final List<center> centers = [
  center(
      shopName: 'وقف السلام الخيري',
      address: 'طريق عبدالرحمن بن عوف - غرب مقبرة النسيم',
      description:
          '',
      locationCoords: LatLng(24.7083410, 46.8211602),
      ),
  center(
      shopName: 'جمعية البر حي الفيحاء',
      address: 'شارع ابو عبيدة بن الجراح ',
      description:
          '',
      locationCoords: LatLng(24.6727441, 46.8158739),
      ),
  center(
      shopName: 'جمعية البر حي الفيصلية',
      address: 'مخرج 17 - شارع أسد السنة',
      description:
          '',
      locationCoords: LatLng(24.6478201, 46.7812560),
      ),
  center(
      shopName: 'جمعية البر - حي الربوة',
      address: 'طريق مكة المكرمة الفرعي',
      description:
          '',
      locationCoords: LatLng(24.6916001, 46.7481495),
      ),
  center(
      shopName: 'جمعية البر - حي العزيزية',
      address: 'شرق جامع البواردي',
      description:
      '',
      locationCoords: LatLng(24.5827561, 46.7731343),
  ),
  center(
      shopName: 'جمعية البر - حي الروضة والجنادرية',
      address: 'طريق خالد بن الوليد - شمال طريق الملك عبدالله - حي الحمراء',
      description:
      '',
      locationCoords: LatLng(24.7687137, 46.7590507),
  ),
  center(
      shopName: 'جمعية البر - حي معكال والشميسي',
      address: 'شارع الأمير عبدالله بن عبدالرحمن(الحجاز) - خلف أسواق القدس',
      description:
      '',
      locationCoords: LatLng(24.6138352, 46.7114666),
  ),
  center(
      shopName: 'جمعية البر - شارع السويدي',
      address: 'شارع السويدي العام - مقابل العثيم',
      description:
      '',
      locationCoords: LatLng(24.5833635, 46.6150858),
  ),
  center(
      shopName: 'جمعية البر - حي الشفا',
      address: 'شارع كربلاء - شرق جامع الأميرة سارة',
      description:
      '',
      locationCoords: LatLng(24.5551889, 46.7043514),
  ),
  center(
      shopName: 'جمعية البر - حي العريجاء',
      address: 'شارع العريجاء العام - جوار جامع العريجاء',
      description:
      '',
      locationCoords: LatLng(24.6230877, 46.6876177),
  ),
  center(
      shopName: 'جمعية البر - شارع حمزة بن عبدالمطلب',
      address: 'طريق حمزة بن عبدالمطلب - جوار جامع آل فريان - شبرا',
      description:
      '',
      locationCoords: LatLng(24.562480, 46.6444181),
  ),
  center(
      shopName: 'جمعية البر - فرع غرب الرياض',
      address: 'طريق المدينة المنورة - غرب سوق الخضار',
      description:
      '',
      locationCoords: LatLng(24.5834809, 46.6150171),
  ),
  center(
      shopName: 'جمعية عرقة الخيرية',
      address: 'شارع الأمير مشعل بن عبدالعزيز',
      description:
      '',
      locationCoords: LatLng(24.6910292, 46.6009542),
  ),
  center(
      shopName: 'جمعية البر - شمال الرياض',
      address: 'طريق الملك عبدالله - الورود',
      description:
      '',
      locationCoords: LatLng(24.7336990, 46.6792405),
  ),
  center(
      shopName: 'جمعية الإمام محمد بن سعود الخيرية',
      address: 'الامام تركي بن عبدالله - الطريف الجديد - الدرعية',
      description:
      '',
      locationCoords: LatLng(24.7336990, 46.6792405),
  ),
  center(
      shopName: 'جمعية البر - حي الملك فهد',
      address: 'شارع هشام بن عبدالملك - شمال حياة مول',
      description:
      'للمستلزمات المنزليه',
      locationCoords: LatLng(24.7135483, 46.6752689),
   ),

  center(
      shopName: 'جمعية البر - حي الخالدية',
      address: 'طريق الأمير محمد بن عبدالرحمن',
      description:
          '',
      locationCoords: LatLng(24.6199389  , 46.7267381),
     )
];