/// Module for [BuilderCScope] class
module gid.gtk4.builder_cscope;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.builder_scope;
import gid.gtk4.builder_scope_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    A [gid.gtk4.builder_scope.BuilderScope] implementation for the C language.
    
    [gid.gtk4.builder_cscope.BuilderCScope] instances use symbols explicitly added to @builder
    with prior calls to [gid.gtk4.builder_cscope.BuilderCScope.addCallbackSymbol].
    If developers want to do that, they are encouraged to create their
    own scopes for that purpose.
    
    In the case that symbols are not explicitly added; GTK will uses
    [gid.gmodule2.module_.Module]’s introspective features (by opening the module null) to
    look at the application’s symbol table. From here it tries to match
    the signal function names given in the interface description with
    symbols in the application.
    
    Note that unless [gid.gtk4.builder_cscope.BuilderCScope.addCallbackSymbol] is
    called for all signal callbacks which are referenced by the loaded XML,
    this functionality will require that [gid.gmodule2.module_.Module] be supported on the platform.
*/
class BuilderCScope : gid.gobject2.object.ObjectWrap, gid.gtk4.builder_scope.BuilderScope
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
    return cast(void function())gtk_builder_cscope_get_type != &gidSymbolNotFound ? gtk_builder_cscope_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkBuilderCScope";
  }

  /** Returns `this`, for use in `with` statements. */
  override BuilderCScope self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.builder_cscope.BuilderCScope]
      Returns: New builder object
  */
  static BuilderCScopeGidBuilder builder() nothrow
  {
    return new BuilderCScopeGidBuilder;
  }

  mixin BuilderScopeT!();

  /**
      Creates a new [gid.gtk4.builder_cscope.BuilderCScope] object to use with future
      [gid.gtk4.builder.Builder] instances.
      
      Calling this function is only necessary if you want to add
      custom callbacks via [gid.gtk4.builder_cscope.BuilderCScope.addCallbackSymbol].
      Returns: a new [gid.gtk4.builder_cscope.BuilderCScope]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkBuilderScope* _cretval;
      _cretval = gtk_builder_cscope_new();
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.builder_cscope.BuilderCScope]
class BuilderCScopeGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gtk4.builder_scope.BuilderScopeGidBuilderImpl!T
{

  mixin BuilderScopeGidBuilderT!();
}

/// Fluent builder for [gid.gtk4.builder_cscope.BuilderCScope]
final class BuilderCScopeGidBuilder : BuilderCScopeGidBuilderImpl!BuilderCScopeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BuilderCScope build() nothrow
  {
    return new BuilderCScope(cast(void*)createGObject(BuilderCScope._getGType), Yes.Take);
  }
}
