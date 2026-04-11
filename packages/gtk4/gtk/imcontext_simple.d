/// Module for [IMContextSimple] class
module gtk.imcontext_simple;

import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.imcontext;
import gtk.types;

/**
    [gtk.imcontext_simple.IMContextSimple] is an input method supporting table-based input methods.
    
    ## Compose sequences
    
    [gtk.imcontext_simple.IMContextSimple] reads compose sequences from the first of the
    following files that is found: ~/.config/gtk-4.0/Compose, ~/.XCompose,
    /usr/share/X11/locale/$locale/Compose (for locales that have a nontrivial
    Compose file). A subset of the file syntax described in the Compose(5)
    manual page is supported. Additionally, `include "`L`"` loads GTK’s built-in
    table of compose sequences rather than the locale-specific one from X11.
    
    If none of these files is found, [gtk.imcontext_simple.IMContextSimple] uses a built-in table
    of compose sequences that is derived from the X11 Compose files.
    
    Note that compose sequences typically start with the Compose_key, which is
    often not available as a dedicated key on keyboards. Keyboard layouts may
    map this keysym to other keys, such as the right Control key.
    
    ## Unicode characters
    
    [gtk.imcontext_simple.IMContextSimple] also supports numeric entry of Unicode characters
    by typing <kbd>Ctrl</kbd>-<kbd>Shift</kbd>-<kbd>u</kbd>, followed by a
    hexadecimal Unicode codepoint.
    
    For example,
    
        Ctrl-Shift-u 1 2 3 Enter
    
    yields U+0123 LATIN SMALL LETTER G WITH CEDILLA, i.e. ģ.
    
    ## Dead keys
    
    [gtk.imcontext_simple.IMContextSimple] supports dead keys. For example, typing
    
        dead_acute a
    
     yields U+00E! LATIN SMALL LETTER_A WITH ACUTE, i.e. á. Note that this
     depends on the keyboard layout including dead keys.
*/
class IMContextSimple : gtk.imcontext.IMContext
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
    return cast(void function())gtk_im_context_simple_get_type != &gidSymbolNotFound ? gtk_im_context_simple_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override IMContextSimple self()
  {
    return this;
  }

  /**
      Get builder for [gtk.imcontext_simple.IMContextSimple]
      Returns: New builder object
  */
  static IMContextSimpleGidBuilder builder()
  {
    return new IMContextSimpleGidBuilder;
  }

  /**
      Creates a new [gtk.imcontext_simple.IMContextSimple].
      Returns: a new [gtk.imcontext_simple.IMContextSimple]
  */
  this()
  {
    GtkIMContext* _cretval;
    _cretval = gtk_im_context_simple_new();
    this(_cretval, Yes.Take);
  }

  /**
      Adds an additional table from the X11 compose file.
  
      Params:
        composeFile = The path of compose file
  */
  void addComposeFile(string composeFile)
  {
    const(char)* _composeFile = composeFile.toCString(No.Alloc);
    gtk_im_context_simple_add_compose_file(cast(GtkIMContextSimple*)this._cPtr, _composeFile);
  }
}

/// Fluent builder implementation template for [gtk.imcontext_simple.IMContextSimple]
class IMContextSimpleGidBuilderImpl(T) : gtk.imcontext.IMContextGidBuilderImpl!T
{
}

/// Fluent builder for [gtk.imcontext_simple.IMContextSimple]
final class IMContextSimpleGidBuilder : IMContextSimpleGidBuilderImpl!IMContextSimpleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  IMContextSimple build()
  {
    return new IMContextSimple(cast(void*)createGObject(IMContextSimple._getGType), Yes.Take);
  }
}
