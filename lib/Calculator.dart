import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final formKey = GlobalKey<FormState>();

  final totalBillController = TextEditingController();
  final tipPercentageController = TextEditingController();
  final numberOfPeopleController = TextEditingController();

  static const greyBackground = Color(0xfff5f8fb);
  static const greyText = Color(0xff717171);
  static const black = Color(0xff232323);
  static const orange = Color(0xffff7511);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tip Calculator",
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black87),
        ),
        centerTitle: true,
        shadowColor: Colors.black26,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: greyBackground,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total Bill",
                          style: TextStyle(
                            color: greyText,
                            fontWeight: FontWeight.w100,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          totalBillController.text.isEmpty
                              ? "\$ 0.00"
                              : "\$ ${totalBillController.text}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Persons",
                          style: TextStyle(
                            color: greyText,
                            fontWeight: FontWeight.w100,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Tip Amount",
                          style: TextStyle(
                            color: greyText,
                            fontWeight: FontWeight.w100,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          numberOfPeopleController.text.isEmpty
                              ? "0"
                              : numberOfPeopleController.text,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const Text(
                          "\$ 20.00",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: greyBackground,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Amount Per Person",
                      style: TextStyle(
                        color: greyText,
                        fontWeight: FontWeight.w100,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "\$ 0.00",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              customeTextfiled(
                "Total Bill",
                totalBillController,
                "Please enter total bill amount",
                icon: Icons.attach_money,
              ),
              const SizedBox(
                height: 10,
              ),
              customeTextfiled(
                "Tip percentage",
                tipPercentageController,
                "Please enter tip percentage",
                icon: Icons.percent,
              ),
              const SizedBox(
                height: 10,
              ),
              customeTextfiled(
                "Number of people",
                numberOfPeopleController,
                "Please enter number of people",
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: GestureDetector(
                      onTap: () {
                        formKey.currentState!.validate();
                      },
                      child: Container(
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "Calculate",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: GestureDetector(
                      onTap: () {
                        totalBillController.text = "";
                        tipPercentageController.text = "";
                        numberOfPeopleController.text = "";
                        setState(() {});
                      },
                      child: Container(
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "Clear",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customeTextfiled(
          String label, TextEditingController controller, String hintText,
          {IconData icon = Icons.abc}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: black,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
                color: greyText,
              ),
              suffixIcon:
                  icon != Icons.abc ? Icon(icon, color: black) : const Text(""),
              filled: true,
              fillColor: greyBackground,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 0,
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 0,
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 0,
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onChanged: (value) {
              controller.text = value;
              setState(() {});
            },
            onFieldSubmitted: (value) {
              controller.text = value.toString();
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter valid amount";
              }
              return null;
            },
          )
        ],
      );
}
