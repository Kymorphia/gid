/// Module for [IMMulticontext] class
module gid.gtk4.immulticontext;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.imcontext;
import gid.gtk4.types;

/**
    Supports switching between multiple input methods.
    
    Text widgets such as [gid.gtk4.text.Text] or [gid.gtk4.text_view.TextView] use a `GtkIMMultiContext`
    to implement their `im-module` property for switching between different
    input methods.
*/
class IMMulticontext : gid.gtk4.imcontext.IMContext
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
    return cast(void function())gtk_im_multicontext_get_type != &gidSymbolNotFound ? gtk_im_multicontext_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkIMMulticontext";
  }

  /** Returns `this`, for use in `with` statements. */
  override IMMulticontext self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.immulticontext.IMMulticontext]
      Returns: New builder object
  */
  static IMMulticontextGidBuilder builder() nothrow
  {
    return new IMMulticontextGidBuilder;
  }

  /**
      Creates a new [gid.gtk4.immulticontext.IMMulticontext].
      Returns: a new [gid.gtk4.immulticontext.IMMulticontext].
  */
  this() nothrow
  {
    GtkIMContext* _cretval;
    _cretval = gtk_im_multicontext_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets the id of the currently active delegate of the context.
      Returns: the id of the currently active delegate
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
      
      This causes the currently active delegate of context to be
      replaced by the delegate corresponding to the new context id.
      
      Setting this to a non-null value overrides the system-wide
      IM module setting. See the [gid.gtk4.settings.Settings.gtkImModule]
      property.
  
      Params:
        contextId = the id to use
  */
  void setContextId(string contextId = null) nothrow
  {
    const(char)* _contextId = contextId.toCString!(No.Malloc, Yes.Nullable);
    gtk_im_multicontext_set_context_id(cast(GtkIMMulticontext*)this._cPtr, _contextId);
  }
}

/// Fluent builder implementation template for [gid.gtk4.immulticontext.IMMulticontext]
class IMMulticontextGidBuilderImpl(T) : gid.gtk4.imcontext.IMContextGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.immulticontext.IMMulticontext]
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
