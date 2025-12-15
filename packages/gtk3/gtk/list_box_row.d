/// Module for [ListBoxRow] class
module gtk.list_box_row;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/** */
class ListBoxRow : gtk.bin.Bin, gtk.actionable.Actionable
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_list_box_row_get_type != &gidSymbolNotFound ? gtk_list_box_row_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ListBoxRow self()
  {
    return this;
  }

  /**
      Get `activatable` property.
      Returns: The property determines whether the #GtkListBox::row-activated
      signal will be emitted for this row.
  */
  @property bool activatable()
  {
    return getActivatable();
  }

  /**
      Set `activatable` property.
      Params:
        propval = The property determines whether the #GtkListBox::row-activated
        signal will be emitted for this row.
  */
  @property void activatable(bool propval)
  {
    return setActivatable(propval);
  }

  /**
      Get `selectable` property.
      Returns: The property determines whether this row can be selected.
  */
  @property bool selectable()
  {
    return getSelectable();
  }

  /**
      Set `selectable` property.
      Params:
        propval = The property determines whether this row can be selected.
  */
  @property void selectable(bool propval)
  {
    return setSelectable(propval);
  }

  mixin ActionableT!();

  /**
      Creates a new #GtkListBoxRow, to be used as a child of a #GtkListBox.
      Returns: a new #GtkListBoxRow
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_list_box_row_new();
    this(_cretval, No.Take);
  }

  /**
      Marks row as changed, causing any state that depends on this
      to be updated. This affects sorting, filtering and headers.
      
      Note that calls to this method must be in sync with the data
      used for the row functions. For instance, if the list is
      mirroring some external data set, and *two* rows changed in the
      external data set then when you call [gtk.list_box_row.ListBoxRow.changed]
      on the first row the sort function must only read the new data
      for the first of the two changed rows, otherwise the resorting
      of the rows will be wrong.
      
      This generally means that if you don’t fully control the data
      model you have to duplicate the data that affects the listbox
      row functions into the row widgets themselves. Another alternative
      is to call [gtk.list_box.ListBox.invalidateSort] on any model change,
      but that is more expensive.
  */
  void changed()
  {
    gtk_list_box_row_changed(cast(GtkListBoxRow*)this._cPtr);
  }

  /**
      Gets the value of the #GtkListBoxRow:activatable property
      for this row.
      Returns: true if the row is activatable
  */
  bool getActivatable()
  {
    bool _retval;
    _retval = cast(bool)gtk_list_box_row_get_activatable(cast(GtkListBoxRow*)this._cPtr);
    return _retval;
  }

  /**
      Returns the current header of the row. This can be used
      in a #GtkListBoxUpdateHeaderFunc to see if there is a header
      set already, and if so to update the state of it.
      Returns: the current header, or null if none
  */
  gtk.widget.Widget getHeader()
  {
    GtkWidget* _cretval;
    _cretval = gtk_list_box_row_get_header(cast(GtkListBoxRow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current index of the row in its #GtkListBox container.
      Returns: the index of the row, or -1 if the row is not in a listbox
  */
  int getIndex()
  {
    int _retval;
    _retval = gtk_list_box_row_get_index(cast(GtkListBoxRow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the #GtkListBoxRow:selectable property
      for this row.
      Returns: true if the row is selectable
  */
  bool getSelectable()
  {
    bool _retval;
    _retval = cast(bool)gtk_list_box_row_get_selectable(cast(GtkListBoxRow*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the child is currently selected in its
      #GtkListBox container.
      Returns: true if row is selected
  */
  bool isSelected()
  {
    bool _retval;
    _retval = cast(bool)gtk_list_box_row_is_selected(cast(GtkListBoxRow*)this._cPtr);
    return _retval;
  }

  /**
      Set the #GtkListBoxRow:activatable property for this row.
  
      Params:
        activatable = true to mark the row as activatable
  */
  void setActivatable(bool activatable)
  {
    gtk_list_box_row_set_activatable(cast(GtkListBoxRow*)this._cPtr, activatable);
  }

  /**
      Sets the current header of the row. This is only allowed to be called
      from a #GtkListBoxUpdateHeaderFunc. It will replace any existing
      header in the row, and be shown in front of the row in the listbox.
  
      Params:
        header = the header, or null
  */
  void setHeader(gtk.widget.Widget header = null)
  {
    gtk_list_box_row_set_header(cast(GtkListBoxRow*)this._cPtr, header ? cast(GtkWidget*)header._cPtr(No.Dup) : null);
  }

  /**
      Set the #GtkListBoxRow:selectable property for this row.
  
      Params:
        selectable = true to mark the row as selectable
  */
  void setSelectable(bool selectable)
  {
    gtk_list_box_row_set_selectable(cast(GtkListBoxRow*)this._cPtr, selectable);
  }

  /**
      Connect to `Activate` signal.
  
      This is a keybinding signal, which will cause this row to be activated.
      
      If you want to be notified when the user activates a row (by key or not),
      use the #GtkListBox::row-activated signal on the row’s parent #GtkListBox.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.list_box_row.ListBoxRow listBoxRow))
  
          `listBoxRow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.list_box_row.ListBoxRow)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }
}
