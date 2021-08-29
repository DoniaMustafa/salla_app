import 'dart:convert';

TranslationModel translationModelFromJson(String? str) =>
    TranslationModel.fromJson(json.decode(str!));

String translationModelToJson(TranslationModel data) =>
    json.encode(data.toJson());

class TranslationModel {
  final String? subTitlePass;
  TranslationModel(
      {this.cancelDialogTitle,
      this.cancelPass,
      this.contentDialog,
      this.but1dialog,
      this.but2dialog,
      this.enterNewPass,
      this.currentPass,
      this.enterCurrentPass,
      this.newPass,
      this.personInfo,
      this.userProfile,
      this.emailProfile,
      this.phoneProfile,
      this.pass,
      this.editProfile2,
      this.changePassword,
      this.loginTitle,
      this.login,
      this.email,
      this.enterEmail,
      this.validationEmail,
      this.validationPass,
      this.password,
      this.enterPass,
      this.forgotPassword,
      this.haveAccount,
      this.signUp,
      this.register,
      this.userName,
      this.phone,
      this.validationName,
      this.validationPhone,
      this.enterPhone,
      this.enterName,
      this.save,
      this.title1,
      this.title2,
      this.title3,
      this.titleBody1,
      this.titleBody2,
      this.titleBody3,
      this.favorite,
      this.settings,
      this.home,
      this.category,
      this.appName,
      this.search,
      this.selectTitle1,
      this.selectTitle2,
      this.categories,
      this.allPro,
      this.sale,
      required this.sale1,
      this.disRecommend,
      this.pageEmpty,
      this.cart,
      this.see,
      this.darkMode,
      this.about,
      this.about2,
      this.contacts,
      this.contacts2,
      this.faq,
      this.condition,
      this.editProfile,
      this.feedback,
      this.lan,
      this.signOut,
      this.changLan,
      this.done,
      this.addCar,
      this.currency,
      this.arrival,
      this.proceed,
      this.total,
      this.selectAr,
      this.selectEn,
      this.seeMore,
      this.address,
      this.selectLocation,
      this.orderState,
      this.cancelOrder,
      this.quantity,
      this.notify,
      this.notify1,
      this.order,
      this.order1,
      this.status,
      this.total1,
      this.date,
      this.terms,
      this.feedName,
      this.feedEmail,
      this.feedPhone,
      this.feedback1,
      this.feedProcess,
      this.noty,
      this.verifyCode,
      this.verifyEmail,
      this.reset,
      this.subTitlePass,
      this.titlePass,
      this.code,
      this.sendBut,
      this.resend,
      this.newPassTitle,
      this.validateNewPass,
      this.newPassBut,
      this.bestOffer,
      this.update});
  final String? update;
  final String? titlePass;
  final String? reset;
  final String? selectTitle1;
  final String? selectTitle2;
  final String? loginTitle;
  final String? login;
  final String? email;
  final String? userName;
  final String? phone;
  final String? enterEmail;
  final String? validationEmail;
  final String? verifyEmail;
  final String? verifyCode;
  final String? validationPass;
  final String? validationName;
  final String? validationPhone;
  final String? password;
  final String? enterPass;
  final String? forgotPassword;
  final String? haveAccount;
  final String? signUp;
  final String? register;
  final String? enterName;
  final String? enterPhone;
  final String? save;
  final String? title1;
  final String? title2;
  final String? title3;
  final String? titleBody1;
  final String? titleBody2;
  final String? titleBody3;
  final String? home;
  final String? category;
  final String? favorite;
  final String? settings;
  final String? appName;
  final String? search;
  final String? categories;
  final String? allPro;
  final String? sale;
  String sale1 = '';
  final String? disRecommend;
  final String? pageEmpty;
  final String? cart;
  final String? see;
  final String? editProfile;
  final String? contacts;
  final String? contacts2;
  final String? darkMode;
  final String? lan;
  final String? about;
  final String? about2;
  final String? proceed;
  final String? faq;
  final String? condition;
  final String? feedback;
  final String? signOut;
  final String? personInfo;
  final String? userProfile;
  final String? emailProfile;
  final String? phoneProfile;
  final String? pass;
  final String? editProfile2;
  final String? changePassword;
  final String? changLan;
  final String? done;
  final String? addCar;
  final String? currency;
  final String? arrival;
  final String? total;
  final String? selectEn;
  final String? selectAr;
  final String? seeMore;
  final String? address;
  final String? selectLocation;
  final String? orderState;
  final String? cancelOrder;
  final String? quantity;
  final String? notify;
  final String? notify1;
  final String? noty;
  final String? order;
  final String? order1;
  final String? status;
  final String? total1;
  final String? date;
  final String? terms;
  final String? feedName;
  final String? feedEmail;
  final String? feedPhone;
  final String? feedback1;
  final String? feedProcess;
  final String? code;
  final String? sendBut;
  final String? resend;
  final String? newPassTitle;
  final String? validateNewPass;
  final String? newPassBut;
  final String? bestOffer;
  final String? currentPass;
  final String? cancelDialogTitle;
  final String? cancelPass;
  final String? contentDialog;
  final String? but1dialog;
  final String? but2dialog;

