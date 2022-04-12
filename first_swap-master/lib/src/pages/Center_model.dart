import 'package:google_maps_flutter/google_maps_flutter.dart';

class center {
  int index;
  String centerName;
  String address;
  String description;
  String thumbNail;
  LatLng locationCoords;

  center(
      {required this.index,
        required this.centerName,
      required this.address,
      required this.description,
      required this.thumbNail,
      required this.locationCoords});
}

final List<center> Dcenters = [
  center(
    index: 0,
      centerName: 'وقف منارة السلام الخيري',
      address: 'طريق عبدالرحمن بن عوف - غرب مقبرة النسيم',
      description:
          '',
      locationCoords: LatLng(24.7083410, 46.8211602),
      thumbNail: 'https://pbs.twimg.com/profile_banners/998704716564582400/1527860815/1500x500',
      

      ),
  center(
    index: 1,
      centerName: 'جمعية البر حي الفيحاء',
      address: 'شارع ابو عبيدة بن الجراح ',
      description:
          '',
      locationCoords: LatLng(24.6727441, 46.8158739),
      thumbNail: 'https://attrapercapace.com/nkvjcw/hPrQKpiM4_nm87b93QFNLAHaIh.jpg'
      ),
  center(
    index: 2,
      centerName: 'جمعية البر حي الفيصلية',
      address: 'مخرج 17 - شارع أسد السنة',
      description:
          '',
      locationCoords: LatLng(24.6478201, 46.7812560),
      thumbNail: 'https://attrapercapace.com/nkvjcw/hPrQKpiM4_nm87b93QFNLAHaIh.jpg'
      ),
  center(
    index: 3,
      centerName: 'جمعية البر - حي الربوة',
      address: 'طريق مكة المكرمة الفرعي',
      description:
          '',
      locationCoords: LatLng(24.6916001, 46.7481495),
      thumbNail: 'https://attrapercapace.com/nkvjcw/hPrQKpiM4_nm87b93QFNLAHaIh.jpg'
      ),
  center(
    index: 4,
      centerName: 'جمعية البر - حي العزيزية',
      address: 'شرق جامع البواردي',
      description:
      '',
      locationCoords: LatLng(24.5827561, 46.7731343),
      thumbNail: 'https://attrapercapace.com/nkvjcw/hPrQKpiM4_nm87b93QFNLAHaIh.jpg'
  ),
  center(
    index: 5,
      centerName: 'جمعية البر - حي الروضة والجنادرية',
      address: 'طريق خالد بن الوليد - شمال طريق الملك عبدالله - حي الحمراء',
      description:
      '',
      locationCoords: LatLng(24.7687137, 46.7590507),
      thumbNail: 'https://attrapercapace.com/nkvjcw/hPrQKpiM4_nm87b93QFNLAHaIh.jpg'
  ),
  center(
    index: 6,
      centerName: 'جمعية البر - حي معكال والشميسي',
      address: 'شارع الأمير عبدالله بن عبدالرحمن(الحجاز) - خلف أسواق القدس',
      description:
      '',
      locationCoords: LatLng(24.6138352, 46.7114666),
      thumbNail: 'https://attrapercapace.com/nkvjcw/hPrQKpiM4_nm87b93QFNLAHaIh.jpg'
  ),
  center(
    index: 7,
      centerName: 'جمعية البر - شارع السويدي',
      address: 'شارع السويدي العام - مقابل العثيم',
      description:
      '',
      locationCoords: LatLng(24.5833635, 46.6150858),
      thumbNail: 'https://attrapercapace.com/nkvjcw/hPrQKpiM4_nm87b93QFNLAHaIh.jpg'
  ),
  center(
    index: 8,
      centerName: 'جمعية البر - حي الشفا',
      address: 'شارع كربلاء - شرق جامع الأميرة سارة',
      description:
      '',
      locationCoords: LatLng(24.5551889, 46.7043514),
      thumbNail: 'https://attrapercapace.com/nkvjcw/hPrQKpiM4_nm87b93QFNLAHaIh.jpg'
  ),
  center(
    index: 9,
      centerName: 'جمعية البر - حي العريجاء',
      address: 'شارع العريجاء العام - جوار جامع العريجاء',
      description:
      '',
      locationCoords: LatLng(24.6230877, 46.6876177),
      thumbNail: 'https://attrapercapace.com/nkvjcw/hPrQKpiM4_nm87b93QFNLAHaIh.jpg'
  ),
  center(
    index: 10,
      centerName: 'جمعية البر - شارع حمزة بن عبدالمطلب',
      address: 'طريق حمزة بن عبدالمطلب - جوار جامع آل فريان - شبرا',
      description:
      '',
      locationCoords: LatLng(24.562480, 46.6444181),
      thumbNail: 'https://attrapercapace.com/nkvjcw/hPrQKpiM4_nm87b93QFNLAHaIh.jpg'
  ),
  center(
    index: 11,
      centerName: 'جمعية البر - فرع غرب الرياض',
      address: 'طريق المدينة المنورة - غرب سوق الخضار',
      description:
      '',
      locationCoords: LatLng(24.5834809, 46.6150171),
      thumbNail: 'https://attrapercapace.com/nkvjcw/hPrQKpiM4_nm87b93QFNLAHaIh.jpg'
  ),
  center(
    index: 13,
      centerName: 'جمعية عرقة الخيرية',
      address: 'شارع الأمير مشعل بن عبدالعزيز',
      description:
      '',
      locationCoords: LatLng(24.6910292, 46.6009542),
      thumbNail: 'https://th3eye.net/wp-content/uploads/2021/04/جمعية-عرقة-الخيرية.png'
  ),
  center(
    index: 14,
      centerName: 'جمعية البر - شمال الرياض',
      address: 'طريق الملك عبدالله - الورود',
      description:
      '',
      locationCoords: LatLng(24.7336990, 46.6792405),
      thumbNail: 'https://attrapercapace.com/nkvjcw/hPrQKpiM4_nm87b93QFNLAHaIh.jpg'
  ),
  center(
    index: 15,
      centerName: 'جمعية الإمام محمد بن سعود الخيرية',
      address: 'الامام تركي بن عبدالله - الطريف الجديد - الدرعية',
      description:
      '',
      locationCoords: LatLng(24.7336990, 46.6792405),
      thumbNail: 'https://www.15000jobs.com/wp-content/uploads/2021/04/جمعية-الامام-محمد-Copy.jpg'
  ),
  center(
    index: 16,
      centerName: 'جمعية البر - حي الملك فهد',
      address: 'شارع هشام بن عبدالملك - شمال حياة مول',
      description:
      'للمستلزمات المنزليه',
      locationCoords: LatLng(24.7135483, 46.6752689),
      thumbNail: 'https://attrapercapace.com/nkvjcw/hPrQKpiM4_nm87b93QFNLAHaIh.jpg'
   ),

  center(
    index: 17,
      centerName: 'جمعية البر - حي الخالدية',
      address: 'طريق الأمير محمد بن عبدالرحمن',
      description:
          '',
      locationCoords: LatLng(24.6199389  , 46.7267381),
      thumbNail: 'https://attrapercapace.com/nkvjcw/hPrQKpiM4_nm87b93QFNLAHaIh.jpg'
     )
];


