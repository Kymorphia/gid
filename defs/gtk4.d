//!gir Gtk-4.0
//!info description "D binding for the Gtk4 library - Gtk4 graphics toolkit library"
//!info homepage https://gtk.org
//!info docs https://www.kymorphia.com/gid/gtk.html
//!info capi https://docs.gtk.org/gtk4/

//!kind BitsetIter Boxed
//!kind RequestedSize StructAlias

//# Disable methods with arrays with sizes not described by parameters (FIXME)
//!set class[ListStore].method[reorder][unsupported] 1

//# Ignore method which uses GObjectClass
//!set interface[Editable].function[install_properties][ignore] 1

//# Add missing c:type for GtkSnapshot
//!set class[Snapshot][c:type] GtkSnapshot

//# CellArea::add-editable signal has parameter name which conflicts with cellArea instance name, rename it
//!set class[CellArea].glib:signal[add-editable].parameters.parameter[cell_area][name] area

//# Set arrays to be zero-terminated=1
//!set function[accelerator_parse_with_keycode].parameters.parameter[accelerator_codes].array[][zero-terminated] 1
//!set class[IconTheme].method[get_icon_sizes].return-value.array[][zero-terminated] 1

//# axes param takes a GDK_AXIS_IGNORE terminated array (0 value) and expects the out values[] array to be the same size (use length of axes array)
//!set class[GestureStylus].method[get_axes].parameters.parameter[axes].array[][zero-terminated] 1
//!set class[GestureStylus].method[get_axes].parameters.parameter[values].array[][length] 0

//# Change Builder.new_from_string to take an array of characters with a length, to remove the length and optimize
//!set class[Builder].constructor[new_from_string].parameters.parameter[string].type '<array length="1" c:type="gchar*"><type name="char" c:type="char"/></array>'

//# Use array of characters with a length, to remove the length and optimize
//!set class[TextBuffer].method[set_text].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[TextBuffer].method[insert].parameters.parameter[text].type '<array length="2" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[TextBuffer].method[insert_at_cursor].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[TextBuffer].method[insert_interactive].parameters.parameter[text].type '<array length="2" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[TextBuffer].method[insert_interactive_at_cursor].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[TextBuffer].method[insert_markup].parameters.parameter[markup].type '<array length="2" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set interface[Editable].method[insert_text].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[IMContext].method[set_surrounding].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[IMContext].method[set_surrounding_with_selection].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'

//# string-length-param (Strings with array length parameters)
//!set class[Builder].method[add_from_string].parameters.parameter[buffer].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set class[Builder].method[add_objects_from_string].parameters.parameter[buffer].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set class[Builder].method[extend_with_template].parameters.parameter[buffer].type '<array length="3" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set class[CssProvider].method[load_from_data].parameters.parameter[data].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set class[EntryBuffer].constructor[new].parameters.parameter[initial_chars].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set class[EntryBuffer].method[emit_inserted_text].parameters.parameter[chars].type '<array length="2" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set class[EntryBuffer].method[insert_text].parameters.parameter[chars].type '<array length="2" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set class[EntryBuffer].method[set_text].parameters.parameter[chars].type '<array length="1" c:type="const char*"><type name="char" c:type="char"/></array>'
//!set class[EntryBuffer].glib:signal[inserted-text].parameters.parameter[chars].type '<array length="2" c:type="gchar*"><type name="char" c:type="char"/></array>'
//!set class[TextBuffer].glib:signal[insert-text].parameters.parameter[text].type '<array length="2" c:type="gchar*"><type name="char" c:type="char"/></array>'
//!set interface[Editable].glib:signal[insert-text].parameters.parameter[text].type '<array length="1" c:type="gchar*"><type name="char" c:type="char"/></array>'

//!class CustomSorter
//!set class[CustomSorter].constructor[new][ignore] 1
//!set class[CustomSorter].method[set_sort_func][ignore] 1
  import gobject.object;

  // Define a sort delegate that takes ObjectWrap objects, instead of the CompareDataFunc which is passed raw GObject pointers
  alias CustomSortDelegate = int delegate(gobject.object.ObjectWrap aObj, gobject.object.ObjectWrap bObj);

  /**
   * Creates a new `GtkSorter` that works by calling
   * sortFunc to compare items.
   * If sortFunc is null, all items are considered equal.
   * Params:
   *   sortFunc = the callback delegate to use for sorting
   * Returns: a new `CustomSorter`
   */
  this(CustomSortDelegate sortFunc)
  {
    extern(C) int _sortFuncCallback(const(void)* a, const(void)* b, void* userData)
    {
      auto _dlg = cast(CustomSortDelegate*)userData;
      auto aObj = cast(GObject*)a;
      auto bObj = cast(GObject*)b;

      int _retval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(aObj, No.Take),
        gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(bObj, No.Take));
      return _retval;
    }

    GtkCustomSorter* _cretval;
    auto _sortFunc = freezeDelegate(cast(void*)&sortFunc);
    _cretval = gtk_custom_sorter_new(&_sortFuncCallback, _sortFunc, &thawDelegate);
    this(_cretval, Yes.Take);
  }

  /**
   * Sets (or unsets) the function used for sorting items.
   * If sort_func is %NULL, all items are considered equal.
   * If the sort func changes its sorting behavior,
   * [Gtk.Sorter.changed] needs to be called.
   * If a previous function was set, its user_destroy will be
   * called now.
   * Params:
   *   sortFunc = function to sort items
   */
  void setSortFunc(CustomSortDelegate sortFunc)
  {
    extern(C) int _sortFuncCallback(const(void)* a, const(void)* b, void* userData)
    {
      auto _dlg = cast(CustomSortDelegate*)userData;
      auto aObj = cast(GObject*)a;
      auto bObj = cast(GObject*)b;

      int _retval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(aObj, No.Take),
        gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(bObj, No.Take));
      return _retval;
    }

    auto _sortFunc = freezeDelegate(cast(void*)&sortFunc);
    gtk_custom_sorter_set_sort_func(cast(GtkCustomSorter*)_cPtr, &_sortFuncCallback, _sortFunc, &thawDelegate);
  }
