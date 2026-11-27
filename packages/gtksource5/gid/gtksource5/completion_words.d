/// Module for [CompletionWords] class
module gid.gtksource5.completion_words;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.text_buffer;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.completion_provider;
import gid.gtksource5.completion_provider_mixin;
import gid.gtksource5.types;

/**
    A [gid.gtksource5.completion_provider.CompletionProvider] for the completion of words.
    
    The [gid.gtksource5.completion_words.CompletionWords] is an example of an implementation of
    the [gid.gtksource5.completion_provider.CompletionProvider] interface. The proposals are words
    appearing in the registered [gid.gtk4.text_buffer.TextBuffer]s.
*/
@gidGir("CompletionWords", "CompletionWordsClass")
class CompletionWords : gid.gobject2.object.ObjectWrap, gid.gtksource5.completion_provider.CompletionProvider
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
    return cast(void function())gtk_source_completion_words_get_type != &gidSymbolNotFound ? gtk_source_completion_words_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceCompletionWords";
  }

  /** Returns `this`, for use in `with` statements. */
  override CompletionWords self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource5.completion_words.CompletionWords]
      Returns: New builder object
  */
  static CompletionWordsGidBuilder builder() nothrow
  {
    return new CompletionWordsGidBuilder;
  }

  /** */
  @property uint minimumWordSize() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("minimum-word-size");
  }

  /** */
  @property void minimumWordSize(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("minimum-word-size", propval);
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
  @property uint proposalsBatchSize() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("proposals-batch-size");
  }

  /** */
  @property void proposalsBatchSize(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("proposals-batch-size", propval);
  }

  /** */
  @property uint scanBatchSize() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("scan-batch-size");
  }

  /** */
  @property void scanBatchSize(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("scan-batch-size", propval);
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
  this(string title = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, title !is null), Yes.Take);
    }
    else
    {
      GtkSourceCompletionWords* _cretval;
      const(char)* _title = title.toCString!(No.Malloc, Yes.Nullable);
      _cretval = gtk_source_completion_words_new(_title);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Registers buffer in the words provider.
  
      Params:
        buffer = a #GtkTextBuffer
  */
  void register(gid.gtk4.text_buffer.TextBuffer buffer) nothrow
  {
    gtk_source_completion_words_register(cast(GtkSourceCompletionWords*)this._cPtr, buffer ? cast(GtkTextBuffer*)buffer._cPtr(No.Dup) : null);
  }

  /**
      Unregisters buffer from the words provider.
  
      Params:
        buffer = a #GtkTextBuffer
  */
  void unregister(gid.gtk4.text_buffer.TextBuffer buffer) nothrow
  {
    gtk_source_completion_words_unregister(cast(GtkSourceCompletionWords*)this._cPtr, buffer ? cast(GtkTextBuffer*)buffer._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtksource5.completion_words.CompletionWords]
class CompletionWordsGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gtksource5.completion_provider.CompletionProviderGidBuilderImpl!T
{

  mixin CompletionProviderGidBuilderT!();

  /** */
  T minimumWordSize(uint propval) nothrow
  {
    return setProperty("minimum-word-size", propval);
  }

  /** */
  T priority(int propval) nothrow
  {
    return setProperty("priority", propval);
  }

  /** */
  T proposalsBatchSize(uint propval) nothrow
  {
    return setProperty("proposals-batch-size", propval);
  }

  /** */
  T scanBatchSize(uint propval) nothrow
  {
    return setProperty("scan-batch-size", propval);
  }

  /** */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }
}

/// Fluent builder for [gid.gtksource5.completion_words.CompletionWords]
final class CompletionWordsGidBuilder : CompletionWordsGidBuilderImpl!CompletionWordsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CompletionWords build() nothrow
  {
    return new CompletionWords(cast(void*)createGObject(CompletionWords._getGType), Yes.Take);
  }
}
