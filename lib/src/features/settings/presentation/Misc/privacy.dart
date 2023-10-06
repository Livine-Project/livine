import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../translations/domain/translation_provider.dart';

class Privacy extends StatelessWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final word = TranslationRepo.translate(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(title: Text(word?.privacy_Policy ?? "")),
          SliverToBoxAdapter(
            child: Consumer(
              builder: (context, ref, child) => Html(
                data: ref.watch(localeNotifierProvider).languageCode == "en"
                    ? """
           <strong>Privacy Policy</strong>
  <p>Last Updated: 29/9/2023</p>

  <strong>1. Introduction</strong>
  <p>Welcome to Livine! At Livine, we are committed to protecting your privacy and ensuring the security of your personal information. This Privacy Policy outlines how we collect, use, disclose, and safeguard your information when you use our app.</p>

  <strong>2. Information We Collect</strong>
  <p><strong>Personal Information:</strong> <br> We may collect personal information that you provide to us, such as your name, email address, and any other information you voluntarily submit when using our app.</p>
  <p><strong>Usage Data:</strong> <br> We may collect information about how you interact with Livine, including log data, device information, and analytics data. This information helps us improve our app and provide you with a better experience.</p>

  <strong>3. How We Use Your Information</strong>
  <p>We use the information we collect for the following purposes:</p>
  <p>a. To provide and improve our app's functionality and user experience.</p>
  <p>b. To communicate with you, respond to your inquiries, and send you updates.</p>
  <p>c. To personalize your experience and offer you relevant content.</p>
  <p>d. To analyze app usage and make improvements.</p>
  <p>e. To comply with legal obligations.</p>

  <strong>4. Disclosure of Your Information</strong>
  <p>We don't share your information with third parties </p>
  
  <strong>5. Security</strong>
  <p>We take the security of your information seriously and employ reasonable measures to protect and encrypt it</p>

  <strong>6. Your Choices</strong>
  <p>You have the right to access, update, or delete your personal information. You can also opt-out of receiving marketing communications from us.</p>

  <h2>7. Changes to this Privacy Policy</h2>
  <p>We may update this Privacy Policy from time to time. The most recent version will be posted on our app.</p>

  <h2>8. Contact Us</h2>
  <p>If you have any questions, concerns, or requests regarding this Privacy Policy, please contact us at onlybailemos123@gmail.com</p>

</div>
                     
            
            """
                    : """
            <strong>سياسة الخصوصية</strong> <p>
            قام ببناء تطبيق Livine باسم
                تطبيق مفتوح المصدر. هذه الخدمة مقدمة من
                مازن عمر بدون تكلفة ومخصص للاستعمال بصفته
                هو.
              </p> <p>
            تستخدم هذه الصفحة لإعلام الزوار بخصوص بلدي
                سياسات مع جمع واستخدام والكشف عن الشخصية
                المعلومات إذا قرر أي شخص استخدام خدمتي.
              </p> <p>
            إذا اخترت استخدام خدمتي ، فأنت توافق على ذلك
                جمع واستخدام المعلومات المتعلقة بهذا
                سياسات. المعلومات الشخصية التي أجمعها هي
                تستخدم لتوفير وتحسين الخدمة. لن أستخدم أو أشارك معلوماتك مع
                أي شخص باستثناء ما هو موضح في سياسة الخصوصية هذه.
              </p> <p>
            المصطلحات المستخدمة في سياسة الخصوصية هذه لها نفس المعاني
                كما هو الحال في الشروط والأحكام الخاصة بنا ، والتي يمكن الوصول إليها على
                Livine ما لم يتم تحديد خلاف ذلك في سياسة الخصوصية هذه.
              </p> <p><strong>جمع المعلومات واستخدامها</strong></p> <p>
            لتجربة أفضل أثناء استخدام خدمتنا ، أنا
                قد يطلب منك تزويدنا ببعض بشكل شخصي
                معلومات تحديد الهوية ، بما في ذلك على سبيل المثال لا الحصر البريد الإلكتروني للمنطقة الزمنية. المعلومات التي
                أطلب سيتم الاحتفاظ به على جهازك ولن يتم جمعها من قبلي بأي شكل من الأشكال.
              </p> <div><p>
            يستخدم التطبيق خدمات الجهات الخارجية التي قد تجمع
                  المعلومات المستخدمة لتحديد هويتك.
                </p> <p>
            رابط لسياسة الخصوصية لمقدمي خدمات الطرف الثالث المستخدمة
                  بواسطة التطبيق
                </p> <ul><li><a href="https://www.google.com/policies/privacy/" target="_blank" rel="noopener noreferrer">Google Play Services</a></li><li><a href="https://support.google.com/admob/answer/6128543?hl=en" target="_blank" rel="noopener noreferrer">AdMob</a></li><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----></ul></div> <p><strong>تسجيل البيانات</strong></p> <p>
            أريد أن أبلغكم بذلك في أي وقت
                استخدام خدمتي ، في حالة حدوث خطأ في التطبيق
                أقوم بجمع البيانات والمعلومات (من خلال جهة خارجية
                products) على هاتفك يسمى Log Data. قد تكون بيانات السجل هذه
                تتضمن معلومات مثل بروتوكول الإنترنت الخاص بجهازك
                ("IP") ، واسم الجهاز ، وإصدار نظام التشغيل ، و
                تكوين التطبيق عند استخدام خدمتي ،
                وقت وتاريخ استخدامك للخدمة ، وغير ذلك
                الإحصاء.
              </p> <p><strong>بسكويت</strong></p> <p>
            ملفات تعريف الارتباط هي ملفات تحتوي على كمية صغيرة من البيانات
                يشيع استخدامها كمعرفات فريدة مجهولة. يتم إرسال هذه
                إلى متصفحك من مواقع الويب التي تزورها وتتواجد بها
                المخزنة على الذاكرة الداخلية لجهازك.
              </p> <p>
            لا تستخدم هذه الخدمة "ملفات تعريف الارتباط" بشكل صريح. لكن،
                قد يستخدم التطبيق رموزًا ومكتبات تابعة لجهة خارجية تستخدم ملفات
                "ملفات تعريف الارتباط" لجمع المعلومات وتحسين خدماتهم.
                لديك خيار إما قبول أو رفض ملفات تعريف الارتباط هذه
                ومعرفة متى يتم إرسال ملف تعريف الارتباط إلى جهازك. اذا أنت
                اختر رفض ملفات تعريف الارتباط الخاصة بنا ، فقد لا تتمكن من استخدام بعضها
                أجزاء من هذه الخدمة.
              </p> <p><strong>مقدمي الخدمة</strong></p> <p>
            يجوز لي توظيف شركات خارجية و
                الأفراد للأسباب التالية:
              </p> <ul><li>لتسهيل خدمتنا ؛</li> <li>لتقديم الخدمة نيابة عنا ؛</li> <li>لأداء الخدمات المتعلقة بالخدمة ؛ أو</li> <li>لمساعدتنا في تحليل كيفية استخدام خدمتنا.</li></ul> <p>
            أريد إبلاغ مستخدمي هذه الخدمة
                أن هذه الأطراف الثالثة لديها حق الوصول إلى الشخصية الخاصة بهم
                معلومة. السبب هو أداء المهام الموكلة إلى
                نيابة عنا. ومع ذلك ، فهم ملزمون بعدم القيام بذلك
                الكشف عن المعلومات أو استخدامها لأي غرض آخر.
              </p> <p><strong>حماية</strong></p> <p>
            أنا أقدر ثقتك في تزويدنا بك
                المعلومات الشخصية ، وبالتالي فإننا نسعى جاهدين لاستخدامها تجاريًا
                الوسائل المقبولة لحمايتها. لكن تذكر أنه لا توجد طريقة
                الإرسال عبر الإنترنت ، أو طريقة إلكترونية
                التخزين آمن وموثوق بنسبة 100٪ ، ولا يمكنني ذلك
                تضمن أمنها المطلق.
              </p> <p><strong>روابط لمواقع أخرى</strong></p> <p>
            قد تحتوي هذه الخدمة على روابط لمواقع أخرى. إذا قمت بالنقر فوق
                رابط جهة خارجية ، سيتم توجيهك إلى هذا الموقع. ملحوظة
                أن هذه المواقع الخارجية لا يتم تشغيلها بواسطتي.
                لذلك ، أنصحك بشدة بمراجعة ملف
                سياسة الخصوصية لهذه المواقع. أملك
                لا سيطرة ولا تتحمل أي مسؤولية عن المحتوى ،
                سياسات الخصوصية ، أو ممارسات أي مواقع طرف ثالث أو
                خدمات.
              </p> <p><strong>خصوصية الأطفال</strong></p> <div><p>
            لا تخاطب هذه الخدمات أي شخص يقل عمره عن 13 عامًا.
                  أنا لا أجمع عن قصد شخصيًا
                  معلومات تحديد الهوية من الأطفال دون سن 13 عامًا. في القضية
                  أكتشف أن طفلاً أقل من 13 عامًا قد قدم
                  أنا مع المعلومات الشخصية ، وأنا على الفور
                  احذف هذا من خوادمنا. إذا كنت أحد الوالدين أو الوصي
                  وأنت على علم بأن طفلك قد قدم لنا
                  المعلومات الشخصية ، يرجى الاتصال بي حتى
                  سأكون قادرًا على القيام بالإجراءات اللازمة.
                </p></div> <!----> <p><strong>التغييرات على سياسة الخصوصية هذه</strong></p> <p>
            يمكنني تحديث سياسة الخصوصية الخاصة بنا من
                من وقت إلى آخر. وبالتالي ، ننصحك بمراجعة هذه الصفحة
                بشكل دوري لأية تغييرات. أنا سوف
                يخطرك بأي تغييرات عن طريق نشر سياسة الخصوصية الجديدة على
                هذه الصفحة.
              </p> <p>هذه السياسة سارية اعتبارًا من 2022-02-13</p> <p><strong>اتصل بنا</strong></p> <p>
            إذا كان لديك أي أسئلة أو اقتراحات حول بلدي
                سياسة الخصوصية ، لا تتردد في الاتصال بي على onlybailemos123@gmail.com
            """,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
