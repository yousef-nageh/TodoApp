int indexOfMapItem(List <dynamic> list,  dynamic value) {
  int index = 0;
  for (var mapItem in list) {
    if (mapItem.id == value) {
      return index;
    }
    index++;
  }
  return -1;  // Return -1 if item is not found
}