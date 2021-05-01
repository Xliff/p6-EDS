class Cursor::Builder::Registry {

  method typeClass {
    (
      CursorSlot    => 'Cursor::Slot',
      CursorExample => 'Cursor::Example',
      CursorSearch  => 'Cursor::Search'
    ).Map
  }

}
