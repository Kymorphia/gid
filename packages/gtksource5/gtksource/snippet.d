/// Module for [Snippet] class
module gtksource.snippet;

import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;
import gtk.text_buffer;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.snippet_chunk;
import gtksource.snippet_context;
import gtksource.types;

/**
    Quick insertion code snippets.
    
    The [gtksource.snippet.Snippet] represents a series of chunks that can quickly be
    inserted into the `class@View`.
    
    Snippets are defined in XML files which are loaded by the
    `class@SnippetManager`. Alternatively, applications can create snippets
    on demand and insert them into the `class@View` using
    [gtksource.view.View.pushSnippet].
    
    Snippet chunks can reference other snippet chunks as well as post-process
    the values from other chunks such as capitalization.
*/
class Snippet : gobject.object.ObjectWrap
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
    return cast(void function())gtk_source_snippet_get_type != &gidSymbolNotFound ? gtk_source_snippet_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Snippet self()
  {
    return this;
  }

  /**
  Get builder for [gtksource.snippet.Snippet]
  Returns: New builder object
  */
  static SnippetGidBuilder builder()
  {
    return new SnippetGidBuilder;
  }

  /** */
  @property gtk.text_buffer.TextBuffer buffer()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.text_buffer.TextBuffer)("buffer");
  }

  /** */
  @property string description()
  {
    return getDescription();
  }

  /** */
  @property void description(string propval)
  {
    setDescription(propval);
  }

  /** */
  @property int focusPosition()
  {
    return getFocusPosition();
  }

  /** */
  @property string languageId()
  {
    return getLanguageId();
  }

  /** */
  @property void languageId(string propval)
  {
    setLanguageId(propval);
  }

  /** */
  @property string name()
  {
    return getName();
  }

  /** */
  @property void name(string propval)
  {
    setName(propval);
  }

  /** */
  @property string trigger()
  {
    return getTrigger();
  }

  /** */
  @property void trigger(string propval)
  {
    setTrigger(propval);
  }

  /**
      Creates a new #GtkSourceSnippet
  
      Params:
        trigger = the trigger word
        languageId = the source language
      Returns: A new #GtkSourceSnippet
  */
  this(string trigger = null, string languageId = null)
  {
    GtkSourceSnippet* _cretval;
    const(char)* _trigger = trigger.toCString(No.Alloc);
    const(char)* _languageId = languageId.toCString(No.Alloc);
    _cretval = gtk_source_snippet_new(_trigger, _languageId);
    this(_cretval, Yes.Take);
  }

  /**
      Parses the snippet formatted text into a series of chunks and adds them
      to a new #GtkSourceSnippet.
  
      Params:
        text = the formatted snippet text to parse
      Returns: the newly parsed #GtkSourceSnippet, or null upon
          failure and error is set.
      Throws: [ErrorWrap]
  */
  static gtksource.snippet.Snippet newParsed(string text)
  {
    GtkSourceSnippet* _cretval;
    const(char)* _text = text.toCString(No.Alloc);
    GError *_err;
    _cretval = gtk_source_snippet_new_parsed(_text, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.snippet.Snippet)(cast(GtkSourceSnippet*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Appends chunk to the snippet.
      
      This may only be called before the snippet has been expanded.
  
      Params:
        chunk = a #GtkSourceSnippetChunk
  */
  void addChunk(gtksource.snippet_chunk.SnippetChunk chunk)
  {
    gtk_source_snippet_add_chunk(cast(GtkSourceSnippet*)this._cPtr, chunk ? cast(GtkSourceSnippetChunk*)chunk._cPtr(No.Dup) : null);
  }

  /**
      Does a deep copy of the snippet.
      Returns: A new #GtkSourceSnippet
  */
  gtksource.snippet.Snippet copy()
  {
    GtkSourceSnippet* _cretval;
    _cretval = gtk_source_snippet_copy(cast(GtkSourceSnippet*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.snippet.Snippet)(cast(GtkSourceSnippet*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the context used for expanding the snippet.
      Returns: an #GtkSourceSnippetContext
  */
  gtksource.snippet_context.SnippetContext getContext()
  {
    GtkSourceSnippetContext* _cretval;
    _cretval = gtk_source_snippet_get_context(cast(GtkSourceSnippet*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.snippet_context.SnippetContext)(cast(GtkSourceSnippetContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the description for the snippet.
      Returns: 
  */
  string getDescription()
  {
    const(char)* _cretval;
    _cretval = gtk_source_snippet_get_description(cast(GtkSourceSnippet*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the current focus for the snippet.
      
      This is changed as the user tabs through focus locations.
      Returns: The focus position, or -1 if unset.
  */
  int getFocusPosition()
  {
    int _retval;
    _retval = gtk_source_snippet_get_focus_position(cast(GtkSourceSnippet*)this._cPtr);
    return _retval;
  }

  /**
      Gets the language-id used for the source snippet.
      
      The language identifier should be one that matches a
      source language `propertyLanguage:id` property.
      Returns: the language identifier
  */
  string getLanguageId()
  {
    const(char)* _cretval;
    _cretval = gtk_source_snippet_get_language_id(cast(GtkSourceSnippet*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the number of chunks in the snippet.
      
      Note that not all chunks are editable.
      Returns: The number of chunks.
  */
  uint getNChunks()
  {
    uint _retval;
    _retval = gtk_source_snippet_get_n_chunks(cast(GtkSourceSnippet*)this._cPtr);
    return _retval;
  }

  /**
      Gets the name for the snippet.
      Returns: 
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gtk_source_snippet_get_name(cast(GtkSourceSnippet*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the chunk at nth.
  
      Params:
        nth = the nth chunk to get
      Returns: an #GtkSourceSnippetChunk
  */
  gtksource.snippet_chunk.SnippetChunk getNthChunk(uint nth)
  {
    GtkSourceSnippetChunk* _cretval;
    _cretval = gtk_source_snippet_get_nth_chunk(cast(GtkSourceSnippet*)this._cPtr, nth);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.snippet_chunk.SnippetChunk)(cast(GtkSourceSnippetChunk*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the trigger for the source snippet.
      
      A trigger is a word that can be expanded into the full snippet when
      the user presses Tab.
      Returns: A string or null
  */
  string getTrigger()
  {
    const(char)* _cretval;
    _cretval = gtk_source_snippet_get_trigger(cast(GtkSourceSnippet*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets the description for the snippet.
  
      Params:
        description = the snippet description
  */
  void setDescription(string description)
  {
    const(char)* _description = description.toCString(No.Alloc);
    gtk_source_snippet_set_description(cast(GtkSourceSnippet*)this._cPtr, _description);
  }

  /**
      Sets the language identifier for the snippet.
      
      This should match the `propertyLanguage:id` identifier.
  
      Params:
        languageId = the language identifier for the snippet
  */
  void setLanguageId(string languageId)
  {
    const(char)* _languageId = languageId.toCString(No.Alloc);
    gtk_source_snippet_set_language_id(cast(GtkSourceSnippet*)this._cPtr, _languageId);
  }

  /**
      Sets the name for the snippet.
  
      Params:
        name = the snippet name
  */
  void setName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_source_snippet_set_name(cast(GtkSourceSnippet*)this._cPtr, _name);
  }

  /**
      Sets the trigger for the snippet.
  
      Params:
        trigger = the trigger word
  */
  void setTrigger(string trigger)
  {
    const(char)* _trigger = trigger.toCString(No.Alloc);
    gtk_source_snippet_set_trigger(cast(GtkSourceSnippet*)this._cPtr, _trigger);
  }
}

class SnippetGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T description(string propval)
  {
    return setProperty("description", propval);
  }

  /** */
  T languageId(string propval)
  {
    return setProperty("language-id", propval);
  }

  /** */
  T name(string propval)
  {
    return setProperty("name", propval);
  }

  /** */
  T trigger(string propval)
  {
    return setProperty("trigger", propval);
  }
}

/// Fluent builder for [gtksource.snippet.Snippet]
final class SnippetGidBuilder : SnippetGidBuilderImpl!SnippetGidBuilder
{
  Snippet build()
  {
    return new Snippet(cast(void*)createGObject(Snippet._getGType), Yes.Take);
  }
}
