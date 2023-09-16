import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:livine/src/translations/domain/translation_provider.dart';

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
            <strong>Privacy Policy</strong> <p>
                Mazen Omar built the Livine app as
                an Open Source app. This SERVICE is provided by
                Mazen Omar at no cost and is intended for use as
                is.
              </p> <p>
                This page is used to inform visitors regarding my
                policies with the collection, use, and disclosure of Personal
                Information if anyone decided to use my Service.
              </p> <p>
                If you choose to use my Service, then you agree to
                the collection and use of information in relation to this
                policy. The Personal Information that I collect is
                used for providing and improving the Service. I will not use or share your information with
                anyone except as described in this Privacy Policy.
              </p> <p>
                The terms used in this Privacy Policy have the same meanings
                as in our Terms and Conditions, which are accessible at
                Livine unless otherwise defined in this Privacy Policy.
              </p> <p><strong>Information Collection and Use</strong></p> <p>
                For a better experience, while using our Service, I
                may require you to provide us with certain personally
                identifiable information, including but not limited to timezone email. The information that
                I request will be retained on your device and is not collected by me in any way.
              </p> <div><p>
                  The app does use third-party services that may collect
                  information used to identify you.
                </p> <p>
                  Link to the privacy policy of third-party service providers used
                  by the app
                </p> <ul><li><a href="https://www.google.com/policies/privacy/" target="_blank" rel="noopener noreferrer">Google Play Services</a></li><li><a href="https://support.google.com/admob/answer/6128543?hl=en" target="_blank" rel="noopener noreferrer">AdMob</a></li><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----></ul></div> <p><strong>Log Data</strong></p> <p>
                I want to inform you that whenever you
                use my Service, in a case of an error in the app
                I collect data and information (through third-party
                products) on your phone called Log Data. This Log Data may
                include information such as your device Internet Protocol
                (“IP”) address, device name, operating system version, the
                configuration of the app when utilizing my Service,
                the time and date of your use of the Service, and other
                statistics.
              </p> <p><strong>Cookies</strong></p> <p>
                Cookies are files with a small amount of data that are
                commonly used as anonymous unique identifiers. These are sent
                to your browser from the websites that you visit and are
                stored on your device's internal memory.
              </p> <p>
                This Service does not use these “cookies” explicitly. However,
                the app may use third-party code and libraries that use
                “cookies” to collect information and improve their services.
                You have the option to either accept or refuse these cookies
                and know when a cookie is being sent to your device. If you
                choose to refuse our cookies, you may not be able to use some
                portions of this Service.
              </p> <p><strong>Service Providers</strong></p> <p>
                I may employ third-party companies and
                individuals due to the following reasons:
              </p> <ul><li>To facilitate our Service;</li> <li>To provide the Service on our behalf;</li> <li>To perform Service-related services; or</li> <li>To assist us in analyzing how our Service is used.</li></ul> <p>
                I want to inform users of this Service
                that these third parties have access to their Personal
                Information. The reason is to perform the tasks assigned to
                them on our behalf. However, they are obligated not to
                disclose or use the information for any other purpose.
              </p> <p><strong>Security</strong></p> <p>
                I value your trust in providing us your
                Personal Information, thus we are striving to use commercially
                acceptable means of protecting it. But remember that no method
                of transmission over the internet, or method of electronic
                storage is 100% secure and reliable, and I cannot
                guarantee its absolute security.
              </p> <p><strong>Links to Other Sites</strong></p> <p>
                This Service may contain links to other sites. If you click on
                a third-party link, you will be directed to that site. Note
                that these external sites are not operated by me.
                Therefore, I strongly advise you to review the
                Privacy Policy of these websites. I have
                no control over and assume no responsibility for the content,
                privacy policies, or practices of any third-party sites or
                services.
              </p> <p><strong>Children’s Privacy</strong></p> <div><p>
                  These Services do not address anyone under the age of 13.
                  I do not knowingly collect personally
                  identifiable information from children under 13 years of age. In the case
                  I discover that a child under 13 has provided
                  me with personal information, I immediately
                  delete this from our servers. If you are a parent or guardian
                  and you are aware that your child has provided us with
                  personal information, please contact me so that
                  I will be able to do the necessary actions.
                </p></div> <!----> <p><strong>Changes to This Privacy Policy</strong></p> <p>
                I may update our Privacy Policy from
                time to time. Thus, you are advised to review this page
                periodically for any changes. I will
                notify you of any changes by posting the new Privacy Policy on
                this page.
              </p> <p>This policy is effective as of 2022-02-13</p> <p><strong>Contact Us</strong></p> <p>
                If you have any questions or suggestions about my
                Privacy Policy, do not hesitate to contact me at mazenomar-@outlook.com.
                     
            
            """
                    : """
            <strong>سياسة الخصوصية</strong> <p>
            قام مازن عمر ببناء تطبيق Livine باسم
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
                سياسة الخصوصية ، لا تتردد في الاتصال بي على mazenomar-@outlook.com.
            """,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
