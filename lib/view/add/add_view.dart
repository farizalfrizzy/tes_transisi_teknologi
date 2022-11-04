import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tes_transisi/service/service_api/api_service.dart';
import 'package:tes_transisi/view/home/home_view.dart';

class FormAdd extends StatefulWidget {
  const FormAdd({super.key});

  @override
  State<FormAdd> createState() => _FormAddState();
}

class _FormAddState extends State<FormAdd> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController noController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: const Color(0xFF6F35A5),
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color(0xFF6F35A5),
            shape: const StadiumBorder(),
            maximumSize: const Size(double.infinity, 56),
            minimumSize: const Size(double.infinity, 56),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFFF1E6FF),
          iconColor: Color(0xFF6F35A5),
          prefixIconColor: Color(0xFF6F35A5),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF6F35A5),
          title: Text(
            "Form Karyawan",
            style: GoogleFonts.montserrat(
              // color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          // actions: [
          //   IconButton(
          //     onPressed: () {},
          //     icon: const Icon(
          //       Icons.search,
          //       size: 24.0,
          //     ),
          //   ),
          // ],
        ),
        resizeToAvoidBottomInset: true,
        body: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: [
                          Row(
                            children: [
                              const Spacer(),
                              Expanded(
                                flex: 8,
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  width: MediaQuery.of(context).size.width,
                                  child: const Text(
                                    "Pengisian Form",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                // Image.asset(
                                //   "assets/images/image1.png",
                                //   // width: 64.0,
                                //   // height: 64.0,
                                //   fit: BoxFit.fill,
                                // ),
                              ),
                              const Spacer(),
                            ],
                          ),
                          const SizedBox(height: 16.0 * 2),
                        ],
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Expanded(
                            flex: 8,
                            child: Form(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: const Color(0xFF6F35A5),
                                      controller: emailController,
                                      onSaved: (email) {},
                                      decoration: const InputDecoration(
                                        hintText: "Your email",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Icon(Icons.person),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.name,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: const Color(0xFF6F35A5),
                                      controller: nameController,
                                      onSaved: (name) {},
                                      decoration: const InputDecoration(
                                        hintText: "Your name",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Icon(Icons.person),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.phone,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: const Color(0xFF6F35A5),
                                      controller: noController,
                                      onSaved: (no) {},
                                      decoration: const InputDecoration(
                                        hintText: "phone number",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Icon(Icons.phone),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      cursorColor: const Color(0xFF6F35A5),
                                      controller: jobController,
                                      onSaved: (job) {},
                                      decoration: const InputDecoration(
                                        hintText: "Your job",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Icon(Icons.work),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  Hero(
                                    tag: "submit_btn",
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Service().userLogin(
                                        //     emailController.toString(),
                                        //     passwordController.toString());
                                        Service.addForm(
                                          emailController.text.toString(),
                                          nameController.text.toString(),
                                          noController.text.toString(),
                                          jobController.text.toString(),
                                        );

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return const HomeView();
                                            },
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Submit".toUpperCase(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
