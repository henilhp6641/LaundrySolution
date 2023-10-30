import 'package:flutter/material.dart';

import '../../../../components/common_appbar.dart';
import '../../../../res/color_schema.dart';
import '../../../../utils/const_string.dart';

class InsuranceTermsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        appBar: AppBar(),
        centerTitle: true,
        title: ConstString.laundryTerms,
      ),
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.primary.withOpacity(0.06),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Text("Terms & Condition",style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),),
                  SizedBox(height: 20,),
                  buildSectionTitle("1. Definitions:"),
                  buildTextItem(
                      "• Insured Item: Refers to the clothing item(s) specified in the policy schedule."),
                  buildTextItem(
                      "• Policyholder: The person named in the policy schedule."),
                  buildTextItem(
                      "• Insurer: The company providing the insurance as named in the policy schedule."),
                  const SizedBox(
                    height: 15,
                  ),
                  buildSectionTitle("2. Coverage:"),
                  buildTextItem(
                      "• This insurance covers the insured item against accidental damage, theft, and loss."),
                  buildTextItem(
                      "• Coverage includes the repair or replacement of the insured item to its original state or its current market value, whichever is lesser."),
                  const SizedBox(
                    height: 15,
                  ),
                  buildSectionTitle("3. Exclusions:"),
                  buildTextItem(
                      "• Normal wear and tear, gradual deterioration, and inherent product defects."),
                  buildTextItem(
                      "• Damage caused intentionally by the policyholder or any person residing with the policyholder."),
                  buildTextItem("• Loss or damage resulting from illegal activities."),
                  buildTextItem("• Items left unattended in a public place."),

                  const SizedBox(
                    height: 15,
                  ),
                  buildSectionTitle("4. Claims:"),
                  buildTextItem("• All claims must be reported to the insurer within 7 days of the incident."),
                  buildTextItem("• Claims must be supported with original purchase receipts, photographs of the damage, and any other relevant documentation."),
                  buildTextItem("• The insurer reserves the right to inspect the damaged items before processing a claim."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget buildTextItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }
}
