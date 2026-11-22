/// Module for [CompletionWords] class
module gid.gtksource4.completion_words;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdkpixbuf2.pixbuf;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.text_buffer;
import gid.gtksource4.c.functions;
import gid.gtksource4.c.types;
import gid.gtksource4.completion_provider;
import gid.gtksource4.completion_provider_mixin;
import gid.gtksource4.types;

/** */
class CompletionWords : gid.gobject2.object.ObjectWrap, gid.gtksource4.completion_provider.CompletionProvider
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
      Get builder for [gid.gtksource4.completion_words.CompletionWords]
      Returns: New builder object
  */
  static CompletionWordsGidBuilder builder() nothrow
  {
    return new CompletionWordsGidBuilder;
  }

  /**
      Get `activation` property.
      Returns: The type of activation.
  */
  @property gid.gtksource4.types.CompletionActivation activation() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtksource4.types.CompletionActivation)("activation");
  }

  /**
      Set `activation` property.
      Params:
        propval = The type of activation.
  */
  @property void activation(gid.gtksource4.types.CompletionActivation propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtksource4.types.CompletionActivation)("activation", propval);
  }

  /** */
  @property gid.gdkpixbuf2.pixbuf.Pixbuf icon() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdkpixbuf2.pixbuf.Pixbuf)("icon");
  }

  /** */
  @property void icon(gid.gdkpixbuf2.pixbuf.Pixbuf propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdkpixbuf2.pixbuf.Pixbuf)("icon", propval);
  }

  /** */
  @property int interactiveDelay() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("interactive-delay");
  }

  /** */
  @property void interactiveDelay(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("interactive-delay", propval);
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
  @property string name() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("name");
  }

  /** */
  @property void name(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("name", propval);
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

  mixin CompletionProviderT!();

  /** */
  this(string name = null, gid.gdkpixbuf2.pixbuf.Pixbuf icon = null) nothrow
  {
    GtkSourceCompletionWords* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_source_completion_words_new(_name, icon ? cast(GdkPixbuf*)icon._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Registers buffer in the words provider.
  
      Params:
        buffer = a #GtkTextBuffer
  */
  void register(gid.gtk3.text_buffer.TextBuffer buffer) nothrow
  {
    gtk_source_completion_words_register(cast(GtkSourceCompletionWords*)this._cPtr, buffer ? cast(GtkTextBuffer*)buffer._cPtr(No.Dup) : null);
  }

  /**
      Unregisters buffer from the words provider.
  
      Params:
        buffer = a #GtkTextBuffer
  */
  void unregister(gid.gtk3.text_buffer.TextBuffer buffer) nothrow
  {
    gtk_source_completion_words_unregister(cast(GtkSourceCompletionWords*)this._cPtr, buffer ? cast(GtkTextBuffer*)buffer._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtksource4.completion_words.CompletionWords]
class CompletionWordsGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gtksource4.completion_provider.CompletionProviderGidBuilderImpl!T
{

  mixin CompletionProviderGidBuilderT!();

  /**
      Set `activation` property.
      Params:
        propval = The type of activation.
      Returns: Builder instance for fluent chaining
  */
  T activation(gid.gtksource4.types.CompletionActivation propval) nothrow
  {
    return setProperty("activation", propval);
  }

  /** */
  T icon(gid.gdkpixbuf2.pixbuf.Pixbuf propval) nothrow
  {
    return setProperty("icon", propval);
  }

  /** */
  T interactiveDelay(int propval) nothrow
  {
    return setProperty("interactive-delay", propval);
  }

  /** */
  T minimumWordSize(uint propval) nothrow
  {
    return setProperty("minimum-word-size", propval);
  }

  /** */
  T name(string propval) nothrow
  {
    return setProperty("name", propval);
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
}

/// Fluent builder for [gid.gtksource4.completion_words.CompletionWords]
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
