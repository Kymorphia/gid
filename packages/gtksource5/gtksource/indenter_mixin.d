/// Module for [Indenter] interface mixin
module gtksource.indenter_mixin;

public import gtksource.indenter_iface_proxy;
public import gdk.types;
public import gid.gid;
public import gtk.text_iter;
public import gtksource.c.functions;
public import gtksource.c.types;
public import gtksource.types;
public import gtksource.view;

/**
    Auto-indentation interface.
    
    By default, `class@View` can auto-indent as you type when
    `property@View:auto-indent` is enabled. The indentation simply copies the
    previous lines indentation.
    
    This can be changed by implementing [gtksource.indenter.Indenter] and setting the
    `property@View:indenter` property.
    
    Implementors of this interface should implement both
    `vfunc@Indenter.is_trigger` and `vfunc@Indenter.indent`.
    
    `vfunc@Indenter.is_trigger` is called upon key-press to
    determine of the key press should trigger an indentation.  The default
    implementation of the interface checks to see if the key was
    [gdk.types.KEY_Return] or [gdk.types.KEY_KP_Enter] without [gdk.types.ModifierType.ShiftMask] set.
    
    `vfunc@Indenter.indent` is called after text has been
    inserted into `class@Buffer` when
    `vfunc@Indenter.is_trigger` returned true. The [gtk.text_iter.TextIter]
    is placed directly after the inserted character or characters.
    
    It may be beneficial to move the insertion mark using
    [gtk.text_buffer.TextBuffer.selectRange] depending on how the indenter changes
    the indentation.
    
    All changes are encapsulated within a single user action so that the
    user may undo them using standard undo/redo accelerators.
*/
template IndenterT()
{

  /**
      This function should be implemented to alter the indentation of text
      within the view.
      
      view is provided so that the indenter may retrieve settings such as indentation and tab widths.
      
      iter is the location where the indentation was requested. This typically
      is after having just inserted a newline (\n) character but can be other
      situations such as a manually requested indentation or reformatting.
      
      See `ifaceIndenter.is_trigger` for how to trigger indentation on
      various characters inserted into the buffer.
      
      The implementor of this function is expected to keep iter valid across
      calls to the function and should contain the location of the insert mark
      after calling this function.
      
      The default implementation for this virtual function will copy the
      indentation of the previous line.
  
      Params:
        view = a #GtkSourceView
        iter = the location of the indentation request
  */
  override void indent(gtksource.view.View view, gtk.text_iter.TextIter iter)
  {
    gtk_source_indenter_indent(cast(GtkSourceIndenter*)this._cPtr, view ? cast(GtkSourceView*)view._cPtr(No.Dup) : null, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null);
  }

  /**
      This function is used to determine if a key pressed should cause the
      indenter to automatically indent.
      
      The default implementation of this virtual method will check to see
      if keyval is [gdk.types.KEY_Return] or [gdk.types.KEY_KP_Enter] and state does
      not have [gdk.types.ModifierType.ShiftMask] set. This is to allow the user to avoid
      indentation when Shift+Return is pressed. Other indenters may want
      to copy this behavior to provide a consistent experience to users.
  
      Params:
        view = a #GtkSourceView
        location = the location where ch is to be inserted
        state = modifier state for the insertion
        keyval = the keyval pressed such as [gdk.types.KEY_Return]
      Returns: true if indentation should be automatically triggered;
          otherwise false and no indentation will be performed.
  */
  override bool isTrigger(gtksource.view.View view, gtk.text_iter.TextIter location, gdk.types.ModifierType state, uint keyval)
  {
    bool _retval;
    _retval = cast(bool)gtk_source_indenter_is_trigger(cast(GtkSourceIndenter*)this._cPtr, view ? cast(GtkSourceView*)view._cPtr(No.Dup) : null, location ? cast(const(GtkTextIter)*)location._cPtr(No.Dup) : null, state, keyval);
    return _retval;
  }
}
