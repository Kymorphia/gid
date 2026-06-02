/// Module for [CompletionSnippets] class
module gtksource.completion_snippets;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.completion_provider;
import gtksource.completion_provider_mixin;
import gtksource.types;

/**
    A [gtksource.completion_provider.CompletionProvider] for the completion of snippets.
    
    The [gtksource.completion_snippets.CompletionSnippets] is an example of an implementation of
    the [gtksource.completion_provider.CompletionProvider] interface. The proposals are snippets
    registered with the [gtksource.snippet_manager.SnippetManager].
*/
class CompletionSnippets : gobject.object.ObjectWrap, gtksource.completion_provider.CompletionProvider
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
    return cast(void function())gtk_source_completion_snippets_get_type != &gidSymbolNotFound ? gtk_source_completion_snippets_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CompletionSnippets self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtksource.completion_snippets.CompletionSnippets]
      Returns: New builder object
  */
  static CompletionSnippetsGidBuilder builder() nothrow
  {
    return new CompletionSnippetsGidBuilder;
  }

  /** */
  @property int priority() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("priority");
  }

  /** */
  @property void priority(int propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(int)("priority", propval);
  }

  /** */
  @property string title() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("title");
  }

  /** */
  @property void title(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("title", propval);
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

/// Fluent builder implementation template for [gtksource.completion_snippets.CompletionSnippets]
class CompletionSnippetsGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gtksource.completion_provider.CompletionProviderGidBuilderImpl!T
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

/// Fluent builder for [gtksource.completion_snippets.CompletionSnippets]
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
