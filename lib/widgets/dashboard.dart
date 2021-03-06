import 'package:bancvest_app/constants/colors.dart';
import 'package:bancvest_app/constants/text_style.dart';
import 'package:bancvest_app/widgets/common/custom_button.dart';
import 'package:bancvest_app/widgets/recent_activity.dart';
import 'package:flutter/material.dart';

class UserDashBoard extends StatelessWidget {
  const UserDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: const [
                Text(
                  'Nna Chebe',
                  style: CustomTextStyles.nameStyle,
                ),
                SizedBox(height: 10),
                Text(
                  'USER ID: BBV000234',
                  style: CustomTextStyles.accountIdStyle,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Account',
                style: CustomTextStyles.dashboardGenericStyle,
              ),
              Text(
                'LogOut',
                style: CustomTextStyles.dashboardGenericStyle
                    .copyWith(color: CustomColors.customRed),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Column(
              children: [
                Text(
                  '#250,000.00',
                  style: CustomTextStyles.nameStyle
                      .copyWith(fontSize: 35, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 10),
                const Text(
                  'TOTAL BALANCE',
                  style: CustomTextStyles.dashboardGenericStyle,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                action: () {},
                label: 'Transfer',
                labelStyle: CustomTextStyles.dashboardGenericStyle
                    .copyWith(color: CustomColors.textWhite),
              ),
              CustomButton(
                action: () {},
                label: 'Deposit',
                labelStyle: CustomTextStyles.dashboardGenericStyle
                    .copyWith(color: CustomColors.customGreen),
                background: CustomColors.textWhite,
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Recent Activities',
            style: CustomTextStyles.dashboardGenericStyle,
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return RecentActivityWidget();
                }),
          ),
        ],
      ),
    );
  }
}
