//!gir Gtk-3.0
//!info description "D binding for the Gtk3 library - Gtk3 graphics toolkit library"
//!info homepage https://gtk.org
//!info docs https://www.kymorphia.com/gid/gid~gtk3/
//!info capi https://docs.gtk.org/gtk3/

// Disabled: returns entries referencing accel group internals, which shallow copies may outlive
//!set class[AccelGroup].method[query][disable] 1

// Borrowed structure returns: owned by a parameter (buffer metas) or static/long-lived data (no owner)
//!set record[BindingSet].function[find].return-value[][gid-borrow] static

//!kind RequestedSize StructAlias

//# Rename ToolShell.getOrientation since it conflicts with Orientable.getOrientation in ToolBar
//!set interface[ToolShell].method[get_orientation][name] tool_shell_get_orientation

//# GtkIconSize enum uses gint for the D type, set it to IconSize enum (the * after GtkIconSize is a wildcard to match a literal '*' also)
//!set *.type[c:type=GtkIconSize*,name=gint][name] IconSize

//# Change string arguments to character array with length
//!set callback[ClipboardRichTextReceivedFunc].parameters.parameter[text].type '<array length="3" c:type="const gchar*"><type name="char" c:type="char"/></array>'

//# Hand-written below: New order array length is the number of rows in the store
//!set class[ListStore].method[reorder][ignore] 1

//# axes param takes a GDK_AXIS_IGNORE terminated array (0 value) and expects the out values[] array to be the same size (use length of axes array)
//!set class[GestureStylus].method[get_axes].parameters.parameter[axes].array[][zero-terminated] 1
//!set class[GestureStylus].method[get_axes].parameters.parameter[values].array[][length] 0

//# Set arrays to be zero-terminated=1
//!set class[IconTheme].method[get_icon_sizes].return-value.array[][zero-terminated] 1
//!set function[accelerator_parse_with_keycode].parameters.parameter[accelerator_codes].array[][zero-terminated] 1
//!set function[init_with_args].parameters.parameter[entries].array[][zero-terminated] 1

//# Ignore unimportant APIs
//!set callback[ModuleInitFunc][ignore] 1
//!set function[target_table_free][ignore] 1

//# Stock items must persist until application exit, binding passes a temporary array
//!set function[stock_add_static][ignore] 1

//# Ignore user data parameter
//!set interface[Buildable].method[custom_tag_end][ignore] 1

//# Set basic parameters to out
//!set function[rc_parse_priority].parameters.parameter[priority][direction] out

//# set_default_icon_list copies the list and refs the pixbufs (caller retains ownership), like set_icon_list
//!set class[Window].function[set_default_icon_list].parameters.parameter[list][transfer-ownership] none

//# Return callback array should be transfer-ownership full
//!set callback[TextBufferSerializeFunc].return-value[][transfer-ownership] full

//# string-length-param (Strings with array length parameters)
//!set class[Builder].constructor[new_from_string].parameters.parameter[string].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[Builder].method[add_from_string].parameters.parameter[buffer].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[Builder].method[add_objects_from_string].parameters.parameter[buffer].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[Builder].method[extend_with_template].parameters.parameter[buffer].type '<array length="3" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[Clipboard].method[set_text].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set interface[Editable].method[insert_text].parameters.parameter[new_text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[EntryBuffer].constructor[new].parameters.parameter[initial_chars].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[EntryBuffer].method[emit_inserted_text].parameters.parameter[chars].type '<array length="2" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[EntryBuffer].method[insert_text].parameters.parameter[chars].type '<array length="2" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[EntryBuffer].method[set_text].parameters.parameter[chars].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[EntryBuffer].glib:signal[inserted-text].parameters.parameter[chars].type '<array length="2" c:type="gchar*"><type name="char" c:type="char"/></array>'
//!set class[IMContext].method[set_surrounding].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set record[SelectionData].method[set_text].parameters.parameter[str].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[TextBuffer].method[insert].parameters.parameter[text].type '<array length="2" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[TextBuffer].method[insert_at_cursor].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[TextBuffer].method[insert_interactive].parameters.parameter[text].type '<array length="2" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[TextBuffer].method[insert_interactive_at_cursor].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[TextBuffer].method[insert_markup].parameters.parameter[markup].type '<array length="2" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[TextBuffer].method[set_text].parameters.parameter[text].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set class[TextBuffer].glib:signal[insert-text].parameters.parameter[text].type '<array length="2" c:type="gchar*"><type name="char" c:type="char"/></array>'
//!set class[UIManager].method[add_ui_from_string].parameters.parameter[buffer].type '<array length="1" c:type="const gchar*"><type name="char" c:type="char"/></array>'
//!set interface[Editable].glib:signal[insert-text].parameters.parameter[new_text].type '<array length="1" c:type="gchar*"><type name="char" c:type="char"/></array>'

//# Pointer fields owned by the structure (freed by its free function), enables setters
//!set record[TargetEntry].field[target][owned] 1


