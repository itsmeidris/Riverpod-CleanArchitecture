import 'package:flutter/material.dart';
import 'package:riverpod_clean_architecture/application/core/themes/colors/app_colors.dart';
import 'package:riverpod_clean_architecture/domain/entities/user_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserCard extends StatelessWidget {
  final UserEntity userEntity;
  final VoidCallback onTap;
  const UserCard({super.key, required this.userEntity ,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          //height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.myWhite,
          ),
          child: Column(
            children: [
              Container(
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  color: AppColors.myBlue2,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      userEntity.profilePic.isNotEmpty
                          ? Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: AppColors.myBlack3,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.myWhite,
                                  width: 2,
                                ),
                              ),
                              // Use ClipOval to ensure the image respects the circle shape
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: userEntity.profilePic,
                                  fit: BoxFit
                                      .cover, // Ensure the image covers the area
                                  placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.myWhite,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            )
                          : Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: AppColors.myBlack3,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.myWhite,
                                  width: 2,
                                ),
                                // Placeholder image (e.g., a default asset or an Icon)
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/person.jpg',
                                  ), // Default/Placeholder image
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${userEntity.firstName} ${userEntity.lastName}',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "${userEntity.country}, ${userEntity.state}",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 5,
                  children: [
                    Row(
                      spacing: 5,
                      children: [
                        Icon(Icons.work),
                        Text(userEntity.jobTitle, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Icon(Icons.location_city),
                        Text(
                          userEntity.companyName,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Icon(Icons.phone),
                        Text(
                          'Phone number: ${userEntity.phone}',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Icon(Icons.email),
                        Text(
                          'Email: ${userEntity.email}',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
