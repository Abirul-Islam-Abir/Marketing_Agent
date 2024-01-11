import '../../../../data/const/export.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/user_avatar.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final profileController = Get.put(ProfileScreenController());
  final dashboardController = Get.put(DashboardScreenController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserAvatar(
                      '${profileController.userProfileList['avatar']}'),
                ],
              ),
            ),
            DrawerUpdateCard(hint: 'Name',label: 'John Doe') ,
            DrawerUpdateCard(hint: '01722734871',label: 'Phone Number') ,
            DrawerUpdateCard(hint: 'Sales Executive',label: 'Designation') ,
            DrawerUpdateCard(hint: 'Company',label: 'Amin Diagnostics') ,
            DrawerUpdateCard(hint: '124578945124',label: 'NID Number') ,
            DrawerUpdateCard(hint: 'Uttara,Dhaka',label: 'Location') ,
            const SizedBox(height: 150),
            PrimaryButton(text: 'Log Out', onTap: dashboardController.logout)
          ],
        ),
      ),
    );
  }
}

class DrawerUpdateCard extends StatelessWidget {
  const DrawerUpdateCard({
    super.key, required this.hint, required this.label,
  });
final String hint,label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hint,
            labelText:label,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: TextStyle(
                fontWeight: FontWeight.bold ,fontSize: 20),
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
