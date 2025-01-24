import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikncodes_machine_test/core/local_storage/hive.dart';
import 'package:vikncodes_machine_test/core/themes/vikn_colors.dart';
import 'package:vikncodes_machine_test/core/themes/vikn_images.dart';
import 'package:vikncodes_machine_test/ui/login_screen/presentation/login_page.dart';
import 'package:vikncodes_machine_test/ui/profile_screen/presentation/provider/profile_notifier_provider.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileNotifierProvider.notifier).getProfileResData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: profileState.maybeWhen(
            orElse: () {
              return Center(
                child: Text(
                  'data',
                  style: TextStyle(color: ViknColors.whiteColor),
                ),
              );
            },
            success: (profileData) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  spacing: 8,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: ViknColors.dashboardCardBackground,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.black,
                                ),
                                height:100,
                                width:100,
                                child: CachedNetworkImage(imageUrl:
                                  profileData.customerData?.photo ?? "",
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      profileData.data?.username ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      profileData.data?.email ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(ViknImages.profileEditIcon),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // Stats Row
                          Row(
                            children: [
                              Expanded(
                                child: _StatCard(
                                  icon: ViknImages.starsIcon,
                                  title: '4.3★',
                                  subtitle: '201\nrides',
                                  color: ViknColors.rideTileBackground,
                                  textColor: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _StatCard(
                                  icon: ViknImages.kycIcon,
                                  title: 'KYC',
                                  subtitle: 'Verified',
                                  color: ViknColors.invoiceCardBackground,
                                  textColor: Colors.white,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // Logout Button
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                StorageServiceMixin().clearData();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 8,
                                children: [
                                  Icon(Icons.logout_outlined,color: Colors.red,),
                                   Text('Logout'),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    // Menu Items
                    _MenuItem(
                      icon: ViknImages.helpIcon,
                      title: 'Help',
                      onTap: () {},
                      iconColor: Colors.white,
                      textColor: Colors.white,
                    ),
                    _MenuItem(
                      icon: ViknImages.faqIcon,
                      title: 'FAQ',
                      onTap: () {},
                      iconColor: Colors.white,
                      textColor: Colors.white,
                    ),
                    _MenuItem(
                      icon: ViknImages.inviteIcon,
                      title: 'Invite Friends',
                      onTap: () {},
                      iconColor: Colors.white,
                      textColor: Colors.white,
                    ),
                    _MenuItem(
                      icon: ViknImages.termsIcon,
                      title: 'Terms of service',
                      onTap: () {},
                      iconColor: Colors.white,
                      textColor: Colors.white,
                    ),
                    _MenuItem(
                      icon: ViknImages.privacyIcon,
                      title: 'Privacy Policy',
                      onTap: () {},
                      iconColor: Colors.white,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              );
            },
            loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
            failure: (e) => Center(
                  child: Text(
                    e.toString(),
                    style: TextStyle(color: ViknColors.whiteColor),
                  ),
                )),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color? color;
  final Color textColor;
  final String icon;

  const _StatCard({
    required this.title,
    required this.subtitle,
    this.color,
    this.textColor = Colors.black,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
      decoration: BoxDecoration(
        color:Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        spacing: 10,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(30)
            ),
            child: Image.asset(icon),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: textColor,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: color,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  final Color iconColor;
  final Color textColor;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor = Colors.white,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(icon),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      trailing: Icon(Icons.chevron_right, color: iconColor),
      onTap: onTap,
    );
  }
}
