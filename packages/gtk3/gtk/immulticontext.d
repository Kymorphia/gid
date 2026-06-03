/// Module for [IMMulticontext] class
module gtk.immulticontext;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.imcontext;
import gtk.menu_shell;
import gtk.types;

/** */
class IMMulticontext : gtk.imcontext.IMContext
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_im_multicontext_get_type != &gidSymbolNotFound ? gtk_im_multicontext_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override IMMulticontext self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.immulticontext.IMMulticontext]
      Returns: New builder object
  */
  static IMMulticontextGidBuilder builder() nothrow
  {
    return new IMMulticontextGidBuilder;
  }

  /**
      Creates a new #GtkIMMulticontext.
      Returns: a new #GtkIMMulticontext.
  */
  this() nothrow
  {
    GtkIMContext* _cretval;
    _cretval = gtk_im_multicontext_new();
    this(_cretval, Yes.Take);
  }

  /**
      Add menuitems for various available input methods to a menu;
      the menuitems, when selected, will switch the input method
      for the context and the global default input method.
  
      Params:
        menushell = a #GtkMenuShell
  
      Deprecated: It is better to use the system-wide input
            method framework for changing input methods. Modern
            desktop shells offer on-screen displays for this that
            can triggered with a keyboard shortcut, e.g. Super-Space.
  */
  void appendMenuitems(gtk.menu_shell.MenuShell menushell) nothrow
  {
    gtk_im_multicontext_append_menuitems(cast(GtkIMMulticontext*)this._cPtr, menushell ? cast(GtkMenuShell*)menushell._cPtr(No.Dup) : null);
  }

  /**
      Gets the id of the currently active slave of the context.
      Returns: the id of the currently active slave
  */
  string getContextId() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_im_multicontext_get_context_id(cast(GtkIMMulticontext*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Sets the context id for context.
      
      This causes the currently active slave of context to be
      replaced by the slave corresponding to the new context id.
  
      Params:
        contextId = the id to use
  */
  void setContextId(string contextId) nothrow
  {
    const(char)* _contextId = contextId.toCString!(No.Malloc, No.Nullable);
    gtk_im_multicontext_set_context_id(cast(GtkIMMulticontext*)this._cPtr, _contextId);
  }
}

/// Fluent builder implementation template for [gtk.immulticontext.IMMulticontext]
class IMMulticontextGidBuilderImpl(T) : gtk.imcontext.IMContextGidBuilderImpl!T
{
}

/// Fluent builder for [gtk.immulticontext.IMMulticontext]
final class IMMulticontextGidBuilder : IMMulticontextGidBuilderImpl!IMMulticontextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  IMMulticontext build() nothrow
  {
    return new IMMulticontext(cast(void*)createGObject(IMMulticontext._getGType), Yes.Take);
  }
}
