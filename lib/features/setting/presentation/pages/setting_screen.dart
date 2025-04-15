 
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcw/core/constansts/asset_manger.dart';
import 'package:tcw/core/constansts/context_extensions.dart';
import 'package:tcw/core/shared/shared_widget/app_bar.dart';
import 'package:tcw/routes/routes_names.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: context.propHeight(32)),
              CustomAppBar(title: 'Settings'),
               SizedBox(height: context.propHeight(24)),
              _settingTile(
                icon:  AssetManger.personalDetailsIcon,
                label: 'Personal Details',
                onTap: () {
                 Modular.to.pushNamed(AppRoutes.personalDetailsScreen);
                },
              ),
              _settingTile(
                icon: AssetManger.subscriptionsIcon,
                label: 'TCW Spaces',
                onTap: () {
                  Modular.to.pushNamed(AppRoutes.tCWMediaScreen);
                },
               ),
              _settingTile(
                icon: AssetManger.heart,
                label: 'Wishlist',
                onTap: () {
                  Modular.to.pushNamed(AppRoutes.wishListScreen);
                },
              ),
              _settingTile(
                icon: AssetManger.support,
                label: 'Support & Complaints',
                onTap: () {
                  Modular.to.pushNamed(AppRoutes.supportScreen);
                },
              ),
              _settingTile(
                icon: AssetManger.deletIcon,
                label: 'Delete Account',
                onTap: () {
                  showDeleteAccountDialog(context);
                },
                color: Colors.red,
                iconColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _settingTile({
    required String icon,
    required String label,
    required VoidCallback onTap,
    Widget? trailing,
    Color color = Colors.black,
    Color iconColor = Colors.black,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
             Image.asset(
                icon,
                width: 24,
                height: 24,
                color: iconColor,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    color: color,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (trailing != null) trailing,
            ],
          ),
        ),
      ),
    );
  }


void showDeleteAccountDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return DeleteAccountDialog();
    },
  );
}

}

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.delete_outline, size: 48, color: Colors.black54),
            const SizedBox(height: 20),
            const Text(
              'Are You Sure You Want To\nDelete Your Account?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Your delete logic here
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