  final String? enterCurrentPass;
  final String? enterNewPass;

  final String? newPass;

  factory TranslationModel.fromJson(Map<String, dynamic> json) =>
      TranslationModel(
          currentPass: json["current_pass"],
          enterCurrentPass: json["enter_current_pass"],
          newPass: json["new_pass"],
          enterNewPass: json["enter_new_pass"],
          update: json["update"],
          allPro: json["all_pro"],
          categories: json["categories"],
          selectTitle1: json["select_title1"],
          selectTitle2: json["select_title2"],
          loginTitle: json["login_title"],
          login: json["login"],
          email: json["email"],
          userName: json["user_name"],
          phone: json["phone"],
          enterEmail: json["enter_email"],
          enterName: json["enter_name"],
          enterPhone: json["enter_phone"],
          validationEmail: json["validation_email"],
          validationPass: json["validation_pass"],
          validationName: json["validation_name"],
          validationPhone: json["validation_phone"],
          password: json["password"],
          enterPass: json["enter_pass"],
          forgotPassword: json["forgot_password"],
          haveAccount: json["have_account"],
          signUp: json["sign_up"],
          register: json["register"],
          save: json["save"],
          title1: json["title1"],
          title2: json["title2"],
          title3: json["title3"],
          titleBody1: json["titleBody1"],
          titleBody2: json["titleBody2"],
          titleBody3: json["titleBody3"],
          home: json["home"],
          category: json["category"],
          favorite: json["favorite"],
          settings: json["settings"],
          appName: json["app_name"],
          search: json["search"],
          sale: json["off"],
          sale1: json["off1"],
          disRecommend: json["disRecommend"],
          pageEmpty: json["page_empty"],
          cart: json["cart"],
          see: json["see"],
          about: json["about"],
          about2: json["about2"],
          condition: json["condition"],
          contacts: json["contacts"],
          contacts2: json["contacts2"],
          editProfile: json["edit_profile"],
          faq: json["faq"],
          feedback: json["feedback"],
          lan: json["lan"],
          darkMode: json["dark_mode"],
          signOut: json["sign_out"],
          editProfile2: json["edit_profile2"],
          emailProfile: json["email_profile"],
          personInfo: json["person_info"],
          pass: json["pass"],
          phoneProfile: json["phone_profile"],
          changePassword: json["change_password"],
          userProfile: json["user_profile"],
          changLan: json["change_lan"],
          done: json["done"],
          addCar: json["add_car"],
          currency: json["currency"],
          arrival: json["arrival"],
          proceed: json["proceed"],
          total: json["total"],
          selectAr: json["select_ar"],
          selectEn: json["select_en"],
          seeMore: json["see_more"],
          orderState: json["order_state"],
          cancelOrder: json["cancel_order"],
          quantity: json["quantity"],
          selectLocation: json['select_location'],
          address: json["address"],
          notify: json["notify"],
          notify1: json["notify1"],
          order: json["order"],
          order1: json["order1"],
          status: json["status"],
          total1: json["total1"],
          date: json["date"],
          terms: json["terms"],
          feedName: json["feed_name"],
          feedEmail: json["feed_email"],
          feedPhone: json["feed_phone"],
          feedback1: json["feedback1"],
          feedProcess: json["feed_process"],
          noty: json["noty"],
          subTitlePass: json["subtitle_pass"],
          titlePass: json["title_pas"],
          reset: json["reset"],
          verifyEmail: json["verify_email"],
          verifyCode: json["verify_code"],
          code: json["code"],
          sendBut: json["send_but"],
          resend: json["resend"],
          newPassTitle: json["title_new_pass"],
          validateNewPass: json["validate_new_pass"],
          newPassBut: json["but_new_pass"],
          bestOffer: json["best_offer"],
          cancelDialogTitle: json["cancel_dialog_title"],
          cancelPass: json["cancel_pass"],
          contentDialog: json["content_dialog"],
          but1dialog: json["but1_dialog"],
          but2dialog: json["but2_dialog"]);
  Map<String, dynamic> toJson() => {
        "current_pass": currentPass,
        "enter_current_pass": enterCurrentPass,
        "new_pass": newPass,
        "enter_new_pass": enterNewPass,
        "categories": categories,
        "all_pro": allPro,
        "email": email,
        "enter_email": enterEmail,
        "user_name": userName,
        "validation_email": validationEmail,
        "validation_pass": validationPass,
        "password": password,
        "enter_pass": enterPass,
        "forgot_password": forgotPassword,
        "have_account": haveAccount,
        "sign_up": signUp,
        "register": register,
        "update": update,
        "home": home,
        "category": category,
        "favorite": favorite,
        "settings": settings,
        "app_name": appName,
        "search": search,
        "select_title1": selectTitle1,
        "select_title2": selectTitle2,
        "off": sale,
        "off1": sale1,
        "disRecommend": disRecommend,
        "page_empty": pageEmpty,
        "cart": cart,
        "see": see,
        "about": about,
        "about2": about2,
        "condition": condition,
        "contacts": contacts,
        "contacts2": contacts2,
        "edit_profile": editProfile,
        "faq": faq,
        "feedback": feedback,
        "lan": lan,
        "dark_mode": darkMode,
        "sign_out": signOut,
        "edit_profile2": editProfile,
        "email_profile": emailProfile,
        "person_info": personInfo,
        "user_profile": userProfile,
        "pass": pass,
        "phone_profile": phoneProfile,
        "change_password": changePassword,
        "change_lan": changLan,
        "done": done,
        "add_car": addCar,
        "currency": currency,
        "arrival": arrival,
        "proceed": proceed,
        "total": total,
        "select_en": selectEn,
        "select_ar": selectAr,
        "see_more": seeMore,
        "address": address,
        "select_location": selectLocation,
        "order_state": orderState,
        "cancel_order": cancelOrder,
        "quantity": quantity,
        "notify": notify,
        "notify1": notify1,
        "order": order,
        "order1": order1,
        "status": status,
        "total1": total1,
        "date": date,
        "terms": terms,
        "feed_name": feedName,
        "feed_email": feedEmail,
        "feed_phone": feedPhone,
        "feedback1": feedback1,
        "feed_process": feedProcess,
        "noty": noty,
        "subtitle_pass": subTitlePass,
        "title_pass": titlePass,
        "reset": reset,
        "verify_email": verifyEmail,
        "verify_code": verifyCode,
        "code": code,
        "send_but ": sendBut,
        "resend": resend,
        "title_new_pass": newPassTitle,
        "validate_new_pass": validateNewPass,
        "but_new_pass": newPassBut,
        "best_offer": bestOffer,
        "cancel_dialog_title": cancelDialogTitle,
        "cancel_pass": cancelPass,
        "content_dialog": contentDialog,
        "but1_dialog": but1dialog,
        "but2_dialog": but2dialog,
      };
}
