import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../translations/locale_keys.g.dart';


class Terms extends StatelessWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Terms_and_conditions.tr()),
      ),
      body: ListView(
        children: <Widget>[
          Text(

            context.locale.languageCode == "en" ?
            """
<strong>Terms &amp; Conditions</strong> <p>
                  By downloading or using the app, these terms will
                  automatically apply to you – you should make sure therefore
                  that you read them carefully before using the app. You’re not
                  allowed to copy or modify the app, any part of the app, or
                  our trademarks in any way. You’re not allowed to attempt to
                  extract the source code of the app, and you also shouldn’t try
                  to translate the app into other languages or make derivative
                  versions. The app itself, and all the trademarks, copyright,
                  database rights, and other intellectual property rights related
                  to it, still belong to Mazen Omar.
                </p> <p>
                  Mazen Omar is committed to ensuring that the app is
                  as useful and efficient as possible. For that reason, we
                  reserve the right to make changes to the app or to charge for
                  its services, at any time and for any reason. We will never
                  charge you for the app or its services without making it very
                  clear to you exactly what you’re paying for.
                </p> <p>
                  The Livine app stores and processes personal data that
                  you have provided to us, to provide my
                  Service. It’s your responsibility to keep your phone and
                  access to the app secure. We therefore recommend that you do
                  not jailbreak or root your phone, which is the process of
                  removing software restrictions and limitations imposed by the
                  official operating system of your device. It could make your
                  phone vulnerable to malware/viruses/malicious programs,
                  compromise your phone’s security features and it could mean
                  that the Livine app won’t work properly or at all.
                </p> <div><p>
                    The app does use third-party services that declare their
                    Terms and Conditions.
                  </p> <p>
                    Link to Terms and Conditions of third-party service
                    providers used by the app
                  </p> <ul><li><a href="https://policies.google.com/terms" target="_blank" rel="noopener noreferrer">Google Play Services</a></li><li><a href="https://developers.google.com/admob/terms" target="_blank" rel="noopener noreferrer">AdMob</a></li><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----></ul></div> <p>
                  You should be aware that there are certain things that
                  Mazen Omar will not take responsibility for. Certain
                  functions of the app will require the app to have an active
                  internet connection. The connection can be Wi-Fi or provided
                  by your mobile network provider, but Mazen Omar
                  cannot take responsibility for the app not working at full
                  functionality if you don’t have access to Wi-Fi, and you don’t
                  have any of your data allowance left.
                </p> <p></p> <p>
                  If you’re using the app outside of an area with Wi-Fi, you
                  should remember that the terms of the agreement with your
                  mobile network provider will still apply. As a result, you may
                  be charged by your mobile provider for the cost of data for
                  the duration of the connection while accessing the app, or
                  other third-party charges. In using the app, you’re accepting
                  responsibility for any such charges, including roaming data
                  charges if you use the app outside of your home territory
                  (i.e. region or country) without turning off data roaming. If
                  you are not the bill payer for the device on which you’re
                  using the app, please be aware that we assume that you have
                  received permission from the bill payer for using the app.
                </p> <p>
                  Along the same lines, Mazen Omar cannot always take
                  responsibility for the way you use the app i.e. You need to
                  make sure that your device stays charged – if it runs out of
                  battery and you can’t turn it on to avail the Service,
                  Mazen Omar cannot accept responsibility.
                </p> <p>
                  With respect to Mazen Omar’s responsibility for your
                  use of the app, when you’re using the app, it’s important to
                  bear in mind that although we endeavor to ensure that it is
                  updated and correct at all times, we do rely on third parties
                  to provide information to us so that we can make it available
                  to you. Mazen Omar accepts no liability for any
                  loss, direct or indirect, you experience as a result of
                  relying wholly on this functionality of the app.
                </p> <p>
                  At some point, we may wish to update the app. The app is
                  currently available on Android – the requirements for the 
                  system(and for any additional systems we
                  decide to extend the availability of the app to) may change,
                  and you’ll need to download the updates if you want to keep
                  using the app. Mazen Omar does not promise that it
                  will always update the app so that it is relevant to you
                  and/or works with the Android version that you have
                  installed on your device. However, you promise to always
                  accept updates to the application when offered to you, We may
                  also wish to stop providing the app, and may terminate use of
                  it at any time without giving notice of termination to you.
                  Unless we tell you otherwise, upon any termination, (a) the
                  rights and licenses granted to you in these terms will end;
                  (b) you must stop using the app, and (if needed) delete it
                  from your device.
                </p> <p><strong>Changes to This Terms and Conditions</strong></p> <p>
                  I may update our Terms and Conditions
                  from time to time. Thus, you are advised to review this page
                  periodically for any changes. I will
                  notify you of any changes by posting the new Terms and
                  Conditions on this page.
                </p> <p>
                  These terms and conditions are effective as of 2022-02-13
                </p> <p><strong>Contact Us</strong></p> <p>
                  If you have any questions or suggestions about my
                  Terms and Conditions, do not hesitate to contact me
                  at mazenomar-@outlook.com.
""" 
: """
<strong>الشروط و الاحكام</strong> <p>
عن طريق تنزيل التطبيق أو استخدامه ، ستفعل هذه الشروط
                  تنطبق تلقائيًا عليك - يجب عليك التأكد من ذلك
                  أنك قرأتها بعناية قبل استخدام التطبيق. أنت لست
                  يُسمح بنسخ التطبيق أو تعديله ، أو أي جزء من التطبيق ، أو
                  علاماتنا التجارية بأي شكل من الأشكال. لا يسمح لك بمحاولة
                  استخرج الكود المصدري للتطبيق ، ويجب ألا تحاول أيضًا
                  لترجمة التطبيق إلى لغات أخرى أو عمل اشتقاق
                  الإصدارات. التطبيق نفسه وجميع العلامات التجارية وحقوق التأليف والنشر ،
                  حقوق قاعدة البيانات ، وحقوق الملكية الفكرية الأخرى ذات الصلة
                  وما زالت تخص مازن عمر.
                </p> <p>
مازن عمر ملتزم بضمان أن التطبيق يعمل
                  مفيدة وفعالة قدر الإمكان. لهذا السبب ، نحن
                  نحتفظ بالحق في إجراء تغييرات على التطبيق أو فرض رسوم عليه
                  خدماتها في أي وقت ولأي سبب. نحن لن
                  تحاسبك على التطبيق أو خدماته دون أن تجعله شديد الأهمية
                  واضحًا لك بالضبط ما تدفع مقابله.
                </p> <p>
يخزن تطبيق Livine البيانات الشخصية ويعالجها
                  الذي قدمته إلينا ، لتقديم
                  خدمة. تقع على عاتقك مسؤولية الاحتفاظ بهاتفك و
                  الوصول إلى التطبيق آمن. لذلك نوصي أن تفعل
                  ليس كسر الحماية أو عمل روت لهاتفك ، وهي عملية
                  إزالة قيود البرامج والقيود التي يفرضها
                  نظام التشغيل الرسمي لجهازك. يمكن أن تجعل الخاص بك
                  الهاتف عرضة للبرامج الضارة / الفيروسات / البرامج الضارة ،
                  تعرض ميزات أمان هاتفك للخطر وقد يعني ذلك
                  أن تطبيق Livine لن يعمل بشكل صحيح أو لا يعمل على الإطلاق.
                </p> <div><p>
                    
                  </p> <p>
                  </p> <ul><li><a href="https://policies.google.com/terms" target="_blank" rel="noopener noreferrer">Google Play Services</a></li><li><a href="https://developers.google.com/admob/terms" target="_blank" rel="noopener noreferrer">AdMob</a></li><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----></ul></div> <p>
يجب أن تدرك أن هناك أشياء معينة
                  مازن عمر لن يتحمل المسؤولية. المؤكد
                  وظائف التطبيق ستتطلب أن يكون التطبيق نشطًا
                  اتصال بالإنترنت. يمكن أن يكون الاتصال Wi-Fi أو يتم توفيره
                  من قبل مزود شبكة المحمول الخاص بك ولكن مازن عمر
                  لا يمكن تحمل المسؤولية عن التطبيق لا يعمل بالكامل
                  وظائف إذا لم يكن لديك وصول إلى شبكة Wi-Fi ، ولم يكن لديك
                  هل لديك أي من البيانات المسموح بها متبقية.
                </p> <p></p> <p>
إذا كنت تستخدم التطبيق خارج منطقة مزودة بشبكة Wi-Fi ، فأنت بذلك
                  يجب أن نتذكر أن شروط الاتفاقية مع الخاص بك
                  سيظل مزود شبكة الجوال ساريًا. نتيجة لذلك ، يمكنك
                  يتحملها مزود خدمة الهاتف المحمول الخاص بك مقابل تكلفة البيانات لـ
                  مدة الاتصال أثناء الوصول إلى التطبيق ، أو
                  رسوم الطرف الثالث الأخرى. باستخدام التطبيق ، فأنت تقبل
                  المسؤولية عن أي من هذه الرسوم ، بما في ذلك بيانات التجوال
                  الرسوم إذا كنت تستخدم التطبيق خارج منطقتك
                  (أي المنطقة أو الدولة) دون إيقاف تجوال البيانات. لو
                  لست دافع الفاتورة للجهاز الذي تستخدمه
                  باستخدام التطبيق ، يرجى العلم أننا نفترض أن لديك
                  الحصول على إذن من دافع الفاتورة لاستخدام التطبيق.
                </p> <p>
على نفس المنوال ، لا يستطيع مازن عمر أن يأخذها دائمًا
                  المسؤولية عن طريقة استخدامك للتطبيق ، أي أنك تحتاج إلى ذلك
                  تأكد من بقاء جهازك مشحونًا - إذا نفد منه
                  البطارية ولا يمكنك تشغيلها للاستفادة من الخدمة ،
                  مازن عمر لا يتحمل المسؤولية.
                </p> <p>
فيما يتعلق بمسؤولية مازن عمر تجاهك
                  استخدام التطبيق ، عند استخدام التطبيق ، من المهم أن
                  ضع في اعتبارك أنه على الرغم من أننا نسعى للتأكد من ذلك
                  محدثة وصحيحة في جميع الأوقات ، نحن نعتمد على أطراف ثالثة
                  لتزويدنا بالمعلومات حتى نتمكن من إتاحتها
                  لك. مازن عمر لا يتحمل أي مسؤولية عن أي شيء
                  الخسارة ، المباشرة أو غير المباشرة ، التي تتعرض لها نتيجة
                  بالاعتماد كليًا على وظيفة التطبيق هذه.
                </p> <p>
في مرحلة ما ، قد نرغب في تحديث التطبيق. التطبيق
                  متوفر حاليًا على Android - متطلبات
                  نظام (وأي أنظمة إضافية نحن
                  قرر تمديد توفر التطبيق لـ) قد يتغير ،
                  وستحتاج إلى تنزيل التحديثات إذا كنت تريد الاحتفاظ بها
                  باستخدام التطبيق. مازن عمر لا يعد بذلك
                  ستعمل دائمًا على تحديث التطبيق بحيث يكون مناسبًا لك
                  و / أو يعمل مع إصدار Android الذي تستخدمه
                  مثبتة على جهازك. ومع ذلك ، فإنك تعد دائمًا
                  يجوز لنا قبول التحديثات على التطبيق عند عرضها عليك
                  ترغب أيضًا في التوقف عن توفير التطبيق ، وقد تنهي استخدام
                  في أي وقت دون إشعار الإنهاء لك.
                  ما لم نخبرك بخلاف ذلك ، عند أي إنهاء ، (أ)
                  تنتهي الحقوق والتراخيص الممنوحة لك بموجب هذه الشروط ؛
                  (ب) يجب عليك التوقف عن استخدام التطبيق ، و (إذا لزم الأمر) حذفه
                  من جهازك.
                </p> <p><strong>
               التغييرات على هذه الشروط والأحكام</strong></p> <p>
قد أقوم بتحديث الشروط والأحكام الخاصة بنا
                  من وقت لآخر. وبالتالي ، ننصحك بمراجعة هذه الصفحة
                  بشكل دوري لأية تغييرات. أنا سوف
                  يخطرك بأي تغييرات عن طريق نشر الشروط الجديدة و
                  الشروط في هذه الصفحة.
                </p> <p>
تسري هذه الشروط والأحكام اعتبارًا من 2022-02-13                </p> 
<p><strong>اتصل بنا</strong></p> <p>
إذا كان لديك أي أسئلة أو اقتراحات حول بلدي
                  الشروط والأحكام ، لا تتردد في الاتصال بي
                  في mazenomar-@outlook.com.
""",
          ),
        ],
      ),
    );
  }
}
