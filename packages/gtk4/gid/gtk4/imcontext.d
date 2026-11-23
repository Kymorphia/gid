/// Module for [IMContext] class
module gid.gtk4.imcontext;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.device;
import gid.gdk4.event;
import gid.gdk4.rectangle;
import gid.gdk4.surface;
import gid.gdk4.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;
import gid.gtk4.widget;
import gid.pango1.attr_list;

/**
    The interface for GTK input methods.
    
    [gid.gtk4.imcontext.IMContext] is used by GTK text input widgets like [gid.gtk4.text.Text]
    to map from key events to Unicode character strings.
    
    An input method may consume multiple key events in sequence before finally
    outputting the composed result. This is called *preediting*, and an input
    method may provide feedback about this process by displaying the intermediate
    composition states as preedit text. To do so, the [gid.gtk4.imcontext.IMContext] will emit
    [gid.gtk4.imcontext.IMContext.preeditStart], [gid.gtk4.imcontext.IMContext.preeditChanged]
    and [gid.gtk4.imcontext.IMContext.preeditEnd] signals.
    
    For instance, the built-in GTK input method [gid.gtk4.imcontext_simple.IMContextSimple]
    implements the input of arbitrary Unicode code points by holding down the
    <kbd>Control</kbd> and <kbd>Shift</kbd> keys and then typing <kbd>u</kbd>
    followed by the hexadecimal digits of the code point. When releasing the
    <kbd>Control</kbd> and <kbd>Shift</kbd> keys, preediting ends and the
    character is inserted as text. For example,
    
        Ctrl+Shift+u 2 0 A C
    
    results in the € sign.
    
    Additional input methods can be made available for use by GTK widgets as
    loadable modules. An input method module is a small shared library which
    provides a [gid.gio2.ioextension.IOExtension] for the extension point named "gtk-im-module".
    
    To connect a widget to the users preferred input method, you should use
    [gid.gtk4.immulticontext.IMMulticontext].
*/
class IMContext : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_im_context_get_type != &gidSymbolNotFound ? gtk_im_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkIMContext";
  }

  /** Returns `this`, for use in `with` statements. */
  override IMContext self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.imcontext.IMContext]
      Returns: New builder object
  */
  static IMContextGidBuilder builder() nothrow
  {
    return new IMContextGidBuilder;
  }

  /**
      Get `inputHints` property.
      Returns: Additional hints that allow input methods to fine-tune
        their behaviour.
  */
  @property gid.gtk4.types.InputHints inputHints() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk4.types.InputHints)("input-hints");
  }

  /**
      Set `inputHints` property.
      Params:
        propval = Additional hints that allow input methods to fine-tune
          their behaviour.
  */
  @property void inputHints(gid.gtk4.types.InputHints propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk4.types.InputHints)("input-hints", propval);
  }

  /**
      Get `inputPurpose` property.
      Returns: The purpose of the text field that the `GtkIMContext is connected to.
        
        This property can be used by on-screen keyboards and other input
        methods to adjust their behaviour.
  */
  @property gid.gtk4.types.InputPurpose inputPurpose() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk4.types.InputPurpose)("input-purpose");
  }

  /**
      Set `inputPurpose` property.
      Params:
        propval = The purpose of the text field that the `GtkIMContext is connected to.
          
          This property can be used by on-screen keyboards and other input
          methods to adjust their behaviour.
  */
  @property void inputPurpose(gid.gtk4.types.InputPurpose propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk4.types.InputPurpose)("input-purpose", propval);
  }

  /** */
  protected void vfuncActivateOsk()
  {
    auto _klass = cast(GtkIMContextClass*)_vfuncClass;
    if (!_klass.activateOsk)
      return;

    _klass.activateOsk(cast(GtkIMContext*)this._cPtr);
  }

  /** */
  protected bool vfuncActivateOskWithEvent(gid.gdk4.event.Event event)
  {
    auto _klass = cast(GtkIMContextClass*)_vfuncClass;
    if (!_klass.activateOskWithEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.activateOskWithEvent(cast(GtkIMContext*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Default handler of the [gid.gtk4.imcontext.IMContext.commit] signal.
  
      Params:
        str = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCommit` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncCommit(string str)
  {
    auto _klass = cast(GtkIMContextClass*)_vfuncClass;
    if (!_klass.commit)
      return;

    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    _klass.commit(cast(GtkIMContext*)this._cPtr, _str);
  }

  /**
      Asks the widget that the input context is attached to delete
      characters around the cursor position by emitting the
      `::delete_surrounding` signal.
      
      Note that offset and n_chars are in characters not in bytes
      which differs from the usage other places in [gid.gtk4.imcontext.IMContext].
      
      In order to use this function, you should first call
      [gid.gtk4.imcontext.IMContext.getSurrounding] to get the current context,
      and call this function immediately afterwards to make sure that you
      know what you are deleting. You should also account for the fact
      that even if the signal was handled, the input context might not
      have deleted all the characters that were requested to be deleted.
      
      This function is used by an input method that wants to make
      substitutions in the existing text in response to new input.
      It is not useful for applications.
  
      Params:
        offset = offset from cursor position in chars;
             a negative value means start before the cursor.
        nChars = number of characters to delete.
      Returns: true if the signal was handled.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDeleteSurrounding` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncDeleteSurrounding(int offset, int nChars)
  {
    auto _klass = cast(GtkIMContextClass*)_vfuncClass;
    if (!_klass.deleteSurrounding)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.deleteSurrounding(cast(GtkIMContext*)this._cPtr, offset, nChars);
    return _retval;
  }

  /**
      Allow an input method to internally handle key press and release
      events.
      
      If this function returns true, then no further processing
      should be done for this key event.
  
      Params:
        event = the key event
      Returns: true if the input method handled the key event.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFilterKeypress` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncFilterKeypress(gid.gdk4.event.Event event)
  {
    auto _klass = cast(GtkIMContextClass*)_vfuncClass;
    if (!_klass.filterKeypress)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.filterKeypress(cast(GtkIMContext*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Notify the input method that the widget to which this
      input context corresponds has gained focus.
      
      The input method may, for example, change the displayed
      feedback to reflect this change.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFocusIn` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncFocusIn()
  {
    auto _klass = cast(GtkIMContextClass*)_vfuncClass;
    if (!_klass.focusIn)
      return;

    _klass.focusIn(cast(GtkIMContext*)this._cPtr);
  }

  /**
      Notify the input method that the widget to which this
      input context corresponds has lost focus.
      
      The input method may, for example, change the displayed
      feedback or reset the contexts state to reflect this change.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFocusOut` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncFocusOut()
  {
    auto _klass = cast(GtkIMContextClass*)_vfuncClass;
    if (!_klass.focusOut)
      return;

    _klass.focusOut(cast(GtkIMContext*)this._cPtr);
  }

  /**
      Retrieve the current preedit string for the input context,
      and a list of attributes to apply to the string.
      
      This string should be displayed inserted at the insertion point.
  
      Params:
        str = location to store the retrieved
            string. The string retrieved must be freed with [gid.glib2.global.gfree].
        attrs = location to store the retrieved
            attribute list. When you are done with this list, you
            must unreference it with [gid.pango1.attr_list.AttrList.unref].
        cursorPos = location to store position of cursor
            (in characters) within the preedit string.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetPreeditString` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGetPreeditString(out string str, out gid.pango1.attr_list.AttrList attrs, out int cursorPos)
  {
    auto _klass = cast(GtkIMContextClass*)_vfuncClass;
    if (!_klass.getPreeditString)
      return;

    char* _str;
    PangoAttrList* _attrs;
    _klass.getPreeditString(cast(GtkIMContext*)this._cPtr, &_str, &_attrs, cast(int*)&cursorPos);
    str = _str.fromCString!(Yes.Free);
    if (_attrs)
      attrs = new gid.pango1.attr_list.AttrList(cast(void*)_attrs, Yes.Take);
  }

  /**
      Retrieves context around the insertion point.
      
      Input methods typically want context in order to constrain input text
      based on existing text; this is important for languages such as Thai
      where only some sequences of characters are allowed.
      
      This function is implemented by emitting the
      [gid.gtk4.imcontext.IMContext.retrieveSurrounding] signal on the input method;
      in response to this signal, a widget should provide as much context as
      is available, up to an entire paragraph, by calling
      [gid.gtk4.imcontext.IMContext.setSurrounding].
      
      Note that there is no obligation for a widget to respond to the
      `::retrieve-surrounding` signal, so input methods must be prepared to
      function without context.
  
      Params:
        text = location to store a UTF-8 encoded
            string of text holding context around the insertion point.
            If the function returns true, then you must free the result
            stored in this location with [gid.glib2.global.gfree].
        cursorIndex = location to store byte index of the insertion
            cursor within text.
      Returns: `TRUE` if surrounding text was provided; in this case
           you must free the result stored in `text`.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetSurrounding` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use [gid.gtk4.imcontext.IMContext.getSurroundingWithSelection] instead.
  */
  protected bool vfuncGetSurrounding(out string text, out int cursorIndex)
  {
    auto _klass = cast(GtkIMContextClass*)_vfuncClass;
    if (!_klass.getSurrounding)
      return typeof(return).init;

    bool _retval;
    char* _text;
    _retval = cast(bool)_klass.getSurrounding(cast(GtkIMContext*)this._cPtr, &_text, cast(int*)&cursorIndex);
    text = _text.fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Retrieves context around the insertion point.
      
      Input methods typically want context in order to constrain input
      text based on existing text; this is important for languages such
      as Thai where only some sequences of characters are allowed.
      
      This function is implemented by emitting the
      [gid.gtk4.imcontext.IMContext.retrieveSurrounding] signal on the input method;
      in response to this signal, a widget should provide as much context as
      is available, up to an entire paragraph, by calling
      [gid.gtk4.imcontext.IMContext.setSurroundingWithSelection].
      
      Note that there is no obligation for a widget to respond to the
      `::retrieve-surrounding` signal, so input methods must be prepared to
      function without context.
  
      Params:
        text = location to store a UTF-8 encoded
            string of text holding context around the insertion point.
            If the function returns true, then you must free the result
            stored in this location with [gid.glib2.global.gfree].
        cursorIndex = location to store byte index of the insertion
            cursor within text.
        anchorIndex = location to store byte index of the selection
            bound within text
      Returns: `TRUE` if surrounding text was provided; in this case
          you must free the result stored in `text`.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetSurroundingWithSelection` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncGetSurroundingWithSelection(out string text, out int cursorIndex, out int anchorIndex)
  {
    auto _klass = cast(GtkIMContextClass*)_vfuncClass;
    if (!_klass.getSurroundingWithSelection)
      return typeof(return).init;

    bool _retval;
    char* _text;
    _retval = cast(bool)_klass.getSurroundingWithSelection(cast(GtkIMContext*)this._cPtr, &_text, cast(int*)&cursorIndex, cast(int*)&anchorIndex);
    text = _text.fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Default handler of the
        [gid.gtk4.imcontext.IMContext.invalidComposition] signal. Since: 4.22
  
      Params:
        str = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncInvalidComposition` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncInvalidComposition(string str)
  {
    auto _klass = cast(GtkIMContextClass*)_vfuncClass;
    if (!_klass.invalidComposition)
      return typeof(return).init;

    bool _retval;
    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)_klass.invalidComposition(cast(GtkIMContext*)this._cPtr, _str);
    return _retval;
  }

  /**
      Default handler of the [gid.gtk4.imcontext.IMContext.preeditChanged]
        signal.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPreeditChanged` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncPreeditChanged()
  {
    auto _klass = cast(GtkIMContextClass*)_vfuncClass;
    if (!_klass.preeditChanged)
      return;

    _klass.preeditChanged(cast(GtkIMContext*)this._cPtr);
  }

  /**
      Default handler of the [gid.gtk4.imcontext.IMContext.preeditEnd] signal.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPreeditEnd` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncPreeditEnd()
  {
    auto _klass = cast(GtkIMContextClass*)_vfuncClass;
    if (!_klass.preeditEnd)
      return;

    _klass.preeditEnd(cast(GtkIMContext*)this._cPtr);
  }

  /**
      Default handler of the [gid.gtk4.imcontext.IMContext.preeditStart] signal.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPreeditStart` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncPreeditStart()
  {
    auto _klass = cast(GtkIMContextClass*)_vfuncClass;
    if (!_klass.preeditStart)
      return;

    _klass.preeditStart(cast(GtkIMContext*)this._cPtr);
  }

  /**
      Notify the input method that a change such as a change in cursor
      position has been made.
      
      This will typically cause the input method to clear the preedit state.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncReset` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncReset()
  {
    auto _klass = cast(GtkIMContextClass*)_vfuncClass;
    if (!_klass.reset)
      return;

    _klass.reset(cast(GtkIMContext*)this._cPtr);
  }

  /**
      Default handler of the
        [gid.gtk4.imcontext.IMContext.retrieveSurrounding] signal.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRetrieveSurrounding` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncRetrieveSurrounding()
  {
    auto _klass = cast(GtkIMContextClass*)_vfuncClass;
    if (!_klass.retrieveSurrounding)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.retrieveSurrounding(cast(GtkIMContext*)this._cPtr);
    return _retval;
  }

  /**
      Set the client widget for the input context.
      
      This is the [gid.gtk4.widget.Widget] holding the input focus. This widget is
      used in order to correctly position status windows, and may
      also be used for purposes internal to the input method.
  
      Params:
        widget = the client widget. This may be null to indicate
            that the previous client widget no longer exists.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetClientWidget` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSetClientWidget(gid.gtk4.widget.Widget widget = null)
  {
    auto _klass = cast(GtkIMContextClass*)_vfuncClass;
    if (!_klass.setClientWidget)
      return;

    _klass.setClientWidget(cast(GtkIMContext*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Notify the input method that a change in cursor
      position has been made.
      
      The location is relative to the client widget.
  
      Params:
        area = new location
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetCursorLocation` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSetCursorLocation(gid.gdk4.rectangle.Rectangle area)
  {
    auto _klass = cast(GtkIMContextClass*)_vfuncClass;
    if (!_klass.setCursorLocation)
      return;

    _klass.setCursorLocation(cast(GtkIMContext*)this._cPtr, cast(GdkRectangle*)&area);
  }

  /**
      Sets surrounding context around the insertion point and preedit
      string.
      
      This function is expected to be called in response to the
      [gid.gtk4.imcontext.IMContext.retrieveSurrounding] signal, and will
      likely have no effect if called at other times.
  
      Params:
        text = text surrounding the insertion point, as UTF-8.
            the preedit string should not be included within text
        len = the length of text, or -1 if text is nul-terminated
        cursorIndex = the byte index of the insertion cursor within text.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetSurrounding` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use [gid.gtk4.imcontext.IMContext.setSurroundingWithSelection] instead
  */
  protected void vfuncSetSurrounding(string text, int len, int cursorIndex)
  {
    auto _klass = cast(GtkIMContextClass*)_vfuncClass;
    if (!_klass.setSurrounding)
      return;

    const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
    _klass.setSurrounding(cast(GtkIMContext*)this._cPtr, _text, len, cursorIndex);
  }

  /**
      Sets surrounding context around the insertion point and preedit
      string. This function is expected to be called in response to the
      `signalGtk.IMContext::retrieve_surrounding` signal, and will likely
      have no effect if called at other times.
  
      Params:
        text = text surrounding the insertion point, as UTF-8.
            the preedit string should not be included within text
        len = the length of text, or -1 if text is nul-terminated
        cursorIndex = the byte index of the insertion cursor within text
        anchorIndex = the byte index of the selection bound within text
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetSurroundingWithSelection` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSetSurroundingWithSelection(string text, int len, int cursorIndex, int anchorIndex)
  {
    auto _klass = cast(GtkIMContextClass*)_vfuncClass;
    if (!_klass.setSurroundingWithSelection)
      return;

    const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
    _klass.setSurroundingWithSelection(cast(GtkIMContext*)this._cPtr, _text, len, cursorIndex, anchorIndex);
  }

  /**
      Sets whether the IM context should use the preedit string
      to display feedback.
      
      If use_preedit is false (default is true), then the IM context
      may use some other method to display feedback, such as displaying
      it in a child of the root window.
  
      Params:
        usePreedit = whether the IM context should use the preedit string.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetUsePreedit` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSetUsePreedit(bool usePreedit)
  {
    auto _klass = cast(GtkIMContextClass*)_vfuncClass;
    if (!_klass.setUsePreedit)
      return;

    _klass.setUsePreedit(cast(GtkIMContext*)this._cPtr, usePreedit);
  }

  /**
      Requests the platform to show an on-screen keyboard for user input.
      
      This method will return true if this request was actually performed
      to the platform, other environmental factors may result in an on-screen
      keyboard effectively not showing up.
  
      Params:
        event = a [gid.gdk4.event.Event]
      Returns: true if an on-screen keyboard could be requested to the platform.
  */
  bool activateOsk(gid.gdk4.event.Event event = null) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_im_context_activate_osk(cast(GtkIMContext*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Asks the widget that the input context is attached to delete
      characters around the cursor position by emitting the
      `::delete_surrounding` signal.
      
      Note that offset and n_chars are in characters not in bytes
      which differs from the usage other places in [gid.gtk4.imcontext.IMContext].
      
      In order to use this function, you should first call
      [gid.gtk4.imcontext.IMContext.getSurrounding] to get the current context,
      and call this function immediately afterwards to make sure that you
      know what you are deleting. You should also account for the fact
      that even if the signal was handled, the input context might not
      have deleted all the characters that were requested to be deleted.
      
      This function is used by an input method that wants to make
      substitutions in the existing text in response to new input.
      It is not useful for applications.
  
      Params:
        offset = offset from cursor position in chars;
             a negative value means start before the cursor.
        nChars = number of characters to delete.
      Returns: true if the signal was handled.
  */
  bool deleteSurrounding(int offset, int nChars) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_im_context_delete_surrounding(cast(GtkIMContext*)this._cPtr, offset, nChars);
    return _retval;
  }

  /**
      Allow an input method to forward key press and release events
      to another input method without necessarily having a [gid.gdk4.event.Event]
      available.
  
      Params:
        press = whether to forward a key press or release event
        surface = the surface the event is for
        device = the device that the event is for
        time = the timestamp for the event
        keycode = the keycode for the event
        state = modifier state for the event
        group = the active keyboard group for the event
      Returns: true if the input method handled the key event.
  */
  bool filterKey(bool press, gid.gdk4.surface.Surface surface, gid.gdk4.device.Device device, uint time, uint keycode, gid.gdk4.types.ModifierType state, int group) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_im_context_filter_key(cast(GtkIMContext*)this._cPtr, press, surface ? cast(GdkSurface*)surface._cPtr(No.Dup) : null, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null, time, keycode, state, group);
    return _retval;
  }

  /**
      Allow an input method to internally handle key press and release
      events.
      
      If this function returns true, then no further processing
      should be done for this key event.
  
      Params:
        event = the key event
      Returns: true if the input method handled the key event.
  */
  bool filterKeypress(gid.gdk4.event.Event event) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_im_context_filter_keypress(cast(GtkIMContext*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Notify the input method that the widget to which this
      input context corresponds has gained focus.
      
      The input method may, for example, change the displayed
      feedback to reflect this change.
  */
  void focusIn() nothrow
  {
    gtk_im_context_focus_in(cast(GtkIMContext*)this._cPtr);
  }

  /**
      Notify the input method that the widget to which this
      input context corresponds has lost focus.
      
      The input method may, for example, change the displayed
      feedback or reset the contexts state to reflect this change.
  */
  void focusOut() nothrow
  {
    gtk_im_context_focus_out(cast(GtkIMContext*)this._cPtr);
  }

  /**
      Retrieve the current preedit string for the input context,
      and a list of attributes to apply to the string.
      
      This string should be displayed inserted at the insertion point.
  
      Params:
        str = location to store the retrieved
            string. The string retrieved must be freed with [gid.glib2.global.gfree].
        attrs = location to store the retrieved
            attribute list. When you are done with this list, you
            must unreference it with [gid.pango1.attr_list.AttrList.unref].
        cursorPos = location to store position of cursor
            (in characters) within the preedit string.
  */
  void getPreeditString(out string str, out gid.pango1.attr_list.AttrList attrs, out int cursorPos) nothrow
  {
    char* _str;
    PangoAttrList* _attrs;
    gtk_im_context_get_preedit_string(cast(GtkIMContext*)this._cPtr, &_str, &_attrs, cast(int*)&cursorPos);
    str = _str.fromCString!(Yes.Free);
    if (_attrs)
      attrs = new gid.pango1.attr_list.AttrList(cast(void*)_attrs, Yes.Take);
  }

  /**
      Retrieves context around the insertion point.
      
      Input methods typically want context in order to constrain input text
      based on existing text; this is important for languages such as Thai
      where only some sequences of characters are allowed.
      
      This function is implemented by emitting the
      [gid.gtk4.imcontext.IMContext.retrieveSurrounding] signal on the input method;
      in response to this signal, a widget should provide as much context as
      is available, up to an entire paragraph, by calling
      [gid.gtk4.imcontext.IMContext.setSurrounding].
      
      Note that there is no obligation for a widget to respond to the
      `::retrieve-surrounding` signal, so input methods must be prepared to
      function without context.
  
      Params:
        text = location to store a UTF-8 encoded
            string of text holding context around the insertion point.
            If the function returns true, then you must free the result
            stored in this location with [gid.glib2.global.gfree].
        cursorIndex = location to store byte index of the insertion
            cursor within text.
      Returns: `TRUE` if surrounding text was provided; in this case
           you must free the result stored in `text`.
  
      Deprecated: Use [gid.gtk4.imcontext.IMContext.getSurroundingWithSelection] instead.
  */
  bool getSurrounding(out string text, out int cursorIndex) nothrow
  {
    bool _retval;
    char* _text;
    _retval = cast(bool)gtk_im_context_get_surrounding(cast(GtkIMContext*)this._cPtr, &_text, cast(int*)&cursorIndex);
    text = _text.fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Retrieves context around the insertion point.
      
      Input methods typically want context in order to constrain input
      text based on existing text; this is important for languages such
      as Thai where only some sequences of characters are allowed.
      
      This function is implemented by emitting the
      [gid.gtk4.imcontext.IMContext.retrieveSurrounding] signal on the input method;
      in response to this signal, a widget should provide as much context as
      is available, up to an entire paragraph, by calling
      [gid.gtk4.imcontext.IMContext.setSurroundingWithSelection].
      
      Note that there is no obligation for a widget to respond to the
      `::retrieve-surrounding` signal, so input methods must be prepared to
      function without context.
  
      Params:
        text = location to store a UTF-8 encoded
            string of text holding context around the insertion point.
            If the function returns true, then you must free the result
            stored in this location with [gid.glib2.global.gfree].
        cursorIndex = location to store byte index of the insertion
            cursor within text.
        anchorIndex = location to store byte index of the selection
            bound within text
      Returns: `TRUE` if surrounding text was provided; in this case
          you must free the result stored in `text`.
  */
  bool getSurroundingWithSelection(out string text, out int cursorIndex, out int anchorIndex) nothrow
  {
    bool _retval;
    char* _text;
    _retval = cast(bool)gtk_im_context_get_surrounding_with_selection(cast(GtkIMContext*)this._cPtr, &_text, cast(int*)&cursorIndex, cast(int*)&anchorIndex);
    text = _text.fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Notify the input method that a change such as a change in cursor
      position has been made.
      
      This will typically cause the input method to clear the preedit state.
  */
  void reset() nothrow
  {
    gtk_im_context_reset(cast(GtkIMContext*)this._cPtr);
  }

  /**
      Set the client widget for the input context.
      
      This is the [gid.gtk4.widget.Widget] holding the input focus. This widget is
      used in order to correctly position status windows, and may
      also be used for purposes internal to the input method.
  
      Params:
        widget = the client widget. This may be null to indicate
            that the previous client widget no longer exists.
  */
  void setClientWidget(gid.gtk4.widget.Widget widget = null) nothrow
  {
    gtk_im_context_set_client_widget(cast(GtkIMContext*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Notify the input method that a change in cursor
      position has been made.
      
      The location is relative to the client widget.
  
      Params:
        area = new location
  */
  void setCursorLocation(gid.gdk4.rectangle.Rectangle area) nothrow
  {
    gtk_im_context_set_cursor_location(cast(GtkIMContext*)this._cPtr, cast(const(GdkRectangle)*)&area);
  }

  /**
      Sets surrounding context around the insertion point and preedit
      string.
      
      This function is expected to be called in response to the
      [gid.gtk4.imcontext.IMContext.retrieveSurrounding] signal, and will
      likely have no effect if called at other times.
  
      Params:
        text = text surrounding the insertion point, as UTF-8.
            the preedit string should not be included within text
        cursorIndex = the byte index of the insertion cursor within text.
  
      Deprecated: Use [gid.gtk4.imcontext.IMContext.setSurroundingWithSelection] instead
  */
  void setSurrounding(string text, int cursorIndex) nothrow
  {
    int _len;
    if (text)
      _len = cast(int)text.length;

    auto _text = cast(char*)text.ptr;
    gtk_im_context_set_surrounding(cast(GtkIMContext*)this._cPtr, _text, _len, cursorIndex);
  }

  /**
      Sets surrounding context around the insertion point and preedit
      string. This function is expected to be called in response to the
      `signalGtk.IMContext::retrieve_surrounding` signal, and will likely
      have no effect if called at other times.
  
      Params:
        text = text surrounding the insertion point, as UTF-8.
            the preedit string should not be included within text
        cursorIndex = the byte index of the insertion cursor within text
        anchorIndex = the byte index of the selection bound within text
  */
  void setSurroundingWithSelection(string text, int cursorIndex, int anchorIndex) nothrow
  {
    int _len;
    if (text)
      _len = cast(int)text.length;

    auto _text = cast(char*)text.ptr;
    gtk_im_context_set_surrounding_with_selection(cast(GtkIMContext*)this._cPtr, _text, _len, cursorIndex, anchorIndex);
  }

  /**
      Sets whether the IM context should use the preedit string
      to display feedback.
      
      If use_preedit is false (default is true), then the IM context
      may use some other method to display feedback, such as displaying
      it in a child of the root window.
  
      Params:
        usePreedit = whether the IM context should use the preedit string.
  */
  void setUsePreedit(bool usePreedit) nothrow
  {
    gtk_im_context_set_use_preedit(cast(GtkIMContext*)this._cPtr, usePreedit);
  }

  /**
      Connect to `Commit` signal.
  
      The ::commit signal is emitted when a complete input sequence
        has been entered by the user.
        
        If the commit comes after a preediting sequence, the
        ::commit signal is emitted after ::preedit-end.
        
        This can be a single character immediately after a key press or
        the final result of preediting.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string str, gid.gtk4.imcontext.IMContext iMContext)`
  
          `str` the completed character(s) entered by the user (optional)
  
          `iMContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCommit(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.imcontext.IMContext)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.commit");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("commit", closure, after);
  }

  /**
      Connect to `DeleteSurrounding` signal.
  
      The ::delete-surrounding signal is emitted when the input method
        needs to delete all or part of the context surrounding the cursor.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(int offset, int nChars, gid.gtk4.imcontext.IMContext iMContext)`
  
          `offset` the character offset from the cursor position of the text
              to be deleted. A negative value indicates a position before
              the cursor. (optional)
  
          `nChars` the number of characters to be deleted (optional)
  
          `iMContext` the instance the signal is connected to (optional)
  
          `Returns` true if the signal was handled.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDeleteSurrounding(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.imcontext.IMContext)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.deleteSurrounding");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("delete-surrounding", closure, after);
  }

  /**
      Connect to `InvalidComposition` signal.
  
      Emitted when the filtered keys do not compose to a single valid character.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(string str, gid.gtk4.imcontext.IMContext iMContext)`
  
          `str` the completed character(s) entered by the user (optional)
  
          `iMContext` the instance the signal is connected to (optional)
  
          `Returns` true if the IM context avoid beeping on invalid composition
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInvalidComposition(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.imcontext.IMContext)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.invalidComposition");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("invalid-composition", closure, after);
  }

  /**
      Connect to `PreeditChanged` signal.
  
      The ::preedit-changed signal is emitted whenever the preedit sequence
        currently being entered has changed.
        
        It is also emitted at the end of a preedit sequence, in which case
        [gid.gtk4.imcontext.IMContext.getPreeditString] returns the empty string.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.imcontext.IMContext iMContext)`
  
          `iMContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPreeditChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.imcontext.IMContext)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.preeditChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("preedit-changed", closure, after);
  }

  /**
      Connect to `PreeditEnd` signal.
  
      The ::preedit-end signal is emitted when a preediting sequence
        has been completed or canceled.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.imcontext.IMContext iMContext)`
  
          `iMContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPreeditEnd(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.imcontext.IMContext)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.preeditEnd");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("preedit-end", closure, after);
  }

  /**
      Connect to `PreeditStart` signal.
  
      The ::preedit-start signal is emitted when a new preediting sequence
        starts.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.imcontext.IMContext iMContext)`
  
          `iMContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPreeditStart(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.imcontext.IMContext)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.preeditStart");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("preedit-start", closure, after);
  }

  /**
      Connect to `RetrieveSurrounding` signal.
  
      The ::retrieve-surrounding signal is emitted when the input method
        requires the context surrounding the cursor.
        
        The callback should set the input method surrounding context by
        calling the [gid.gtk4.imcontext.IMContext.setSurrounding] method.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk4.imcontext.IMContext iMContext)`
  
          `iMContext` the instance the signal is connected to (optional)
  
          `Returns` true if the signal was handled.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRetrieveSurrounding(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.imcontext.IMContext)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.retrieveSurrounding");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("retrieve-surrounding", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from IMContext
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk4.imcontext.IMContext), T.stringof ~ " is not derived from gid.gtk4.imcontext.IMContext");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivateOsk", true)[0]) == gid.gtk4.imcontext.IMContext))
      _installVfunc(klass, "activate_osk");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivateOskWithEvent", true)[0]) == gid.gtk4.imcontext.IMContext))
      _installVfunc(klass, "activate_osk_with_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCommit", true)[0]) == gid.gtk4.imcontext.IMContext))
      _installVfunc(klass, "commit");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDeleteSurrounding", true)[0]) == gid.gtk4.imcontext.IMContext))
      _installVfunc(klass, "delete_surrounding");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFilterKeypress", true)[0]) == gid.gtk4.imcontext.IMContext))
      _installVfunc(klass, "filter_keypress");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFocusIn", true)[0]) == gid.gtk4.imcontext.IMContext))
      _installVfunc(klass, "focus_in");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFocusOut", true)[0]) == gid.gtk4.imcontext.IMContext))
      _installVfunc(klass, "focus_out");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPreeditString", true)[0]) == gid.gtk4.imcontext.IMContext))
      _installVfunc(klass, "get_preedit_string");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetSurrounding", true)[0]) == gid.gtk4.imcontext.IMContext))
      _installVfunc(klass, "get_surrounding");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetSurroundingWithSelection", true)[0]) == gid.gtk4.imcontext.IMContext))
      _installVfunc(klass, "get_surrounding_with_selection");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncInvalidComposition", true)[0]) == gid.gtk4.imcontext.IMContext))
      _installVfunc(klass, "invalid_composition");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPreeditChanged", true)[0]) == gid.gtk4.imcontext.IMContext))
      _installVfunc(klass, "preedit_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPreeditEnd", true)[0]) == gid.gtk4.imcontext.IMContext))
      _installVfunc(klass, "preedit_end");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPreeditStart", true)[0]) == gid.gtk4.imcontext.IMContext))
      _installVfunc(klass, "preedit_start");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncReset", true)[0]) == gid.gtk4.imcontext.IMContext))
      _installVfunc(klass, "reset");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRetrieveSurrounding", true)[0]) == gid.gtk4.imcontext.IMContext))
      _installVfunc(klass, "retrieve_surrounding");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetClientWidget", true)[0]) == gid.gtk4.imcontext.IMContext))
      _installVfunc(klass, "set_client_widget");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetCursorLocation", true)[0]) == gid.gtk4.imcontext.IMContext))
      _installVfunc(klass, "set_cursor_location");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetSurrounding", true)[0]) == gid.gtk4.imcontext.IMContext))
      _installVfunc(klass, "set_surrounding");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetSurroundingWithSelection", true)[0]) == gid.gtk4.imcontext.IMContext))
      _installVfunc(klass, "set_surrounding_with_selection");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetUsePreedit", true)[0]) == gid.gtk4.imcontext.IMContext))
      _installVfunc(klass, "set_use_preedit");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkIMContextClass*)klass;

    switch (vfunc)
    {
      case "activate_osk":
      {
        static extern(C) void _vfuncActivateOskTramp(GtkIMContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.imcontext.IMContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkIMContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.activateOsk)
              return (cast(typeof(&_vfuncActivateOskTramp))_klass.activateOsk)(context);
            return;
          }

          try
          {
            _obj.vfuncActivateOsk();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.vfuncActivateOsk");
          }
        }

        _klass.activateOsk = cast(typeof(_klass.activateOsk))&_vfuncActivateOskTramp;
        break;
      }
      case "activate_osk_with_event":
      {
        static extern(C) gboolean _vfuncActivateOskWithEventTramp(GtkIMContext* context, GdkEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.imcontext.IMContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkIMContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.activateOskWithEvent)
              return (cast(typeof(&_vfuncActivateOskWithEventTramp))_klass.activateOskWithEvent)(context, event);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncActivateOskWithEvent(event ? new gid.gdk4.event.Event(cast(void*)event, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.vfuncActivateOskWithEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.activateOskWithEvent = cast(typeof(_klass.activateOskWithEvent))&_vfuncActivateOskWithEventTramp;
        break;
      }
      case "commit":
      {
        static extern(C) void _vfuncCommitTramp(GtkIMContext* context, const(char)* str) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.imcontext.IMContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkIMContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.commit)
              return (cast(typeof(&_vfuncCommitTramp))_klass.commit)(context, str);
            return;
          }

          string _str = str.fromCString!(No.Free);

          try
          {
            _obj.vfuncCommit(_str);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.vfuncCommit");
          }
        }

        _klass.commit = cast(typeof(_klass.commit))&_vfuncCommitTramp;
        break;
      }
      case "delete_surrounding":
      {
        static extern(C) gboolean _vfuncDeleteSurroundingTramp(GtkIMContext* context, int offset, int nChars) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.imcontext.IMContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkIMContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.deleteSurrounding)
              return (cast(typeof(&_vfuncDeleteSurroundingTramp))_klass.deleteSurrounding)(context, offset, nChars);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncDeleteSurrounding(offset, nChars);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.vfuncDeleteSurrounding");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.deleteSurrounding = cast(typeof(_klass.deleteSurrounding))&_vfuncDeleteSurroundingTramp;
        break;
      }
      case "filter_keypress":
      {
        static extern(C) gboolean _vfuncFilterKeypressTramp(GtkIMContext* context, GdkEvent* event) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.imcontext.IMContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkIMContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.filterKeypress)
              return (cast(typeof(&_vfuncFilterKeypressTramp))_klass.filterKeypress)(context, event);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncFilterKeypress(event ? new gid.gdk4.event.Event(cast(void*)event, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.vfuncFilterKeypress");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.filterKeypress = cast(typeof(_klass.filterKeypress))&_vfuncFilterKeypressTramp;
        break;
      }
      case "focus_in":
      {
        static extern(C) void _vfuncFocusInTramp(GtkIMContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.imcontext.IMContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkIMContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.focusIn)
              return (cast(typeof(&_vfuncFocusInTramp))_klass.focusIn)(context);
            return;
          }

          try
          {
            _obj.vfuncFocusIn();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.vfuncFocusIn");
          }
        }

        _klass.focusIn = cast(typeof(_klass.focusIn))&_vfuncFocusInTramp;
        break;
      }
      case "focus_out":
      {
        static extern(C) void _vfuncFocusOutTramp(GtkIMContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.imcontext.IMContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkIMContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.focusOut)
              return (cast(typeof(&_vfuncFocusOutTramp))_klass.focusOut)(context);
            return;
          }

          try
          {
            _obj.vfuncFocusOut();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.vfuncFocusOut");
          }
        }

        _klass.focusOut = cast(typeof(_klass.focusOut))&_vfuncFocusOutTramp;
        break;
      }
      case "get_preedit_string":
      {
        static extern(C) void _vfuncGetPreeditStringTramp(GtkIMContext* context, char** str, PangoAttrList** attrs, int* cursorPos) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.imcontext.IMContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkIMContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.getPreeditString)
              return (cast(typeof(&_vfuncGetPreeditStringTramp))_klass.getPreeditString)(context, str, attrs, cursorPos);
            return;
          }

          string _str;
          gid.pango1.attr_list.AttrList _attrs;

          try
          {
            _obj.vfuncGetPreeditString(_str, _attrs, *cursorPos);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.vfuncGetPreeditString");
          }
          *str = _str.toCString!(Yes.Malloc, No.Nullable);
          *attrs = _attrs ? cast(PangoAttrList*)_attrs._cPtr(Yes.Dup) : null;

        }

        _klass.getPreeditString = cast(typeof(_klass.getPreeditString))&_vfuncGetPreeditStringTramp;
        break;
      }
      case "get_surrounding":
      {
        static extern(C) gboolean _vfuncGetSurroundingTramp(GtkIMContext* context, char** text, int* cursorIndex) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.imcontext.IMContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkIMContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.getSurrounding)
              return (cast(typeof(&_vfuncGetSurroundingTramp))_klass.getSurrounding)(context, text, cursorIndex);
            return typeof(return).init;
          }

          bool _dretval;
          string _text;

          try
          {
            _dretval = _obj.vfuncGetSurrounding(_text, *cursorIndex);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.vfuncGetSurrounding");
          }
          auto _retval = cast(gboolean)_dretval;
          *text = _text.toCString!(Yes.Malloc, No.Nullable);

          return _retval;
        }

        _klass.getSurrounding = cast(typeof(_klass.getSurrounding))&_vfuncGetSurroundingTramp;
        break;
      }
      case "get_surrounding_with_selection":
      {
        static extern(C) gboolean _vfuncGetSurroundingWithSelectionTramp(GtkIMContext* context, char** text, int* cursorIndex, int* anchorIndex) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.imcontext.IMContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkIMContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.getSurroundingWithSelection)
              return (cast(typeof(&_vfuncGetSurroundingWithSelectionTramp))_klass.getSurroundingWithSelection)(context, text, cursorIndex, anchorIndex);
            return typeof(return).init;
          }

          bool _dretval;
          string _text;

          try
          {
            _dretval = _obj.vfuncGetSurroundingWithSelection(_text, *cursorIndex, *anchorIndex);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.vfuncGetSurroundingWithSelection");
          }
          auto _retval = cast(gboolean)_dretval;
          *text = _text.toCString!(Yes.Malloc, No.Nullable);

          return _retval;
        }

        _klass.getSurroundingWithSelection = cast(typeof(_klass.getSurroundingWithSelection))&_vfuncGetSurroundingWithSelectionTramp;
        break;
      }
      case "invalid_composition":
      {
        static extern(C) gboolean _vfuncInvalidCompositionTramp(GtkIMContext* context, const(char)* str) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.imcontext.IMContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkIMContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.invalidComposition)
              return (cast(typeof(&_vfuncInvalidCompositionTramp))_klass.invalidComposition)(context, str);
            return typeof(return).init;
          }

          bool _dretval;
          string _str = str.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncInvalidComposition(_str);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.vfuncInvalidComposition");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.invalidComposition = cast(typeof(_klass.invalidComposition))&_vfuncInvalidCompositionTramp;
        break;
      }
      case "preedit_changed":
      {
        static extern(C) void _vfuncPreeditChangedTramp(GtkIMContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.imcontext.IMContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkIMContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.preeditChanged)
              return (cast(typeof(&_vfuncPreeditChangedTramp))_klass.preeditChanged)(context);
            return;
          }

          try
          {
            _obj.vfuncPreeditChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.vfuncPreeditChanged");
          }
        }

        _klass.preeditChanged = cast(typeof(_klass.preeditChanged))&_vfuncPreeditChangedTramp;
        break;
      }
      case "preedit_end":
      {
        static extern(C) void _vfuncPreeditEndTramp(GtkIMContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.imcontext.IMContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkIMContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.preeditEnd)
              return (cast(typeof(&_vfuncPreeditEndTramp))_klass.preeditEnd)(context);
            return;
          }

          try
          {
            _obj.vfuncPreeditEnd();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.vfuncPreeditEnd");
          }
        }

        _klass.preeditEnd = cast(typeof(_klass.preeditEnd))&_vfuncPreeditEndTramp;
        break;
      }
      case "preedit_start":
      {
        static extern(C) void _vfuncPreeditStartTramp(GtkIMContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.imcontext.IMContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkIMContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.preeditStart)
              return (cast(typeof(&_vfuncPreeditStartTramp))_klass.preeditStart)(context);
            return;
          }

          try
          {
            _obj.vfuncPreeditStart();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.vfuncPreeditStart");
          }
        }

        _klass.preeditStart = cast(typeof(_klass.preeditStart))&_vfuncPreeditStartTramp;
        break;
      }
      case "reset":
      {
        static extern(C) void _vfuncResetTramp(GtkIMContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.imcontext.IMContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkIMContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.reset)
              return (cast(typeof(&_vfuncResetTramp))_klass.reset)(context);
            return;
          }

          try
          {
            _obj.vfuncReset();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.vfuncReset");
          }
        }

        _klass.reset = cast(typeof(_klass.reset))&_vfuncResetTramp;
        break;
      }
      case "retrieve_surrounding":
      {
        static extern(C) gboolean _vfuncRetrieveSurroundingTramp(GtkIMContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.imcontext.IMContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkIMContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.retrieveSurrounding)
              return (cast(typeof(&_vfuncRetrieveSurroundingTramp))_klass.retrieveSurrounding)(context);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncRetrieveSurrounding();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.vfuncRetrieveSurrounding");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.retrieveSurrounding = cast(typeof(_klass.retrieveSurrounding))&_vfuncRetrieveSurroundingTramp;
        break;
      }
      case "set_client_widget":
      {
        static extern(C) void _vfuncSetClientWidgetTramp(GtkIMContext* context, GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.imcontext.IMContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkIMContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.setClientWidget)
              return (cast(typeof(&_vfuncSetClientWidgetTramp))_klass.setClientWidget)(context, widget);
            return;
          }

          try
          {
            _obj.vfuncSetClientWidget(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)widget, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.vfuncSetClientWidget");
          }
        }

        _klass.setClientWidget = cast(typeof(_klass.setClientWidget))&_vfuncSetClientWidgetTramp;
        break;
      }
      case "set_cursor_location":
      {
        static extern(C) void _vfuncSetCursorLocationTramp(GtkIMContext* context, GdkRectangle* area) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.imcontext.IMContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkIMContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.setCursorLocation)
              return (cast(typeof(&_vfuncSetCursorLocationTramp))_klass.setCursorLocation)(context, area);
            return;
          }

          try
          {
            _obj.vfuncSetCursorLocation(*cast(gid.gdk4.rectangle.Rectangle*)area);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.vfuncSetCursorLocation");
          }
        }

        _klass.setCursorLocation = cast(typeof(_klass.setCursorLocation))&_vfuncSetCursorLocationTramp;
        break;
      }
      case "set_surrounding":
      {
        static extern(C) void _vfuncSetSurroundingTramp(GtkIMContext* context, const(char)* text, int len, int cursorIndex) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.imcontext.IMContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkIMContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.setSurrounding)
              return (cast(typeof(&_vfuncSetSurroundingTramp))_klass.setSurrounding)(context, text, len, cursorIndex);
            return;
          }

          string _text = text.fromCString!(No.Free);

          try
          {
            _obj.vfuncSetSurrounding(_text, len, cursorIndex);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.vfuncSetSurrounding");
          }
        }

        _klass.setSurrounding = cast(typeof(_klass.setSurrounding))&_vfuncSetSurroundingTramp;
        break;
      }
      case "set_surrounding_with_selection":
      {
        static extern(C) void _vfuncSetSurroundingWithSelectionTramp(GtkIMContext* context, const(char)* text, int len, int cursorIndex, int anchorIndex) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.imcontext.IMContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkIMContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.setSurroundingWithSelection)
              return (cast(typeof(&_vfuncSetSurroundingWithSelectionTramp))_klass.setSurroundingWithSelection)(context, text, len, cursorIndex, anchorIndex);
            return;
          }

          string _text = text.fromCString!(No.Free);

          try
          {
            _obj.vfuncSetSurroundingWithSelection(_text, len, cursorIndex, anchorIndex);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.vfuncSetSurroundingWithSelection");
          }
        }

        _klass.setSurroundingWithSelection = cast(typeof(_klass.setSurroundingWithSelection))&_vfuncSetSurroundingWithSelectionTramp;
        break;
      }
      case "set_use_preedit":
      {
        static extern(C) void _vfuncSetUsePreeditTramp(GtkIMContext* context, gboolean usePreedit) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.imcontext.IMContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkIMContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.setUsePreedit)
              return (cast(typeof(&_vfuncSetUsePreeditTramp))_klass.setUsePreedit)(context, usePreedit);
            return;
          }

          try
          {
            _obj.vfuncSetUsePreedit(cast(bool)usePreedit);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.imcontext.IMContext.vfuncSetUsePreedit");
          }
        }

        _klass.setUsePreedit = cast(typeof(_klass.setUsePreedit))&_vfuncSetUsePreeditTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.imcontext.IMContext]
class IMContextGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `inputHints` property.
      Params:
        propval = Additional hints that allow input methods to fine-tune
          their behaviour.
      Returns: Builder instance for fluent chaining
  */
  T inputHints(gid.gtk4.types.InputHints propval) nothrow
  {
    return setProperty("input-hints", propval);
  }

  /**
      Set `inputPurpose` property.
      Params:
        propval = The purpose of the text field that the `GtkIMContext is connected to.
          
          This property can be used by on-screen keyboards and other input
          methods to adjust their behaviour.
      Returns: Builder instance for fluent chaining
  */
  T inputPurpose(gid.gtk4.types.InputPurpose propval) nothrow
  {
    return setProperty("input-purpose", propval);
  }
}

/// Fluent builder for [gid.gtk4.imcontext.IMContext]
final class IMContextGidBuilder : IMContextGidBuilderImpl!IMContextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  IMContext build() nothrow
  {
    return new IMContext(cast(void*)createGObject(IMContext._getGType), Yes.Take);
  }
}
