import 'package:apartment_tow/core/functions/get_text_size_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class AbutViewpage extends StatelessWidget {
  const AbutViewpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppBar(title: Text("من نحن".tr))),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Text(
            messageAr.tr,
            style: TextStyle(fontSize: getTextSize(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}

String messageAr =
    """تطبيق إسكان هو وسيطك العقاري القريب، يمكنك من خلال تطبيق اسكان الحصول على الشقة التي تريدها بسهولة ومن مكانك وفي أي وقت، أو تأجير شققك وعقاراتك بسهولة.
حرصنا في تطبيق إسكان على تسهيل عملية البحث عن شقة من خلال عرض المعلومات الكاملة التي تسعى لمعرفتها قبل التأجير الفعلي للشقة كما أننا حرصنا على تقليل خياراتك باختيار أفضل الشقق مع تسهيل عملية طلب التأجير؛ فبضغطة زر تستطيع الحصول على الشقة التي ترغب بها، أما إن كنت مؤجر فتطبيقنا يساعدك على عرض شققك بسهولة من خلال التواصل المباشر معنا لعرض معلومات الشقة.
ونحن من خلال تطبيق إسكان نهدف لحل مشكلة الاحتيال التي غالباً ما يقع فيها المستأجر من الوسيط التقليدي سواءً بعرض الشقق الغير متوافقة مع المواصفات الحقيقية للشقة المعروضة أو من خلال الاحتيال المادي الذي يستنزف الباحث عن شقق للإيجار. ولهذا تم بناء التطبيق ليتمتع بالمصداقية التامة من خلال عرض كافة البيانات المتعلقة بالشقة من خلال صور توضيحية للشقة المعروضة مع السعر والمنطقة عموماً ( الشارع فقط)  بدون طلب دفع لأي مبلغ مادي قبل حصولك على الشقة فعلياً.
تم تصميم التطبيق من قِبلنا طلاب تكنلوجيا المعلومات جامعة آزال للعلوم والتكنولوجيا لنيل درجة البكالوريوس تم اختيار التطبيق بهدف تقليل المشاكل التي تواجه الباحثين عن شقق.

عمل الطالبات:
-	إيمان عبدالعليم منصور اليوسفي.
-	دعاء عادل عبدالواحد الحمادي.
-	شيماء صالح أحمد العرقي.
-	هديل عبدالكريم هادي هيج.
""";
String messageEn = """
Eskan App is your nearby real estate intermediary. Through Eskan App, you can easily find the apartment you want from your location and at any time, or effortlessly rent out your apartments and properties.  
At Eskan App, we have simplified the apartment search process by displaying all the essential information you need to know before finalizing a rental. We also streamline your choices by selecting the best apartments and simplifying the rental request process—with just a click, you can secure the apartment you desire. If you are a landlord, our app helps you list your properties easily through direct communication with us to provide apartment details.  
Through Eskan App, we aim to address the common issue of fraud often faced by tenants when dealing with traditional intermediaries, whether through misleading apartment descriptions or financial scams that drain those searching for rentals. To ensure complete credibility, the app transparently displays all apartment-related data, including photos, pricing, and the general area (street name only), without requiring any upfront payment before you physically obtain the apartment.  
The app was designed by us, Information Technology students at Azal University for Science and Technology, as part of our bachelor’s degree project. We chose this project to reduce the challenges faced by those searching for apartments.  
Developed by:  
- Eman Abdulaleem Mansoor Al-Yousfi.  
- Doaa Adel Abdulwahab Al-Hammadi.  
- Shaima Saleh Ahmed Al-Arqi.  
- Hadeel Abdulkarim Hadi Hayaj.
""";