final List<center> Rcenters = [

  center(
    index: 0,
      centerName: 'شركة التدوير العربية المحدودة',
      address: 'حي السلي',
      description:
      'إعادة تدوير للمخلفات الورقية والكرتونية والبلاستيكية',
      locationCoords: LatLng(24.6516874  , 46.8242924),
      thumbNail: 'https://souqalkhalej.com/assets/upload/profile_images/360X177/thumb_423741164.jpg'
  ),

  center(
    index: 1,
      centerName: 'شركة تدوير البيئة الأهلية',
      address: 'حي الملقا',
      description:
      'إعادة تدوير للنفايات الالكترونية',
      locationCoords: LatLng(24.8140346  , 46.6098384),
      thumbNail: 'https://tadweeer.com/wp-content/uploads/2021/08/Logo-Color.png'
  ),

  center(
    index: 2,
      centerName: 'معمل الأل السعودي لإعادة التدوير',
      address: 'حي المشاعل',
      description:
      'إعادة تدوير للمخلفات الورقية والكرتونية والبلاستيكية',
      locationCoords: LatLng(24.6159488  , 46.8632218),
      thumbNail: 'https://www.kaust.edu.sa/PublishingImages/about/green%20campus/recycling.jpg'
  ),
  center(
    index: 3,
      centerName: 'مؤسسة سلمان انترناشونال للتدوير',
      address: 'حي السلي',
      description:
      'إعادة تدوير',
      locationCoords: LatLng(24.6585958  , 46.8468984),
      thumbNail: 'https://www.kaust.edu.sa/PublishingImages/about/green%20campus/recycling.jpg'
  ),
  center(
    index: 4,
      centerName: 'شركة وادي الرم لتدوير المعادن المحدودة',
      address: 'حي الصناعية الثانية',
      description:
      'إعادة تدوير المعادن',
      locationCoords: LatLng(24.5674483  , 46.8784381),
      thumbNail: 'https://www.kaust.edu.sa/PublishingImages/about/green%20campus/recycling.jpg'
  ),

];
