/// Module for [Editable] interface mixin
module gtk.editable_mixin;

public import gtk.editable_iface_proxy;
public import gid.gid;
public import gobject.dclosure;
public import gobject.object;
public import gobject.param_spec;
public import gobject.value;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
    [gtk.editable.Editable] is an interface for text editing widgets.
    
    Typical examples of editable widgets are [gtk.entry.Entry] and
    [gtk.spin_button.SpinButton]. It contains functions for generically manipulating
    an editable widget, a large number of action signals used for key bindings,
    and several signals that an application can connect to modify the behavior
    of a widget.
    
    As an example of the latter usage, by connecting the following handler to
    `signal@Gtk.Editable::insert-text`, an application can convert all entry
    into a widget into uppercase.
    
    ## Forcing entry to uppercase.
    
    ```c
    #include <ctype.h>
    
    void
    insert_text_handler (GtkEditable *editable,
                         const char  *text,
                         int          length,
                         int         *position,
                         gpointer     data)
    {
      char *result = g_utf8_strup (text, length);
    
      g_signal_handlers_block_by_func (editable,
                                   (gpointer) insert_text_handler, data);
      gtk_editable_insert_text (editable, result, length, position);
      g_signal_handlers_unblock_by_func (editable,
                                         (gpointer) insert_text_handler, data);
    
      g_signal_stop_emission_by_name (editable, "insert_text");
    
      g_free (result);
    }
    ```
    
    ## Implementing GtkEditable
    
    The most likely scenario for implementing [gtk.editable.Editable] on your own widget
    is that you will embed a [gtk.text.Text] inside a complex widget, and want to
    delegate the editable functionality to that text widget. [gtk.editable.Editable]
    provides some utility functions to make this easy.
    
    In your class_init function, call [gtk.editable.Editable.installProperties],
    passing the first available property ID:
    
    ```c
    static void
    my_class_init (MyClass *class)
    {
      ...
      g_object_class_install_properties (object_class, NUM_PROPERTIES, props);
      gtk_editable_install_properties (object_clas, NUM_PROPERTIES);
      ...
    }
    ```
    
    In your interface_init function for the [gtk.editable.Editable] interface, provide
    an implementation for the get_delegate vfunc that returns your text widget:
    
    ```c
    GtkEditable *
    get_editable_delegate (GtkEditable *editable)
    {
      return GTK_EDITABLE (MY_WIDGET (editable)->text_widget);
    }
    
    static void
    my_editable_init (GtkEditableInterface *iface)
    {
      iface->get_delegate = get_editable_delegate;
    }
    ```
    
    You don't need to provide any other vfuncs. The default implementations
    work by forwarding to the delegate that the GtkEditableInterface.get_delegate()
    vfunc returns.
    
    In your instance_init function, create your text widget, and then call
    [gtk.editable.Editable.initDelegate]:
    
    ```c
    static void
    my_widget_init (MyWidget *self)
    {
      ...
      self->text_widget = gtk_text_new ();
      gtk_editable_init_delegate (GTK_EDITABLE (self));
      ...
    }
    ```
    
    In your dispose function, call [gtk.editable.Editable.finishDelegate] before
    destroying your text widget:
    
    ```c
    static void
    my_widget_dispose (GObject *object)
    {
      ...
      gtk_editable_finish_delegate (GTK_EDITABLE (self));
      g_clear_pointer (&self->text_widget, gtk_widget_unparent);
      ...
    }
    ```
    
    Finally, use [gtk.editable.Editable.delegateSetProperty] in your `set_property`
    function (and similar for `get_property`), to set the editable properties:
    
    ```c
      ...
      if (gtk_editable_delegate_set_property (object, prop_id, value, pspec))
        return;
    
      switch (prop_id)
      ...
    ```
    
    It is important to note that if you create a [gtk.editable.Editable] that uses
    a delegate, the low level `signal@Gtk.Editable::insert-text` and
    `signal@Gtk.Editable::delete-text` signals will be propagated from the
    "wrapper" editable to the delegate, but they will not be propagated from
    the delegate to the "wrapper" editable, as they would cause an infinite
    recursion. If you wish to connect to the `signal@Gtk.Editable::insert-text`
    and `signal@Gtk.Editable::delete-text` signals, you will need to connect
    to them on the delegate obtained via [gtk.editable.Editable.getDelegate].
