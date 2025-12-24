import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/core/utils/app_text_styles.dart';
import 'package:style_hub/core/widgets/show_snack_bar.dart';
import 'package:style_hub/features/cart/domain/entities/address_entity.dart';
import 'package:style_hub/features/cart/presentation/cubits/get_my_addresses_cubit/get_my_addresses_cubit.dart';
import 'package:style_hub/features/cart/presentation/cubits/remove_address_cubit/remove_address_cubit.dart';
import 'package:style_hub/generated/l10n.dart';

class RemoveAddressWidget extends StatelessWidget {
  const RemoveAddressWidget({super.key, required this.addressEntity});
  final AddressEntity addressEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocConsumer<RemoveAddressCubit, RemoveAddressState>(
          listener: (context, state) {
            if (state is RemoveAddressSuccess) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  showSnackBar(
                    title: S.of(context).success,
                    message: S.of(context).addressDeleted,
                    contentType: ContentType.success,
                  ),
                );
              context.read<GetMyAddressesCubit>().getMyAddresses();
            } else if (state is RemoveAddressFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  showSnackBar(
                    title: S.of(context).error,
                    message: state.errorMessage,
                    contentType: ContentType.failure,
                  ),
                );
            }
          },
          builder: (context, state) {
            return state is RemoveAddressLoading
                ? const CupertinoActivityIndicator(
                    color: Colors.black,
                  )
                : IconButton(
                    onPressed: () {
                      context.read<RemoveAddressCubit>().removeAddress(
                        addressId: addressEntity.id ?? '',
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 20,
                    ),
                  );
          },
        ),
        Text(
          S.of(context).delete,
          style: AppTextStyles.regular14(context),
        ),
      ],
    );
  }
}
