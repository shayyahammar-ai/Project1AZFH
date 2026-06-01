import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscurePassword = true;
  bool isChecked = false;

  static const primary = Color(0xFF15A5A5);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF3FAFA),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
               
                Container(
                  height: size.height * 0.42,
                  width: double.infinity,

                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/ph7.png"),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),

                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.6, 1.0],
                        colors: [
                          Colors.black.withOpacity(0.15),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),

                
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.34),

                  child: Container(
                    width: double.infinity,

                    margin: const EdgeInsets.symmetric(horizontal: 20),

                    padding: const EdgeInsets.all(28),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15,
                          offset: const Offset(0, -5),
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// ===== عنوان =====
                        const Text(
                          "Create Account",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          "Create your medical account",
                          style: TextStyle(color: Colors.grey.shade500),
                        ),

                        const SizedBox(height: 35),

                       
                        _inputLabel("First Name"),
                        const SizedBox(height: 10),

                        _customTextField(
                          child: TextField(
                            decoration: _inputDecoration(
                              "Enter first name",
                              Icons.person_outline,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        
                        _inputLabel("Last Name"),
                        const SizedBox(height: 10),

                        _customTextField(
                          child: TextField(
                            decoration: _inputDecoration(
                              "Enter last name",
                              Icons.person_outline,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        _inputLabel("Phone Number"),
                        const SizedBox(height: 10),

                        _customTextField(
                          child: TextField(
                            keyboardType: TextInputType.phone,

                            decoration: _inputDecoration(
                              "Enter phone number",
                              Icons.phone_outlined,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        _inputLabel("Email"),
                        const SizedBox(height: 10),

                        _customTextField(
                          child: TextField(
                            decoration: _inputDecoration(
                              "Enter your email",
                              Icons.email_outlined,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        _inputLabel("Password"),
                        const SizedBox(height: 10),

                        _customTextField(
                          child: TextField(
                            obscureText: obscurePassword,

                            decoration:
                                _inputDecoration(
                                  "Enter password",
                                  Icons.lock_outline,
                                ).copyWith(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obscurePassword = !obscurePassword;
                                      });
                                    },

                                    icon: Icon(
                                      obscurePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: primary,
                                    ),
                                  ),
                                ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              activeColor: primary,

                              onChanged: (v) {
                                setState(() {
                                  isChecked = v!;
                                });
                              },
                            ),

                            Expanded(
                              child: Text(
                                "I agree to Terms & Privacy Policy",
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 28),
                        _registerButton(),

                        const SizedBox(height: 22),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(color: Colors.grey.shade600),
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },

                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                  color: primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _inputLabel(String label) {
    return Text(
      label,

      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black54,
        fontSize: 14,
      ),
    );
  }

  Widget _customTextField({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3FAFA),
        borderRadius: BorderRadius.circular(18),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: child,
      ),
    );
  }

  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,

      hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),

      prefixIcon: Icon(icon, color: primary, size: 22),

      border: InputBorder.none,

      contentPadding: const EdgeInsets.symmetric(vertical: 18),
    );
  }

  Widget _registerButton() {
    return SizedBox(
      width: double.infinity,
      height: 58,

      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [primary, Color(0xFF36CFCF)]),

          borderRadius: BorderRadius.circular(18),

          boxShadow: [
            BoxShadow(
              color: primary.withOpacity(0.35),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),

          onPressed: () {},

          child: const Text(
            "CREATE ACCOUNT",

            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16,
              letterSpacing: 1.1,
            ),
          ),
        ),
      ),
    );
  }
}
