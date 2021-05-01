enum ECategoryEvents { getCategories }

class CategoryEvents {
  late ECategoryEvents eventType;

  CategoryEvents.getCategories() {
    this.eventType = ECategoryEvents.getCategories;
  }
}
