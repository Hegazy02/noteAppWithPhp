import 'package:flutter/material.dart';
import 'package:noteappwithphp/core/helpers/extentions.dart';
import 'package:noteappwithphp/core/models/note_model.dart';
import 'package:noteappwithphp/core/routing/routes.dart';
import 'package:noteappwithphp/core/theme/styles.dart';
import 'package:noteappwithphp/features/home/presentation/views/widgets/cutom_listTile.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      context.pushNamedAndRemoveUntil(
                        Routes.loginView,
                        predicate: (route) => false,
                      );
                    },
                    icon: const Icon(Icons.logout_outlined)),
                const Spacer(),
                Text(
                  "Hegazy",
                  style: Styles.style18WPrimaryBoldCairo,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ),
        SliverList.builder(
          itemCount: 4,
          itemBuilder: (context, index) => CustomListTile(
            noteTitle: "noteTitle",
            noteBody: "noteBody",
            onTap: () {
              context.pushNamed(Routes.editNoteView,
                  arguments: NoteModel(noteTitle: "as", noteBody: "ww"));
            },
          ),
        )
      ],
    );
  }
}
