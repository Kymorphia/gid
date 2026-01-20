/// Module for [WidgetPath] class
module gtk.widget_path;

import gid.gid;
import glib.types;
import gobject.boxed;
import gobject.types;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    GtkWidgetPath is a boxed type that represents a widget hierarchy from
    the topmost widget, typically a toplevel, to any child. This widget
    path abstraction is used in #GtkStyleContext on behalf of the real
    widget in order to query style information.
    
    If you are using GTK+ widgets, you probably will not need to use
    this API directly, as there is [gtk.widget.Widget.getPath], and the style
    context returned by [gtk.widget.Widget.getStyleContext] will be automatically
    updated on widget hierarchy changes.
    
    The widget path generation is generally simple:
    
    ## Defining a button within a window
    
    ```c
    {
      GtkWidgetPath *path;
    
      path = gtk_widget_path_new ();
      gtk_widget_path_append_type (path, GTK_TYPE_WINDOW);
      gtk_widget_path_append_type (path, GTK_TYPE_BUTTON);
    }
    ```
    
    Although more complex information, such as widget names, or
    different classes (property that may be used by other widget
    types) and intermediate regions may be included:
    
    ## Defining the first tab widget in a notebook
    
    ```c
    {
      GtkWidgetPath *path;
      guint pos;
    
      path = gtk_widget_path_new ();
    
      pos = gtk_widget_path_append_type (path, GTK_TYPE_NOTEBOOK);
      gtk_widget_path_iter_add_region (path, pos, "tab", GTK_REGION_EVEN | GTK_REGION_FIRST);
    
      pos = gtk_widget_path_append_type (path, GTK_TYPE_LABEL);
      gtk_widget_path_iter_set_name (path, pos, "first tab label");
    }
    ```
    
    All this information will be used to match the style information
    that applies to the described widget.
