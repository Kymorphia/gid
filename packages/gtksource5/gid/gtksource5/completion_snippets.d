/// Module for [CompletionSnippets] class
module gid.gtksource5.completion_snippets;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.completion_provider;
import gid.gtksource5.completion_provider_mixin;
import gid.gtksource5.types;

/**
    A [gid.gtksource5.completion_provider.CompletionProvider] for the completion of snippets.
    
    The [gid.gtksource5.completion_snippets.CompletionSnippets] is an example of an implementation of
    the [gid.gtksource5.completion_provider.CompletionProvider] interface. The proposals are snippets
    registered with the [gid.gtksource5.snippet_manager.SnippetManager].
*/
class CompletionSnippets : gid.gobject2.object.ObjectWrap, gid.gtksource5.completion_provider.CompletionProvider
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
    return cast(void function())gtk_source_completion_snippets_get_type != &gidSymbolNotFound ? gtk_source_completion_snippets_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceCompletionSnippets";
  }

  /** Returns `this`, for use in `with` statements. */
  override CompletionSnippets self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource5.completion_snippets.CompletionSnippets]
      Returns: New builder object
  */
  static CompletionSnippetsGidBuilder builder() nothrow
  {
    return new CompletionSnippetsGidBuilder;
  }

  /** */
  @property int priority() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("priority");
  }

  /** */
  @property void priority(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("priority", propval);
  }

  /** */
  @property string title() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("title");
  }

  /** */
  @property void title(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("title", propval);
  }

  mixin CompletionProviderT!();

  /** */
  this() nothrow
  {
    GtkSourceCompletionSnippets* _cretval;
    _cretval = gtk_source_completion_snippets_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gid.gtksource5.completion_snippets.CompletionSnippets]
class CompletionSnippetsGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gtksource5.completion_provider.CompletionProviderGidBuilderImpl!T
{

  mixin CompletionProviderGidBuilderT!();

  /** */
  T priority(int propval) nothrow
  {
    return setProperty("priority", propval);
  }

  /** */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }
}

/// Fluent builder for [gid.gtksource5.completion_snippets.CompletionSnippets]
final class CompletionSnippetsGidBuilder : CompletionSnippetsGidBuilderImpl!CompletionSnippetsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CompletionSnippets build() nothrow
  {
    return new CompletionSnippets(cast(void*)createGObject(CompletionSnippets._getGType), Yes.Take);
  }
}