*/
template EditableT()
{

  /**
      Get `cursorPosition` property.
      Returns: The current position of the insertion cursor in chars.
  */
  @property int cursorPosition()
  {
    return getPosition();
  }

  /**
      Get `editable` property.
      Returns: Whether the entry contents can be edited.
  */
  @property bool editable()
  {
    return getEditable();
  }

  /**
      Set `editable` property.
      Params:
        propval = Whether the entry contents can be edited.
  */
  @property void editable(bool propval)
  {
    return setEditable(propval);
  }

  /**
      Get `enableUndo` property.
      Returns: If undo/redo should be enabled for the editable.
  */
  @property bool enableUndo()
  {
    return getEnableUndo();
  }

  /**
      Set `enableUndo` property.
      Params:
        propval = If undo/redo should be enabled for the editable.
  */
  @property void enableUndo(bool propval)
  {
    return setEnableUndo(propval);
  }

  /**
      Get `maxWidthChars` property.
      Returns: The desired maximum width of the entry, in characters.
  */
  @property int maxWidthChars()
  {
    return getMaxWidthChars();
  }

  /**
      Set `maxWidthChars` property.
      Params:
        propval = The desired maximum width of the entry, in characters.
  */
  @property void maxWidthChars(int propval)
  {
    return setMaxWidthChars(propval);
  }

  /**
      Get `selectionBound` property.
      Returns: The position of the opposite end of the selection from the cursor in chars.
  */
  @property int selectionBound()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("selection-bound");
  }

  /**
      Get `text` property.
      Returns: The contents of the entry.
  */
  @property string text()
  {
    return getText();
  }

  /**
      Set `text` property.
      Params:
        propval = The contents of the entry.
  */
  @property void text(string propval)
  {
    return setText(propval);
  }

  /**
      Get `widthChars` property.
      Returns: Number of characters to leave space for in the entry.
  */
  @property int widthChars()
  {
    return getWidthChars();
  }

  /**
      Set `widthChars` property.
      Params:
        propval = Number of characters to leave space for in the entry.
  */
  @property void widthChars(int propval)
  {
    return setWidthChars(propval);
  }

  /**
      Get `xalign` property.
      Returns: The horizontal alignment, from 0 (left) to 1 (right).
        
        Reversed for RTL layouts.
  */
  @property float xalign()
  {
    return getAlignment();
  }

  /**
      Set `xalign` property.
      Params:
        propval = The horizontal alignment, from 0 (left) to 1 (right).
          
          Reversed for RTL layouts.
  */
  @property void xalign(float propval)
  {
    return setAlignment(propval);
  }



  /**
      Retrieves the accessible platform state from the editable delegate.
      
      This is an helper function to retrieve the accessible state for
      [gtk.editable.Editable] interface implementations using a delegate pattern.
      
      You should call this function in your editable widget implementation
      of the `vfuncGtk.Accessible.get_platform_state` virtual function, for
      instance:
      
      ```c
      static void
      accessible_interface_init (GtkAccessibleInterface *iface)
      {
        iface->get_platform_state = your_editable_get_accessible_platform_state;
      }
      
      static gboolean
      your_editable_get_accessible_platform_state (GtkAccessible *accessible,
                                                   GtkAccessiblePlatformState state)
      {
        return gtk_editable_delegate_get_accessible_platform_state (GTK_EDITABLE (accessible), state);
      }
      ```
  
      Params:
        state = what kind of accessible state to retrieve
      Returns: 
  */
  override bool delegateGetAccessiblePlatformState(gtk.types.AccessiblePlatformState state)
  {
    bool _retval;
    _retval = cast(bool)gtk_editable_delegate_get_accessible_platform_state(cast(GtkEditable*)this._cPtr, state);
    return _retval;
  }

  /**
      Deletes the currently selected text of the editable.
      
      This call doesn’t do anything if there is no selected text.
  */
  override void deleteSelection()
  {
    gtk_editable_delete_selection(cast(GtkEditable*)this._cPtr);
  }

  /**
      Deletes a sequence of characters.
      
      The characters that are deleted are those characters at positions
      from start_pos up to, but not including end_pos. If end_pos is
      negative, then the characters deleted are those from start_pos to
      the end of the text.
      
      Note that the positions are specified in characters, not bytes.
  
      Params:
        startPos = start position
        endPos = end position
  */
  override void deleteText(int startPos, int endPos)
  {
    gtk_editable_delete_text(cast(GtkEditable*)this._cPtr, startPos, endPos);
  }

  /**
      Undoes the setup done by [gtk.editable.Editable.initDelegate].
      
      This is a helper function that should be called from dispose,
      before removing the delegate object.
  */
  override void finishDelegate()
  {
    gtk_editable_finish_delegate(cast(GtkEditable*)this._cPtr);
  }

  /**
      Gets the alignment of the editable.
      Returns: the alignment
  */
  override float getAlignment()
  {
    float _retval;
    _retval = gtk_editable_get_alignment(cast(GtkEditable*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves a sequence of characters.
      
      The characters that are retrieved are those characters at positions
      from start_pos up to, but not including end_pos. If end_pos is negative,
      then the characters retrieved are those characters from start_pos to
      the end of the text.
      
      Note that positions are specified in characters, not bytes.
  
      Params:
        startPos = start of text
        endPos = end of text
      Returns: a pointer to the contents of the widget as a
          string. This string is allocated by the [gtk.editable.Editable] implementation
          and should be freed by the caller.
  */
  override string getChars(int startPos, int endPos)
  {
    char* _cretval;
    _cretval = gtk_editable_get_chars(cast(GtkEditable*)this._cPtr, startPos, endPos);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the [gtk.editable.Editable] that editable is delegating its
      implementation to.
      
      Typically, the delegate is a [gtk.text.Text] widget.
      Returns: the delegate [gtk.editable.Editable]
  */
  override gtk.editable.Editable getDelegate()
  {
    GtkEditable* _cretval;
    _cretval = gtk_editable_get_delegate(cast(GtkEditable*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.editable.Editable)(cast(GtkEditable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves whether editable is editable.
      Returns: true if editable is editable.
  */
  override bool getEditable()
  {
    bool _retval;
    _retval = cast(bool)gtk_editable_get_editable(cast(GtkEditable*)this._cPtr);
    return _retval;
  }

  /**
      Gets if undo/redo actions are enabled for editable
      Returns: true if undo is enabled
  */
  override bool getEnableUndo()
  {
    bool _retval;
    _retval = cast(bool)gtk_editable_get_enable_undo(cast(GtkEditable*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the desired maximum width of editable, in characters.
      Returns: the maximum width of the entry, in characters
  */
  override int getMaxWidthChars()
  {
    int _retval;
    _retval = gtk_editable_get_max_width_chars(cast(GtkEditable*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the current position of the cursor relative
      to the start of the content of the editable.
      
      Note that this position is in characters, not in bytes.
      Returns: the cursor position
  */
  override int getPosition()
  {
    int _retval;
    _retval = gtk_editable_get_position(cast(GtkEditable*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the selection bound of the editable.
      
      start_pos will be filled with the start of the selection and
      end_pos with end. If no text was selected both will be identical
      and false will be returned.
      
      Note that positions are specified in characters, not bytes.
  
      Params:
        startPos = location to store the starting position
        endPos = location to store the end position
      Returns: true if there is a non-empty selection, false otherwise
  */
  override bool getSelectionBounds(out int startPos, out int endPos)
  {
    bool _retval;
    _retval = cast(bool)gtk_editable_get_selection_bounds(cast(GtkEditable*)this._cPtr, cast(int*)&startPos, cast(int*)&endPos);
    return _retval;
  }

  /**
      Retrieves the contents of editable.
      
      The returned string is owned by GTK and must not be modified or freed.
      Returns: a pointer to the contents of the editable
  */
  override string getText()
  {
    const(char)* _cretval;
    _cretval = gtk_editable_get_text(cast(GtkEditable*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the number of characters of space reserved
      for the contents of the editable.
      Returns: number of chars to request space for, or negative if unset
  */
  override int getWidthChars()
  {
    int _retval;
    _retval = gtk_editable_get_width_chars(cast(GtkEditable*)this._cPtr);
    return _retval;
  }

  /**
      Sets up a delegate for [gtk.editable.Editable].
      
      This is assuming that the get_delegate vfunc in the [gtk.editable.Editable]
      interface has been set up for the editable's type.
      
      This is a helper function that should be called in instance init,
      after creating the delegate object.
  */
  override void initDelegate()
  {
    gtk_editable_init_delegate(cast(GtkEditable*)this._cPtr);
  }

  /**
      Inserts length bytes of text into the contents of the
      widget, at position position.
      
      Note that the position is in characters, not in bytes.
      The function updates position to point after the newly
      inserted text.
  
      Params:
        text = the text to insert
        position = location of the position text will be inserted at
  */
  override void insertText(string text, ref int position)
  {
    int _length;
    if (text)
      _length = cast(int)text.length;

    auto _text = cast(const(char)*)text.ptr;
    gtk_editable_insert_text(cast(GtkEditable*)this._cPtr, _text, _length, cast(int*)&position);
  }

  /**
      Selects a region of text.
      
      The characters that are selected are those characters at positions
      from start_pos up to, but not including end_pos. If end_pos is
      negative, then the characters selected are those characters from
      start_pos to  the end of the text.
      
      Note that positions are specified in characters, not bytes.
  
      Params:
        startPos = start of region
        endPos = end of region
  */
  override void selectRegion(int startPos, int endPos)
  {
    gtk_editable_select_region(cast(GtkEditable*)this._cPtr, startPos, endPos);
  }

  /**
      Sets the alignment for the contents of the editable.
      
      This controls the horizontal positioning of the contents when
      the displayed text is shorter than the width of the editable.
  
      Params:
        xalign = The horizontal alignment, from 0 (left) to 1 (right).
            Reversed for RTL layouts
  */
  override void setAlignment(float xalign)
  {
    gtk_editable_set_alignment(cast(GtkEditable*)this._cPtr, xalign);
  }

  /**
      Determines if the user can edit the text in the editable widget.
  
      Params:
        isEditable = true if the user is allowed to edit the text
            in the widget
  */
  override void setEditable(bool isEditable)
  {
    gtk_editable_set_editable(cast(GtkEditable*)this._cPtr, isEditable);
  }

  /**
      If enabled, changes to editable will be saved for undo/redo
      actions.
      
      This results in an additional copy of text changes and are not
      stored in secure memory. As such, undo is forcefully disabled
      when [gtk.text.Text.visibility] is set to false.
  
      Params:
        enableUndo = if undo/redo should be enabled
  */
  override void setEnableUndo(bool enableUndo)
  {
    gtk_editable_set_enable_undo(cast(GtkEditable*)this._cPtr, enableUndo);
  }

  /**
      Sets the desired maximum width in characters of editable.
  
      Params:
        nChars = the new desired maximum width, in characters
  */
  override void setMaxWidthChars(int nChars)
  {
    gtk_editable_set_max_width_chars(cast(GtkEditable*)this._cPtr, nChars);
  }

  /**
      Sets the cursor position in the editable to the given value.
      
      The cursor is displayed before the character with the given (base 0)
      index in the contents of the editable. The value must be less than
      or equal to the number of characters in the editable. A value of -1
      indicates that the position should be set after the last character
      of the editable. Note that position is in characters, not in bytes.
  
      Params:
        position = the position of the cursor
  */
  override void setPosition(int position)
  {
    gtk_editable_set_position(cast(GtkEditable*)this._cPtr, position);
  }

  /**
      Sets the text in the editable to the given value.
      
      This is replacing the current contents.
  
      Params:
        text = the text to set
  */
  override void setText(string text)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_editable_set_text(cast(GtkEditable*)this._cPtr, _text);
  }

  /**
      Changes the size request of the editable to be about the
      right size for n_chars characters.
      
      Note that it changes the size request, the size can still
      be affected by how you pack the widget into containers.
      If n_chars is -1, the size reverts to the default size.
  
      Params:
        nChars = width in chars
  */
  override void setWidthChars(int nChars)
  {
    gtk_editable_set_width_chars(cast(GtkEditable*)this._cPtr, nChars);
  }

  /**
      Connect to `Changed` signal.
  
      Emitted at the end of a single user-visible operation on the
        contents.
        
        E.g., a paste operation that replaces the contents of the
        selection will cause only one signal emission (even though it
        is implemented by first deleting the selection, then inserting
        the new content, and may cause multiple ::notify::text signals
        to be emitted).
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.editable.Editable editable))
  
          `editable` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.editable.Editable)))
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
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Connect to `DeleteText` signal.
  
      Emitted when text is deleted from the widget by the user.
        
        The default handler for this signal will normally be responsible for
        deleting the text, so by connecting to this signal and then stopping
        the signal with [gobject.global.signalStopEmission], it is possible to modify the
        range of deleted text, or prevent it from being deleted entirely.
        
        The start_pos and end_pos parameters are interpreted as for
        [gtk.editable.Editable.deleteText].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int startPos, int endPos, gtk.editable.Editable editable))
  
          `startPos` the starting position (optional)
  
          `endPos` the end position (optional)
  
          `editable` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDeleteText(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.editable.Editable)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("delete-text", closure, after);
  }
}
