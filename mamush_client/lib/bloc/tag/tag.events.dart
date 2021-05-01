enum ETagsEvents { getTags }

class TagsEvents {
  late ETagsEvents eventType;
  late String id;

  TagsEvents.getTags(String id) {
    this.id = id;
    this.eventType = ETagsEvents.getTags;
  }
}
