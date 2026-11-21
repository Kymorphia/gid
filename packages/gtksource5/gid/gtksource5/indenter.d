/// Module for [Indenter] interface
module gid.gtksource5.indenter;

public import gid.core.basictypes;
public import gid.gtksource5.indenter_iface_proxy;
import gid.core.gid;
import gid.gdk4.types;
import gid.gobject2.gid_builder;
import gid.gtk4.text_iter;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.types;
import gid.gtksource5.view;

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
interface Indenter : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_indenter_get_type != &gidSymbolNotFound ? gtk_source_indenter_get_type() : cast(GType)0;
  }

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
  void indent(gid.gtksource5.view.View view, gid.gtk4.text_iter.TextIter iter);

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
  bool isTrigger(gid.gtksource5.view.View view, gid.gtk4.text_iter.TextIter location, gid.gdk4.types.ModifierType state, uint keyval);
}

/// Fluent builder implementation template for [gid.gtksource5.indenter.Indenter]
interface IndenterGidBuilderImpl(T)
{
}
