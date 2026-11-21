/// Module for [Indenter] interface mixin
module gid.gtksource5.indenter_mixin;

public import gid.core.basictypes;
public import gid.gtksource5.indenter_iface_proxy;
public import gid.core.gid;
public import gid.gdk4.types;
public import gid.gobject2.gid_builder;
public import gid.gtk4.text_iter;
public import gid.gtksource5.c.functions;
public import gid.gtksource5.c.types;
public import gid.gtksource5.types;
public import gid.gtksource5.view;

/**
    Auto-indentation interface.
    
    By default, [gid.gtksource5.view.View] can auto-indent as you type when
    [gid.gtksource5.view.View.autoIndent] is enabled. The indentation simply copies the
    previous lines indentation.
    
    This can be changed by implementing [gid.gtksource5.indenter.Indenter] and setting the
    [gid.gtksource5.view.View.indenter] property.
    
    Implementors of this interface should implement both
    `vfunc@GtkSource.Indenter.is_trigger` and `vfunc@GtkSource.Indenter.indent`.
    
    `vfunc@GtkSource.Indenter.is_trigger` is called upon key-press to
    determine of the key press should trigger an indentation.  The default
    implementation of the interface checks to see if the key was
    [gid.gdk4.types.KEY_Return] or [gid.gdk4.types.KEY_KP_Enter] without [gid.gdk4.types.ModifierType.ShiftMask] set.
    
    `vfunc@GtkSource.Indenter.indent` is called after text has been
    inserted into [gid.gtksource5.buffer.Buffer] when
    `vfunc@GtkSource.Indenter.is_trigger` returned true. The [gid.gtk4.text_iter.TextIter]
    is placed directly after the inserted character or characters.
    
    It may be beneficial to move the insertion mark using
    [gid.gtk4.text_buffer.TextBuffer.selectRange] depending on how the indenter changes
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
      
      See `vfuncGtkSource.Indenter.is_trigger` for how to trigger indentation on
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
  override void indent(gid.gtksource5.view.View view, gid.gtk4.text_iter.TextIter iter) nothrow
  {
    gtk_source_indenter_indent(cast(GtkSourceIndenter*)this._cPtr, view ? cast(GtkSourceView*)view._cPtr(No.Dup) : null, iter ? cast(GtkTextIter*)iter._cPtr(No.Dup) : null);
  }

  /**
      This function is used to determine if a key pressed should cause the
      indenter to automatically indent.
      
      The default implementation of this virtual method will check to see
      if keyval is [gid.gdk4.types.KEY_Return] or [gid.gdk4.types.KEY_KP_Enter] and state does
      not have [gid.gdk4.types.ModifierType.ShiftMask] set. This is to allow the user to avoid
      indentation when Shift+Return is pressed. Other indenters may want
      to copy this behavior to provide a consistent experience to users.
  
      Params:
        view = a #GtkSourceView
        location = the location where ch is to be inserted
        state = modifier state for the insertion
        keyval = the keyval pressed such as [gid.gdk4.types.KEY_Return]
      Returns: true if indentation should be automatically triggered;
          otherwise false and no indentation will be performed.
  */
  override bool isTrigger(gid.gtksource5.view.View view, gid.gtk4.text_iter.TextIter location, gid.gdk4.types.ModifierType state, uint keyval) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_indenter_is_trigger(cast(GtkSourceIndenter*)this._cPtr, view ? cast(GtkSourceView*)view._cPtr(No.Dup) : null, location ? cast(const(GtkTextIter)*)location._cPtr(No.Dup) : null, state, keyval);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtksource5.indenter.Indenter]
template IndenterGidBuilderT()
{
}
