import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:momrecipes/bloc/tag/tag.controller.dart';
import 'package:momrecipes/bloc/tag/tag.events.dart';
import 'package:momrecipes/bloc/tag/tag.state.dart';

class TagsBloc extends Bloc<TagsEvents, TagsState> {
  final TagsController tagsController;

  TagsBloc({required this.tagsController})
      : super(
          TagsInitState(),
        );

  @override
  Stream<TagsState> mapEventToState(TagsEvents event) async* {
    switch (event.eventType) {
      case ETagsEvents.getTags:
        try {
          yield TagsLoadingState();
          final tags = await tagsController.getTags(event.id);
          yield TagsLoadedState(
            tags: tags,
          );
          break;
        } catch (e) {
          throw new Error();
        }
    }
  }
}