*/
class WidgetPath : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_widget_path_get_type != &gidSymbolNotFound ? gtk_widget_path_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WidgetPath self()
  {
    return this;
  }

  /**
      Returns an empty widget path.
      Returns: A newly created, empty, #GtkWidgetPath
  */
  this()
  {
    GtkWidgetPath* _cretval;
    _cretval = gtk_widget_path_new();
    this(_cretval, Yes.Take);
  }

  /**
      Appends the data from widget to the widget hierarchy represented
      by path. This function is a shortcut for adding information from
      widget to the given path. This includes setting the name or
      adding the style classes from widget.
  
      Params:
        widget = the widget to append to the widget path
      Returns: the position where the data was inserted
  */
  int appendForWidget(gtk.widget.Widget widget)
  {
    int _retval;
    _retval = gtk_widget_path_append_for_widget(cast(GtkWidgetPath*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Appends a widget type to the widget hierarchy represented by path.
  
      Params:
        type = widget type to append
      Returns: the position where the element was inserted
  */
  int appendType(gobject.types.GType type)
  {
    int _retval;
    _retval = gtk_widget_path_append_type(cast(GtkWidgetPath*)this._cPtr, type);
    return _retval;
  }

  /**
      Appends a widget type with all its siblings to the widget hierarchy
      represented by path. Using this function instead of
      [gtk.widget_path.WidgetPath.appendType] will allow the CSS theming to use
      sibling matches in selectors and apply :nth-child() pseudo classes.
      In turn, it requires a lot more care in widget implementations as
      widgets need to make sure to call [gtk.widget.Widget.resetStyle] on all
      involved widgets when the siblings path changes.
  
      Params:
        siblings = a widget path describing a list of siblings. This path
            may not contain any siblings itself and it must not be modified
            afterwards.
        siblingIndex = index into siblings for where the added element is
            positioned.
      Returns: the position where the element was inserted.
  */
  int appendWithSiblings(gtk.widget_path.WidgetPath siblings, uint siblingIndex)
  {
    int _retval;
    _retval = gtk_widget_path_append_with_siblings(cast(GtkWidgetPath*)this._cPtr, siblings ? cast(GtkWidgetPath*)siblings._cPtr(No.Dup) : null, siblingIndex);
    return _retval;
  }

  /**
      Returns a copy of path
      Returns: a copy of path
  */
  gtk.widget_path.WidgetPath copy()
  {
    GtkWidgetPath* _cretval;
    _cretval = gtk_widget_path_copy(cast(const(GtkWidgetPath)*)this._cPtr);
    auto _retval = _cretval ? new gtk.widget_path.WidgetPath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the topmost object type, that is, the object type this path
      is representing.
      Returns: The object type
  */
  gobject.types.GType getObjectType()
  {
    gobject.types.GType _retval;
    _retval = gtk_widget_path_get_object_type(cast(const(GtkWidgetPath)*)this._cPtr);
    return _retval;
  }

  /**
      Returns true if any of the parents of the widget represented
      in path is of type type, or any subtype of it.
  
      Params:
        type = widget type to check in parents
      Returns: true if any parent is of type type
  */
  bool hasParent(gobject.types.GType type)
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_path_has_parent(cast(const(GtkWidgetPath)*)this._cPtr, type);
    return _retval;
  }

  /**
      Returns true if the widget type represented by this path
      is type, or a subtype of it.
  
      Params:
        type = widget type to match
      Returns: true if the widget represented by path is of type type
  */
  bool isType(gobject.types.GType type)
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_path_is_type(cast(const(GtkWidgetPath)*)this._cPtr, type);
    return _retval;
  }

  /**
      Adds the class name to the widget at position pos in
      the hierarchy defined in path. See
      [gtk.style_context.StyleContext.addClass].
  
      Params:
        pos = position to modify, -1 for the path head
        name = a class name
  */
  void iterAddClass(int pos, string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_widget_path_iter_add_class(cast(GtkWidgetPath*)this._cPtr, pos, _name);
  }

  /**
      Adds the region name to the widget at position pos in
      the hierarchy defined in path. See
      [gtk.style_context.StyleContext.addRegion].
      
      Region names must only contain lowercase letters
      and “-”, starting always with a lowercase letter.
  
      Params:
        pos = position to modify, -1 for the path head
        name = region name
        flags = flags affecting the region
  
      Deprecated: The use of regions is deprecated.
  */
  void iterAddRegion(int pos, string name, gtk.types.RegionFlags flags)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_widget_path_iter_add_region(cast(GtkWidgetPath*)this._cPtr, pos, _name, flags);
  }

  /**
      Removes all classes from the widget at position pos in the
      hierarchy defined in path.
  
      Params:
        pos = position to modify, -1 for the path head
  */
  void iterClearClasses(int pos)
  {
    gtk_widget_path_iter_clear_classes(cast(GtkWidgetPath*)this._cPtr, pos);
  }

  /**
      Removes all regions from the widget at position pos in the
      hierarchy defined in path.
  
      Params:
        pos = position to modify, -1 for the path head
  
      Deprecated: The use of regions is deprecated.
  */
  void iterClearRegions(int pos)
  {
    gtk_widget_path_iter_clear_regions(cast(GtkWidgetPath*)this._cPtr, pos);
  }

  /**
      Returns the name corresponding to the widget found at
      the position pos in the widget hierarchy defined by
      path
  
      Params:
        pos = position to get the widget name for, -1 for the path head
      Returns: The widget name, or null if none was set.
  */
  string iterGetName(int pos)
  {
    const(char)* _cretval;
    _cretval = gtk_widget_path_iter_get_name(cast(const(GtkWidgetPath)*)this._cPtr, pos);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the object name that is at position pos in the widget
      hierarchy defined in path.
  
      Params:
        pos = position to get the object name for, -1 for the path head
      Returns: the name or null
  */
  string iterGetObjectName(int pos)
  {
    const(char)* _cretval;
    _cretval = gtk_widget_path_iter_get_object_name(cast(const(GtkWidgetPath)*)this._cPtr, pos);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the object #GType that is at position pos in the widget
      hierarchy defined in path.
  
      Params:
        pos = position to get the object type for, -1 for the path head
      Returns: a widget type
  */
  gobject.types.GType iterGetObjectType(int pos)
  {
    gobject.types.GType _retval;
    _retval = gtk_widget_path_iter_get_object_type(cast(const(GtkWidgetPath)*)this._cPtr, pos);
    return _retval;
  }

  /**
      Returns the index into the list of siblings for the element at pos as
      returned by [gtk.widget_path.WidgetPath.iterGetSiblings]. If that function would
      return null because the element at pos has no siblings, this function
      will return 0.
  
      Params:
        pos = position to get the sibling index for, -1 for the path head
      Returns: 0 or the index into the list of siblings for the element at pos.
  */
  uint iterGetSiblingIndex(int pos)
  {
    uint _retval;
    _retval = gtk_widget_path_iter_get_sibling_index(cast(const(GtkWidgetPath)*)this._cPtr, pos);
    return _retval;
  }

  /**
      Returns the list of siblings for the element at pos. If the element
      was not added with siblings, null is returned.
  
      Params:
        pos = position to get the siblings for, -1 for the path head
      Returns: null or the list of siblings for the element at pos.
  */
  gtk.widget_path.WidgetPath iterGetSiblings(int pos)
  {
    const(GtkWidgetPath)* _cretval;
    _cretval = gtk_widget_path_iter_get_siblings(cast(const(GtkWidgetPath)*)this._cPtr, pos);
    auto _retval = _cretval ? new gtk.widget_path.WidgetPath(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the state flags corresponding to the widget found at
      the position pos in the widget hierarchy defined by
      path
  
      Params:
        pos = position to get the state for, -1 for the path head
      Returns: The state flags
  */
  gtk.types.StateFlags iterGetState(int pos)
  {
    GtkStateFlags _cretval;
    _cretval = gtk_widget_path_iter_get_state(cast(const(GtkWidgetPath)*)this._cPtr, pos);
    gtk.types.StateFlags _retval = cast(gtk.types.StateFlags)_cretval;
    return _retval;
  }

  /**
      Returns true if the widget at position pos has the class name
      defined, false otherwise.
  
      Params:
        pos = position to query, -1 for the path head
        name = class name
      Returns: true if the class name is defined for the widget at pos
  */
  bool iterHasClass(int pos, string name)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = cast(bool)gtk_widget_path_iter_has_class(cast(const(GtkWidgetPath)*)this._cPtr, pos, _name);
    return _retval;
  }

  /**
      Returns true if the widget at position pos has the name name,
      false otherwise.
  
      Params:
        pos = position to query, -1 for the path head
        name = a widget name
      Returns: true if the widget at pos has this name
  */
  bool iterHasName(int pos, string name)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = cast(bool)gtk_widget_path_iter_has_name(cast(const(GtkWidgetPath)*)this._cPtr, pos, _name);
    return _retval;
  }

  /**
      See [gtk.widget_path.WidgetPath.iterHasClass]. This is a version that operates
      with GQuarks.
  
      Params:
        pos = position to query, -1 for the path head
        qname = class name as a #GQuark
      Returns: true if the widget at pos has the class defined.
  */
  bool iterHasQclass(int pos, glib.types.Quark qname)
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_path_iter_has_qclass(cast(const(GtkWidgetPath)*)this._cPtr, pos, qname);
    return _retval;
  }

  /**
      See [gtk.widget_path.WidgetPath.iterHasName]. This is a version
      that operates on #GQuarks.
  
      Params:
        pos = position to query, -1 for the path head
        qname = widget name as a #GQuark
      Returns: true if the widget at pos has this name
  */
  bool iterHasQname(int pos, glib.types.Quark qname)
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_path_iter_has_qname(cast(const(GtkWidgetPath)*)this._cPtr, pos, qname);
    return _retval;
  }

  /**
      See [gtk.widget_path.WidgetPath.iterHasRegion]. This is a version that operates
      with GQuarks.
  
      Params:
        pos = position to query, -1 for the path head
        qname = region name as a #GQuark
        flags = return location for the region flags
      Returns: true if the widget at pos has the region defined.
  
      Deprecated: The use of regions is deprecated.
  */
  bool iterHasQregion(int pos, glib.types.Quark qname, out gtk.types.RegionFlags flags)
  {
    bool _retval;
    _retval = cast(bool)gtk_widget_path_iter_has_qregion(cast(const(GtkWidgetPath)*)this._cPtr, pos, qname, &flags);
    return _retval;
  }

  /**
      Returns true if the widget at position pos has the class name
      defined, false otherwise.
  
      Params:
        pos = position to query, -1 for the path head
        name = region name
        flags = return location for the region flags
      Returns: true if the class name is defined for the widget at pos
  
      Deprecated: The use of regions is deprecated.
  */
  bool iterHasRegion(int pos, string name, out gtk.types.RegionFlags flags)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = cast(bool)gtk_widget_path_iter_has_region(cast(const(GtkWidgetPath)*)this._cPtr, pos, _name, &flags);
    return _retval;
  }

  /**
      Returns a list with all the class names defined for the widget
      at position pos in the hierarchy defined in path.
  
      Params:
        pos = position to query, -1 for the path head
      Returns: The list of
                 classes, This is a list of strings, the #GSList contents
                 are owned by GTK+, but you should use [glib.slist.SList.free] to
                 free the list itself.
  */
  string[] iterListClasses(int pos)
  {
    GSList* _cretval;
    _cretval = gtk_widget_path_iter_list_classes(cast(const(GtkWidgetPath)*)this._cPtr, pos);
    auto _retval = gSListToD!(string, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Returns a list with all the region names defined for the widget
      at position pos in the hierarchy defined in path.
  
      Params:
        pos = position to query, -1 for the path head
      Returns: The list of
                 regions, This is a list of strings, the #GSList contents
                 are owned by GTK+, but you should use [glib.slist.SList.free] to
                 free the list itself.
  
      Deprecated: The use of regions is deprecated.
  */
  string[] iterListRegions(int pos)
  {
    GSList* _cretval;
    _cretval = gtk_widget_path_iter_list_regions(cast(const(GtkWidgetPath)*)this._cPtr, pos);
    auto _retval = gSListToD!(string, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Removes the class name from the widget at position pos in
      the hierarchy defined in path.
  
      Params:
        pos = position to modify, -1 for the path head
        name = class name
  */
  void iterRemoveClass(int pos, string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_widget_path_iter_remove_class(cast(GtkWidgetPath*)this._cPtr, pos, _name);
  }

  /**
      Removes the region name from the widget at position pos in
      the hierarchy defined in path.
  
      Params:
        pos = position to modify, -1 for the path head
        name = region name
  
      Deprecated: The use of regions is deprecated.
  */
  void iterRemoveRegion(int pos, string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_widget_path_iter_remove_region(cast(GtkWidgetPath*)this._cPtr, pos, _name);
  }

  /**
      Sets the widget name for the widget found at position pos
      in the widget hierarchy defined by path.
  
      Params:
        pos = position to modify, -1 for the path head
        name = widget name
  */
  void iterSetName(int pos, string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_widget_path_iter_set_name(cast(GtkWidgetPath*)this._cPtr, pos, _name);
  }

  /**
      Sets the object name for a given position in the widget hierarchy
      defined by path.
      
      When set, the object name overrides the object type when matching
      CSS.
  
      Params:
        pos = position to modify, -1 for the path head
        name = object name to set or null to unset
  */
  void iterSetObjectName(int pos, string name = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_widget_path_iter_set_object_name(cast(GtkWidgetPath*)this._cPtr, pos, _name);
  }

  /**
      Sets the object type for a given position in the widget hierarchy
      defined by path.
  
      Params:
        pos = position to modify, -1 for the path head
        type = object type to set
  */
  void iterSetObjectType(int pos, gobject.types.GType type)
  {
    gtk_widget_path_iter_set_object_type(cast(GtkWidgetPath*)this._cPtr, pos, type);
  }

  /**
      Sets the widget name for the widget found at position pos
      in the widget hierarchy defined by path.
      
      If you want to update just a single state flag, you need to do
      this manually, as this function updates all state flags.
      
      ## Setting a flag
      
      ```c
      gtk_widget_path_iter_set_state (path, pos, gtk_widget_path_iter_get_state (path, pos) | flag);
      ```
      
      ## Unsetting a flag
      
      ```c
      gtk_widget_path_iter_set_state (path, pos, gtk_widget_path_iter_get_state (path, pos) & ~flag);
      ```
  
      Params:
        pos = position to modify, -1 for the path head
        state = state flags
  */
  void iterSetState(int pos, gtk.types.StateFlags state)
  {
    gtk_widget_path_iter_set_state(cast(GtkWidgetPath*)this._cPtr, pos, state);
  }

  /**
      Returns the number of #GtkWidget #GTypes between the represented
      widget and its topmost container.
      Returns: the number of elements in the path
  */
  int length()
  {
    int _retval;
    _retval = gtk_widget_path_length(cast(const(GtkWidgetPath)*)this._cPtr);
    return _retval;
  }

  /**
      Prepends a widget type to the widget hierachy represented by path.
  
      Params:
        type = widget type to prepend
  */
  void prependType(gobject.types.GType type)
  {
    gtk_widget_path_prepend_type(cast(GtkWidgetPath*)this._cPtr, type);
  }

  /**
      Dumps the widget path into a string representation. It tries to match
      the CSS style as closely as possible (Note that there might be paths
      that cannot be represented in CSS).
      
      The main use of this code is for debugging purposes, so that you can
      [glib.global.print] the path or dump it in a gdb session.
      Returns: A new string describing path.
  */
  string toString_()
  {
    char* _cretval;
    _cretval = gtk_widget_path_to_string(cast(const(GtkWidgetPath)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
