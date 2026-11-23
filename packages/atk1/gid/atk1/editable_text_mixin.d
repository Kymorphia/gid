/// Module for [EditableText] interface mixin
module gid.atk1.editable_text_mixin;

public import gid.core.basictypes;
public import gid.atk1.editable_text_iface_proxy;
public import gid.atk1.c.functions;
public import gid.atk1.c.types;
public import gid.atk1.types;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    The ATK interface implemented by components containing user-editable text content.
    
    #AtkEditableText should be implemented by UI components which
    contain text which the user can edit, via the #AtkObject
    corresponding to that component (see #AtkObject).
    
    #AtkEditableText is a subclass of #AtkText, and as such, an object
    which implements #AtkEditableText is by definition an #AtkText
    implementor as well.
    
    See `iface@AtkText`
*/
template EditableTextT()
{

  /**
      Copy text from start_pos up to, but not including end_pos
      to the clipboard.
  
      Params:
        startPos = start position
        endPos = end position
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCopyText`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncCopyText(int startPos, int endPos)
  {
    auto _klass = cast(AtkEditableTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.editable_text.EditableText._getGType);
    if (!_klass || !_klass.copyText)
      return;

    _klass.copyText(cast(AtkEditableText*)this._cPtr, startPos, endPos);
  }

  /**
      Copy text from start_pos up to, but not including end_pos
      to the clipboard and then delete from the widget.
  
      Params:
        startPos = start position
        endPos = end position
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCutText`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncCutText(int startPos, int endPos)
  {
    auto _klass = cast(AtkEditableTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.editable_text.EditableText._getGType);
    if (!_klass || !_klass.cutText)
      return;

    _klass.cutText(cast(AtkEditableText*)this._cPtr, startPos, endPos);
  }

  /**
      Delete text start_pos up to, but not including end_pos.
  
      Params:
        startPos = start position
        endPos = end position
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncDeleteText`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncDeleteText(int startPos, int endPos)
  {
    auto _klass = cast(AtkEditableTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.editable_text.EditableText._getGType);
    if (!_klass || !_klass.deleteText)
      return;

    _klass.deleteText(cast(AtkEditableText*)this._cPtr, startPos, endPos);
  }

  /**
      Paste text from clipboard to specified position.
  
      Params:
        position = position to paste
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncPasteText`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncPasteText(int position)
  {
    auto _klass = cast(AtkEditableTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.editable_text.EditableText._getGType);
    if (!_klass || !_klass.pasteText)
      return;

    _klass.pasteText(cast(AtkEditableText*)this._cPtr, position);
  }

  /**
      Set text contents of text.
  
      Params:
        string_ = string to set for text contents of text
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetTextContents`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetTextContents(string string_)
  {
    auto _klass = cast(AtkEditableTextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.editable_text.EditableText._getGType);
    if (!_klass || !_klass.setTextContents)
      return;

    const(char)* _string_ = string_.toCString!(No.Malloc, No.Nullable);
    _klass.setTextContents(cast(AtkEditableText*)this._cPtr, _string_);
  }

  /**
      Copy text from start_pos up to, but not including end_pos
      to the clipboard.
  
      Params:
        startPos = start position
        endPos = end position
  */
  override void copyText(int startPos, int endPos) nothrow
  {
    atk_editable_text_copy_text(cast(AtkEditableText*)this._cPtr, startPos, endPos);
  }

  /**
      Copy text from start_pos up to, but not including end_pos
      to the clipboard and then delete from the widget.
  
      Params:
        startPos = start position
        endPos = end position
  */
  override void cutText(int startPos, int endPos) nothrow
  {
    atk_editable_text_cut_text(cast(AtkEditableText*)this._cPtr, startPos, endPos);
  }

  /**
      Delete text start_pos up to, but not including end_pos.
  
      Params:
        startPos = start position
        endPos = end position
  */
  override void deleteText(int startPos, int endPos) nothrow
  {
    atk_editable_text_delete_text(cast(AtkEditableText*)this._cPtr, startPos, endPos);
  }

  /**
      Insert text at a given position.
  
      Params:
        string_ = the text to insert
        position = The caller initializes this to
          the position at which to insert the text. After the call it
          points at the position after the newly inserted text.
  */
  override void insertText(string string_, ref int position) nothrow
  {
    int _length;
    if (string_)
      _length = cast(int)string_.length;

    auto _string_ = cast(char*)string_.ptr;
    atk_editable_text_insert_text(cast(AtkEditableText*)this._cPtr, _string_, _length, cast(int*)&position);
  }

  /**
      Paste text from clipboard to specified position.
  
      Params:
        position = position to paste
  */
  override void pasteText(int position) nothrow
  {
    atk_editable_text_paste_text(cast(AtkEditableText*)this._cPtr, position);
  }

  /**
      Set text contents of text.
  
      Params:
        string_ = string to set for text contents of text
  */
  override void setTextContents(string string_) nothrow
  {
    const(char)* _string_ = string_.toCString!(No.Malloc, No.Nullable);
    atk_editable_text_set_text_contents(cast(AtkEditableText*)this._cPtr, _string_);
  }

  /// True if the D class T overrides any vfunc method of gid.atk1.editable_text.EditableText (DiG)
  enum bool _ifaceVfuncsOverridden_gid_atk1_editable_text_EditableText(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCopyText", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCutText", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDeleteText", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPasteText", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetTextContents", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.atk1.editable_text.EditableText vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_atk1_editable_text_EditableText(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCopyText", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_editable_text_EditableText(iface, "copy_text");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCutText", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_editable_text_EditableText(iface, "cut_text");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDeleteText", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_editable_text_EditableText(iface, "delete_text");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPasteText", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_editable_text_EditableText(iface, "paste_text");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetTextContents", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_editable_text_EditableText(iface, "set_text_contents");
  }

  private static void _installIfaceVfunc_gid_atk1_editable_text_EditableText(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(AtkEditableTextIface*)iface;

    switch (vfunc)
    {
      case "copy_text":
      {
        static extern(C) void _vfuncCopyTextTramp(AtkEditableText* text, int startPos, int endPos) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkEditableTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.editable_text.EditableText._getGType);
            if (_klass && _klass.copyText)
              return (cast(typeof(&_vfuncCopyTextTramp))_klass.copyText)(text, startPos, endPos);
            return;
          }

          try
          {
            _obj.vfuncCopyText(startPos, endPos);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.editable_text.EditableText.vfuncCopyText");
          }
        }

        _klass.copyText = cast(typeof(_klass.copyText))&_vfuncCopyTextTramp;
        break;
      }
      case "cut_text":
      {
        static extern(C) void _vfuncCutTextTramp(AtkEditableText* text, int startPos, int endPos) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkEditableTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.editable_text.EditableText._getGType);
            if (_klass && _klass.cutText)
              return (cast(typeof(&_vfuncCutTextTramp))_klass.cutText)(text, startPos, endPos);
            return;
          }

          try
          {
            _obj.vfuncCutText(startPos, endPos);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.editable_text.EditableText.vfuncCutText");
          }
        }

        _klass.cutText = cast(typeof(_klass.cutText))&_vfuncCutTextTramp;
        break;
      }
      case "delete_text":
      {
        static extern(C) void _vfuncDeleteTextTramp(AtkEditableText* text, int startPos, int endPos) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkEditableTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.editable_text.EditableText._getGType);
            if (_klass && _klass.deleteText)
              return (cast(typeof(&_vfuncDeleteTextTramp))_klass.deleteText)(text, startPos, endPos);
            return;
          }

          try
          {
            _obj.vfuncDeleteText(startPos, endPos);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.editable_text.EditableText.vfuncDeleteText");
          }
        }

        _klass.deleteText = cast(typeof(_klass.deleteText))&_vfuncDeleteTextTramp;
        break;
      }
      case "paste_text":
      {
        static extern(C) void _vfuncPasteTextTramp(AtkEditableText* text, int position) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkEditableTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.editable_text.EditableText._getGType);
            if (_klass && _klass.pasteText)
              return (cast(typeof(&_vfuncPasteTextTramp))_klass.pasteText)(text, position);
            return;
          }

          try
          {
            _obj.vfuncPasteText(position);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.editable_text.EditableText.vfuncPasteText");
          }
        }

        _klass.pasteText = cast(typeof(_klass.pasteText))&_vfuncPasteTextTramp;
        break;
      }
      case "set_text_contents":
      {
        static extern(C) void _vfuncSetTextContentsTramp(AtkEditableText* text, const(char)* string_) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)text);
          if (!_obj)
          {
            auto _klass = cast(AtkEditableTextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)text), gid.atk1.editable_text.EditableText._getGType);
            if (_klass && _klass.setTextContents)
              return (cast(typeof(&_vfuncSetTextContentsTramp))_klass.setTextContents)(text, string_);
            return;
          }

          string _string_ = string_.fromCString!(No.Free);

          try
          {
            _obj.vfuncSetTextContents(_string_);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.editable_text.EditableText.vfuncSetTextContents");
          }
        }

        _klass.setTextContents = cast(typeof(_klass.setTextContents))&_vfuncSetTextContentsTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.atk1.editable_text.EditableText]
template EditableTextGidBuilderT()
{
}
