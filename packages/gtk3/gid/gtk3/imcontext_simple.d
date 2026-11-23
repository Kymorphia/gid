/// Module for [IMContextSimple] class
module gid.gtk3.imcontext_simple;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.imcontext;
import gid.gtk3.types;

/**
    GtkIMContextSimple is a simple input method context supporting table-based
    input methods. It has a built-in table of compose sequences that is derived
    from the X11 Compose files.
    
    GtkIMContextSimple reads additional compose sequences from the first of the
    following files that is found: ~/.config/gtk-3.0/Compose, ~/.XCompose,
    /usr/share/X11/locale/$locale/Compose (for locales that have a nontrivial
    Compose file). The syntax of these files is described in the Compose(5)
    manual page.
    
    ## Unicode characters
    
    GtkIMContextSimple also supports numeric entry of Unicode characters
    by typing Ctrl-Shift-u, followed by a hexadecimal Unicode codepoint.
    For example, Ctrl-Shift-u 1 2 3 Enter yields U+0123 LATIN SMALL LETTER
    G WITH CEDILLA, i.e. ģ.
*/
class IMContextSimple : gid.gtk3.imcontext.IMContext
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_im_context_simple_get_type != &gidSymbolNotFound ? gtk_im_context_simple_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkIMContextSimple";
  }

  /** Returns `this`, for use in `with` statements. */
  override IMContextSimple self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.imcontext_simple.IMContextSimple]
      Returns: New builder object
  */
  static IMContextSimpleGidBuilder builder() nothrow
  {
    return new IMContextSimpleGidBuilder;
  }

  /**
      Creates a new #GtkIMContextSimple.
      Returns: a new #GtkIMContextSimple.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkIMContext* _cretval;
      _cretval = gtk_im_context_simple_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Adds an additional table from the X11 compose file.
  
      Params:
        composeFile = The path of compose file
  */
  void addComposeFile(string composeFile) nothrow
  {
    const(char)* _composeFile = composeFile.toCString!(No.Malloc, No.Nullable);
    gtk_im_context_simple_add_compose_file(cast(GtkIMContextSimple*)this._cPtr, _composeFile);
  }
}

/// Fluent builder implementation template for [gid.gtk3.imcontext_simple.IMContextSimple]
class IMContextSimpleGidBuilderImpl(T) : gid.gtk3.imcontext.IMContextGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk3.imcontext_simple.IMContextSimple]
final class IMContextSimpleGidBuilder : IMContextSimpleGidBuilderImpl!IMContextSimpleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  IMContextSimple build() nothrow
  {
    return new IMContextSimple(cast(void*)createGObject(IMContextSimple._getGType), Yes.Take);
  }
}
