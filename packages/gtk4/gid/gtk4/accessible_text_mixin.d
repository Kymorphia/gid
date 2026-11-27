/// Module for [AccessibleText] interface mixin
module gid.gtk4.accessible_text_mixin;

public import gid.core.basictypes;
public import gid.gtk4.accessible_text;
public import gid.gtk4.accessible_text_iface_proxy;
public import gid.core.utils;
public import gid.glib2.bytes;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.graphene1.point;
public import gid.graphene1.rect;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.types;

/**
    An interface for accessible objects containing formatted text.
    
    The [gid.gtk4.accessible_text.AccessibleText] interfaces is meant to be implemented by accessible
    objects that have text formatted with attributes, or non-trivial text contents.
    
    You should use the `enum@Gtk.AccessibleProperty.LABEL` or the
    `enum@Gtk.AccessibleProperty.DESCRIPTION` properties for accessible
    objects containing simple, unformatted text.
*/
template AccessibleTextT()
{

  /**
      Retrieves the text attributes inside the accessible object.
      
      Each attribute is composed by:
      
      - a range
      - a name
      - a value
      
      It is left to the implementation to determine the serialization format
      of the value to a string.
      
      GTK provides support for various text attribute names and values, but
      implementations of this interface are free to add their own attributes.
      
      If this function returns true, `n_ranges` will be set to a value
      greater than or equal to one, ranges will be set to a newly
      allocated array of [struct#Gtk.AccessibleTextRange].
  
      Params:
        offset = the offset, in characters
        ranges = the ranges of the attributes
            inside the accessible object
        attributeNames = the
            names of the attributes inside the accessible object
        attributeValues = the
            values of the attributes inside the accessible object
      Returns: true if the accessible object has at least an attribute,
          and false otherwise
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetAttributes`
      to chain up from an override.
      Overriding it from D is not supported (Out array parameter 'ranges' in callback with ownership 'Container' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncGetAttributes(uint offset, out gid.gtk4.types.AccessibleTextRange[] ranges, out string[] attributeNames, out string[] attributeValues)
  {
    auto _klass = cast(GtkAccessibleTextInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.accessible_text.AccessibleText._getGType);
    if (!_klass || !_klass.getAttributes)
      return typeof(return).init;

    bool _retval;
    size_t _nRanges;
    GtkAccessibleTextRange* _ranges;
    char** _attributeNames;
    char** _attributeValues;
    _retval = cast(bool)_klass.getAttributes(cast(GtkAccessibleText*)this._cPtr, offset, &_nRanges, &_ranges, &_attributeNames, &_attributeValues);
    ranges.length = _nRanges;
    ranges[0 .. $] = (cast(gid.gtk4.types.AccessibleTextRange*)_ranges)[0 .. _nRanges];
    gFree(cast(void*)_ranges);
    uint _lenattributeNames;
    if (_attributeNames)
    {
      for (; _attributeNames[_lenattributeNames] !is null; _lenattributeNames++)
      {
      }
    }

    attributeNames.length = _lenattributeNames;
    foreach (i; 0 .. _lenattributeNames)
      attributeNames[i] = _attributeNames[i].fromCString!(Yes.Free);
    gFree(cast(void*)_attributeNames);
    uint _lenattributeValues;
    if (_attributeValues)
    {
      for (; _attributeValues[_lenattributeValues] !is null; _lenattributeValues++)
      {
      }
    }

    attributeValues.length = _lenattributeValues;
    foreach (i; 0 .. _lenattributeValues)
      attributeValues[i] = _attributeValues[i].fromCString!(Yes.Free);
    gFree(cast(void*)_attributeValues);
    return _retval;
  }

  /**
      Retrieves the position of the caret inside the accessible object.
      Returns: the position of the caret, in characters
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetCaretPosition`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected uint vfuncGetCaretPosition()
  {
    auto _klass = cast(GtkAccessibleTextInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.accessible_text.AccessibleText._getGType);
    if (!_klass || !_klass.getCaretPosition)
      return typeof(return).init;

    uint _retval;
    _retval = _klass.getCaretPosition(cast(GtkAccessibleText*)this._cPtr);
    return _retval;
  }

  /**
      Retrieve the current contents of the accessible object within
      the given range.
      
      If end is `G_MAXUINT`, the end of the range is the full content
      of the accessible object.
  
      Params:
        start = the beginning of the range, in characters
        end = the end of the range, in characters
      Returns: the requested slice of the contents of the
          accessible object, as UTF-8. Note that the slice does not have to
          be NUL-terminated
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetContents`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.glib2.bytes.Bytes vfuncGetContents(uint start, uint end)
  {
    auto _klass = cast(GtkAccessibleTextInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.accessible_text.AccessibleText._getGType);
    if (!_klass || !_klass.getContents)
      return typeof(return).init;

    GBytes* _cretval;
    _cretval = _klass.getContents(cast(GtkAccessibleText*)this._cPtr, start, end);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieve the current contents of the accessible object starting
      from the given offset, and using the given granularity.
      
      The start and end values contain the boundaries of the text.
  
      Params:
        offset = the offset, in characters
        granularity = the granularity of the query
        start = the start of the range, in characters
        end = the end of the range, in characters
      Returns: the requested slice of the contents of the
          accessible object, as UTF-8. Note that the slice does not have to
          be NUL-terminated
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetContentsAt`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.glib2.bytes.Bytes vfuncGetContentsAt(uint offset, gid.gtk4.types.AccessibleTextGranularity granularity, out uint start, out uint end)
  {
    auto _klass = cast(GtkAccessibleTextInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.accessible_text.AccessibleText._getGType);
    if (!_klass || !_klass.getContentsAt)
      return typeof(return).init;

    GBytes* _cretval;
    _cretval = _klass.getContentsAt(cast(GtkAccessibleText*)this._cPtr, offset, granularity, cast(uint*)&start, cast(uint*)&end);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieves the default text attributes inside the accessible object.
      
      Each attribute is composed by:
      
      - a name
      - a value
      
      It is left to the implementation to determine the serialization format
      of the value to a string.
      
      GTK provides support for various text attribute names and values, but
      implementations of this interface are free to add their own attributes.
  
      Params:
        attributeNames = the
            names of the default attributes inside the accessible object
        attributeValues = the
            values of the default attributes inside the accessible object
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetDefaultAttributes`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncGetDefaultAttributes(out string[] attributeNames, out string[] attributeValues)
  {
    auto _klass = cast(GtkAccessibleTextInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.accessible_text.AccessibleText._getGType);
    if (!_klass || !_klass.getDefaultAttributes)
      return;

    char** _attributeNames;
    char** _attributeValues;
    _klass.getDefaultAttributes(cast(GtkAccessibleText*)this._cPtr, &_attributeNames, &_attributeValues);
    uint _lenattributeNames;
    if (_attributeNames)
    {
      for (; _attributeNames[_lenattributeNames] !is null; _lenattributeNames++)
      {
      }
    }

    attributeNames.length = _lenattributeNames;
    foreach (i; 0 .. _lenattributeNames)
      attributeNames[i] = _attributeNames[i].fromCString!(Yes.Free);
    gFree(cast(void*)_attributeNames);
    uint _lenattributeValues;
    if (_attributeValues)
    {
      for (; _attributeValues[_lenattributeValues] !is null; _lenattributeValues++)
      {
      }
    }

    attributeValues.length = _lenattributeValues;
    foreach (i; 0 .. _lenattributeValues)
      attributeValues[i] = _attributeValues[i].fromCString!(Yes.Free);
    gFree(cast(void*)_attributeValues);
  }

  /**
      Obtains the extents of a range of text, in widget coordinates.
  
      Params:
        start = the start offset, in characters
        end = the end offset, in characters,
          extents (out caller-allocates): return location for the extents
        extents =  (modified in place, changes are seen by the caller)
      Returns: true if the extents were filled in, false otherwise
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetExtents`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncGetExtents(uint start, uint end, gid.graphene1.rect.Rect extents)
  {
    auto _klass = cast(GtkAccessibleTextInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.accessible_text.AccessibleText._getGType);
    if (!_klass || !_klass.getExtents)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.getExtents(cast(GtkAccessibleText*)this._cPtr, start, end, extents ? cast(graphene_rect_t*)extents._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the text offset at a given point.
  
      Params:
        point = a point in widget coordinates of self
        offset = return location for the text offset at point
      Returns: true if the offset was set, false otherwise
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetOffset`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncGetOffset(gid.graphene1.point.Point point, out uint offset)
  {
    auto _klass = cast(GtkAccessibleTextInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.accessible_text.AccessibleText._getGType);
    if (!_klass || !_klass.getOffset)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.getOffset(cast(GtkAccessibleText*)this._cPtr, cast(const(graphene_point_t)*)&point, cast(uint*)&offset);
    return _retval;
  }

  /**
      Retrieves the selection ranges in the accessible object.
      
      If this function returns true, `n_ranges` will be set to a value
      greater than or equal to one, and ranges will be set to a newly
      allocated array of [struct#Gtk.AccessibleTextRange].
  
      Params:
        ranges = the selection ranges
      Returns: true if there is at least a selection inside the
          accessible object, and false otherwise
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetSelection`
      to chain up from an override.
      Overriding it from D is not supported (Out array parameter 'ranges' in callback with ownership 'Container' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncGetSelection(out gid.gtk4.types.AccessibleTextRange[] ranges)
  {
    auto _klass = cast(GtkAccessibleTextInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.accessible_text.AccessibleText._getGType);
    if (!_klass || !_klass.getSelection)
      return typeof(return).init;

    bool _retval;
    size_t _nRanges;
    GtkAccessibleTextRange* _ranges;
    _retval = cast(bool)_klass.getSelection(cast(GtkAccessibleText*)this._cPtr, &_nRanges, &_ranges);
    ranges.length = _nRanges;
    ranges[0 .. $] = (cast(gid.gtk4.types.AccessibleTextRange*)_ranges)[0 .. _nRanges];
    gFree(cast(void*)_ranges);
    return _retval;
  }

  /**
      Sets the caret position.
  
      Params:
        offset = the text offset in characters
      Returns: true if the caret position was updated
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetCaretPosition`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetCaretPosition(uint offset)
  {
    auto _klass = cast(GtkAccessibleTextInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.accessible_text.AccessibleText._getGType);
    if (!_klass || !_klass.setCaretPosition)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setCaretPosition(cast(GtkAccessibleText*)this._cPtr, offset);
    return _retval;
  }

  /**
      Sets the caret position.
  
      Params:
        i = the selection to set
        range = the range to set the selection to
      Returns: true if the selection was updated
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetSelection`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetSelection(size_t i, gid.gtk4.types.AccessibleTextRange range)
  {
    auto _klass = cast(GtkAccessibleTextInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.accessible_text.AccessibleText._getGType);
    if (!_klass || !_klass.setSelection)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setSelection(cast(GtkAccessibleText*)this._cPtr, i, cast(GtkAccessibleTextRange*)&range);
    return _retval;
  }

  /**
      Updates the position of the caret.
      
      Implementations of the [gid.gtk4.accessible_text.AccessibleText] interface should call this
      function every time the caret has moved, in order to notify assistive
      technologies.
  */
  override void updateCaretPosition() nothrow
  {
    gtk_accessible_text_update_caret_position(cast(GtkAccessibleText*)this._cPtr);
  }

  /**
      Notifies assistive technologies of a change in contents.
      
      Implementations of the [gid.gtk4.accessible_text.AccessibleText] interface should call this
      function every time their contents change as the result of an operation,
      like an insertion or a removal.
      
      Note: If the change is a deletion, this function must be called *before*
      removing the contents, if it is an insertion, it must be called *after*
      inserting the new contents.
  
      Params:
        change = the type of change in the contents
        start = the starting offset of the change, in characters
        end = the end offset of the change, in characters
  */
  override void updateContents(gid.gtk4.types.AccessibleTextContentChange change, uint start, uint end) nothrow
  {
    gtk_accessible_text_update_contents(cast(GtkAccessibleText*)this._cPtr, change, start, end);
  }

  /**
      Updates the boundary of the selection.
      
      Implementations of the [gid.gtk4.accessible_text.AccessibleText] interface should call this
      function every time the selection has moved, in order to notify assistive
      technologies.
  */
  override void updateSelectionBound() nothrow
  {
    gtk_accessible_text_update_selection_bound(cast(GtkAccessibleText*)this._cPtr);
  }

  /// True if the D class T overrides any vfunc method of gid.gtk4.accessible_text.AccessibleText (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk4_accessible_text_AccessibleText(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetAttributes", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCaretPosition", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetContents", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetContentsAt", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDefaultAttributes", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetExtents", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetOffset", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSelection", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetCaretPosition", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetSelection", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk4.accessible_text.AccessibleText vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk4_accessible_text_AccessibleText(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetAttributes", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gtk4.accessible_text.AccessibleText.vfuncGetAttributes is not supported: Out array parameter 'ranges' in callback with ownership 'Container' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCaretPosition", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_accessible_text_AccessibleText(iface, "get_caret_position");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetContents", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_accessible_text_AccessibleText(iface, "get_contents");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetContentsAt", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_accessible_text_AccessibleText(iface, "get_contents_at");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetDefaultAttributes", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_accessible_text_AccessibleText(iface, "get_default_attributes");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetExtents", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_accessible_text_AccessibleText(iface, "get_extents");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetOffset", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_accessible_text_AccessibleText(iface, "get_offset");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSelection", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gtk4.accessible_text.AccessibleText.vfuncGetSelection is not supported: Out array parameter 'ranges' in callback with ownership 'Container' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetCaretPosition", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_accessible_text_AccessibleText(iface, "set_caret_position");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetSelection", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_accessible_text_AccessibleText(iface, "set_selection");
  }

  private static void _installIfaceVfunc_gid_gtk4_accessible_text_AccessibleText(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkAccessibleTextInterface*)iface;

    switch (vfunc)
    {
      case "get_caret_position":
      {
        static extern(C) uint _vfuncGetCaretPositionTramp(GtkAccessibleText* self) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkAccessibleTextInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.accessible_text.AccessibleText._getGType);
            if (_klass && _klass.getCaretPosition)
              return (cast(typeof(&_vfuncGetCaretPositionTramp))_klass.getCaretPosition)(self);
            return typeof(return).init;
          }

          uint _retval;

          try
          {
            _retval = _obj.vfuncGetCaretPosition();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.accessible_text.AccessibleText.vfuncGetCaretPosition");
          }
          return _retval;
        }

        _klass.getCaretPosition = cast(typeof(_klass.getCaretPosition))&_vfuncGetCaretPositionTramp;
        break;
      }
      case "get_contents":
      {
        static extern(C) GBytes* _vfuncGetContentsTramp(GtkAccessibleText* self, uint start, uint end) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkAccessibleTextInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.accessible_text.AccessibleText._getGType);
            if (_klass && _klass.getContents)
              return (cast(typeof(&_vfuncGetContentsTramp))_klass.getContents)(self, start, end);
            return typeof(return).init;
          }

          gid.glib2.bytes.Bytes _dretval;

          try
          {
            _dretval = _obj.vfuncGetContents(start, end);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.accessible_text.AccessibleText.vfuncGetContents");
          }
          auto _retval = _dretval ? cast(GBytes*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getContents = cast(typeof(_klass.getContents))&_vfuncGetContentsTramp;
        break;
      }
      case "get_contents_at":
      {
        static extern(C) GBytes* _vfuncGetContentsAtTramp(GtkAccessibleText* self, uint offset, GtkAccessibleTextGranularity granularity, uint* start, uint* end) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkAccessibleTextInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.accessible_text.AccessibleText._getGType);
            if (_klass && _klass.getContentsAt)
              return (cast(typeof(&_vfuncGetContentsAtTramp))_klass.getContentsAt)(self, offset, granularity, start, end);
            return typeof(return).init;
          }

          gid.glib2.bytes.Bytes _dretval;

          try
          {
            _dretval = _obj.vfuncGetContentsAt(offset, granularity, *start, *end);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.accessible_text.AccessibleText.vfuncGetContentsAt");
          }
          auto _retval = _dretval ? cast(GBytes*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getContentsAt = cast(typeof(_klass.getContentsAt))&_vfuncGetContentsAtTramp;
        break;
      }
      case "get_default_attributes":
      {
        static extern(C) void _vfuncGetDefaultAttributesTramp(GtkAccessibleText* self, char*** attributeNames, char*** attributeValues) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkAccessibleTextInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.accessible_text.AccessibleText._getGType);
            if (_klass && _klass.getDefaultAttributes)
              return (cast(typeof(&_vfuncGetDefaultAttributesTramp))_klass.getDefaultAttributes)(self, attributeNames, attributeValues);
            return;
          }

          typeof(*attributeNames) _attributeNamesNull;
          if (!attributeNames)
            attributeNames = &_attributeNamesNull;

          typeof(*attributeValues) _attributeValuesNull;
          if (!attributeValues)
            attributeValues = &_attributeValuesNull;

          string[] _attributeNames;
          string[] _attributeValues;

          try
          {
            _obj.vfuncGetDefaultAttributes(_attributeNames, _attributeValues);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.accessible_text.AccessibleText.vfuncGetDefaultAttributes");
          }
          typeof(*attributeNames) _attributeNamesC;
          if (_attributeNames.length > 0)
          {
            _attributeNamesC = cast(typeof(_attributeNamesC))gMalloc((_attributeNames.length + 1) * (*_attributeNamesC).sizeof);

            foreach (i; 0 .. _attributeNames.length)
              _attributeNamesC[i] = toCString!(Yes.Malloc)(_attributeNames[i]);
          }

          *attributeNames = _attributeNamesC;
          typeof(*attributeValues) _attributeValuesC;
          if (_attributeValues.length > 0)
          {
            _attributeValuesC = cast(typeof(_attributeValuesC))gMalloc((_attributeValues.length + 1) * (*_attributeValuesC).sizeof);

            foreach (i; 0 .. _attributeValues.length)
              _attributeValuesC[i] = toCString!(Yes.Malloc)(_attributeValues[i]);
          }

          *attributeValues = _attributeValuesC;

        }

        _klass.getDefaultAttributes = cast(typeof(_klass.getDefaultAttributes))&_vfuncGetDefaultAttributesTramp;
        break;
      }
      case "get_extents":
      {
        static extern(C) gboolean _vfuncGetExtentsTramp(GtkAccessibleText* self, uint start, uint end, graphene_rect_t* extents) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkAccessibleTextInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.accessible_text.AccessibleText._getGType);
            if (_klass && _klass.getExtents)
              return (cast(typeof(&_vfuncGetExtentsTramp))_klass.getExtents)(self, start, end, extents);
            return typeof(return).init;
          }

          bool _dretval;
          auto _extents = extents ? new gid.graphene1.rect.Rect(cast(void*)extents, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncGetExtents(start, end, _extents);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.accessible_text.AccessibleText.vfuncGetExtents");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_extents)
            _extents._cUnborrow;

          return _retval;
        }

        _klass.getExtents = cast(typeof(_klass.getExtents))&_vfuncGetExtentsTramp;
        break;
      }
      case "get_offset":
      {
        static extern(C) gboolean _vfuncGetOffsetTramp(GtkAccessibleText* self, const(graphene_point_t)* point, uint* offset) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkAccessibleTextInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.accessible_text.AccessibleText._getGType);
            if (_klass && _klass.getOffset)
              return (cast(typeof(&_vfuncGetOffsetTramp))_klass.getOffset)(self, point, offset);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncGetOffset(*cast(gid.graphene1.point.Point*)point, *offset);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.accessible_text.AccessibleText.vfuncGetOffset");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.getOffset = cast(typeof(_klass.getOffset))&_vfuncGetOffsetTramp;
        break;
      }
      case "set_caret_position":
      {
        static extern(C) gboolean _vfuncSetCaretPositionTramp(GtkAccessibleText* self, uint offset) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkAccessibleTextInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.accessible_text.AccessibleText._getGType);
            if (_klass && _klass.setCaretPosition)
              return (cast(typeof(&_vfuncSetCaretPositionTramp))_klass.setCaretPosition)(self, offset);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSetCaretPosition(offset);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.accessible_text.AccessibleText.vfuncSetCaretPosition");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setCaretPosition = cast(typeof(_klass.setCaretPosition))&_vfuncSetCaretPositionTramp;
        break;
      }
      case "set_selection":
      {
        static extern(C) gboolean _vfuncSetSelectionTramp(GtkAccessibleText* self, size_t i, GtkAccessibleTextRange* range) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkAccessibleTextInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.accessible_text.AccessibleText._getGType);
            if (_klass && _klass.setSelection)
              return (cast(typeof(&_vfuncSetSelectionTramp))_klass.setSelection)(self, i, range);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSetSelection(i, *cast(gid.gtk4.types.AccessibleTextRange*)range);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.accessible_text.AccessibleText.vfuncSetSelection");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setSelection = cast(typeof(_klass.setSelection))&_vfuncSetSelectionTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.accessible_text.AccessibleText]
template AccessibleTextGidBuilderT()
{
}