//# Make read-only (no write support): Fields with types that can't be written (Wrap/Opaque/Pointer, embedded Boxed, containers)
//!set record[BindingEntry].field[binding_set][writable] 0
//!set record[BindingEntry].field[set_next][writable] 0
//!set record[BindingEntry].field[hash_next][writable] 0
//!set record[BindingEntry].field[signals][writable] 0
//!set record[BindingSet].field[widget_path_pspecs][writable] 0
//!set record[BindingSet].field[widget_class_pspecs][writable] 0
//!set record[BindingSet].field[class_branch_pspecs][writable] 0
//!set record[BindingSet].field[entries][writable] 0
//!set record[BindingSet].field[current][writable] 0
//!set record[BindingSignal].field[next][writable] 0
//!set record[BindingSignal].field[args][writable] 0
//!set record[RcProperty].field[value][writable] 0
//!set record[RecentData].field[groups][writable] 0
//!set record[RecentFilterInfo].field[applications][writable] 0
//!set record[RecentFilterInfo].field[groups][writable] 0
//!set record[SettingsValue].field[value][writable] 0
//!set record[TargetPair].field[target][writable] 0
//!set record[TextAttributes].field[appearance][writable] 0

//# Make read-only (no write support): Pointer fields of unknown ownership, no proper write support
//!set record[TextAttributes].field[font][writable] 0
//!set record[TextAttributes].field[tabs][writable] 0
//!set record[TextAttributes].field[language][writable] 0

//# Ignore: Deprecated API with a replacement
//!set class[Settings].property[color-hash][ignore] 1

//# Ignore: Generic GCallback/C function symbol APIs, not usable from D
//!set class[Builder].method[add_callback_symbol][ignore] 1

//# Ignore: Properties which conflict with identically named methods (use the methods)
//!set class[Widget].property[has-default][ignore] 1
//!set class[Widget].property[has-focus][ignore] 1
//!set class[Widget].property[is-focus][ignore] 1

//# Ignore: Untyped raw pointer fields (gpointer user/private data), not useful from D
//!set record[RequestedSize].field[data][ignore] 1
//!set record[TreeIter].field[user_data][ignore] 1
//!set record[TreeIter].field[user_data2][ignore] 1
//!set record[TreeIter].field[user_data3][ignore] 1

//# Ignore: Legacy target table array of inline structures with full ownership, use TargetList instead
//!set function[target_table_new_from_list][ignore] 1

//# Hand-written below: Notified callback without closure data (delegate stored as menu object data)
//!set class[Menu].method[attach_to_widget][ignore] 1

//!class ListStore

  /**
      Reorders the store to follow the order indicated by newOrder. Note that this function only works with unsorted
      stores.
      Params:
        newOrder = an array of integers mapping the new position of each child to its old position before the
          re-ordering, i.e. `newOrder[newpos] = oldpos`. Its length must be the number of rows in the store.
  */
  void reorder(int[] newOrder) nothrow
  {
    import glib.c.functions : g_log;
    import glib.c.types : GLogLevelFlags;

    auto nRows = gtk_tree_model_iter_n_children(cast(GtkTreeModel*)this._cPtr, null);

    if (newOrder.length != nRows)
    {
      g_log("Gid", GLogLevelFlags.LevelCritical, "gtk.list_store.ListStore.reorder newOrder length %d does not match the number of rows %d",
        cast(int)newOrder.length, nRows);
      return;
    }

    if (nRows > 0)
      gtk_list_store_reorder(cast(GtkListStore*)this._cPtr, newOrder.ptr);
  }

//!class Menu

  /**
      Attaches the menu to the widget and provides a callback function that will be invoked when the menu calls
      [gtk.menu.Menu.detach] during its destruction.
      If the menu is attached to the widget then it will be destroyed when the widget is destroyed, as if it was a
      child widget. An attached menu will also move between screens correctly if the widgets moves between screens.
      Params:
        attachWidget = the widget that the menu will be attached to
        detacher = the user supplied callback function that will be called when the menu calls
          [gtk.menu.Menu.detach] (kept alive by the menu), or null
  */
  void attachToWidget(gtk.widget.Widget attachWidget, gtk.types.MenuDetachFunc detacher = null) nothrow
  {
    import gobject.c.functions : g_object_get_data, g_object_set_data_full;
    import gobject.c.types : GObject;

    static extern(C) void _detacherCallback(GtkWidget* attachWidget, GtkMenu* menu) nothrow
    {
      auto _dlg = cast(gtk.types.MenuDetachFunc*)g_object_get_data(cast(GObject*)menu, "gid-menu-detacher");

      if (!_dlg || !*_dlg)
        return;

      try
      {
        (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(void*)attachWidget, No.Take),
          gobject.object.ObjectWrap._getDObject!(gtk.menu.Menu)(cast(void*)menu, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gtk.types.MenuDetachFunc");
      }
    }

    // The detacher has no closure data, the frozen delegate is owned by the menu object data (replaced or freed with the menu)
    g_object_set_data_full(cast(GObject*)this._cPtr, "gid-menu-detacher", detacher ? freezeDelegate(cast(void*)&detacher) : null,
      detacher ? cast(GDestroyNotify)&thawPtrDestroyFunc : null);
    gtk_menu_attach_to_widget(cast(GtkMenu*)this._cPtr, attachWidget ? cast(GtkWidget*)attachWidget._cPtr(No.Dup) : null,
      detacher ? &_detacherCallback : null);
  }
