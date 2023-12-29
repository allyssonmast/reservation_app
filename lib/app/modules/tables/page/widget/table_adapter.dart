import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helpers/constants/padding_constants.dart';
import '../../../../helpers/theme/text_theme.dart';
import '../../domain/models/index.dart';

class TableAdapter extends StatelessWidget {
  final Tables tables;
  final Customers? customers;
  final Function(Tables, Customers?) onTap;
  const TableAdapter(
      {Key? key, required this.tables, this.customers, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: customers != null ? kBadgeColor : context.theme.cardColor,
      child: InkWell(
        onTap: () => onTap(tables, customers),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Table Id', style: TextThemes.headline1),
            Text(tables.id.toString(), style: TextThemes.bodyTextSub1),
            if (customers != null)
              Card(
                color: kSecondaryColor,
                margin: paddingHorizonteMedium,
                child: ListTile(
                  contentPadding: paddingHorizonteSmail,
                  leading: CircleAvatar(
                    key: const Key('customer_image'),
                    backgroundImage: NetworkImage(customers!.imageUrl),
                    onBackgroundImageError: (_, __) => Container(),
                  ),
                  title: Text(
                    '${customers!.firstName} ${customers!.lastName}',
                    key: const Key('customer_name'),
                  ),
                ),
              )
            else
              const Text('Free', style: TextThemes.bodyTextBold)
          ],
        ),
      ),
    );
  }
}
