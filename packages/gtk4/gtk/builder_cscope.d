/// Module for [BuilderCScope] class
module gtk.builder_cscope;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.builder_scope;
import gtk.builder_scope_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A [gtk.builder_scope.BuilderScope] implementation for the C language.
    
    [gtk.builder_cscope.BuilderCScope] instances use symbols explicitly added to @builder
    with prior calls to [gtk.builder_cscope.BuilderCScope.addCallbackSymbol].
    If developers want to do that, they are encouraged to create their
    own scopes for that purpose.
    
    In the case that symbols are not explicitly added; GTK will uses
    [gmodule.module_.Module]’s introspective features (by opening the module null) to
    look at the application’s symbol table. From here it tries to match
    the signal function names given in the interface description with
    symbols in the application.
    
    Note that unless [gtk.builder_cscope.BuilderCScope.addCallbackSymbol] is
    called for all signal callbacks which are referenced by the loaded XML,
    this functionality will require that [gmodule.module_.Module] be supported on the platform.
*/
class BuilderCScope : gobject.object.ObjectWrap, gtk.builder_scope.BuilderScope
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
    return cast(void function())gtk_builder_cscope_get_type != &gidSymbolNotFound ? gtk_builder_cscope_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BuilderCScope self()
  {
    return this;
  }

  /**
  Get builder for [gtk.builder_cscope.BuilderCScope]
  Returns: New builder object
  */
  static BuilderCScopeGidBuilder builder()
  {
    return new BuilderCScopeGidBuilder;
  }

  mixin BuilderScopeT!();

  /**
      Creates a new [gtk.builder_cscope.BuilderCScope] object to use with future
      [gtk.builder.Builder] instances.
      
      Calling this function is only necessary if you want to add
      custom callbacks via [gtk.builder_cscope.BuilderCScope.addCallbackSymbol].
      Returns: a new [gtk.builder_cscope.BuilderCScope]
  */
  this()
  {
    GtkBuilderScope* _cretval;
    _cretval = gtk_builder_cscope_new();
    this(_cretval, Yes.Take);
  }
}

class BuilderCScopeGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gtk.builder_scope.BuilderScopeGidBuilderImpl!T
{

  mixin BuilderScopeGidBuilderT!();
}

/// Fluent builder for [gtk.builder_cscope.BuilderCScope]
final class BuilderCScopeGidBuilder : BuilderCScopeGidBuilderImpl!BuilderCScopeGidBuilder
{
  BuilderCScope build()
  {
    return new BuilderCScope(cast(void*)createGObject(BuilderCScope._getGType), Yes.Take);
  }
}
