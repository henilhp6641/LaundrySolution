import 'package:ft_washing_app/module/bottom/new_order/address_selection/address_selection_controller.dart';
import 'package:ft_washing_app/package/config_packages.dart';
import 'package:ft_washing_app/utils/const_string.dart';

import '../../profile/address/all_address_controller.dart';

class AddressSelectionScreen extends StatefulWidget {
  const AddressSelectionScreen({super.key});

  @override
  State<AddressSelectionScreen> createState() => _AddressSelectionScreenState();
}

class _AddressSelectionScreenState extends State<AddressSelectionScreen> {
  final addressSelectionController =
      Get.put<AddressSelectionController>(AddressSelectionController());

  final allAddressController =
      Get.put<AllAddressController>(AllAddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CommonAppBar(
        appBar: AppBar(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppRouter.editAddressScreen);
              },
              child: const Icon(
                Icons.edit,
                color: AppColor.primary,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            InputField(
              prefixIcon: const Visibility(
                visible: true,
                child: Icon(
                  Icons.search,
                  color: AppColor.primary,
                  size: 25,
                ),
              ),
              controller: addressSelectionController.firstNameController,
              hint: ConstString.findAddress,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              onChange: (value) {
                addressSelectionController.firstNameString.value = value ?? "";
              },
            ),
            Expanded(
              child: Obx(
                () => SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (allAddressController.showProgress.value)
                        const Center(child: CircularProgressIndicator())
                      else if (allAddressController.addresses.isEmpty)
                        const Center(child: Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text('No Addresses Found'),
                        )) // You can style this text according to your needs.
                      else
                      ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.only(top: 20),
                              shrinkWrap: true,
                              itemCount:
                                  allAddressController.addresses.length ?? 0,
                              itemBuilder: (context, index) {

                                return Obx(() {
                                  bool isSelected =
                                      allAddressController.selectedIndex!.value ==
                                          index;
                                  return ListTile(
                                    selected: allAddressController
                                            .selectedIndex!.value ==
                                        index,
                                    onTap: () {
                                      allAddressController
                                          .selectedIndex!.value = index;
                                      print(allAddressController
                                          .selectedIndex!.value);
                                    },
                                    title: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColor.primary,
                                          width: 1,
                                        ),
                                        color: isSelected
                                            ? AppColor.primary
                                            .withOpacity(0.25) // Color for selected item
                                            : AppColor.primary
                                                .withOpacity(0.01),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.only(bottom: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    allAddressController
                                                            .addresses[index]
                                                        ['address1'],
                                                    style: const TextStyle()
                                                        .normal18w600,
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10,
                                                        vertical: 4),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      color: AppColor.primary,
                                                    ),
                                                    child: Text(
                                                      "Home",
                                                      style: const TextStyle()
                                                          .normal14w500
                                                          .textColor(
                                                              AppColor.white),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            allAddressController
                                                .addresses[index]['address2'],
                                            style:
                                                const TextStyle().normal16w400,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "${allAddressController.addresses[index]['city']}, ${allAddressController.addresses[index]['country']}, ${allAddressController.addresses[index]['postalCode']}",
                                            style:
                                                const TextStyle().normal16w400,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              },
                            ),
                    ],
                  ),
                ),
              ),
            ),
            CommonAppButton(
              buttonType: ButtonType.enable,
              text: ConstString.next,
              onTap: () {
                FocusScope.of(context).unfocus();
                Get.toNamed(AppRouter.checkOutScreen);
              },
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
